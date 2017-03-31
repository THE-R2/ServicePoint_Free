<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SlideTest.aspx.cs" Inherits="ServicePoint.Test.SlideTest" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="frm" runat="server">

        <div class="">
            <asp:GridView ID="grv" runat="server" AutoGenerateColumns="false" CssClass="" HeaderStyle-HorizontalAlign="Center" OnRowDataBound="grv_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="server">
                        <ItemTemplate>
                            <div class="row-fluid">
                                <div>
                                    <%= str %>
                                </div>
                                <div>
                                    <h4>hi</h4>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>

