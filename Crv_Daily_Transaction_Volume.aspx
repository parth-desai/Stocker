<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Crv_Daily_Transaction_Volume.aspx.cs" Inherits="Crv_Daily_Transaction_Volume" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Daily Transaction Report</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Report For Daily Transaction Volume
    </h2>

    <br />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
    <CR:CrystalReportViewer ID="crvDailyTransactionVolume" runat="server" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" EnableDrillDown="False" AutoDataBind="True" ReportSourceID="CrystalReportSource1" GroupTreeStyle-ShowLines="False" Height="1202px" HasToggleGroupTreeButton="False" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="CrtDailyTransVolume.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>


