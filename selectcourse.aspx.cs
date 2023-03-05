using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class selectcourse : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
            Response.Redirect("studentlogin.aspx");
        if (!IsPostBack)
        {
            //fillgrid();
            DropDownList2.Visible = false;
            Label3.Visible = false;

        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == 0)
        {
            DropDownList2.Items.Clear();
            DropDownList1.Items.Clear();
            //DropDownList2.Items.Add("--Select--");
            DropDownList1.Items.Add("BCA three yrs");
            DropDownList1.Items.Add("BE / B.Tech four yrs");
            DropDownList1.Items.Add("Diploma three yrs");
            DropDownList1.Items.Add("PHD");
            DropDownList1.Items.Add("MCA two yrs");
            DropDownList1.Items.Add("MBA two yrs");
            DropDownList1.Items.Add("ME / M.Tech two yrs");
            DropDownList1.Items.Add("MBBS");
            DropDownList1.Items.Add("BDS");
            DropDownList1.Items.Add("MDS two yrs");
            DropDownList1.Items.Add("BHMS");
        }
        else if (RadioButtonList1.SelectedIndex == 1)
        {
            DropDownList1.Items.Clear();
            DropDownList2.Items.Clear();

            DropDownList1.Items.Add("BA two yrs");
            DropDownList1.Items.Add("B.Com three yrs");
            DropDownList1.Items.Add("M.Com two yrs");
            DropDownList1.Items.Add("MA two yrs");
            DropDownList1.Items.Add("MSC two yrs");
            DropDownList1.Items.Add("BSC three yrs");
            DropDownList1.Items.Add("Architecture five yrs");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        if (DropDownList1.SelectedIndex == 1 && RadioButtonList1.SelectedIndex == 0)
        {

            //DropDownList3.Items.Add("--Select--");
            DropDownList2.Visible = true;
            Label3.Visible = true;
            DropDownList2.Items.Add("CSE");
            DropDownList2.Items.Add("Mech");
            DropDownList2.Items.Add("E&TC");
            DropDownList2.Items.Add("Electrical");
            DropDownList2.Items.Add("Civil");
            DropDownList2.Items.Add("Textile");
            DropDownList2.Items.Add("Chemical Engineering");
            DropDownList2.Items.Add("Information Technology");
            DropDownList2.Items.Add("Humanities And Basic Science");
            DropDownList2.Items.Add("Automobile Engineering");
            DropDownList2.Items.Add("Biotechnology ");
        }
        else if (DropDownList1.SelectedIndex == 6 && RadioButtonList1.SelectedIndex == 0)
        {
            DropDownList2.Visible = true;
            Label3.Visible = true;
            DropDownList2.Items.Add("CSE");
            DropDownList2.Items.Add("Mech");
            DropDownList2.Items.Add("E&TC");
            DropDownList2.Items.Add("Electrical");
            DropDownList2.Items.Add("Civil");
            DropDownList2.Items.Add("Information Technology");
        }
        else if (DropDownList1.SelectedIndex == 2 && RadioButtonList1.SelectedIndex == 0)
        {
            DropDownList2.Visible = true;
            Label3.Visible = true;
            DropDownList2.Items.Add("CSE");
            DropDownList2.Items.Add("Mech");
            DropDownList2.Items.Add("E&TC");
            DropDownList2.Items.Add("Electrical");
            DropDownList2.Items.Add("Civil");
            DropDownList2.Items.Add("Textile");
            //DropDownList3.Items.Add("Chemical Engineering");
            DropDownList2.Items.Add("Information Technology");
            DropDownList2.Items.Add("Automobile Engineering");
        }
        else if (DropDownList1.SelectedIndex == 3 && RadioButtonList1.SelectedIndex == 0)
        {
            DropDownList2.Visible = true;
            Label3.Visible = true;

            DropDownList2.Items.Add("Mech");
        }
        else
            Response.Write("<script>alert('Branch not applcable for this course')</script>");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            Button1.Visible = true;

            int i = Convert.ToInt32(e.CommandArgument);

            try
            {
                cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
                cmd = new SqlCommand("insert into [coursefav](uname,course_type,course_name,branch,college_id,college_name,fees,college_email,image) values(@uid,@ctype,@course,@branch,@clg_id,@clg_name,@fees,@clg_email,@imgurl)", cn);
                //cmd.Parameters.AddWithValue("@uid", Session["uname"].ToString());
                cmd.Parameters.AddWithValue("@uid", Session["uname"].ToString());

                cmd.Parameters.AddWithValue("@ctype", RadioButtonList1.SelectedValue);
                cmd.Parameters.AddWithValue("@course", DropDownList1.SelectedValue);

                if (DropDownList1.SelectedIndex == 1 || DropDownList1.SelectedIndex == 2 || DropDownList1.SelectedIndex == 3 || DropDownList1.SelectedIndex == 6)
                    cmd.Parameters.AddWithValue("@branch", DropDownList2.SelectedItem.ToString());
                else
                    cmd.Parameters.AddWithValue("@branch", DBNull.Value);
                //cmd.Parameters.AddWithValue("@college",)
                cmd.Parameters.AddWithValue("@clg_id", GridView1.Rows[i].Cells[0].Text);
                cmd.Parameters.AddWithValue("@clg_name", GridView1.Rows[i].Cells[1].Text);
                cmd.Parameters.AddWithValue("@fees", GridView1.Rows[i].Cells[6].Text);
                cmd.Parameters.AddWithValue("@clg_email", GridView1.Rows[i].Cells[3].Text);
                Image img = (Image)GridView1.Rows[i].Cells[8].Controls[0];//getting the image url

                cmd.Parameters.AddWithValue("@imgurl", img.ImageUrl);

                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                // Label7.Text = "Record Successful savaed";
                // sendmail();
                Response.Write("<script>alert('College added to favourites')</script>");
                GridView1.Rows[i].BackColor = System.Drawing.Color.Brown;
                // Response.Redirect("interest.aspx");
            }
            catch (Exception ex)
            {
                lblmsg.Text = ex.Message.ToString();
            }
        }
    }

    //protected bool checkincart()
    //{
    //    cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
    //    string sql = "select * from [coursefav] where pid=@pid and username=@uname";
    //    cmd = new SqlCommand(sql, cn);
    //    cmd.Parameters.AddWithValue("@pid", ((Label)dlproduct.SelectedItem.FindControl("lblpid")).Text);
    //    cmd.Parameters.AddWithValue("@uname", Session["username"].ToString());
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //    DataTable dt = new DataTable();
    //    da.Fill(dt);
    //    if (dt.Rows.Count <= 0)
    //        return true;
    //    else
    //        return false;

    //}

    protected void btnshow_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedItem.ToString() == "Professional")
        {
            //if selected course with branch
            if (DropDownList1.SelectedIndex == 1 || DropDownList1.SelectedIndex == 2 || DropDownList1.SelectedIndex == 3 || DropDownList1.SelectedIndex == 6)
            {
                cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
                string sql = "Select * from [coursereg] cr INNER JOIN [collegereg] ci ON cr.[college_id]=ci.[college_id] where cr.[course_name]=@cid and cr.[branch]=@cb ";
                cmd = new SqlCommand(sql, cn);


                cmd.Parameters.AddWithValue("@cid", DropDownList1.SelectedValue);

                cmd.Parameters.AddWithValue("@cb", DropDownList2.SelectedItem.ToString());

                //  cmd.Parameters.AddWithValue("@cb", DropDownList2.SelectedValue);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (GridView1.Rows.Count <= 0)
                    Response.Write("<script>alert('No data exists')</script>");
            }
            else
            {
                cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
                string sql = "Select * from [coursereg] cr INNER JOIN [collegereg] ci ON cr.[college_id]=ci.[college_id] where cr.[course_name]=@cid";
                cmd = new SqlCommand(sql, cn);


                cmd.Parameters.AddWithValue("@cid", DropDownList1.SelectedValue);


                //  cmd.Parameters.AddWithValue("@cb", DropDownList2.SelectedValue);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (GridView1.Rows.Count <= 0)
                    Response.Write("<script>alert('No data exists')</script>");
            }
        }
                else if (RadioButtonList1.SelectedItem.ToString() == "Non-Professional")
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "Select * from [coursereg] cr INNER JOIN [collegereg] ci ON cr.[college_id]=ci.[college_id] where cr.[course_name]=@cid";
            cmd = new SqlCommand(sql, cn);


            cmd.Parameters.AddWithValue("@cid", DropDownList1.SelectedValue);


            //  cmd.Parameters.AddWithValue("@cb", DropDownList2.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            if (GridView1.Rows.Count <= 0)
                Response.Write("<script>alert('No data exists')</script>");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
