using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class AfterLogin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Type"] == "" || Session["Type"] == null)
        {

            Session.Abandon();
            Response.Redirect("Login_Page.aspx");
            return;
        }

        lblUsername.Text = Session["fullname"].ToString();
        //Session["Type"] = "User";
        string sessionType = Session["Type"].ToString();
        //string emailid = Session["uname"].ToString();

        if (sessionType == "Shareholder")
        {

            string shid = Session["shid"].ToString();

            string imagepath = Server.MapPath("~/Profile_Pictures/Shareholder/") + shid;
            if (File.Exists(imagepath + ".jpg"))
            {
                imgProfilePic.Attributes["src"] = "Profile_Pictures/Shareholder/" + shid + ".jpg";
            }
            else if (File.Exists(imagepath + ".png"))
            {
                imgProfilePic.Attributes["src"] = "Profile_Pictures/Shareholder/" + shid + ".png";
            }
        }
        else if (sessionType == "User")
        {
            string uid = Session["uid"].ToString();

            string imagepath = Server.MapPath("~/Profile_Pictures/User/") + uid;
            if (File.Exists(imagepath + ".jpg"))
            {
                imgProfilePic.Attributes["src"] = "Profile_Pictures/User/" + uid + ".jpg";
            }
            else if (File.Exists(imagepath + ".png"))
            {
                imgProfilePic.Attributes["src"] = "Profile_Pictures/User/" + uid + ".png";
            }
        }


       
               if (sessionType == "User")
        {
            string isManager = Session["Is_Manager"].ToString();
            string isAccoutant = Session["Is_Acct"].ToString();
            string isDocGenerator = Session["Is_Doc_Gen"].ToString();
            string isAdmin = Session["Is_Admin"].ToString();
            string isClerk = Session["Is_Clerk"].ToString();
            string isReportGen = Session["Is_Report_Gen"].ToString();

            hlDashboard.Attributes["href"] = "Dashboard.aspx";
            menuUpdateDetails.Attributes["href"] = "User_Information_Form.aspx?Update=1";
            if (isManager == "Y" || isAdmin == "Y")
            {
                menuSearch.Visible = true;
            }
            else
            {
                menuSearch.Visible = false;
            }

            if (isDocGenerator == "Y")
            {
                //menuShareCertificate.Visible = true;
                //menuShareholderStatement.Visible = true;
                menuDocGen.Visible = true;
            }
            else
            {
                //menuShareCertificate.Visible = false;
                //menuShareholderStatement.Visible = false;
                menuDocGen.Visible = false;
            }

            if (isReportGen == "Y")
            {
                menuReportGen.Visible = true;
            }
            else
            {
                menuReportGen.Visible = false;
            }

            if (isClerk == "Y")
            {
                menuClerk.Visible = true;
            }
            else
            {
                menuClerk.Visible = false;
            }

            if (isAdmin == "Y")
            {
                menuAdmin.Visible = true;
                menuUserSearch.Visible = true;
            }
            else
            {
                menuAdmin.Visible = false;
                menuUserSearch.Visible = false;
            }



        }
        else if (sessionType == "Shareholder")
        {
            hlDashboard.Attributes["href"] = "Shareholder_Dashboard.aspx";
            menuUpdateDetails.Attributes["href"] = "Shareholder_Information_Form.aspx?Update=1";
            menuAdmin.Visible = false;
            menuClerk.Visible = false;
            menuDocGen.Visible = true;
            menuReportGen.Visible = true;
            menuDailyTransactionVolume.Visible = false;
            menuAccountant.Visible = false;
            menuSearch.Visible = false;

        }

    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login_Page.aspx");
    }

 
}
