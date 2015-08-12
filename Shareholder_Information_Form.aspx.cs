using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

using System.Data;
using System.IO;

public partial class Shareholder_Information_Form : System.Web.UI.Page
{
    String qry;
    string search, update;
    protected void Page_Load(object sender, EventArgs e)
    {
        search = Request.QueryString["Search"];
        update= Request.QueryString["Update"];
        divDelete.Visible = false;
        divSubmit.Attributes["class"] = "col-sm-6";

        if (search == null && update == null)
        {
            pnlDataView.Visible = false;
            btnDelete.Visible = false;
            btnBack.Visible = false;
        }
        else if (search == "1" && update == null)
        {
            
            pnlDataEntry.Visible = false;
            pnlDataView.Visible = true;
            btnBack.Visible = false;
            FillGrid();
        }
        else if (update == "1" && search == null)
        {
            pnlDataView.Visible = false;
            btnDelete.Visible = false;
            btnBack.Visible = false;
            btnView.Visible = false;
            //Session["shid"] = 4;
            qry = "SELECT * FROM tbl_Shareholder_Information WHERE SH_Id='" + Session["shid"].ToString() + "'";
            int shtid = 0;
            SqlDataReader dr = smsclass.getRecord(qry);
            if (dr.Read())
            {
                shtid = dr.GetInt32(1);
                txtEmailId.Text = dr.GetValue(2).ToString();
                txtMobileNo.Text = dr.GetValue(4).ToString();
                txtFullName.Text = dr.GetValue(5).ToString();
                txtAddress.Text = dr.GetValue(6).ToString();
                txtCity.Text = dr.GetValue(7).ToString();
                txtState.Text = dr.GetValue(8).ToString();
                txtPinCode.Text = dr.GetValue(9).ToString();
                txtDOB.Text = dr.GetValue(11).ToString();
                txtPan.Text = dr.GetValue(12).ToString();
                txtProfession.Text = dr.GetValue(13).ToString();
                btnSubmit.Text = "Update";
                

                pnlDataEntry.Visible = true;
               
            }
            dr.Close();


            qry = "SELECT Main_Category,Sub_Category FROM tbl_Shareholder_Type WHERE SH_TId=" + shtid;
            dr = smsclass.getRecord(qry);
            if (dr.Read())
            {
                string a=dr.GetValue(0).ToString();;
                ddlShTypeMain.SelectedValue = a;
                String query;
                query = "SELECT Sub_Category FROM tbl_Shareholder_Type WHERE Main_Category='" + a + "'";
                ddlShTypeSub.DataTextField = "Sub_Category";
                ddlShTypeSub.DataValueField = "Sub_Category";
                ddlShTypeSub.DataSource = smsclass.getRecord(query);
                ddlShTypeSub.DataBind();

                ddlShTypeSub.SelectedValue = dr.GetValue(1).ToString();
            }
            dr.Close();



          
        }
       
        


    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        int sh_tid = 0;
        qry = "SELECT SH_TId From tbl_Shareholder_Type WHERE Main_Category ='" + ddlShTypeMain.SelectedValue + "' AND Sub_Category='" + ddlShTypeSub.SelectedValue + "'";
        SqlDataReader ds = smsclass.getRecord(qry);
        string emailid;
        while (ds.Read())
        {
            sh_tid = ds.GetInt32(0);
        }
        ds.Close();
        if (btnSubmit.Text == "Submit")
        {
           

            qry = "INSERT INTO tbl_Shareholder_Information(SH_TId,Email_Id,SH_Password,SH_Mobile_No,SH_Full_Name,SH_Address,SH_City,SH_State,SH_Pincode,SH_DOB,SH_PAN,SH_Profession) values ("
                                                                   + sh_tid + ",'"
                                                                   + txtEmailId.Text + "','"
                                                                   + txtPwd.Text + "','"
                                                                   + txtMobileNo.Text + "','"
                                                                   + txtFullName.Text + "','"
                                                                   + txtAddress.Text + "','"
                                                                   + txtCity.Text + "','"
                                                                   + txtState.Text + "','"
                                                                   + txtPinCode.Text + "','"
                                                                   + txtDOB.Text + "','"
                                                                   + txtPan.Text + "','"
                                                                   + txtProfession.Text + "')";
        }
        else
        {
            qry = "UPDATE tbl_Shareholder_Information SET SH_TId=" + sh_tid + ",Email_Id='" + txtEmailId.Text + "',SH_Password='" + txtPwd.Text + "',SH_Mobile_No='" + txtMobileNo.Text + "',SH_Full_Name='" + txtFullName.Text + "',SH_Address='" + txtAddress.Text + "',SH_City='" + txtCity.Text + "',SH_State='" + txtState.Text + "',SH_Pincode='" + txtPinCode.Text + "' WHERE SH_Id='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        try
        {
            emailid = txtEmailId.Text;
            int i = smsclass.setRecord(qry);
            AllClear();
            if (i == 1)
            {
                lblOutput.Text = "Data Inserted Successfully";
                if(fuProfilePic.HasFile)
                {
                    string query = "SELECT SH_Id FROM tbl_Shareholder_Information WHERE Email_Id='" + emailid + "'";
                    SqlDataReader dr=smsclass.getRecord(query);
                    if(dr.Read())
                    {
                        int shid=dr.GetInt32(0);
                        string filename=fuProfilePic.PostedFile.FileName;
                        string image=Server.MapPath("~/Profile_Pictures/Shareholder/")+shid+Path.GetExtension(filename);
                        if (File.Exists(image))
                        {
                            File.Delete(image);
                        }
                      
                            fuProfilePic.SaveAs(image);
                        
                    }
                    dr.Close();
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
    protected void ddSHType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlDataEntry.Visible = true;
        pnlDataView.Visible = false;

        
    }
    protected void AllClear()
    {
        txtAddress.Text = "";
        txtCity.Text = "";
        txtEmailId.Text = "";
        txtFullName.Text = "";
        txtMobileNo.Text = "";
        txtPinCode.Text = "";
        txtState.Text = "";
        txtPan.Text = "";
        txtDOB.Text = "";
        txtProfession.Text = "";

        ddlShTypeMain.SelectedIndex = 0;


        ddlShTypeSub.Items.Clear();


        lblOutput.Text = "";

        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void FillGrid()
    {
        qry = "SELECT dbo.tbl_Shareholder_Information.SH_Id AS [Shareholder ID], "+
                            "dbo.tbl_Shareholder_Type.Main_Category AS [Shareholder Main Category], "+
                            "dbo.tbl_Shareholder_Type.Sub_Category AS [Shareholder Sub Category], " +
                            "dbo.tbl_Shareholder_Information.SH_Full_Name AS [Shareholder Name], "+
                            "dbo.tbl_Shareholder_Information.Email_Id AS [Registered Email Address], " +
                            "dbo.tbl_Shareholder_Information.SH_State AS [Shareholder State] " +
                            "FROM dbo.tbl_Shareholder_Type INNER JOIN dbo.tbl_Shareholder_Information "+
                            "ON dbo.tbl_Shareholder_Type.SH_TId = dbo.tbl_Shareholder_Information.SH_TId "+
                            "AND SH_Full_Name LIKE '" + txtShareholderSearch.Text + "%'";

        GridView1.DataSource = smsclass.getRecord(qry);
        GridView1.DataBind();

        if (search == "1")
        {
            GridView1.Columns[0].Visible = false;
        }
    }



    protected void btnView_Click1(object sender, EventArgs e)
    {
        pnlDataEntry.Visible = false;
        pnlDataView.Visible = true;
        txtShareholderSearch.Text = "";
        if(search!="1")
            btnBack.Visible = true;
        //AllClear();     
        FillGrid();

    }
    protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void btnDelete_Click1(object sender, EventArgs e)
    {
        qry = "DELETE FROM tbl_Shareholder_Information WHERE SH_Id='" + GridView1.SelectedRow.Cells[1].Text + "'";

        try
        {
            int i = smsclass.setRecord(qry);
            AllClear();
            if (i == 1)
            {
                lblOutput.Text = "Data Deleted Successfully";
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

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        qry = "SELECT * FROM tbl_Shareholder_Information WHERE SH_Id='" + GridView1.SelectedRow.Cells[1].Text + "'";
        int shtid = 0;
        SqlDataReader dr = smsclass.getRecord(qry);
        if (dr.Read())
        {
            shtid = dr.GetInt32(1);
            txtEmailId.Text = dr.GetValue(2).ToString();
            txtMobileNo.Text = dr.GetValue(4).ToString();
            txtFullName.Text = dr.GetValue(5).ToString();
            txtAddress.Text = dr.GetValue(6).ToString();
            txtCity.Text = dr.GetValue(7).ToString();
            txtState.Text = dr.GetValue(8).ToString();
            txtPinCode.Text = dr.GetValue(9).ToString();
            txtDOB.Text = dr.GetDateTime(10).ToString("dd-MMM-yyyy");
            txtPan.Text = dr.GetValue(11).ToString();
            txtProfession.Text = dr.GetValue(12).ToString();
           

            btnSubmit.Text = "Update";
            divDelete.Visible = true;
            btnDelete.Visible = true;

            divSubmit.Attributes["class"] = "col-sm-3";
            pnlDataEntry.Visible = true;
            pnlDataView.Visible = false;
        }
        dr.Close();


        qry = "SELECT Main_Category,Sub_Category FROM tbl_Shareholder_Type WHERE SH_TId=" + shtid;
        dr = smsclass.getRecord(qry);
        if (dr.Read())
        {
            ddlShTypeMain.SelectedValue = dr.GetValue(0).ToString();
            ddlShTypeMain_SelectedIndexChanged(sender, e);
            ddlShTypeSub.SelectedValue = dr.GetValue(1).ToString();
        }
        dr.Close();




    }


    protected void ddlShTypeMain_SelectedIndexChanged(object sender, EventArgs e)
    {
        String query;
        query = "SELECT Sub_Category FROM tbl_Shareholder_Type WHERE Main_Category='" + ddlShTypeMain.SelectedValue + "'";
        ddlShTypeSub.DataTextField = "Sub_Category";
        ddlShTypeSub.DataValueField = "Sub_Category";
        ddlShTypeSub.DataSource = smsclass.getRecord(query);
        ddlShTypeSub.DataBind();
    }
    protected void ddlShTypeMain_DataBound(object sender, EventArgs e)
    {
        ddlShTypeMain.Items.Insert(0, "Select a Main  Category");
    }
    protected void ddlShTypeSub_DataBound(object sender, EventArgs e)
    {
        ddlShTypeSub.Items.Insert(0, "Select a Sub Category");
       
    }
    protected void btnShareholderSearch_Click(object sender, EventArgs e)
    {
        FillGrid();
        pnlDataView.Visible = true;
        btnBack.Visible = true;
    }
}