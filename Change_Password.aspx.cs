using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Change_Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



        if (Session["Type"] == "User")
        {
            txt_Email.Text = Session["uname"].ToString();
        }
        else if (Session["Type"] == "Shareholder")
        {
            txt_Email.Text = Session["shname"].ToString();
        }
        else { }

    }
    protected void btn_changepass_Click(object sender, EventArgs e)
    {
        string qry;
        qry = "SELECT * FROM tbl_User_Information WHERE Email_Id = '" + txt_Email.Text + "' AND User_Password = '" + txt_oldp.Text + "'";

        SqlDataReader dr = smsclass.getRecord(qry);
        if (dr.Read())
        {
            dr.Close();
            qry = "UPDATE tbl_User_Information SET User_Password='" + txt_newp.Text + "' WHERE Email_Id = '" + txt_Email.Text + "'";
            smsclass.setRecord(qry);
            lbl_Output.Text = "Password changed successfully!";
        }
        else
        { lbl_Output.Text = "Incorect fields!"; }

    }
}