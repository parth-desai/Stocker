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

public partial class User_Information_Form : System.Web.UI.Page
{

    String qry;
    string update,search;

    protected void Page_Load(object sender, EventArgs e)
    {
       search = Request.QueryString["Search"];
       update  = Request.QueryString["Update"];


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
            btnShowAll.Visible = false;
            //Session["shid"] = 4;
            qry = "SELECT * FROM tbl_User_Information WHERE User_Id='" + Session["uid"] + "'";

            SqlDataReader dr = smsclass.getRecord(qry);
            if (dr.Read())
            {
                txtEmail.Text = dr.GetValue(1).ToString();
                txtMobile.Text = dr.GetValue(3).ToString();
                txtFullName.Text = dr.GetValue(4).ToString();
                txtAddress.Text = dr.GetValue(5).ToString();
                txtCity.Text = dr.GetValue(6).ToString();
                txtState.Text = dr.GetValue(7).ToString();
                txtPincode.Text = dr.GetValue(8).ToString();

                if (dr.GetValue(9).ToString() == "M")
                {
                    rbMale.Checked = true;
                    rbFemale.Checked = false;
                }
                else
                {
                    rbMale.Checked = false;
                    rbFemale.Checked = true;
                }

                if (dr.GetValue(10).ToString() == "Y")
                {
                    cbManager.Checked = true;
                }
                if (dr.GetValue(11).ToString() == "Y")
                {
                    cbAccountant.Checked = true;
                }
                if (dr.GetValue(12).ToString() == "Y")
                {
                    cbDocGen.Checked = true;
                }
                if (dr.GetValue(13).ToString() == "Y")
                {
                    cbAdmin.Checked = true;
                }
                if (dr.GetValue(14).ToString() == "Y")
                {
                    cbClerk.Checked = true;
                }
                if (dr.GetValue(15).ToString() == "Y")
                {
                    cbRepGen.Checked = true;
                }



                btnSubmit.Text = "Update";

            }




        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        char gender = 'M';
        char isAdmin = 'N';
        if (rbFemale.Checked == true)
        {
            gender = 'F';
        }
        char isManager = 'N';
        char isAccountant = 'N';
        char isDocGen = 'N';
        char isRepGen = 'N';
        char isClerk = 'N';
        string emailid;
        if (cbManager.Checked == true)
        {
            isManager = 'Y';
        }

        if (cbAdmin.Checked == true)
        {
            isAdmin = 'Y';
        }
        if (cbAccountant.Checked == true)
        {
            isAccountant = 'Y';
        }
        if (cbDocGen.Checked == true)
        {
            isDocGen = 'Y';
        }

        if (cbRepGen.Checked == true)
        {
            isRepGen = 'Y';
        }
        if (cbClerk.Checked == true)
        {
            isClerk = 'Y';
        }
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tbl_User_Information(Email_Id,User_Password,User_Mobile_No,User_Full_Name,User_Address,User_City,User_State,User_Pincode,User_Gender,Is_Manager,Is_Acct,Is_Doc_Gen,Is_Admin,Is_Clerk,Is_Report_Gen) values ('"
                                                                   + txtEmail.Text+"','"
                                                                   + txtPassword.Text + "','"
                                                                   + txtMobile.Text + "','"
                                                                   + txtFullName.Text + "','"
                                                                   + txtAddress.Text + "','"
                                                                   + txtCity.Text + "','"
                                                                   + txtState.Text + "','"
                                                                   + txtPincode.Text + "','"
                                                                   + gender + "','"
                                                                   + isManager + "','"
                                                                   + isAccountant + "','"
                                                                   + isDocGen + "','"
                                                                   + isAdmin + "','"
                                                                   + isClerk + "','"
                                                                   + isRepGen + "')";
        }
        else
        {
            qry = "UPDATE tbl_User_Information SET Email_Id='" + txtEmail.Text
                + "',User_Password='" + txtPassword.Text
                + "',User_Mobile_No='" + txtMobile.Text
                + "',User_Full_Name='" + txtFullName.Text
                + "',User_Address='" + txtAddress.Text
                + "',User_City='" + txtCity.Text
                + "',User_State='" + txtState.Text
                + "',User_Pincode='" + txtPincode.Text
                + "',User_Gender='" + gender
                + "',Is_Manager='" + isManager
                + "',Is_Acct='" + isAccountant
                + "',Is_Doc_Gen='" + isDocGen
                + "',Is_Admin='" + isAdmin
                + "',Is_Clerk='" + isClerk
                + "',Is_Report_Gen='" + isRepGen
                + "' WHERE User_Id='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        try
        {
            emailid = txtEmail.Text;
            int i = smsclass.setRecord(qry);
            AllClear();
            if (i == 1)
            {
                lblOutput.Text = "Data Inserted successfully";
                if (fuProfilePic.HasFile)
                {
                    string query = "SELECT User_Id FROM tbl_User_Information WHERE Email_Id='" + emailid + "'";
                    SqlDataReader dr = smsclass.getRecord(query);
                    if (dr.Read())
                    {
                        int shid = dr.GetInt32(0);
                        string filename = fuProfilePic.PostedFile.FileName;
                        string image = Server.MapPath("~/Profile_Pictures/User/") + shid + Path.GetExtension(filename);
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
   
    
    protected void btnBack_Click(object sender, EventArgs e)
    {
        
            pnlDataView.Visible = false;
            pnlDataEntry.Visible = true;
        
        
    }
    protected void AllClear()
    {
        txtAddress.Text = "";
        txtCity.Text = "";
        txtEmail.Text = "";
        txtFullName.Text = "";
        txtMobile.Text = "";
        txtPincode.Text = "";
        txtState.Text = "";
        cbManager.Checked = false;
        cbAdmin.Checked = false;
        cbAccountant.Checked = false;
        cbDocGen.Checked = false;
        cbRepGen.Checked = false;
        cbClerk.Checked = false;
        lblOutput.Text = "";

        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void FillGrid()
    {
        qry = "SELECT User_Id AS [ID], Email_ID AS [Email], User_Full_Name AS [Full Name] FROM tbl_User_Information WHERE  User_Full_Name LIKE '" + txtSearchFullName.Text + "%'";

        GridView1.DataSource = smsclass.getRecord(qry);
        GridView1.DataBind();
        
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       // AllClear();

        qry = "SELECT * FROM tbl_User_Information WHERE User_Id='" + GridView1.SelectedRow.Cells[1].Text + "'";

        SqlDataReader dr = smsclass.getRecord(qry);
        if (dr.Read())
        {
            txtEmail.Text = dr.GetValue(1).ToString();
            txtMobile.Text = dr.GetValue(3).ToString();
            txtFullName.Text = dr.GetValue(4).ToString();
            txtAddress.Text = dr.GetValue(5).ToString();
            txtCity.Text = dr.GetValue(6).ToString();
            txtState.Text = dr.GetValue(7).ToString();
            txtPincode.Text = dr.GetValue(8).ToString();

            if (dr.GetValue(9).ToString() == "M")
            {
                rbMale.Checked = true;
                rbFemale.Checked = false;
            }
            else
            {
                rbMale.Checked = false;
                rbFemale.Checked = true;
            }

            if(dr.GetValue(10).ToString()=="Y")
            {
                cbManager.Checked = true;
            }
            if (dr.GetValue(11).ToString() == "Y")
            {
                cbAccountant.Checked = true;
            }
            if (dr.GetValue(12).ToString() == "Y")
            {
                cbDocGen.Checked = true;
            }
            if (dr.GetValue(13).ToString() == "Y")
            {
                cbAdmin.Checked = true;
            }
            if (dr.GetValue(14).ToString() == "Y")
            {
                cbClerk.Checked = true;
            }
            if (dr.GetValue(15).ToString() == "Y")
            {
                cbRepGen.Checked = true;
            }



            btnSubmit.Text = "Update";
            btnDelete.Visible = true;
            divDelete.Visible = true;
            divSubmit.Attributes["class"] = "col-sm-3";
            pnlDataEntry.Visible = true;
            pnlDataView.Visible = false;
        }
    } 
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tbl_User_Information WHERE User_Id='" + GridView1.SelectedRow.Cells[1].Text + "'";

        try
        {
            int i = smsclass.setRecord(qry);
            AllClear();
            if (i == 1)
            {
                lblOutput.Text = "data DELETED successfully";
            }
            else
            {
                lblOutput.Text = "Something went wrong.";
            }
        }
        catch (Exception ex)
        {
            lblOutput.Text = "data insertion error" + ex.ToString();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        txtSearchFullName.Text = "";

        FillGrid();
        if (search != "1")
        {
            btnBack.Visible = true;
        }
        pnlDataEntry.Visible = false;
        pnlDataView.Visible = true;
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}