using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class editcourse : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("adminlog.aspx");
        if (!IsPostBack)
            fillgrid();
    }
    protected void fillgrid()
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "select * from coursereg";
            cmd = new SqlCommand(sql, cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count <= 0)
                Response.Write("<script>alert('No records to show')</script>");
        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message;
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
         if (e.CommandName=="select")
        {
            int i = Convert.ToInt32(e.CommandArgument);
            txtcourseid.Text = GridView1.Rows[i].Cells[0].Text;
            txtcollegeid.Text = GridView1.Rows[i].Cells[1].Text;
            txtfees.Text = GridView1.Rows[i].Cells[4].Text;
            txtduration.Text = GridView1.Rows[i].Cells[5].Text;

            
        }

    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "update coursereg set fees=@fees,duration=@duration where course_id=@cid";
            cmd = new SqlCommand(sql, cn);
           // cmd.Parameters.AddWithValue("@course_name", txtfees.Text);
            cmd.Parameters.AddWithValue("@fees", txtfees.Text);
            cmd.Parameters.AddWithValue("@duration", txtduration.Text);
            cmd.Parameters.AddWithValue("@cid", txtcourseid.Text);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            lblmessage.Text = "Record updated";
            fillgrid();
        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message;
        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "Delete from coursereg where course_id=@cid";
            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@cid", txtcourseid.Text);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            lblmessage.Text = "Record deleted";
            fillgrid();
        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message;
        }
    }
}