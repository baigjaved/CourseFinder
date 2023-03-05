using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class editcollege : System.Web.UI.Page
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
            string sql = "select * from collegereg";
            cmd = new SqlCommand(sql, cn);
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
            lblmessage.Text = ex.Message;
        }
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("/images/") + FileUpload1.FileName);
            ImageButton1.ImageUrl = "/images/" + FileUpload1.FileName;
        }
        else
        {
            lblmessage.Text = "Please select file";
        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "update collegereg set name=@name,mobileno=@mobileno,image=@image where college_id=@cid";
            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
            cmd.Parameters.AddWithValue("@image", ImageButton1.ImageUrl);
            cmd.Parameters.AddWithValue("@cid", txtcollegeid.Text);
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
            string sql = "Delete collegereg where college_id=@cid";
            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@cid", txtcollegeid.Text);
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
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            int i = Convert.ToInt32(e.CommandArgument);
            txtcollegeid.Text = GridView1.Rows[i].Cells[0].Text;
            txtname.Text = GridView1.Rows[i].Cells[1].Text;
            txtmobileno.Text = GridView1.Rows[i].Cells[2].Text;
            Image images = (Image)GridView1.Rows[i].Cells[3].Controls[0];
            ImageButton1.ImageUrl = images.ImageUrl;
        }
    }
}