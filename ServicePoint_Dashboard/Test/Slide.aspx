<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Slide.aspx.cs" Inherits="ServicePoint.Test.Slide" %>



<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="frm" runat="server" enableviewstate="false">
        <script type="text/javascript">
     <!--
    //-->
        </script>
        <div class="col-md-12 col-xs-12">
            <asp:Repeater ID="rpt_ServerStatus" runat="server">
                <ItemTemplate>
                    <section id="section_<%# Container.DataItem.ToString() %>" class="status">
                        <div class="row">
                            <div class="col-md-12">
                                <h3><%# Container.DataItem.ToString() %></h3>
                            </div>
                        </div>
                        <%# GetServerList(Container.DataItem.ToString()) %>
                    </section>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblEmptyData" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>' Text="No Data" />
                </FooterTemplate>
            </asp:Repeater>
            <div>
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="no-bold">Alerts in last 15 minutes</h3>
                    </div>
                </div>
                <div class="alerts-contents">
                    

                </div>
            </div>
        </div>
        <asp:ScriptManager ID="scrMgr" runat="server" EnableViewState="false"></asp:ScriptManager>
        <asp:Timer ID="tmr" runat="server" EnableViewState="false"></asp:Timer>
    </form>
</asp:Content>

