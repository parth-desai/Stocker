using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Dividend_Entry : System.Web.UI.Page
{
    string query;
    int percent;
    int facevalue;
    float amount;
    protected void Page_Load(object sender, EventArgs e)
    {
        btnBack.Visible = false;
        pnlDataView.Visible = false;
        btnDelete.Visible = false;

    }
    
    protected void ddCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        query = "SELECT Face_Value from tbl_Company_Information where Comp_Id=" + ddCompany.SelectedValue;
        SqlDataReader dr=smsclass.getRecord(query);
        while (dr.Read())
        {
            txtFaceValue.Text = dr.GetValue(0).ToString();
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        query = "INSERT  INTO tbl_Dividend_Entry(Comp_Id,Dividend_Date,Dividend_Percent,Dividend_Amount) VALUES ("
            + Convert.ToInt32(ddCompany.SelectedValue)
            + ",'" + txtDividendDate.Text + "'," + Convert.ToInt32(txtDividendPercent.Text)+ "," + Convert.ToInt32(txtAmount.Text) + ")";
        string query1 = "INSERT INTO tbl_Stock_History(Comp_Id,Date,Activity) VALUES (" + Convert.ToInt32(ddCompany.SelectedValue) + ",'" + txtDividendDate.Text + "',''Bonus Declared at"+txtDividendPercent.Text+"')";
        string query2 = "INSERT INTO tbl_News(Comp_Id,News_Date,News_Data) VALUES (" + Convert.ToInt32(ddCompany.SelectedValue) + ",'" + txtDividendDate.Text + "','Split Declared')";
        try
        {

            int i = smsclass.setRecord(query);
            if (i == 1)
                lblOutput.Text = "Data Inserted Successfully";
            else
                lblOutput.Text = "Some Error Occured ";

            int j = smsclass.setRecord(query1);
            if (j == 1)
                lblOutput.Text = "Data Inserted Successfully";
            else
                lblOutput.Text = "Some Error Occured ";
            smsclass.setRecord(query2);
        }
        catch (Exception ex)
        {
            lblOutput.Text = "Data Insertion Error " + ex.ToString();
        }
        
    }
    protected void ddCompany_DataBound(object sender, EventArgs e)
    {
        ddCompany.Items.Insert(0, "Select a Company");
    }
    protected void FillGrid()
    {
        
        
        query = "SELECT Comp_Id AS [ID],Dividend_Date AS [Dividend Date],Dividend_Percent AS [Dividend %],Dividend_Amount AS [Dividend Amount] FROM tbl_Dividend_Entry WHERE Comp_Id = " + ddCompanySearch.SelectedValue;
        SqlDataReader dr = smsclass.getRecord(query);
        if (dr.HasRows)
        {
            GridViewDividend.DataSource = dr;
            GridViewDividend.DataBind();
            lblErrorDividend.Visible = false;
        }
        else
        {
            lblErrorDividend.Text = "This Company Did Not Issue any Dividend to its Shareholders";
            lblErrorDividend.Visible = true;
        }
        dr.Close();


    }

    protected void GridViewDividend_SelectedIndexChanged(object sender, EventArgs e)
    {
        //query = "SELECT * FROM tbl_Dividend_Entry WHERE Dividend_Id='" + GridViewDividend.SelectedRow.Cells[1].Text + "'";

        //SqlDataReader dr = smsclass.getRecord(query);
        //if (dr.Read())
        //{
        //    ddCompany.SelectedValue = dr.GetInt32(1).ToString();
        //    txtDividendDate.Text = dr.GetValue(2).ToString();
        //    txtDividendPercent.Text = dr.GetValue(3).ToString();
        //    txtAmount.Text = dr.GetValue(4).ToString();


        //    btnSubmit.Text = "Update";
        //    btnDelete.Visible = true;

        //    pnlDataEntry.Visible = true;
        //    pnlDataView.Visible = false;
        //    btnView.Visible = true;
        //}
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        btnBack.Visible = true;

        pnlDataView.Visible = true;
        pnlDataEntry.Visible = false;
    }
    protected void btnSearchCompany_Click(object sender, EventArgs e)
    {
        FillGrid();
        pnlDataView.Visible = true;
        btnBack.Visible = true;
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        
            pnlDataView.Visible = false;
            pnlDataEntry.Visible = true;
            btnBack.Visible = false;

        
    }
    protected void txtDividendPercent_TextChanged1(object sender, EventArgs e)
    {
        percent = int.Parse(txtDividendPercent.Text);
        facevalue = int.Parse(txtFaceValue.Text);
        amount = (percent * facevalue)/100;
        txtAmount.Text = amount.ToString();
        
    }
}