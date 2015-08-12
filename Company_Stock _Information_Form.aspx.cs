using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

using System.Data;
public partial class CSI_form : System.Web.UI.Page
{

    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlDataView.Visible = false;
        btnBack.Visible = false;
        btnDelete.Visible = false;
        divBtnDelete.Visible = false;
        divBtnSubmit.Attributes["class"] = "col-sm-6";

    }
    protected void Submit_Click(object sender, EventArgs e)
    {

        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tbl_Company_Stock_Information(Comp_Id,Stock_Exchange_Name,Scrip_Code,Scrip_Name,Group_Name,Index_Name,Earning_Per_Share,Industry_Type,Total_No_Of_Shares,Listed_Price) values ('"
                                                                    + ddCompanyId.SelectedValue + "','"
                                                                   + txtStockExName.Text + "','"
                                                                   + txtScripCode.Text + "','"
                                                                   + txtScripName.Text + "','"
                                                                   + txtGroupName.Text + "','"
                                                                   + txtIndexName.Text + "',"
                                                                   + Convert.ToDouble(txtEPS.Text) + ",'"
                                                                   + txtInduType.Text + "','"
                                                                   + txtTotal.Text + "','"
                                                                   + txtListPrice.Text + "')";
        }
        else
        {
            qry = "UPDATE tbl_Company_Stock_Information SET Stock_Exchange_Name='" + txtStockExName.Text
                + "',Scrip_Code='" + txtScripCode.Text
                + "',Scrip_Name='" + txtScripName.Text
                + "',Group_Name='" + txtGroupName.Text
                + "',Index_Name='" + txtIndexName.Text
                + "',Earning_Per_Share=" + Convert.ToDouble(txtEPS.Text)
                + ",Industry_Type='" + txtInduType.Text
                + "',Total_No_Of_Shares='" + txtTotal.Text
                + "',Listed_Price='" + txtListPrice.Text
                + "' WHERE CSI_Code='" + GridViewStock.SelectedRow.Cells[1].Text + "'";
        }
        try
        {
            int i = smsclass.setRecord(qry);
            AllClear();
            if (i == 1)
            {
                lblOutput.Text = "Data Inserted Successfully ";
            }
            else
            {
                lblOutput.Text = "Something went wrong.";
            }
        }
        catch (Exception ex)
        {
            lblOutput.Text = "Data Insertion error " + ex.ToString();
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        pnlDataEntry.Visible = false;
        pnlDataView.Visible = true;
        btnBack.Visible = true;
        btnView.Visible = true;
        AllClear();
        FillGrid();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tbl_Company_Stock_Information WHERE CSI_Code='" + GridViewStock.SelectedRow.Cells[1].Text + "'";

        try
        {
            int i = smsclass.setRecord(qry);
            AllClear();
            if (i == 1)
            {
                lblOutput.Text = "Data DELETED Successfully";
            }
            else
            {
                lblOutput.Text = "Something went wrong.";
            }
        }
        catch (Exception ex)
        {
            lblOutput.Text = "Data Deletion error " + ex.ToString();
        }
    }
    protected void AllClear()
    {
        txtEPS.Text = "";
        txtGroupName.Text = "";
        txtIndexName.Text = "";
        txtInduType.Text = "";
        txtListPrice.Text = "";
        txtScripCode.Text = "";
        txtScripName.Text = "";
        txtStockExName.Text = "";
        txtTotal.Text = "";
        lblOutput.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void FillGrid()
    {
        qry = "SELECT a.CSI_Code AS [Code],b.Comp_Name as [Company Name],a.Stock_Exchange_Name AS [Stock Exchange Name], a.Group_Name AS [Group Name], a.Industry_Type AS [Industry Type] FROM tbl_Company_Stock_Information a, tbl_Company_Information b where a.Comp_Id=b.Comp_Id";
        GridViewStock.DataSource = smsclass.getRecord(qry);
        GridViewStock.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        qry = "SELECT * FROM tbl_Company_Stock_Information WHERE CSI_Code='" + GridViewStock.SelectedRow.Cells[1].Text + "'";

        SqlDataReader dr = smsclass.getRecord(qry);
        if (dr.Read())
        {
            ddCompanyId.SelectedValue = dr.GetValue(1).ToString();
            txtStockExName.Text = dr.GetValue(2).ToString();
            txtScripCode.Text = dr.GetValue(3).ToString();
            txtScripName.Text = dr.GetValue(4).ToString();
            txtGroupName.Text = dr.GetValue(5).ToString();
            txtIndexName.Text = dr.GetValue(6).ToString();
            txtEPS.Text = dr.GetValue(7).ToString();
            txtInduType.Text = dr.GetValue(8).ToString();
            txtTotal.Text = dr.GetValue(9).ToString();
            txtListPrice.Text = dr.GetValue(10).ToString();
            btnSubmit.Text = "Update";
            btnDelete.Visible = true;
            btnBack.Visible = true;
            pnlDataEntry.Visible = true;
            pnlDataView.Visible = false;
            divBtnDelete.Visible = true;
            divBtnSubmit.Attributes["class"] = "col-sm-3";
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {

        if (pnlDataEntry.Visible == true)
        {
            pnlDataEntry.Visible = false;
            pnlDataView.Visible = true;
            btnBack.Visible = true;
        }
        else if (pnlDataView.Visible == true)
        {
            pnlDataView.Visible = false;
            pnlDataEntry.Visible = true;
            AllClear();
        }
    }
    protected void ddCompanyId_DataBound(object sender, EventArgs e)
    {
        ddCompanyId.Items.Insert(0, "Select a Company");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        qry = "SELECT a.CSI_Code AS [Code],b.Comp_Name as [Company Name],a.Stock_Exchange_Name AS [Stock Exchange Name], a.Group_Name AS [Group Name], a.Industry_Type AS [Industry Type] FROM tbl_Company_Stock_Information a, tbl_Company_Information b WHERE a.Comp_Id=b.Comp_Id AND a.Comp_Id=" + ddCompanySearch.SelectedValue;
        GridViewStock.DataSource = smsclass.getRecord(qry);
        GridViewStock.DataBind();
        btnBack.Visible = true;
        pnlDataView.Visible = true;
    }
    protected void ddCompanySearch_DataBound(object sender, EventArgs e)
    {
        ddCompanySearch.Items.Insert(0, "Select a Company");
    }
}