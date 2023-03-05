using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class studentlogin : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "select * from [studreg] where username=@u and password=@pass";
            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@u", txtusername.Text);
            cmd.Parameters.AddWithValue("@pass", txtpassword.Text);
            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session["uname"] = dr[3];
                    // lblmsg2.Text = "Welcome" + Session["username"].ToString();

                    Response.Redirect("~/studentLoggedin.aspx");

                }
                else
                {
                    lblmsg.Text = "User not found";
                }
                dr.Close();
            }
        
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
        finally
        {

            cn.Close();
        }
    }
}