<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AlerttEST.aspx.cs" Inherits="ServicePoint.Test.AlerttEST" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="frm" runat="server">
        <div class="col-md-6 ">
            <Alert:AlertSlide ID="AlertSlide" runat="server" />
        </div>
        <div class="col-md-6  nopadding">
            <Alert:AlertList ID="AlertList" runat="server" />
        </div>

        <asp:ScriptManager ID="scrMgr" runat="server"></asp:ScriptManager>
        <asp:Timer ID="tmr" runat="server"></asp:Timer>
    </form>
</asp:Content>
