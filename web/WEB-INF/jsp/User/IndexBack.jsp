<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/12/29
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="../css/IndexBack.css">
    <script src="https://cdn.staticfile.org/Chart.js/3.9.1/chart.js"></script>
    <%-- 图片--%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>
<body>
<%@include file="../Common/LeftBack.jsp" %>
<div id="page-wrapper">
    <div class="main-page">
        <div class="row-one">
            <div class="col-md-4 widget">
                <div class="stats-left ">
                    <h5>Today</h5>
                    <h4>Sales</h4>
                </div>
                <%--销售额--%>
                <div class="stats-right">
                    <label> 45</label>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-4 widget states-mdl">
                <div class="stats-left">
                    <h5>Today</h5>
                    <h4>Visitors</h4>
                </div>
                <%--                来访人数--%>
                <div class="stats-right">
                    <label> 80</label>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-4 widget states-last">
                <div class="stats-left">
                    <h5>Today</h5>
                    <h4>Orders</h4>
                </div>
                <div class="stats-right">
                    <label>51</label>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="charts">
            <div class="col-md-4 charts-grids widget">
                <h4 class="title">Bar Chart Example</h4>
                <canvas id="bar" height="314" width="400"></canvas>
                <script>
                    const ctxs = document.getElementById('bar');
                    const datas = {
                        labels: [

                            'Sales',
                            'Visites',
                            'Orders'

                        ],
                        datasets: [{
                            label: '',
                            data: [45, 80, 51],
                            backgroundColor: [

                                'rgb(79,82,186)',
                                'rgb(88,88,88)',
                                'rgb(233,78,2)'
                            ]
                        }]
                    };
                    const configs = {
                        type: 'polarArea',
                        data: datas,
                        options: {
                            responsive: false,
                            maintainAspectRatio: false,
                        }
                    };
                    const myCharts = new Chart(ctxs, configs);
                </script>
                </script>
            </div>

            <div class="col-md-4 charts-grids widget states-mdl">
                <div class="col-md-4 social-media widget-shadow">
                    <div class="wid-social twitter">
                        <div class="social-icon">
                            <i class="fa fa-twitter text-light icon-xlg ">
                                <ion-icon name="logo-twitter"></ion-icon>
                            </i>
                        </div>
                        <div class="social-info">
                            <h3 class="number_counter bold count text-light start_timer counted">3.1 K</h3>
                            <h4 class="counttype text-light">Tweets</h4>
                        </div>
                    </div>
                    <div class="wid-social google-plus">
                        <div class="social-icon">
                            <i class="fa fa-google-plus text-light icon-xlg ">8+</i>
                        </div>
                        <div class="social-info">
                            <h3 class="number_counter bold count text-light start_timer counted">523</h3>
                            <h4 class="counttype text-light">Circles</h4>
                        </div>
                    </div>
                    <div class="wid-social facebook">
                        <div class="social-icon">
                            <i class="fa fa-facebook text-light icon-xlg ">
                                <ion-icon name="logo-facebook"></ion-icon>
                            </i>
                        </div>
                        <div class="social-info">
                            <h3 class="number_counter bold count text-light start_timer counted">1.06K</h3>
                            <h4 class="counttype text-light">Likes</h4>
                        </div>
                    </div>
                    <div class="wid-social dribbble">
                        <div class="social-icon">
                            <i class="fa fa-dribbble text-light icon-xlg ">
                                <ion-icon name="logo-dribbble"></ion-icon>
                            </i>
                        </div>
                        <div class="social-info">
                            <h3 class="number_counter bold count text-light start_timer counted">1.6 K</h3>
                            <h4 class="counttype text-light">Subscribers</h4>
                        </div>
                    </div>
                    <div class="wid-social vimeo">
                        <div class="social-icon">
                            <i class="fa fa-vimeo-square text-light icon-xlg">
                                <ion-icon name="logo-vimeo"></ion-icon>
                            </i>
                        </div>
                        <div class="social-info">
                            <h3 class="number_counter bold count text-light start_timer counted">2.1 m</h3>
                            <h4 class="counttype text-light">Contacts</h4>
                        </div>
                    </div>
                    <div class="wid-social xing">
                        <div class="social-icon">
                            <i class="fa fa-xing text-light icon-xlg ">
                                <ion-icon name="logo-xing"></ion-icon>
                            </i>
                        </div>
                        <div class="social-info">
                            <h3 class="number_counter bold count text-light start_timer counted">2525</h3>
                            <h4 class="counttype text-light">Connections</h4>
                        </div>
                    </div>
                    <div class="wid-social flickr">
                        <div class="social-icon">
                            <i class="fa fa-android text-light icon-xlg">
                                <ion-icon name="logo-android"></ion-icon>
                            </i>
                        </div>
                        <div class="social-info">
                            <h3 class="number_counter bold count text-light start_timer counted">1221</h3>
                            <h4 class="counttype text-light">Media</h4>
                        </div>
                    </div>
                    <div class="wid-social yahoo">
                        <div class="social-icon">
                            <i class="fa fa-yahoo text-light icon-xlg"> Y!</i>
                        </div>
                        <div class="social-info">
                            <h3 class="number_counter bold count text-light start_timer counted">2525</h3>
                            <h4 class="counttype text-light">Connections</h4>
                        </div>
                    </div>
                    <div class="wid-social rss">
                        <div class="social-icon">
                            <i class="fa fa-rss text-light icon-xlg">
                                <ion-icon name="logo-rss"></ion-icon>
                            </i>
                        </div>
                        <div class="social-info">
                            <h3 class="number_counter bold count text-light start_timer counted">1523</h3>
                            <h4 class="counttype text-light">Subscribers</h4>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="stats">
                <div class="row">
                    <div class="col-md-4 stats-info widget">
                        <div class="stats-title">
                            <h4 class="title">Browser Stats</h4>
                        </div>
                        <div class="stats-body">
                            <ul class="list-unstyled">
                                <%--                                用户购买各个商品的百分率--%>
                                <li>fish <span class="pull-right">85%</span>
                                    <div class="progress progress-striped active progress-right">
                                        <div class="bar green" style="width:85%;"></div>
                                    </div>
                                </li>
                                <li>cat <span class="pull-right">35%</span>
                                    <div class="progress progress-striped active progress-right">
                                        <div class="bar yellow" style="width:35%;"></div>
                                    </div>
                                </li>
                                <li>dog <span class="pull-right">78%</span>
                                    <div class="progress progress-striped active progress-right">
                                        <div class="bar red" style="width:78%;"></div>
                                    </div>
                                </li>
                                <li>reptils <span class="pull-right">50%</span>
                                    <div class="progress progress-striped active progress-right">
                                        <div class="bar blue" style="width:50%;"></div>
                                    </div>
                                </li>
                                <li>birds <span class="pull-right">80%</span>
                                    <div class="progress progress-striped active progress-right">
                                        <div class="bar light-blue" style="width:80%;"></div>
                                    </div>
                                </li>
                                <li class="last">Others <span class="pull-right">60%</span>
                                    <div class="progress progress-striped active progress-right">
                                        <div class="bar orange" style="width:60%;"></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
</body>
</html>
