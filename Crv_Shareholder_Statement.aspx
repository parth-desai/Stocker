<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Crv_Shareholder_Statement.aspx.cs" Inherits="Crv_Shareholder_Statement" MasterPageFile="~/AfterLogin.master" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Shareholder Statement</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" runat="Server">
    <h2>Shareholder Statement</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageContents" runat="Server">
    <CR:CrystalReportViewer ID="crvShareholderStatement" runat="server" EnableDatabaseLogonPrompt="false" EnableParameterPrompt="false" EnableDrillDown="false" AutoDataBind="True" ReportSourceID="CrystalReportSource1" GroupTreeStyle-ShowLines="false" Height="1000px" HasToggleGroupTreeButton="false" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="CrystalReport_Shareholder_Statement.rpt">
        </Report>
    </CR:CrystalReportSource>
    <%-- <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />--%>
</asp:Content>

<%--    </form>
</body>
</html>--%>
