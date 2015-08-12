using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

using System.Data;

public partial class Share_Transaction_Entry : System.Web.UI.Page
{
    String query;
    int transType;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlDataView.Visible = false;
        
        btnBack.Visible = false; 
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtQty_TextChanged(object sender, EventArgs e)
    {
        //GetAmount();
    }
    protected void txtRate_TextChanged(object sender, EventArgs e)
    {
        GetAmount();
    }

    protected void GetAmount()
    {
        if (txtQty.Text == "") txtQty.Text = "0";
        if (txtRate.Text == "") txtRate.Text = "0";

        double q = double.Parse(txtQty.Text);
        double r = double.Parse(txtRate.Text);
        double a = q * r;

        txtAmount.Text = a.ToString();
    }
    protected void ddlExName_SelectedIndexChanged(object sender, EventArgs e)
    {
        query = "SELECT * FROM Complist WHERE Stock_Exchange_Name='" + ddExchangeName.SelectedValue + "'";
        ddCompanyName.DataTextField = "Comp_Name";
        ddCompanyName.DataValueField = "CSI_Code";
        ddCompanyName.DataSource = smsclass.getRecord(query);
        ddCompanyName.DataBind();
    }
    protected void ddExchangeName_DataBound(object sender, EventArgs e)
    {
        ddExchangeName.Items.Insert(0, "Select a Stock Exchange");
    }

    protected void ddCompanyName_DataBound(object sender, EventArgs e)
    {
        ddCompanyName.Items.Insert(0, "Select a Company");
    }
    protected void ddlBuyer_SelectedIndexChanged(object sender, EventArgs e)
    {
        query = "SELECT * FROM tbl_Shareholder_Information WHERE SH_Id != '" + ddBuyerName.SelectedValue + "'";
        ddSellerName.DataTextField = "SH_FUll_Name";
        ddSellerName.DataValueField = "SH_Id";
        ddSellerName.DataSource = smsclass.getRecord(query);
        ddSellerName.DataBind();
    }
    protected void ddBuyerName_DataBound(object sender, EventArgs e)
    {
        ddBuyerName.Items.Insert(0, "Select a Buyer Name");
    }
    protected void ddSellerName_DataBound(object sender, EventArgs e)
    {
        ddSellerName.Items.Insert(0, "Select a Seller Name");
    }
    protected void btnTransfer_Click(object sender, EventArgs e)
    {
        query = "SELECT MAX(Trans_Id) FROM tbl_Share_Transaction_Entry";
        SqlDataReader dr = smsclass.getRecord(query); // SELECT QUERY TO FIND LAST TRANSACTION ID 

        int maxtransId = 0;
        try
        {
            if (dr.Read())
            {
                
                   String  transId = dr.GetValue(0).ToString();
                   if (transId != "")
                   {
                       maxtransId = Convert.ToInt32(transId);
                   }

            }
            lblOutput.Text = lblOutput.Text + maxtransId + " TRANS ID";
        }
        catch (System.Data.SqlTypes.SqlNullValueException se)
        {
            lblOutput.Text = lblOutput.Text + "Couldnt find max transaction id";
        }

        transType = Convert.ToInt32(ddTransType.SelectedValue);

        if (transType == 1)
        {
            transAllotment(maxtransId);
        }
        else if (transType == 2)
        {
             transTransfer(maxtransId);
        }




    }

    protected void ddCompanyName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddTransType_SelectedIndexChanged(object sender, EventArgs e)
    {
        transType = Convert.ToInt32(ddTransType.SelectedValue);
        if (transType == 1)
        {
            ddSellerName.Enabled = false;
            txtRate.Enabled = false;
            txtRate.Text = "0";
        }
        else if(transType==2)
        {
            ddSellerName.Enabled = true;
            txtRate.Enabled = true;
            txtRate.Text = "";
        }
        lblOutput.Text += " " + transType + " trans type";

    }

