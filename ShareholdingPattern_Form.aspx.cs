using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data.SqlClient;
using System.Configuration;

using System.Data;


public partial class ShareholdingPattern_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void gridviewShpattern_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlCompanyName_SelectedIndexChanged(object sender, EventArgs e)
    {
        String qry;

        qry = "SELECT [Main Category],[Sub Category],[Shares Owned] From viewShareHoldingPattern where [Company Name] like '" + ddlCompanyName.SelectedValue+"'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString());
        SqlCommand cmd = new SqlCommand(qry, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        dt.Columns.Add("Percentage", typeof(float));

        int count = dt.Rows.Count;
        int[] shares=new int[count];
        int sum = 0;
        for (int i = 0; i < count; i++)
        {
            shares[i] =Convert.ToInt32( dt.Rows[i][2].ToString());
            sum = sum + shares[i];
            

        }
        
        for (int i = 0; i < count; i++)
        {

            dt.Rows[i][3] =(float) shares[i]*100/sum;

        }


        gridviewShpattern.DataSource = dt;
        gridviewShpattern.DataBind();
     
    }
    protected void ddlCompanyName_DataBound(object sender, EventArgs e)
    {
        ddlCompanyName.Items.Insert(0, "Select a Company Name");
    }
}