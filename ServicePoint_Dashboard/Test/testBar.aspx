<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="testBar.aspx.cs" Inherits="ServicePoint.Test.testBar" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width:100px;height:100px">
        <div class="progress">
            <div class="progress-bar progress-bar-success" style="width: 80%">
                <span class="sr-only">80% Complete (success)</span>
            </div>
            <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 20%">
                <span class="sr-only">20% Complete (warning)</span>
            </div>
        </div>
        <div class="progress">
            <div class="progress-bar progress-bar-success" style="width: 70%">
                <span class="sr-only">70% Complete (success)</span>
            </div>
            <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 30%">
                <span class="sr-only">30% Complete (warning)</span>
            </div>
        </div>
        <div class="progress">
            <div class="progress-bar progress-bar-success" style="width: 50%">
                <span class="sr-only">50% Complete (success)</span>
            </div>
            <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 50%">
                <span class="sr-only">50% Complete (warning)</span>
            </div>
        </div>
        <div class="progress">
            <div class="progress-bar progress-bar-success" style="width: 50%">
                <span class="sr-only">50% Complete (success)</span>
            </div>
            <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 50%">
                <span class="sr-only">50% Complete (warning)</span>
            </div>
        </div>
    </div>
</asp:Content>
