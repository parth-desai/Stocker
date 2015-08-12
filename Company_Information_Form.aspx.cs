using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Company_Information_Form : System.Web.UI.Page
{
    String qry;
    String qry1;
    int counter = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        string search = Request.QueryString["Search"];
        divDelete.Visible = false;
        divSubmit.Attributes["class"] = "col-sm-6";
        if (search == null)
        {
            pnlDataView.Visible = false;
            btnDelete.Visible = false;
            btnBack.Visible = false;
        }
        else if (search == "1")
        {
            lblOutput.Text = search;
            pnlDataEntry.Visible = false;
            pnlDataView.Visible = true;
            btnBack.Visible = false;
            FillGrid();
            GridViewCompany.Columns[0].Visible = false;
        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        


        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tbl_Company_Information(Comp_Name,Comp_Start_Date,Comp_Contact_Person,Comp_Address,Comp_City,Comp_State,Comp_Pincode,Comp_Phone_No,Comp_Fax_No,Face_Value) values ('"
                                                                   + txtName.Text + "','"
                                                                   + txtStartDate.Text + "','"
                                                                   + txtContact.Text + "','"
                                                                   + txtAddress.Text + "','"
                                                                   + txtCity.Text + "','"
                                                                   + txtState.Text + "','"
                                                                   + txtPinCode.Text + "','"
                                                                   + txtPhone.Text + "','"
                                                                   + txtFax.Text + "',10)";    //Face Value At should always be 10

            

        }
        else
        {
            qry = "UPDATE tbl_Company_Information SET Comp_Name='" + txtName.Text
                                                    + "',Comp_Start_Date='" + txtStartDate.Text
                                                    + "',Comp_Contact_Person='" + txtContact.Text
                                                    + "',Comp_Address='" + txtAddress.Text
                                                    + "',Comp_City='" + txtCity.Text
                                                    + "',Comp_State='" + txtState.Text
                                                    + "',Comp_Pincode='" + txtPinCode.Text
                                                    + "',Comp_Phone_No='" + txtPhone.Text
                                                    + "',Comp_Fax_No='" + txtFax.Text
                                                    + "' WHERE Comp_Id='" + GridViewCompany.SelectedRow.Cells[1].Text + "'";

            qry1 = "UPDATE tbl_Stock_History SET Date='" + txtStartDate.Text + "' WHERE Comp_Id='" + GridViewCompany.SelectedRow.Cells[1].Text + "'";

        }
        try
        {
            int i = smsclass.setRecord(qry);

            if (i == 1)
            {
                lblOutput.Text = "Data Inserted Successfully";
                int CompId = 1;
                SqlDataReader dr = smsclass.getRecord("SELECT Comp_Id FROM tbl_Company_Information WHERE Comp_Name='"+txtName.Text+"'");
                if (dr.Read())
                {
                    String compid = dr.GetValue(0).ToString();
                    if (compid != "")
                    {
                        CompId = Convert.ToInt32(compid);
                    }
                }
                dr.Close();

                qry1 = "INSERT INTO tbl_Stock_History(Comp_Id,Date,Activity) VALUES (" + CompId + ",'" + txtStartDate.Text + "','Company Start Date')";
                int j = smsclass.setRecord(qry1);
                AllClear();
                if (j == 1)
                {
                    lblOutput.Text = "Data Inserted Successfully";
                }
                else
                {
                    lblOutput.Text = "Something went wrong.";
                }

            }
            else
            {
                lblOutput.Text = "Something went wrong.";
            }

            
        }
        catch (Exception ex)
        {
            lblOutput.Text = "Data Insertion Error" + ex.ToString();
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {

        pnlDataEntry.Visible = false;
        pnlDataView.Visible = true;
        txtSearchCompName.Text = "";
        AllClear();
        FillGrid();
        btnBack.Visible = true;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tbl_Company_Information WHERE Comp_Id='" + GridViewCompany.SelectedRow.Cells[1].Text + "'";
        qry1 = "DELETE FROM tbl_Stock_History WHERE Comp_Id='" + GridViewCompany.SelectedRow.Cells[1].Text + "'";
        try
        {
            int i = smsclass.setRecord(qry);
            if (i == 1)
            {
                lblOutput.Text = "Data Deleted successfully";
            }
            else
            {
                lblOutput.Text = "Something went wrong";
            }

            int j = smsclass.setRecord(qry1);
            AllClear();
            lblOutput.Text = "Data Deleted successfully";
            
        }
        catch (Exception ex)
        {
            lblOutput.Text = "Data Insertion Error" + ex.ToString();
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        //if (pnlDataEntry.Visible == true)
        //{
        //    pnlDataEntry.Visible = false;
        //    pnlDataView.Visible = true;
        //    btnBack.Visible = true;
        //}
        //else if (pnlDataView.Visible == true)
        //{
        //    pnlDataEntry.Visible = true;
        //    pnlDataView.Visible = false;
        //    AllClear();
        //    btnBack.Visible = true;
        //}
        pnlDataEntry.Visible = true;
        pnlDataView.Visible = false;
    }
    protected void AllClear()
    {
        txtAddress.Text = "";
        txtStartDate.Text = "";
        txtCity.Text = "";
        txtContact.Text = "";
        txtFax.Text = "";
        txtName.Text = "";
        txtPhone.Text = "";
        txtPinCode.Text = "";
        txtState.Text = "";
        lblOutput.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void FillGrid()
    {
        qry = "SELECT Comp_Id AS [Company ID],Comp_Start_Date as [Company Start Date],Comp_Name AS [Company Name],Comp_State AS [State],Comp_Phone_No AS [Phone No] FROM tbl_Company_Information WHERE Comp_Name LIKE '" + txtSearchCompName.Text + "%'";
        GridViewCompany.DataSource = smsclass.getRecord(qry);
        GridViewCompany.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        qry = "SELECT * FROM tbl_Company_Information WHERE Comp_Id='" + GridViewCompany.SelectedRow.Cells[1].Text + "'";

        SqlDataReader dr = smsclass.getRecord(qry);
        if (dr.Read())
        {
            txtName.Text = dr.GetValue(1).ToString();
            DateTime st = dr.GetDateTime(2);
            txtStartDate.Text = st.ToString("dd-MMMM-yyyy");
            txtContact.Text = dr.GetValue(3).ToString();
            txtAddress.Text = dr.GetValue(4).ToString();
            txtCity.Text = dr.GetValue(5).ToString();
            txtState.Text = dr.GetValue(6).ToString();
            txtPinCode.Text = dr.GetValue(7).ToString();
            txtPhone.Text = dr.GetValue(8).ToString();
            txtFax.Text = dr.GetValue(9).ToString();

            btnSubmit.Text = "Update";
            btnDelete.Visible = true;
            divDelete.Visible = true;
            divSubmit.Attributes["class"] = "col-sm-3";
            pnlDataEntry.Visible = true;
            pnlDataView.Visible = false;
            btnView.Visible = true;
        }
    }
    protected void btnSearchCompany_Click(object sender, EventArgs e)
    {
        FillGrid();
        pnlDataView.Visible = true;
    }

    protected void GridViewCompany_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToString("dd-MMM-yyyy");
            //Label1.Text = e.Row.Cells[2].Text;


        }  
    }
}