using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Company_Stock_History_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlCompanyName_SelectedIndexChanged(object sender, EventArgs e)
    {
        String qry;
        if (ddlCompanyName.SelectedValue == "0")
        {
            lblOutput.Text = "Select a Company";
        }

        qry = "SELECT Activity_Id AS [Activity Id], Date AS [Activity Date] ,Activity  FROM tbl_Stock_History WHERE Comp_Id =" + ddlCompanyName.SelectedValue;



        gridviewStockHistory.DataSource = smsclass.getRecord(qry);
       
        gridviewStockHistory.DataBind();
        
    
    }
    protected void ddlCompanyName_DataBound(object sender, EventArgs e)
    {
        ddlCompanyName.Items.Insert(0, "Select A Comapny Name");
    }
}