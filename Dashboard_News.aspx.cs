using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Click(object sender, EventArgs e)
    {
        string query = "INSERT INTO tbl_News(Comp_Id,News_Date,News_Data) VALUES(" +ddlCompanyName.SelectedValue+",'"+System.DateTime.Now.ToString("dd-MMM-yyyy")+"','"+txtNews.Text+ "')";
        try
        {
            smsclass.setRecord(query);
            lblOutput.Text = "Data Inserted Successfully";
        }
        catch (Exception ex)
        {
            lblOutput.Text = "Data Insertion Error " + ex.ToString();
        }
    }
}