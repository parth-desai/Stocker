using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

using System.Web.UI.HtmlControls;

public partial class Shareholder_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Session["Type"] == "" || Session["Type"] == null)
        {

            Session.Abandon();
            Response.Redirect("Login_Page.aspx");
            return;
        }
        string query = "SELECT [Company Name],[Shares In Hand],[Last Transaction Price],[Current Amount] FROM viewSH_Investment WHERE SH_Id=" + Session["shid"].ToString();
        GridViewPortfolio.DataSource = smsclass.getRecord(query);
        GridViewPortfolio.DataBind();




        query = "SELECT  TOP 10 [Company Name],[Exchange Name],[Transaction Date],[Transaction Type],[Share Quantity],[Price Per Share] FROM viewShareholderTransaction WHERE Sh_Id=" + Session["shid"].ToString();
        GridViewTransactions.DataSource = smsclass.getRecord(query);
        GridViewTransactions.DataBind();


    }
    protected void GridViewTransactions_DataBound(object sender, EventArgs e)
    {

    }
    protected void GridViewTransactions_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToString("dd-MMM-yyyy");



        }  

    }
    protected void GridViewTransactions_SelectedIndexChanged(object sender, EventArgs e)
    {
       

    }
    protected void GridViewPortfolio_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtCompanyName.Text = GridViewPortfolio.SelectedRow.Cells[1].Text.ToString();
        txtQuantityhand.Text = GridViewPortfolio.SelectedRow.Cells[2].Text.ToString();

        string query = "SELECT [Company Name],[Company Id],[Buying Amount],[Selling Amount] FROM viewSH_Amount WHERE [Shareholder Id]=" + Session["shid"].ToString() + " AND [Company Name]='" + txtCompanyName.Text + "'";
        SqlDataReader dr = smsclass.getRecord(query);

        double samount = 0;
        double bamount = 0;
        if (dr.Read())
        {
            samount = dr.GetDouble(2);
            bamount = dr.GetDouble(3);
        }

        double rate = Convert.ToDouble(GridViewPortfolio.SelectedRow.Cells[3].Text.ToString());
        float qty = float.Parse(GridViewPortfolio.SelectedRow.Cells[2].Text.ToString());
        double currentvalue = rate * qty;
        float investment = float.Parse(GridViewPortfolio.SelectedRow.Cells[4].Text.ToString());
        double profit = currentvalue - (bamount - samount);
        txtCurrentValue.Text = currentvalue.ToString();
        txtProfitLoss.Text = profit.ToString();



        if (profit >= 0)
        {
            txtProfitLoss.BackColor = System.Drawing.Color.LightGreen;
            txtProfitLoss.ForeColor = System.Drawing.Color.Blue;
        }
        else
        { 
            txtProfitLoss.BackColor = System.Drawing.Color.Red;
            txtProfitLoss.ForeColor = System.Drawing.Color.White;
        }
    }
}