    protected void transTransfer(int maxTransId)
    {
        long noSellerShares = 0;
       
        SqlDataReader dr;
       




        query = "Select No_Of_Shares_Owned From tbl_Share_Owned where SH_id=" + ddSellerName.SelectedValue
                                                        + " AND CSI_Code=" + ddCompanyName.SelectedValue;
        dr = smsclass.getRecord(query);  // SELECT QUERY TO FIND NO OF SHARES OWNED BY SELLER
        try
        {
            if (dr.HasRows)
            {
                bool next = dr.Read();
                if (next == true)
                    noSellerShares = dr.GetInt64(0);

            }
            else
            {
                lblOutput.Text = lblOutput.Text + "Seller Doesn't Own Any Shares "+noSellerShares ;
            }
            lblOutput.Text = lblOutput.Text + noSellerShares + " SELLER";
        }
        catch (Exception se)
        {
            lblOutput.Text = lblOutput.Text + "COULDNT FIND BUYER SHARES";
        }

        long sellqty = Convert.ToInt64(txtQty.Text);
        if (noSellerShares >= sellqty)
        {
            maxTransId++;
            string queryBuy = "INSERT INTO tbl_Share_Transaction_Entry(Trans_Id,Trans_Date,Trans_Type,Sh_Id,CSI_Code,Buy_Qty,Sell_Qty,Trans_Price) VALUES ( "
                + maxTransId + ",'"
                   + txtTransDate.Text + "','"
                   + "Buy" + "',"
                   + ddBuyerName.SelectedValue + ","
                   + ddCompanyName.SelectedValue + ","
                   + Convert.ToInt64(txtQty.Text) + ",0,"
                   + Convert.ToDouble(txtRate.Text) + ")";

            String querySell = "INSERT INTO tbl_Share_Transaction_Entry(Trans_Id,Trans_Date,Trans_Type,Sh_Id,CSI_Code,Buy_Qty,Sell_Qty,Trans_Price) VALUES ( "
                 + maxTransId + ",'"
                 + txtTransDate.Text + "','"
                 + "Sell" + "',"
                 + ddSellerName.SelectedValue + ","
                 + ddCompanyName.SelectedValue + ",0,"
                 + Convert.ToInt64(txtQty.Text) + ","
                 + Convert.ToDouble(txtRate.Text) + ")";

            String queryUpdateBuyer = "UPDATE tbl_Share_Owned SET No_Of_Shares_Owned=No_Of_Shares_Owned+" + sellqty
                                                + "WHERE CSI_Code=" + ddCompanyName.SelectedValue
                                                + " AND SH_Id=" + ddBuyerName.SelectedValue;
            String queryUpdateSeller = "UPDATE tbl_Share_Owned SET No_Of_Shares_Owned=No_Of_Shares_Owned-" + sellqty
                                                + "WHERE CSI_Code=" + ddCompanyName.SelectedValue
                                                + " AND SH_Id=" + ddSellerName.SelectedValue;
            String queryLastTransPrice = "UPDATE tbl_Company_Stock_Information SET Last_Transaction_Price=" + Convert.ToDouble(txtRate.Text)
                                                + " WHERE CSI_Code=" + ddCompanyName.SelectedValue;

            int rowsaffected;
            try
            {
                rowsaffected = smsclass.setRecord(queryBuy);               // INSERT QUERY TO INSERT RECORD TO SHOW BUY TRANSACTION
                lblOutput.Text = lblOutput.Text + rowsaffected + "queryBuy\n";

                rowsaffected = smsclass.setRecord(querySell);              // INSERT QUERY TO INSERT RECORD TO SHOW SELL TRANSACTION
                lblOutput.Text = lblOutput.Text + rowsaffected + " querySell\n";


                rowsaffected = smsclass.setRecord(queryUpdateBuyer);       // UPDATE QUERY TO INCREASE NUMBER OF SHARES OF BUYER
                if (rowsaffected == 0)
                {
                    queryUpdateBuyer = "INSERT INTO tbl_Share_Owned(CSI_Code,SH_Id,No_OF_Shares_Owned) VALUES("
                                       + ddCompanyName.SelectedValue + "," + ddBuyerName.SelectedValue + "," + Convert.ToInt64(txtQty.Text) + ")";
                    rowsaffected = smsclass.setRecord(queryUpdateBuyer);
                    //lblOutput.Text = rowsaffected + "INSERT \n";
                }

                lblOutput.Text = lblOutput.Text + rowsaffected + " queryUpdateBuyer\n";
                rowsaffected = smsclass.setRecord(queryUpdateSeller);      // UPDATE QUERY TO DECREASE NUMBER OF SHARES OF SELLER
                lblOutput.Text = lblOutput.Text + rowsaffected + " queryUpdateSeller\n";

                rowsaffected = smsclass.setRecord(queryLastTransPrice);
                lblOutput.Text = lblOutput.Text + rowsaffected + " queryLastTransPrice \n";
                lblOutput.Text = lblOutput.Text+" Share Transfer Completed Successfully";
            }
            catch (Exception ex)
            {
                lblOutput.Text = ex.ToString();
            }
        }
        else
        {
            lblOutput.Text = "Seller doesn't own that many Shares... Try Again";
        }

    }

