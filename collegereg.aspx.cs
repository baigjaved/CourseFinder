using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class collegereg : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("/images/" + FileUpload1.FileName));
            Image1.ImageUrl = "/images/" + FileUpload1.FileName;
        }
        else
        {
            lblmessage.Text = "PLease select file";
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "insert into collegereg(name,address,city,email,mobileno,nacc_grade,image)values(@name,@address,@city,@email,@mobileno,@nacc_grade,@image)";
            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
            cmd.Parameters.AddWithValue("@nacc_grade", txtnaccgrade.Text);
            cmd.Parameters.AddWithValue("@image", Image1.ImageUrl);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            lblmessage.Text = "Information saved";
        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message;
        }
    }
}