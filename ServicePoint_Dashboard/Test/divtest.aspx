<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="divtest.aspx.cs" Inherits="ServicePoint.Test.divtest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12 col-xs-12">
            <section id="section_Corp Sales (KR)" class="">
                <div class="row">
                    <div class="col-md-12">
                        <h3>Corp Sales (KR)</h3>
                    </div>
                </div>
                <div class="row" style="background-color: blue;">
                    <div class="col-sm-4 col-md-4" style="background-color: ActiveCaption">
                        <div class="row">
                            <div class="col-sm-6 col-md-6 bg-status-warning box" style="background-color: sienna">

                                <div class="media-left media-middle">
                                    <img src="/images/Windows.png" />
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">CORP_APPSVR1</h4>
                                    <ul class="list-unstyled">
                                        <li>192.168.0.34</li>
                                        <li>Windows</li>
                                    </ul>
                                </div>
                                <div>Last updated : 2015-11-20 오후 6:46:34</div>

                            </div>


                            <div id="carouselCorp Sales (KR)1" class="col-sm-6 col-md-6 bg-status-text text-right box">
                                <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <!-- slider 1 -->
                                        <div class="item active">
                                            <h4 class="media-heading">CPU</h4>
                                            <ul class="list-unstyled">
                                                <li>Total:4%</li>
                                                <li>Kernel: 1%</li>
                                                <li>PQL: 7</li>
                                            </ul>
                                        </div>
                                        <!-- //slider 1 -->
                                        <!-- slider 2 -->
                                        <div class="item">
                                            <h4 class="media-heading">Memory</h4>
                                            <ul class="list-unstyled">
                                                <li>RAM: 6143.55 MB</li>
                                                <li>Available: 4.65GB </li>
                                                <li>Committed: 2.04GB </li>
                                            </ul>
                                        </div>
                                        <!-- //slider 2 -->
                                        <!-- slider 3 -->
                                        <div class="item">
                                            <h4 class="media-heading">Disk</h4>
                                            <ul class="list-unstyled">
                                                <li>Disk Read Speed: 0ms</li>
                                                <li>%Disk Time: 0%</li>
                                                <li>Free Space: 35362MB</li>
                                            </ul>
                                        </div>
                                        <div class="item">

                                            <h4>NETWORK</h4>
                                            <ul class="list-unstyled">
                                                <li>BYTES TOTAL: 106,278 Bytes/sec</li>
                                                <li>BYTES RECV:  6,502 Bytes/sec</li>
                                                <li>BYTES SEND:  99,766 Bytes/sec </li>
                                            </ul>
                                        </div>
                                        <!-- //slider 3 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <div class="row">

                            <div class="col-sm-6 col-md-6 bg-status-info box">
                                <div class="media-left media-middle">
                                    <img src="/images/SQL.png" />
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">CORP_DBSVR01</h4>
                                    <ul class="list-unstyled">
                                        <li>192.168.0.34</li>
                                        <li>SQL</li>
                                    </ul>
                                </div>
                                <div>Last updated : 2015-11-20 오후 6:46:25</div>
                            </div>

                            <div id="carouselCorp Sales (KR)2" class="col-sm-6 col-md-6 bg-status-text text-right box">
                                <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <!-- slider 1 -->
                                        <div class="item active">
                                            <h4 class="media-heading">CPU</h4>
                                            <ul class="list-unstyled">
                                                <li>Total:0%</li>
                                                <li>Kernel: 0%</li>
                                                <li>PQL: 1</li>
                                            </ul>
                                        </div>
                                        <!-- //slider 1 -->
                                        <!-- slider 2 -->
                                        <div class="item">
                                            <h4 class="media-heading">Memory</h4>
                                            <ul class="list-unstyled">
                                                <li>RAM: 6143.55 MB</li>
                                                <li>Available: 4.65GB </li>
                                                <li>Committed: 2.04GB </li>
                                            </ul>
                                        </div>
                                        <!-- //slider 2 -->
                                        <!-- slider 3 -->
                                        <div class="item">
                                            <h4 class="media-heading">Disk</h4>
                                            <ul class="list-unstyled">
                                                <li>Disk Read Speed: 0ms</li>
                                                <li>%Disk Time: 0%</li>
                                                <li>Free Space: 35362MB</li>
                                            </ul>
                                        </div>
                                        <div class="item">

                                            <h4>NETWORK</h4>
                                            <ul class="list-unstyled">
                                                <li>BYTES TOTAL: 116,713 Bytes/sec</li>
                                                <li>BYTES RECV:  6,730 Bytes/sec</li>
                                                <li>BYTES SEND:  109,959 Bytes/sec </li>
                                            </ul>
                                        </div>
                                        <!-- //slider 3 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <div class="row">
                            <div class="col-sm-6 col-md-6 bg-status-good box">
                                <div class="media-left media-middle">
                                    <img src="/images/Web.png" />
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">CORP_WEB1</h4>
                                    <ul class="list-unstyled">
                                        <li>192.168.0.34</li>
                                        <li>Web</li>
                                    </ul>
                                </div>
                                <div>Last updated : 2015-11-20 오후 6:46:37</div>
                            </div>

                            <div id="carouselCorp Sales (KR)3" class="col-sm-6 col-md-6 bg-status-text text-right box">
                                <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <!-- slider 1 -->
                                        <div class="item active">
                                            <h4 class="media-heading">CPU</h4>
                                            <ul class="list-unstyled">
                                                <li>Total:4%</li>
                                                <li>Kernel: 1%</li>
                                                <li>PQL: 0</li>
                                            </ul>
                                        </div>
                                        <!-- //slider 1 -->
                                        <!-- slider 2 -->
                                        <div class="item">
                                            <h4 class="media-heading">Memory</h4>
                                            <ul class="list-unstyled">
                                                <li>RAM: 6143.55 MB</li>
                                                <li>Available: 4.65GB </li>
                                                <li>Committed: 2.04GB </li>
                                            </ul>
                                        </div>
                                        <!-- //slider 2 -->
                                        <!-- slider 3 -->
                                        <div class="item">
                                            <h4 class="media-heading">Disk</h4>
                                            <ul class="list-unstyled">
                                                <li>Disk Read Speed: 0ms</li>
                                                <li>%Disk Time: 0%</li>
                                                <li>Free Space: 35362MB</li>
                                            </ul>
                                        </div>
                                        <div class="item">

                                            <h4>NETWORK</h4>
                                            <ul class="list-unstyled">
                                                <li>BYTES TOTAL: 100,960 Bytes/sec</li>
                                                <li>BYTES RECV:  6,181 Bytes/sec</li>
                                                <li>BYTES SEND:  94,799 Bytes/sec </li>
                                            </ul>
                                        </div>
                                        <!-- //slider 3 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </div>
    <div class="row" style="background-color: red;">
        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm- asdfasdfasdf asdfa sdf as das asdfas asfdaasdfasdfas asdf asdf asdf asdf asdf asdf asdfasdfasdf</div>
        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>

        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
        <div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ModalContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
