using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class coursereg : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["admin"]==null)
        {
            Response.Redirect("adminlog.aspx");
        }
        if(!IsPostBack)
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
            lblmessage.Text = ex.Message.ToString();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            cmd = new SqlCommand("insert into coursereg(course_type,course_name,branch,college_id,college_name,city,emailid,mobileno,fees,duration,image) values(@course_type,@course_name,@branch,@college_id,@college_name,@city,@emailid,@mobileno,@fees,@duration,@image)", cn);
            cmd.Parameters.AddWithValue("@course_type", RadioButtonList1.SelectedValue);
            if (DropDownList1.SelectedIndex == 1 || DropDownList1.SelectedIndex == 2 || DropDownList1.SelectedIndex == 3 || DropDownList1.SelectedIndex == 6)
                cmd.Parameters.AddWithValue("@branch", DropDownList2.SelectedItem.ToString());
            else
                cmd.Parameters.AddWithValue("@branch", DBNull.Value);

            cmd.Parameters.AddWithValue("@course_name", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@college_id", Convert.ToInt32(txtclgid.Text));
            cmd.Parameters.AddWithValue("@college_name", txtclgname.Text);
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
            cmd.Parameters.AddWithValue("@emailid", txtemailid.Text);
            cmd.Parameters.AddWithValue("@mobileno", txtmobileno.Text);
            cmd.Parameters.AddWithValue("@fees", txtfees.Text);
            cmd.Parameters.AddWithValue("@duration", txtduration.Text);
            cmd.Parameters.AddWithValue("@image", Convert.ToString(ImageButton1.ImageUrl));
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            lblmessage.Text = "Record Successful saved";

        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message.ToString();
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
    protected void btnselect_Click(object sender, EventArgs e)
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
    protected void btnclear_Click(object sender, EventArgs e)
    
    {
        txtclgid.Text = "";
        txtclgname.Text = "";
        DropDownList2.Items.Clear();
        txtcity.Text = "";
        txtemailid.Text = "";
        txtmobileno.Text = "";
        txtclgid.Text = "";
        txtclgname.Text = "";
        txtduration.Text = "";
        txtfees.Text = "";
        RadioButtonList1.ClearSelection();
        lblmessage.Text = "";
        //GridView1.DataSource = null;
        //GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            int i = Convert.ToInt32(e.CommandArgument);
            txtclgid.Text = GridView1.Rows[i].Cells[0].Text;
            txtclgname.Text = GridView1.Rows[i].Cells[1].Text;
            txtcity.Text = GridView1.Rows[i].Cells[2].Text;
            txtemailid.Text = GridView1.Rows[i].Cells[3].Text;
            txtmobileno.Text = GridView1.Rows[i].Cells[5].Text;
            //txtfees.Text = GridView1.Rows[i].Cells[8].Text;
            //Image1.ImageUrl = GridView1.Rows[i].Cells[6].Controls[0].ToString();
            txtfees.Focus();

            Image img1 = (Image)GridView1.Rows[i].Cells[7].Controls[0];

            ImageButton1.ImageUrl = img1.ImageUrl;
        }
    }
    }
