using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;


public partial class coursefav : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    int bid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
            Response.Redirect("studentlogin.aspx");
        if (!IsPostBack)
            fillgrid();
    }
    protected void fillgrid()
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "select * from coursefav where uname=@uname";
            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@uname", Session["uname"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count <= 0)
                Response.Write("<script>alert('no record to show')</script>");
        }

        catch (Exception ex)
        {
            lblmsg.Text = ex.Message.ToString();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);

            int i = Convert.ToInt32(e.CommandArgument);
            int cid =Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);
            string sql;
        //Inserting [course_master] records
        sql = "delete from coursefav where id=@id and uname=@uname";
        cmd = new SqlCommand(sql, cn);
        cmd.Parameters.AddWithValue("@id", cid);
        cmd.Parameters.AddWithValue("@uname", Session["uname"].ToString());

        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        fillgrid();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);

        //Getting booking ID
        string sql = "select max(bid)+1 from [course_master]";
        cmd = new SqlCommand(sql, cn);
        cn.Open();
        object obj = cmd.ExecuteScalar();
        if (obj == DBNull.Value)
            obj = 1;
        bid = Convert.ToInt32(obj);
        cn.Close();


       // string sql;
        //Inserting [course_master] records
        sql = "insert into [course_master] values(@bid,@userid,@doi)";
        cmd = new SqlCommand(sql, cn);
        cmd.Parameters.AddWithValue("@bid", bid);
        cmd.Parameters.AddWithValue("@userid", Session["uname"].ToString());
        cmd.Parameters.AddWithValue("@doi", DateTime.Now);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        //Copying records from [[coursefav]] into [course_details]
        sql = "select * from [coursefav] where uname=@uid";
        cmd = new SqlCommand(sql, cn);
        cmd.Parameters.AddWithValue("@uid", Session["uname"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        for (int k = 0; k < dt.Rows.Count; k++)
        {
            sql = "insert into course_details values(@bid,@course_type,@course_name,@branch,@clgid,@clg_name,@fees,@clg_email)";
            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@bid", bid);
            cmd.Parameters.AddWithValue("@course_type", dt.Rows[k][2]);
            cmd.Parameters.AddWithValue("@course_name", dt.Rows[k][3]);
            cmd.Parameters.AddWithValue("@branch", dt.Rows[k][4]);

            cmd.Parameters.AddWithValue("@clgid", dt.Rows[k][5]);
            cmd.Parameters.AddWithValue("@clg_name", dt.Rows[k][6]);
            cmd.Parameters.AddWithValue("@fees", dt.Rows[k][7]);
            cmd.Parameters.AddWithValue("@clg_email", dt.Rows[k][8]);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }
        //sendmail();
        // Response.Redirect("interest.aspx");
        Response.Redirect("success.aspx");

    }
    protected void sendmail()
    {
        //Get student personal data
        cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["projectdb"].ConnectionString);
        string sql = "Select * from [Student_reg] where username=@id ";
        cmd = new SqlCommand(sql, cn);
        cmd.Parameters.AddWithValue("@id", Session["uname"].ToString());
        string fname = string.Empty;
        string lname = string.Empty;
        string contact_no = string.Empty;
        string address = string.Empty;
        string city = string.Empty;

        cn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            fname = dr[1].ToString();
            lname = dr[2].ToString();
            contact_no = dr[8].ToString();
            address = dr[7].ToString();
            city = dr[9].ToString();
        }
        dr.Close();
        cn.Close();

        sql = "select * from [course_details] where bid=@bid";
        cmd = new SqlCommand(sql, cn);
        cmd.Parameters.AddWithValue("@bid", bid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        for (int k = 0; k < dt.Rows.Count; k++)
        {
            string college_email = dt.Rows[k][7].ToString();
            string course_name = dt.Rows[k][2].ToString();
            //CHange allow less secure apps setting to ON in your gmailaccount(present in sign-in and security)
            string youremail = "coursefinder99@gmail.com";
            string yourpassword = "99coursefinder";
            MailMessage mm = new MailMessage(youremail, college_email);
            mm.Subject = "From Online Course Finder";
            mm.Body = "The student having name:" + fname + " " + lname + " and contact no:" + contact_no + " and having address:" + address + " and city:" + city + " and email:" + Session["uname"].ToString() + " has expressed interest in your course: " + course_name;
            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new
            NetworkCredential(youremail, yourpassword);
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
            //ClientScript.RegisterStartupScript(GetType(), "alert","alert('Email sent.');", true);
        }
    }
}