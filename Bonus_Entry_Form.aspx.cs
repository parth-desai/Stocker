using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Bonus_Entry_Form : System.Web.UI.Page
{
    String query;
    
    protected void Page_Load(object sender, EventArgs e)
    {

        pnlDataView.Visible = false;
        btnBack.Visible = false;
    }
    
    protected void Submit_Click(object sender, EventArgs e)
    {

        int ratio1=Convert.ToInt32(txtRatio1.Text);
        int ratio2=Convert.ToInt32(txtRatio2.Text);
        
        
        query = "INSERT INTO tbl_Bonus_Entry(Comp_Id,Bonus_Date,Bonus_Ratio1,Bonus_Ratio2) VALUES( "
                   + Convert.ToInt32(ddCompanyName.SelectedValue) + ",'"
                   + txtBonusDate.Text + "',"
                   + ratio1 + "," + ratio2 + ")";

        string query1="INSERT INTO tbl_Stock_History(Comp_Id,Date,Activity) VALUES ("+Convert.ToInt32(ddCompanyName.SelectedValue)+",'"+txtBonusDate.Text+"','Bonus Declared as "+txtRatio1.Text+" for "+txtRatio2.Text+" Shares')";
        string query2 = "INSERT INTO tbl_News(Comp_Id,News_Date,News_Data) VALUES (" + Convert.ToInt32(ddCompanyName.SelectedValue) + ",'" + txtBonusDate.Text + "','Split Declared')";
        
        string queryIncreaseShares;
        queryIncreaseShares = "UPDATE tbl_Share_Owned SET No_Of_Shares_Owned=NO_Of_Shares_Owned+(No_Of_Shares_Owned/" + ratio2 + "*" + ratio1 + ") WHERE CSI_Code in ( SELECT CSI_Code FROM Complist where Comp_Id=" + ddCompanyName.SelectedValue+")";

        string queryUpdateSharePrice;
        queryUpdateSharePrice = "UPDATE tbl_Company_Stock_Information SET Last_Transaction_Price=Last_Transaction_Price*" + ratio2 + "/(" + ratio1 + "+" + ratio2 + ") WHERE CSI_Code in ( SELECT CSI_Code FROM Complist where Comp_Id=" + ddCompanyName.SelectedValue + ")";
        try
        {
            //finding last Trans_Id
            string nextTrans_Id ;
            int nexttid = 1;
            String queryLastTransId = "SELECT MAX(Trans_Id) FROM tbl_Share_Transaction_Entry";
            SqlDataReader dr = smsclass.getRecord(queryLastTransId); // SELECT QUERY TO FIND LAST TRANSACTION ID 
            if (dr.Read())
            {
                nextTrans_Id = dr.GetValue(0).ToString();
                if(nextTrans_Id!="")
                nexttid = Convert.ToInt32(nextTrans_Id) + 1;
            }

            
            dr.Close();

            string loopquery = "SELECT * FROM tbl_Share_Owned WHERE CSI_Code in (SELECT CSI_Code FROM Complist where Comp_Id=" + ddCompanyName.SelectedValue + ") AND No_Of_Shares_Owned>0";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString());
            SqlCommand cmd = new SqlCommand(loopquery, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            foreach (DataRow rows in ds.Tables[0].Rows)
            {
                int owned = int.Parse(rows[3].ToString());
                int owned1 = int.Parse(rows[3].ToString());
                int remval = (owned % ratio2);

                owned = owned - remval;

                int newqty = (owned / ratio2 * ratio1) + owned + remval;

                owned1 = newqty - owned1;

                if (owned1 > 0)
                {
                    String qry = "INSERT INTO tbl_Share_Transaction_Entry (Trans_Id, Trans_Date, Trans_Type, SH_Id, CSI_Code, Buy_Qty, Sell_Qty, Trans_Price) VALUES(" + nexttid + ",'" + txtBonusDate.Text + "','Bonus'," + rows[2].ToString() + "," + rows[1].ToString() + "," + owned1 + ",0,0)";
                    smsclass.setRecord(qry);

                    nexttid++;
                }
            }

           smsclass.setRecord(query);
            //smsclass.setRecord(query1);
           // smsclass.setRecord(query2);
           smsclass.setRecord(queryIncreaseShares);
           smsclass.setRecord(queryUpdateSharePrice);
            lblOutput.Text = "Data Inserted Successfully";

        }
        catch (Exception ex)
        {
            lblOutput.Text = "Data Insertion Error" + ex.ToString();
        }
    }
    protected void ddCompanyName_DataBound(object sender, EventArgs e)
    {
        ddCompanyName.Items.Insert(0, "Select a Company");
    }




    protected void ddCompanyName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        pnlDataEntry.Visible = false;
        pnlDataView.Visible = true;
        btnBack.Visible = true;
    }
     
    void FillGrid()
    {
        query = "SELECT  Bonus_Id AS [ID], Bonus_Date AS [Bonus Date],Convert(varchar(10),Bonus_Ratio1)+' for '+Convert(varchar(10),Bonus_Ratio2) AS [Bonus Ratio] FROM tbl_Bonus_Entry WHERE Comp_Id=" + ddCompanySearch.SelectedValue;
        SqlDataReader dr = smsclass.getRecord(query);
        if(dr.HasRows)
        {
            GridViewBonus.DataSource = dr;
            GridViewBonus.DataBind();
            lblErrorBonus.Visible = false;
        }
        else
        {
            lblErrorBonus.Text = "This Company Did Not Issue any Bonus Shares to its Shareholders";
            lblErrorBonus.Visible = true;
        }
        dr.Close();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
       
            pnlDataView.Visible = false;
            pnlDataEntry.Visible = true;
            btnBack.Visible = false;
        
    }
    protected void btnSearchCompany_Click(object sender, EventArgs e)
    {
        FillGrid();
        pnlDataView.Visible = true;
        GridViewBonus.Visible = true;
        btnBack.Visible = true;
    }
    protected void ddCompanySearch_DataBound(object sender, EventArgs e)
    {
        ddCompanySearch.Items.Insert(0, "Select a Company");
    }
}