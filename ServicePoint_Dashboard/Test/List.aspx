<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="ServicePoint.Test.List" %>


<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="frm" runat="server" enableviewstate="false">
        <script type="text/javascript">
     <!--
    //-->
        </script>
        <div class="col-md-12 col-xs-12">
            
            <div>
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="no-bold">Alerts in last 15 minutes</h3>
                    </div>
                </div>
                <div class="alerts-contents">
                    <asp:Repeater ID="rpt_Alert" runat="server">
                        <ItemTemplate>
                            <section id="alert-app-servers_<%# Container.DataItem.ToString() %>" class="alerts">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-md-1 nopadding">
                                            <div class="col-sm-12 col-md-12 bg-alert-default text-center box">
                                                <h4><%# Container.DataItem.ToString() %></h4>
                                            </div>
                                        </div>
                                        <div class="col-md-11 nopadding">
                                            <div class="col-sm-2 col-md-2 bg-alert-text box">
                                                <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <%# GetAlertList(Container.DataItem.ToString(),0) %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 col-md-2 bg-alert-text box">
                                                <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <%# GetAlertList(Container.DataItem.ToString(),1) %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 col-md-2 bg-alert-text box">
                                                <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <%# GetAlertList(Container.DataItem.ToString(),2) %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 col-md-2 bg-alert-text box">
                                                <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <%# GetAlertList(Container.DataItem.ToString(),3) %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 col-md-2 bg-alert-text box">
                                                <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <%# GetAlertList(Container.DataItem.ToString(),4) %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2 col-md-2 bg-alert-text box">
                                                <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <%# GetAlertList(Container.DataItem.ToString(),5) %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </ItemTemplate>
                            <FooterTemplate>
                    <asp:Label ID="lblEmptyData" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>' Text="No Data" />
                </FooterTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
        <asp:ScriptManager ID="scrMgr" runat="server" EnableViewState="false"></asp:ScriptManager>
        <asp:Timer ID="tmr" runat="server" EnableViewState="false"></asp:Timer>
    </form>
</asp:Content>
