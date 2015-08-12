using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data.SqlClient;
using System.Configuration;

using System.Data;

using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using System.IO; 

public partial class Share_Certificate_Generation_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlCompanyName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string query = "SELECT [Shareholder ID],[Shareholder Name] FROM viewShareOwnedCompanyWise where [Company Id]="+ddlCompanyName.SelectedValue;
        ddlShareholderName.DataSource = smsclass.getRecord(query);
        ddlShareholderName.DataTextField = "Shareholder Name";
        ddlShareholderName.DataValueField = "Shareholder ID";
        ddlShareholderName.DataBind();
        ddlShareholderName.Enabled = true;
        

    }
    protected void ddlCompanyName_DataBound(object sender, EventArgs e)
    {
        ddlCompanyName.Items.Insert(0, "Select a Company Name");
    }
    protected void ddlShareholderName_DataBound(object sender, EventArgs e)
    {
      //  ddlShareholderName.Items.Insert(0, "Select a Shareholder Name");
    }
    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        string totalshares="";
        string shName = "";
        string sharesowned = "";
        string companyName = "";
        string startDate="" ;
        string facevalue = "";
        int maxCertificateId=1;

        string query = "SELECT MAX(Certificate_Id) FROM tbl_Certificate_Entry";
        SqlDataReader dr;
        dr = smsclass.getRecord(query);

        if (dr.Read())
        {

            string maxid =dr.GetValue(0).ToString();
                   if (maxid != "")
                   {
                       maxCertificateId = Convert.ToInt32(maxid)+1;
                   }
        }
        dr.Close();



        query = "SELECT [Total Shares] FROM viewTotalCompanyShares where [Company ID]="  +ddlCompanyName.SelectedValue;
        dr = smsclass.getRecord(query);
        
        if (dr.Read())
        {
            totalshares = dr.GetValue(0).ToString();
        }
        dr.Close();

        query = "SELECT [Shareholder ID],[Shareholder Name],[Shares Owned],[Company Name],[Start Date],[Face Value] FROM viewShareOwnedCompanyWise where [Company Id]=" + ddlCompanyName.SelectedValue+" AND [Shareholder ID]="+ddlShareholderName.SelectedValue;
        dr = smsclass.getRecord(query);
        
        if (dr.Read())
        {
            shName = dr.GetString(1);
            sharesowned = dr.GetValue(2).ToString();
            companyName = dr.GetString(3);
            startDate = dr.GetDateTime(4).ToString("dd-MMM-yyy");
            facevalue = dr.GetValue(5).ToString();
        }
        dr.Close();

        string pdftemplate = Server.MapPath("Share-Certificate-Template.pdf");
        string newfile = Server.MapPath("~/Share_Certificates/"+maxCertificateId+".pdf");

        PdfReader pdfr = new PdfReader(pdftemplate);
        PdfStamper pdfStamper = new PdfStamper(pdfr, new FileStream(newfile, FileMode.Create));

        pdfStamper.FormFlattening = true;
        AcroFields formfields = pdfStamper.AcroFields;


        formfields.SetField("Certificate Number", maxCertificateId.ToString());
        formfields.SetField("Company Name", companyName);
        formfields.SetField("Incorporation Date", startDate);
        formfields.SetField("Total Company Shares", totalshares);
        formfields.SetField("Face Value", facevalue);
        formfields.SetField("Shareholder Name", shName);
        formfields.SetField("Shares Owned", sharesowned);
        formfields.SetField("Number of Shares", sharesowned);
        pdfStamper.FormFlattening = false;
        //formfields.SetField("", "");
        //formfields.SetField("", "");
        //formfields.SetField("", "");


        pdfStamper.Close();
        pdfviewer.Visible = true;
        pdfviewer.Attributes.Add("src", "Share_Certificates/"+maxCertificateId+".pdf");

        query = "INSERT INTO tbl_Certificate_Entry(Certificate_Date,Sh_Id,Comp_id) VALUES ('"+System.DateTime.Now.ToString("dd-MMM-yy")+"',"+ddlShareholderName.SelectedValue+","+ddlCompanyName.SelectedValue+")";
        //smsclass.setRecord(query);
        //File.Delete(Server.MapPath("~/Share_Certificates/"+maxCertificateId+".pdf"));

    }


    //public void ListFieldNames()
    //{
        

    //}
}