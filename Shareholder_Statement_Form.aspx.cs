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

public partial class Shareholder_Statement_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddCompanyName_SelectedIndexChanged(object sender, EventArgs e)
    {
        String query = "SELECT  DISTINCT CONVERT(Varchar(10),[Shareholder ID])+' '+[Shareholder Name] AS [Shareholder], [Shareholder ID] AS SH_Id FROM view_Shareholder_Statement where [Company ID]=" + ddCompanyName.SelectedValue;
        SqlDataReader dr = smsclass.getRecord(query);
        ddShareholderName.DataTextField = "Shareholder";
        ddShareholderName.DataValueField = "SH_Id";
        ddShareholderName.DataSource = dr;
        ddShareholderName.DataBind();
    }
    protected void ddCompanyName_DataBound(object sender, EventArgs e)
    {
        ddCompanyName.Items.Insert(0, "Select A Company Name");
    }
    protected void btnReport_Click(object sender, EventArgs e)
    {
        if (ddCompanyName.SelectedValue == "0" || ddShareholderName.SelectedValue == "0")
        {
            lblOutput.Text = "Select a Company Name then a Shareholder Name";
            return;
        } 

        Session["shid"] = ddShareholderName.SelectedValue;
        Session["compid"] = ddCompanyName.SelectedValue;
        Response.Redirect("Crv_Shareholder_Statement.aspx");
        

    }
}