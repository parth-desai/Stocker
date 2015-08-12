using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using CrystalDecisions;
using CrystalDecisions.Reporting;
using CrystalDecisions.CrystalReports.Engine;

using CrystalDecisions.CrystalReports.ViewerObjectModel;

public partial class Crv_Shareholder_Statement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string shid = Session["shid"].ToString();
        string compid =   Session["compid"].ToString();

        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString());
        ReportDocument rdStatement = new ReportDocument();
        String reppath = Server.MapPath("CrystalReport_Shareholder_Statement.rpt");
        rdStatement.Load(reppath);
        string query = "SELECT * FROM  view_Shareholder_Statement where [Shareholder ID]="+Convert.ToInt32(shid)+ " AND [Company ID]="+Convert.ToInt32(compid);
        SqlDataAdapter SqlDA = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        SqlDA.Fill(ds, "view_Shareholder_Statement");
        DataTable dt = new DataTable();
        rdStatement.SetDataSource(ds.Tables[0]);
        crvShareholderStatement.ReportSource = rdStatement;

        crvShareholderStatement.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
        crvShareholderStatement.PageZoomFactor = 115;
        crvShareholderStatement.HasZoomFactorList = false;
    }
}