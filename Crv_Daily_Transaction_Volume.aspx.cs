using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions;
using CrystalDecisions.Reporting;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Web.Design;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Crv_Daily_Transaction_Volume : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString());
        ReportDocument customrep = new ReportDocument();
        String reppath = Server.MapPath("~/CrtDailyTransVolume.rpt");
        customrep.Load(reppath);

        SqlDataAdapter SqlDA = new SqlDataAdapter("SELECT * FROM viewDailyTransVolume", con);
        DataSet ds = new DataSet();
        SqlDA.Fill(ds, "viewDailyTransVolume");
        DataTable dt = new DataTable();
        customrep.SetDataSource(ds.Tables[0]);
        crvDailyTransactionVolume.ReportSource = customrep;


        crvDailyTransactionVolume.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
        crvDailyTransactionVolume.PageZoomFactor = 115;
        crvDailyTransactionVolume.HasZoomFactorList = false;
    }
    protected void CrystalReportViewer1_Init(object sender, EventArgs e)
    {

    }
}