    protected void transAllotment(int maxTransId)
    {
        lblOutput.Text = "allotment";
       

        long qty = Convert.ToInt64(txtQty.Text);

        String queryUpdateBuyer = "UPDATE tbl_Share_Owned SET No_Of_Shares_Owned=No_Of_Shares_Owned+" + qty
                                            + "WHERE CSI_Code=" + ddCompanyName.SelectedValue
                                            + " AND SH_Id=" + ddBuyerName.SelectedValue;
        int rowsaffected = -1;
        try
        {


            rowsaffected = smsclass.setRecord(queryUpdateBuyer);       // UPDATE QUERY TO INCREASE NUMBER OF SHARES OF BUYER
            lblOutput.Text = rowsaffected + "UPDATE \n";
            if (rowsaffected == 0)
            {
                queryUpdateBuyer = "INSERT INTO tbl_Share_Owned(CSI_Code,SH_Id,No_OF_Shares_Owned) VALUES(" + ddCompanyName.SelectedValue + "," + ddBuyerName.SelectedValue + "," + qty + ")";
                rowsaffected = smsclass.setRecord(queryUpdateBuyer);
                lblOutput.Text = rowsaffected + "INSERT \n";
            }



        }
        catch (Exception ex)
        {
            lblOutput.Text = ex.ToString();
        }

        maxTransId++;

        String queryTransEntry = "INSERT INTO tbl_Share_Transaction_Entry(Trans_Id,Trans_Date,Trans_Type,Sh_Id,CSI_Code,Buy_Qty,Trans_Price) VALUES ( "
                 + maxTransId + ",'"
                 + txtTransDate.Text + "','"
                 + "Allotment" + "',"
                 + ddBuyerName.SelectedValue + ","
                 + ddCompanyName.SelectedValue + ","
                 + Convert.ToInt64(txtQty.Text) + ","
                 + Convert.ToDouble(txtRate.Text)
                 + ")";
        try
        {

            rowsaffected = smsclass.setRecord(queryTransEntry);       // INSERT QUERY TO ADD A ENTRY FOR SHARE TRANSACTION
            lblOutput.Text = "Share Allotment Completed Successfully \n";
        }
        catch (Exception ex)
        {
            lblOutput.Text = ex.ToString();
        }


    }


    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlDataView.Visible = false;
        pnlDataEntry.Visible = true;
        btnBack.Visible = false;
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        FillGrid();
        pnlDataView.Visible = true;
        pnlDataEntry.Visible = false;
        btnBack.Visible = true;
    }
    public void FillGrid()
    {
        string query = "SELECT * FROM viewShareTransaction";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString());
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridViewTransaction.DataSource = dt;
        GridViewTransaction .DataBind();

    }



    protected void btnSearchTransaction_Click(object sender, EventArgs e)
    {
        if (ddlCompany.SelectedIndex != 0)
        {
            string query = "SELECT * FROM viewShareTransaction WHERE [Company Id]=" + ddlCompany.SelectedValue + " AND Date BETWEEN '" + txtStartDate.Text + "' AND '" + txtEndDate.Text + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString());
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewTransaction.DataSource = dt;
            GridViewTransaction.DataBind();
            pnlDataView.Visible = true;
            btnBack.Visible = false;
        }
        else
            lblError.Text = "Select a Company";
    }
    protected void ddlCompany_DataBound(object sender, EventArgs e)
    {
        ddlCompany.Items.Insert(0,"Select a Company");
    }
    protected void GridViewTransaction_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[4].Text = Convert.ToDateTime(e.Row.Cells[4].Text).ToString("dd-MMM-yyyy");



        }  
    }
}