using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using Microsoft.Reporting.WebForms;


public partial class frmrptcollegereg : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testdb"].ConnectionString);
            string sql = "select * from collegereg";
            cmd = new SqlCommand(sql, cn);
            dsstudent dsemp = new dsstudent();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dsemp, "DataTable1");
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/rptcollege.rdlc");
            ReportDataSource rds = new ReportDataSource("dscollege", dsemp.Tables[0]);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
        }
    }
}