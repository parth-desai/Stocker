using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Net;
using System.Net.Mail;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //for sedning email code starts here
            NetworkCredential loginInfo = new NetworkCredential("imagesoftware.student@gmail.com", "abcd123456789");
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(Request["txtEmail"].ToString());
            msg.To.Add(new MailAddress("siddharth.kotecha@yahoo.com"));
            msg.Subject = "Inquiry about System";
            msg.Body = Request["txtMessage"].ToString();
            msg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInfo;
            client.Send(msg);
            //for sending email ends here
        }
        catch
        {

        }
        finally { }
    }
}