<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlertList.ascx.cs" Inherits="ServicePoint.Common.UC.AlertList" %>

<div class="col-md-12 col-lg-12 col-xs-12">
    <div class="col-md-6 col-lg-6">
        <%--<h3 class="no-bold">List of alerts in last  <%= ConfigurationManager.AppSettings["ChartDataDuration"].ToString() %>  min</h3>--%>
        <h3 class="no-bold">List of alerts in last  <%= ConfigurationManager.AppSettings["AlertDataDuration"].ToString() %>  min</h3>
    </div>
    <div class="col-md-6 col-lg-6  alert-check">
        <ul class="list-unstyled list-inline">
            <li>
                <asp:CheckBox runat="server" ID="chk_Critical" AutoPostBack="true" Checked="true" />
                Critical</li>
            <li>
                <asp:CheckBox runat="server" ID="chk_Warning" AutoPostBack="true" Checked="true" />
                Warning</li>
            <li>
                <asp:CheckBox runat="server" ID="chk_Information" AutoPostBack="true" Checked="true" />
                Information</li>
        </ul>

    </div>
    <div class="col-md-12 col-lg-12">
        <div class="table-responsive">
            <div class="contents">
                <asp:GridView ID="gv_List" runat="server" EnableViewState="false" AutoGenerateColumns="false" HeaderStyle-BackColor="#333333" HeaderStyle-ForeColor="White" RowStyle-ForeColor="Black" RowStyle-BackColor="WhiteSmoke" RowStyle-HorizontalAlign="Center" CssClass=" table table-bordered col-md-12 nopadding " HeaderStyle-CssClass="nopadding" OnRowDataBound="gv_List_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="DisplayName" HeaderText="Server" ItemStyle-CssClass="col-md-1" />
                        <asp:TemplateField HeaderText="Alert Description" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="col-md-3">
                            <ItemTemplate>
                                <a onclick="window.open('<%# RedirectToAlertDetailPage(Eval("ServerType"), Eval("DisplayName"), Eval("ReasonCode"), Eval("InstanceName"), Eval("AlertRecordID"), Eval("ServerNum"), Eval("dtLastUpdate") ) %>', '_blank', 'scrollbars=yes resizable=yes width=1200 height=900')" style="color: #1d1d1d;"><%# Eval("ReasonCodeDesc") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="InstanceName" HeaderText="Instance" SortExpression="InstanceName" ItemStyle-CssClass="col-md-2" HeaderStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="RepeatCnt" HeaderText="#Counts" ItemStyle-CssClass="col-md-1" SortExpression="#Counts" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="dtLastUpdate" HeaderText="Last Occured" ItemStyle-CssClass="col-md-3" SortExpression="dtLastUpdate" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                        <asp:BoundField DataField="AlertLevel" HeaderText="Level" SortExpression="AlertLevel" ItemStyle-CssClass="col-md-2" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ShowHeader="true" ItemStyle-ForeColor="White" />
                    </Columns>
                    <EmptyDataTemplate>
                        No Data
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>

