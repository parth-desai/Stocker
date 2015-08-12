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
public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime lastdate = DateTime.Now.AddDays(-1);
        //Label1.Text = "Report dated " + lastdate.ToString("dd-MMM-yyyy");
        lblSPDate.Text = "Dated " + lastdate.ToString("dd-MMM-yyyy");

        String query;
        //query = "SELECT * FROM ViewStockPrice";
        query = "SELECT  [Last Date],[Exchange Name],[Company Name],[Share Volume],[Share Price] FROM ViewLastSharePrice_Volume";
            //"' AND [Company id] IN (Select Distinct [Company id], FROM viewDailyTransVolume)";
        SqlDataReader dr = smsclass.getRecord(query);

        GridViewStockPrice.DataSource = dr;
        GridViewStockPrice.DataBind();

        //GridViewStockPrice.Columns[0].Visible = false;


        query = "SELECT DISTINCT Comp_Name FROM viewNews ";
        SqlDataReader dr2 = smsclass.getRecord(query);
        while (dr2.Read())
        {
            string compName = dr2.GetString(0);
            HtmlGenericControl liCompany = new HtmlGenericControl("li");
            HtmlGenericControl ulCompany = new HtmlGenericControl("ul");
            ulNews.Controls.Add(liCompany);
            HtmlGenericControl h4Company= new HtmlGenericControl("h4");
            h4Company.InnerHtml = compName;
            liCompany.Controls.Add(h4Company);
            liCompany.Controls.Add(ulCompany);
            SqlDataReader dr3 = smsclass.getRecord("SELECT TOP 5 News_Date,News_Data from viewNews where Comp_Name='"+compName+"'");
            while (dr3.Read())
            {
                DateTime newsdate = dr3.GetDateTime(0);
                string newsData = dr3.GetString(1);
                HtmlGenericControl linews = new HtmlGenericControl("li");
                linews.InnerHtml = newsdate.ToString("dd-MMM-yyyy") + " <i class=\"fa fa-arrow-right\"></i> " + newsData;
                ulCompany.Controls.Add(linews);
            }
            dr3.Close();
        


        }
        dr2.Close();


       
    }
    protected void GridViewStockPrice_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           e.Row.Cells[0].Text = Convert.ToDateTime(e.Row.Cells[0].Text).ToString("dd-MMM-yyyy");
 
        

        }  
    }
    protected void GridViewStockPrice_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}