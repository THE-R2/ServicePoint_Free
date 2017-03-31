<%@ Page Title="" Language="C#" MasterPageFile="~/PopUp.Master" AutoEventWireup="true" CodeBehind="mysql.aspx.cs" Inherits="ServicePoint.Test.mysql" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="frm" runat="server">
        <asp:GridView ID="gv_List" runat="server" CssClass="table table-bordered">
            <Columns></Columns>
            <EmptyDataTemplate>No Data</EmptyDataTemplate>
        </asp:GridView>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ModalContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
