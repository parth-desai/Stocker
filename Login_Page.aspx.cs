using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Login : System.Web.UI.Page
{
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
       

        if (!IsPostBack)
        {
            if (Request.Cookies["uname"] != null && Request.Cookies["upassword"] != null)
            {
                txtUsername.Value = Request.Cookies["uname"].Value.ToString();
                txtPassword.Attributes.Add("value", Request.Cookies["upassword"].Value);
                ddUserType.SelectedIndex = 1;
            }
            else if (Request.Cookies["sname"] != null && Request.Cookies["spassword"] != null)
            {
                txtUsername.Value = Request.Cookies["sname"].Value.ToString();
                txtPassword.Attributes.Add("value", Request.Cookies["spassword"].Value);
                ddUserType.SelectedIndex = 2;
            }

        }

    }
    protected void Unnamed1_Click(object sender, EventArgs e)
    {

        if (ddUserType.SelectedValue == "1")
        {
            qry = "SELECT * FROM tbl_User_Information WHERE Email_Id = '" + Request["txtUsername"] + "' AND User_Password = '" + Request["txtPassword"] + "'";


            SqlDataReader dr = smsclass.getRecord(qry);
            if (dr.Read())
            {
                Session["Type"] = "User";
                Session["uid"] = dr.GetValue(0).ToString();
                Session["uname"] = dr.GetValue(1).ToString();
                Session["fullname"] = dr.GetValue(4).ToString();
                Session["Is_Manager"] = dr.GetValue(10).ToString();
                Session["Is_Acct"] = dr.GetValue(11).ToString();
                Session["Is_Doc_Gen"] = dr.GetValue(12).ToString();
                Session["Is_Admin"] = dr.GetValue(13).ToString();
                Session["Is_Clerk"] = dr.GetValue(14).ToString();
                Session["Is_Report_Gen"] = dr.GetValue(15).ToString();

                if (cbRemember.Checked == true)
                {
                    Response.Cookies["sname"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["spassword"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["uname"].Value = Request["txtUsername"].ToString().Trim();
                    Response.Cookies["uname"].Expires = DateTime.Now.AddDays(1);
                    Response.Cookies["upassword"].Value = Request["txtPassword"].ToString().Trim();
                    Response.Cookies["upassword"].Expires = DateTime.Now.AddDays(1);


                }
                else
                {
                    
                    Response.Cookies["uname"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["upassword"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblError.Text = "Invalid Username OR Password";
            }
        }
        else
        {
            qry = "SELECT * FROM tbl_Shareholder_Information WHERE Email_Id = '" + Request["txtUsername"] + "' AND SH_Password = '" + Request["txtPassword"] + "'";


            SqlDataReader dr = smsclass.getRecord(qry);
            if (dr.Read())
            {
                Session["Type"] = "Shareholder";
                Session["shid"] = dr.GetValue(0).ToString();
                Session["shname"] = Request["txtUsername"];
                Session["fullname"] = dr.GetValue(5).ToString();
                if (cbRemember.Checked == true)
                {
                    Response.Cookies["uname"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["upassword"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["sname"].Value = Request["txtUsername"].ToString().Trim();
                    Response.Cookies["sname"].Expires = DateTime.Now.AddDays(1);
                    Response.Cookies["spassword"].Value = Request["txtPassword"].ToString().Trim();
                    Response.Cookies["spassword"].Expires = DateTime.Now.AddDays(1);
                    
                }
                else
                {
                    
                    Response.Cookies["sname"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["spassword"].Expires = DateTime.Now.AddDays(-1);
                }
                Response.Redirect("Shareholder_Dashboard.aspx");
            }
            else
            {
                lblError.Text = "Invalid Username OR Password";
            }
        }

        
    
    }

    private void ExpireAllCookies()
    {
        if (HttpContext.Current != null)
        {
            int cookieCount = HttpContext.Current.Request.Cookies.Count;
            for (var i = 0; i < cookieCount; i++)
            {
                var cookie = HttpContext.Current.Request.Cookies[i];
                if (cookie != null)
                {
                    var cookieName = cookie.Name;
                    var expiredCookie = new HttpCookie(cookieName) { Expires = DateTime.Now.AddDays(-1) };
                    HttpContext.Current.Response.Cookies.Add(expiredCookie); // overwrite it
                }
            }

            // clear cookies server side
            HttpContext.Current.Request.Cookies.Clear();
        }
    }
}