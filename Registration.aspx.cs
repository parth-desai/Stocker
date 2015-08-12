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

public partial class Registration : System.Web.UI.Page
{
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
protected void btn_Submit_Click(object sender, EventArgs e)
{
    
     qry = "INSERT INTO tbl_Register(Username, Password, DOB) values ('"+ txt_Username.Text+"','"+ txt_Pwd.Text + "','"+ txt_Dob.Text + "')";
     lbl_sub.Text = "Submitted succesfully";

}

}