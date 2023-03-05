using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class studentreg : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "insert into studreg(student_name,student_lastname,username,password,dob,gender,address,mobileno,city,pincode)values(@student_name,@student_lastname,@username,@password,@dob,@gender,@address,@mobileno,@city,@pincode)";
            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@student_name", txtname.Text);
            cmd.Parameters.AddWithValue("@student_lastname", txtlastname.Text);
            cmd.Parameters.AddWithValue("@username", txtusername.Text);
            cmd.Parameters.AddWithValue("@password", txtpassword.Text);
            cmd.Parameters.AddWithValue("@dob", Calendar1.SelectedDate);
            cmd.Parameters.AddWithValue("@gender", RadioButtonList1.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
            cmd.Parameters.AddWithValue("@pincode", txtpincode.Text);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            lblmessage.Text = "Record Saved";
        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message;
        }
    }

    protected void txtusername_TextChanged(object sender, EventArgs e)
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "select username from studreg where username=@un";
            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@un", txtusername.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblmessage.Text = "Email is already present";
                btnsubmit.Enabled = false;
            }
            else
            {
                btnsubmit.Enabled = true;
                lblmessage.Text = "";
            }
        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message.ToString();
        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        
            Response.Redirect("default.aspx");
        
    }
}