using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Split_Entry_Form : System.Web.UI.Page
{
    String query;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        pnlDataView.Visible = false;
        btnBack.Visible = false;
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        int ratio1 = Convert.ToInt32(txtRatio1.Text);
        int ratio2 = Convert.ToInt32(txtRatio2.Text);
        SqlDataReader dr;
        string compid = "SELECT DISTINCT Comp_Id FROM Complist where CSI_Code=" + ddCompanyName.SelectedValue;
        int faceValue=0;

        string queryFace_Value = "SELECT Face_Value FROM tbl_Company_Information WHERE Comp_Id in ( SELECT DISTINCT Comp_Id FROM Complist where CSI_Code=" + ddCompanyName.SelectedValue+") ";

        try
        {
            dr = smsclass.getRecord(queryFace_Value);
            while(dr.Read())
            {
                faceValue = dr.GetInt32(0);
            }
            dr.Close();
        }
        catch(Exception ex)
        {
            lblOutput.Text = "Error Fetching Face Value "+ ex.ToString();
            return;

        }
        

        int fvCheck = (faceValue * ratio2) % (ratio1 + ratio2);
        int newFV = (faceValue * ratio2) / (ratio1 + ratio2);
        if(fvCheck!=0)
        {
            lblOutput.Text = "Face Value Cannot be Updated with the given ratio. Try Another Ratio";
            return;

        }

        query = "INSERT INTO tbl_Split_Entry(Comp_id,Split_Date,Split_Ratio1,Split_Ratio2) VALUES( "
                    + Convert.ToInt32(ddCompanyName.SelectedValue) + ",'"
                    + txtSplitDate.Text + "',"
                    + Convert.ToInt32(txtRatio1.Text) + "," + Convert.ToInt32(txtRatio2.Text) + ")";

        string queryIncreaseShares;
        queryIncreaseShares = "UPDATE tbl_Share_Owned SET No_Of_Shares_Owned=NO_Of_Shares_Owned+(No_Of_Shares_Owned/" + ratio2 + "*" + ratio1 + ") WHERE CSI_Code in ( SELECT CSI_Code FROM Complist where Comp_Id=" + ddCompanyName.SelectedValue + ")";

        string queryUpdateSharePrice;
        queryUpdateSharePrice = "UPDATE tbl_Company_Stock_Information SET Last_Transaction_Price=Last_Transaction_Price*" + ratio2 + "/(" + ratio1 + "+" + ratio2 + ") WHERE CSI_Code in ( SELECT CSI_Code FROM Complist where Comp_Id=" + ddCompanyName.SelectedValue + ")";

        String queryUpdateFaceValue;
        queryUpdateFaceValue = "UPDATE tbl_Company_Information SET Face_Value=" + newFV + "WHERE Comp_Id in ( SELECT DISTINCT Comp_Id FROM Complist where CSI_Code=" + ddCompanyName.SelectedValue + ") ";

        string query1 = "INSERT INTO tbl_Stock_History(Comp_Id,Date,Activity) VALUES (" + Convert.ToInt32(ddCompanyName.SelectedValue) + ",'" + txtSplitDate.Text + "','Split Declared as " + txtRatio1.Text + " for " + txtRatio2.Text + " Shares')";
        string query2= "INSERT INTO tbl_News(Comp_Id,News_Date,News_Data) VALUES ("+ Convert.ToInt32(ddCompanyName.SelectedValue) +",'"+txtSplitDate.Text+"','Split Declared')";

        try
        {
            //finding last Trans_Id
            string nextTrans_Id;
            int nexttid = 1;
            String queryLastTransId = "SELECT MAX(Trans_Id) FROM tbl_Share_Transaction_Entry";
             dr = smsclass.getRecord(queryLastTransId); // SELECT QUERY TO FIND LAST TRANSACTION ID 
            if (dr.Read())
            {
                nextTrans_Id = dr.GetValue(0).ToString();
                if (nextTrans_Id != "")
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
                //lblOutput.Text = newqty.ToString();

                owned1 = newqty - owned1;

                if (owned1 > 0)
                {
                    String qry = "INSERT INTO tbl_Share_Transaction_Entry (Trans_Id, Trans_Date, Trans_Type, SH_Id, CSI_Code, Buy_Qty, Sell_Qty, Trans_Price) VALUES(" + nexttid + ",'" + txtSplitDate.Text + "','Split'," + rows[2].ToString() + "," + rows[1].ToString() + "," + owned1 + ",0,0)";
                    smsclass.setRecord(qry);

                    nexttid++;
                }
            }

            smsclass.setRecord(query);
            smsclass.setRecord(query1);
            smsclass.setRecord(query2);
            smsclass.setRecord(queryIncreaseShares);
            smsclass.setRecord(queryUpdateSharePrice);
            smsclass.setRecord(queryUpdateFaceValue);
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

    protected void btnBack_Click(object sender, EventArgs e)
    {
      
            pnlDataView.Visible = false;
            pnlDataEntry.Visible = true;
            btnBack.Visible = false;
        
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        pnlDataEntry.Visible = false;
        pnlDataView.Visible = true;
        btnBack.Visible = true;
    }
    void FillGrid()
    {
        query = "SELECT  Split_Id AS [ID], Split_Date AS [Split Date],Convert(varchar(10),Split_Ratio1)+' for '+Convert(varchar(10),Split_Ratio2) AS [Split Ratio] FROM tbl_Split_Entry WHERE Comp_Id=" + ddCompanySearch.SelectedValue;
        SqlDataReader dr = smsclass.getRecord(query);
        if (dr.HasRows)
        {
            GridViewSplit.DataSource = dr;
            GridViewSplit.DataBind();
            lblErrorBonus.Visible = false;
        }
        else
        {
            lblErrorBonus.Text = "This Company Did Not Issue any Split Shares to its Shareholders";
            lblErrorBonus.Visible = true;
        }
        dr.Close();
    }
    protected void ddCompanySearch_DataBound(object sender, EventArgs e)
    {
        ddCompanySearch.Items.Insert(0, "Select a Company");
    }
    protected void btnSearchCompany_Click(object sender, EventArgs e)
    {
        FillGrid();
        pnlDataView.Visible = true;
        GridViewSplit.Visible = true;
        btnBack.Visible = true;
    }
}