using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


using System.Net;
using System.Net.Mail;

public partial class Forget_Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btngetpwd_Click(object sender, EventArgs e)
    {
        SqlConnection SqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ToString());
        String pwd = "";
        SqlConn.Open();
        string emailid = Request["txtemailid"];
        SqlCommand SqlCmd = new SqlCommand("SELECT * FROM tbl_User_Information WHERE Email_Id = '" + emailid + "'", SqlConn);
        SqlDataReader SqlDr = SqlCmd.ExecuteReader();

        if (SqlDr.Read())
        {
            pwd = SqlDr.GetValue(2).ToString();

            //for sending email code starts here
            NetworkCredential loginInfo = new NetworkCredential("imagesoftware.student@gmail.com", "abcd123456789");
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("imagesoftware.student@gmail.com");
            msg.To.Add(new MailAddress(emailid));
            msg.Subject = "Inquiry about Forget Password";
            msg.Body = "Your password is " + pwd;
            msg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInfo;
            client.Send(msg);
            lblforgetpwd.Text = "Your Password has been sent to your Email ID.<br/>"
                +"Click <a Href=\"Login_Page.aspx\" style=\"color:yellow; \">HERE</a> to Login Again";
            //for sending email ends here
        }
        else
        {
            lblforgetpwd.Text = "Please check Email ID.";
        }

        SqlConn.Close(); 
    }
}