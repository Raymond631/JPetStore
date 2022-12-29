<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/12/29
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客服</title>
    <link rel="stylesheet" href="../css/ServiceBack.css">
</head>
<body>
<%@include file="../Common/LeftBack.jsp" %>
<section class="section section-lg bg-default">
    <div class="container">
        <div class="row align-items-md-center row-30">
            <div class="col-lg-8">
                <div class="block-md text-center">
                    <h3>Get in Touch</h3>
                    <p>We are available 24/7 by fax, e-mail or by phone. You can also use our quick contact form to ask
                        a question about our services and products we offer.</p>
                    <form class="rd-form rd-mailform" data-form-output="form-output-global" data-form-type="contact"
                          method="post" action="bat/rd-mailform.php">
                        <div class="row row-20">
                            <div class="col-md-6">
                                <div class="form-wrap">
                                    <input class="form-input" id="contact-name" type="text" name="name"
                                           data-constraints="@Required">
                                    <label class="form-label" for="contact-name">Your Name</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-wrap">
                                    <input class="form-input" id="contact-phone" type="text" name="phone"
                                           data-constraints="@Numeric">
                                    <label class="form-label" for="contact-phone">Phone</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-wrap">
                                    <label class="form-label" for="contact-message">Your Message</label>
                                    <textarea class="form-input" id="contact-message" name="message"
                                              data-constraints="@Required"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-wrap">
                                    <input class="form-input" id="contact-email" type="email" name="email"
                                           data-constraints="@Email @Required">
                                    <label class="form-label" for="contact-email">E-mail</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <button class="button button-block button-secondary-light" type="submit">Send Message
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="contact-box-wrap">
                    <div class="contact-box">
                        <div class="contact-box-item">
                            <p class="contact-box-title">Get social</p>
                            <ul class="list-inline">
                                <li><a class="icon-gray-500" href="#">
                                    <ion-icon name="logo-facebook"></ion-icon>
                                </a></li>
                                <li><a class="icon-gray-500 fa-twitter" href="#">
                                    <ion-icon name="logo-twitter"></ion-icon>
                                </a></li>
                                <li><a class="icon-gray-500 fa-google" href="#">
                                    <ion-icon name="logo-google"></ion-icon>
                                </a></li>
                                <li><a class="icon-gray-500 fa-youtube" href="#">
                                    <ion-icon name="logo-youtube"></ion-icon>
                                </a></li>
                            </ul>
                        </div>
                        <div class="contact-box-item">
                            <p class="contact-box-title">Phone</p>
                            <div class="link-inline"><span class="icon material-icons-local_phone"><ion-icon
                                    name="call-outline"></ion-icon></span><a href="tel:#"> xxxxxxxxxxx</a></div>
                        </div>
                        <div class="contact-box-item">
                            <p class="contact-box-title">E-mail</p>
                            <div class="link-inline"><span class="icon mdi-email-outline"></span><a href="mailto:#">
                                <ion-icon name="mail-outline"></ion-icon>
                                xxxxxxxxxxx</a></div>
                        </div>
                        <div class="contact-box-item">
                            <p class="contact-box-title">Address</p>
                            <div class="link-inline link-inline-top"><span
                                    class="icon material-icons-location_on"></span><a href="#">
                                <ion-icon name="location-outline"></ion-icon>
                                xxxxxxxxxxx<br>xxxxxxxxxxx</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
