<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="ServicePoint.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-12 col-xs-12">

        <section id="section_App Servers (EN)" class="status">
            <div class="row">
                <div class="col-md-12">
                    <h3>App Servers (EN)</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-md-4">
                    <a href="/dashboard/dashboard.aspx?ServerType=SQL&ServerNum=7" class="text-white">
                        <div class="col-sm-6 col-md-6 bg-status-warning box">
                            <div class="media-left media-middle">
                                <img src="/images/SQL.png" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Contents DB</h4>
                                <ul class="list-unstyled">
                                    <li>192.168.0.34</li>
                                    <li>SQL</li>
                                </ul>
                            </div>
                            <div>Last updated : 2015-11-20 오후 6:28:28</div>
                        </div>

                    </a>
                    <div id="carouselApp Servers (EN)1" class="col-sm-6 col-md-6 bg-status-text text-right box">
                        <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                            <div class="carousel-inner">
                                <!-- slider 1 -->
                                <div class="item active">
                                    <h4 class="media-heading">CPU</h4>
                                    <ul class="list-unstyled">
                                        <li>Total:0%</li>
                                        <li>Kernel: 17%</li>
                                        <li>PQL: 17</li>
                                    </ul>
                                </div>
                                <!-- //slider 1 -->
                                <!-- slider 2 -->
                                <div class="item">
                                    <h4 class="media-heading">Memory</h4>
                                    <ul class="list-unstyled">
                                        <li>RAM: 6143.55 MB</li>
                                        <li>Available: 4.64GB </li>
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
                                        <li>BYTES TOTAL: 107,554 Bytes/sec</li>
                                        <li>BYTES RECV:  6,310 Bytes/sec</li>
                                        <li>BYTES SEND:  101,235 Bytes/sec </li>
                                    </ul>
                                </div>
                                <!-- //slider 3 -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <a href="/dashboard/dashboard.aspx?ServerType=Web&ServerNum=1" class="text-white">
                        <div class="col-sm-6 col-md-6 bg-status-good box">
                            <div class="media-left media-middle">
                                <img src="/images/Web.png" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">MSGWEB01</h4>
                                <ul class="list-unstyled">
                                    <li>192.168.0.34</li>
                                    <li>Web</li>
                                </ul>
                            </div>
                            <div>Last updated : 2015-11-20 오후 6:28:39</div>
                        </div>

                    </a>
                    <div id="carouselApp Servers (EN)1" class="col-sm-6 col-md-6 bg-status-text text-right box">
                        <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                            <div class="carousel-inner">
                                <!-- slider 1 -->
                                <div class="item active">
                                    <h4 class="media-heading">CPU</h4>
                                    <ul class="list-unstyled">
                                        <li>Total:5%</li>
                                        <li>Kernel: 1%</li>
                                        <li>PQL: 4</li>
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
                                        <li>BYTES TOTAL: 0 Bytes/sec</li>
                                        <li>BYTES RECV:  0 Bytes/sec</li>
                                        <li>BYTES SEND:  0 Bytes/sec </li>
                                    </ul>
                                </div>
                                <!-- //slider 3 -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4"></div>
        </section>

        <section id="section_Corp Sales (KR)" class="status">
            <div class="row">
                <div class="col-md-12">
                    <h3>Corp Sales (KR)</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-md-4">
                    <a href="/dashboard/dashboard.aspx?ServerType=Windows&ServerNum=6" class="text-white">
                        <div class="col-sm-6 col-md-6 bg-status-good box">
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
                            <div>Last updated : 2015-11-20 오후 6:28:33</div>
                        </div>

                    </a>
                    <div id="carouselCorp Sales (KR)1" class="col-sm-6 col-md-6 bg-status-text text-right box">
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
                                        <li>BYTES TOTAL: 99,242 Bytes/sec</li>
                                        <li>BYTES RECV:  3,251 Bytes/sec</li>
                                        <li>BYTES SEND:  94,038 Bytes/sec </li>
                                    </ul>
                                </div>
                                <!-- //slider 3 -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <a href="/dashboard/dashboard.aspx?ServerType=SQL&ServerNum=8" class="text-white">
                        <div class="col-sm-6 col-md-6 bg-status-warning box">
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
                            <div>Last updated : 2015-11-20 오후 6:28:30</div>
                        </div>

                    </a>
                    <div id="carouselCorp Sales (KR)1" class="col-sm-6 col-md-6 bg-status-text text-right box">
                        <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                            <div class="carousel-inner">
                                <!-- slider 1 -->
                                <div class="item active">
                                    <h4 class="media-heading">CPU</h4>
                                    <ul class="list-unstyled">
                                        <li>Total:4%</li>
                                        <li>Kernel: 1%</li>
                                        <li>PQL: 6</li>
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
                                        <li>BYTES TOTAL: 0 Bytes/sec</li>
                                        <li>BYTES RECV:  0 Bytes/sec</li>
                                        <li>BYTES SEND:  0 Bytes/sec </li>
                                    </ul>
                                </div>
                                <!-- //slider 3 -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <a href="/dashboard/dashboard.aspx?ServerType=Web&ServerNum=17" class="text-white">
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
                            <div>Last updated : 2015-11-20 오후 6:28:36</div>
                        </div>

                    </a>
                    <div id="carouselCorp Sales (KR)1" class="col-sm-6 col-md-6 bg-status-text text-right box">
                        <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                            <div class="carousel-inner">
                                <!-- slider 1 -->
                                <div class="item active">
                                    <h4 class="media-heading">CPU</h4>
                                    <ul class="list-unstyled">
                                        <li>Total:4%</li>
                                        <li>Kernel: 1%</li>
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
                                        <li>BYTES TOTAL: 101,502 Bytes/sec</li>
                                        <li>BYTES RECV:  3,493 Bytes/sec</li>
                                        <li>BYTES SEND:  101,219 Bytes/sec </li>
                                    </ul>
                                </div>
                                <!-- //slider 3 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-4"></div>
            <div class="col-sm-4 col-md-4"></div>
            <div class="col-sm-4 col-md-4"></div>
        </section>

        <section id="section_Portal (JP)" class="status">
            <div class="row">
                <div class="col-md-12">
                    <h3>Portal (JP)</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-md-4">
                    <a href="/dashboard/dashboard.aspx?ServerType=Web&ServerNum=2" class="text-white">
                        <div class="col-sm-6 col-md-6 bg-status-good box">
                            <div class="media-left media-middle">
                                <img src="/images/Web.png" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">PORTAL_SPS</h4>
                                <ul class="list-unstyled">
                                    <li>192.168.0.34</li>
                                    <li>Web</li>
                                </ul>
                            </div>
                            <div>Last updated : 2015-11-20 오후 6:28:33</div>
                        </div>

                    </a>
                    <div id="carouselPortal (JP)1" class="col-sm-6 col-md-6 bg-status-text text-right box">
                        <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                            <div class="carousel-inner">
                                <!-- slider 1 -->
                                <div class="item active">
                                    <h4 class="media-heading">CPU</h4>
                                    <ul class="list-unstyled">
                                        <li>Total:4%</li>
                                        <li>Kernel: 1%</li>
                                        <li>PQL: 4</li>
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
                                        <li>BYTES TOTAL: 103,136 Bytes/sec</li>
                                        <li>BYTES RECV:  3,312 Bytes/sec</li>
                                        <li>BYTES SEND:  99,483 Bytes/sec </li>
                                    </ul>
                                </div>
                                <!-- //slider 3 -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <a href="/dashboard/dashboard.aspx?ServerType=SQL&ServerNum=18" class="text-white">
                        <div class="col-sm-6 col-md-6 bg-status-info box">
                            <div class="media-left media-middle">
                                <img src="/images/SQL.png" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Search DB</h4>
                                <ul class="list-unstyled">
                                    <li>192.168.0.34</li>
                                    <li>SQL</li>
                                </ul>
                            </div>
                            <div>Last updated : 2015-11-20 오후 6:28:26</div>
                        </div>

                    </a>
                    <div id="carouselPortal (JP)1" class="col-sm-6 col-md-6 bg-status-text text-right box">
                        <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                            <div class="carousel-inner">
                                <!-- slider 1 -->
                                <div class="item active">
                                    <h4 class="media-heading">CPU</h4>
                                    <ul class="list-unstyled">
                                        <li>Total:5%</li>
                                        <li>Kernel: 1%</li>
                                        <li>PQL: 4</li>
                                    </ul>
                                </div>
                                <!-- //slider 1 -->
                                <!-- slider 2 -->
                                <div class="item">
                                    <h4 class="media-heading">Memory</h4>
                                    <ul class="list-unstyled">
                                        <li>RAM: 6143.55 MB</li>
                                        <li>Available: 4.64GB </li>
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
                                        <li>BYTES TOTAL: 107,834 Bytes/sec</li>
                                        <li>BYTES RECV:  6,348 Bytes/sec</li>
                                        <li>BYTES SEND:  99,106 Bytes/sec </li>
                                    </ul>
                                </div>
                                <!-- //slider 3 -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4">
                    <a href="/dashboard/dashboard.aspx?ServerType=Windows&ServerNum=9" class="text-white">
                        <div class="col-sm-6 col-md-6 bg-status-default box">
                            <div class="media-left media-middle">
                                <img src="/images/Windows.png" />
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">SearchServer</h4>
                                <ul class="list-unstyled">
                                    <li>192.168.1.20</li>
                                    <li>Windows</li>
                                </ul>
                            </div>
                            <div>Last updated : 2015-02-23 오후 2:46:41</div>
                        </div>

                    </a>
                    <div id="carouselPortal (JP)1" class="col-sm-6 col-md-6 bg-status-text text-right box">
                        <div class="media-body carousel slide vertical" data-interval="3000" data-ride="carousel">
                            <div class="carousel-inner">
                                <!-- slider 1 -->
                                <div class="item active">
                                    <h4 class="media-heading">CPU</h4>
                                    <ul class="list-unstyled">
                                        <li>Total:0%</li>
                                        <li>Kernel: 0%</li>
                                        <li>PQL: 0</li>
                                    </ul>
                                </div>
                                <!-- //slider 1 -->
                                <!-- slider 2 -->
                                <div class="item">
                                    <h4 class="media-heading">Memory</h4>
                                    <ul class="list-unstyled">
                                        <li>RAM: 4093.03 MB</li>
                                        <li>Available: 0MB </li>
                                        <li>Committed: 0MB </li>
                                    </ul>
                                </div>
                                <!-- //slider 2 -->
                                <!-- slider 3 -->
                                <div class="item">
                                    <h4 class="media-heading">Disk</h4>
                                    <ul class="list-unstyled">
                                        <li>Disk Read Speed: 0ms</li>
                                        <li>%Disk Time: 0%</li>
                                        <li>Free Space: 0MB</li>
                                    </ul>
                                </div>
                                <div class="item">

                                    <h4>NETWORK</h4>
                                    <ul class="list-unstyled">
                                        <li>BYTES TOTAL: 0 Bytes/sec</li>
                                        <li>BYTES RECV:  0 Bytes/sec</li>
                                        <li>BYTES SEND:  0 Bytes/sec </li>
                                    </ul>
                                </div>
                                <!-- //slider 3 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 col-md-4"></div>
            <div class="col-sm-4 col-md-4"></div>
            <div class="col-sm-4 col-md-4"></div>
        </section>

        <div>
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="no-bold">Alerts in last 15 minutes</h3>
                </div>
            </div>
            <div class="alerts-contents">

                <section id="alert-app-servers_App Servers (EN)" class="alerts">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-1 nopadding">
                                <div class="col-sm-12 col-md-12 bg-alert-default text-center box">
                                    <h4>App Servers (EN)</h4>
                                </div>
                            </div>
                            <div class="col-md-11 nopadding">
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">19</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:13</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">31</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:13</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">2</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:14:12</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">7</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:27:53</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">27</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:13</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">59</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">SQL Server 에이전트 (MSSQLSERVER)</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:30</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">9</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:13</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">59</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">model</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:13</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">59</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:13</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">59</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">msdb</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:13</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">15</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">CODECLASSIC</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:27:50</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">31</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">Info Errors</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:13</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">38</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:27:43</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="alert-app-servers_Corp Sales (KR)" class="alerts">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-1 nopadding">
                                <div class="col-sm-12 col-md-12 bg-alert-default text-center box">
                                    <h4>Corp Sales (KR)</h4>
                                </div>
                            </div>
                            <div class="col-md-11 nopadding">
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">14</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:24</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">59</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">msdb</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:24</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">8</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:24:36</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">15</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">CODECLASSIC</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:28</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">59</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">SQL Server 에이전트 (MSSQLSERVER)</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:28</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">3</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">Average wait time (ms)</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:22:54</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">13</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:03</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">37</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">Info Errors</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:09</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">2</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:17:24</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">59</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:24</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">47</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:09</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">39</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:24</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">30</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:09</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">59</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">model</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:24</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">8</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:09</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="alert-app-servers_Portal (JP)" class="alerts">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-1 nopadding">
                                <div class="col-sm-12 col-md-12 bg-alert-default text-center box">
                                    <h4>Portal (JP)</h4>
                                </div>
                            </div>
                            <div class="col-md-11 nopadding">
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Critical.png" />
                                                        <h6 class="text-center">15</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-02-23 오후 2:46:40</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">43</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:11</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">40</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:27:41</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">15</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">CODECLASSIC</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:00</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">31</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:11</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">1</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">Average wait time (ms)</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:13:25</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">60</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">SQL Server 에이전트 (MSSQLSERVER)</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:32</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">9</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:11</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">60</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">model</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:11</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">60</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:11</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">60</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">msdb</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:11</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">20</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:27:26</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2 bg-alert-text box">
                                    <div class="carousel slide" data-interval="3000" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Information.png" />
                                                        <h6 class="text-center">36</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">Info Errors</h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:28:11</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="item ">
                                                <div class="media-left">
                                                    <div>
                                                        <img src="/images/Warning.png" />
                                                        <h6 class="text-center">11</h6>
                                                    </div>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"></h5>
                                                    <ul class="list-unstyled">
                                                        <li></li>
                                                        <li class="text-red">2015-11-20 오후 6:27:18</li>
                                                        <li>[SQL] Info Errors have been found</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ModalContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
