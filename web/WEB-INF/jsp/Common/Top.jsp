<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
    </script>
    <title>Top</title>
    <link rel="stylesheet" type="text/css" href="../css/jpetstore.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="../css/aspectran.css"/>
    <link rel="stylesheet" type="text/css" href="../css/top.css"/>
    <script src="../js/Search.js"></script>
</head>
<body>

<div class="header">

    <div class="logo">
        <div class="logoName">
            <h1 class="gradient-text">Jpetstore</h1>
        </div>
    </div>

    <div class="top-cover">

        <form action="../Pet/searchPet" method="post" name="searchForm" id="searchForm">
            <div class="tb">
                <div class="td">
                    <input type="text" name="keyword" id="keyword" placeholder="Product Search" required>
                </div>
                <div class="td" id="s-cover">
                    <button type="submit">
                        <div id="s-circle"></div>
                        <span></span>
                    </button>
                </div>
            </div>
        </form>
        <div id="productAutoComplete">
            <ul id="productAutoList">

            </ul>
        </div>
    </div>

    <div class="top-right">

        <a href="../Cart/cartList">
            <img align="middle" name="img_cart" src="../images/shopping.png"/>
        </a>

        <c:if test="${sessionScope.user == null}">
            <a href="../User/showLogin">
                <img align="middle" name="img_cart" src="../images/login.png"/>
            </a>

            <a href="../User/showRegister">
                <img align="middle" name="img_cart" src="../images/register.png"/>
            </a>
        </c:if>
        <c:if test="${sessionScope.user != null}">
            <a href="../Order/orderList">
                <img align="middle" name="img_cart" src="../images/order.png"/>
            </a>

            <a href="../User/personalCenter">
                <img align="middle" name="img_cart" src="../images/self.png"/>
            </a>

            <a href="../User/signOut">
                <img align="middle" name="img_cart" src="../images/logout.png"/>
            </a>
        </c:if>

    </div>
</div>

<nav id="navbar" style="z-index: 9999">
    <ul class="navbar-items flexbox-col">
        <li class="navbar-logo flexbox-left">
            <a class="navbar-item-inner flexbox" href="../Pet/homePage">
                <span style="font-size: 20px">Home</span>

            </a>
        </li>
        <li class="navbar-item flexbox-left">
            <a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=fish">
                <div class="navbar-item-inner-icon-wrapper flexbox">
                    <ion-icon name="search-outline">Fish</ion-icon>
                </div>
                <span class="link-text">Saltwater, Freshwater</span>
            </a>
        </li>
        <li class="navbar-item flexbox-left">
            <a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=dogs">
                <div class="navbar-item-inner-icon-wrapper flexbox">
                    <ion-icon name="home-outline">Dogs</ion-icon>
                </div>
                <span class="link-text">Various Breeds</span>
            </a>
        </li>
        <li class="navbar-item flexbox-left">
            <a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=reptiles">
                <div class="navbar-item-inner-icon-wrapper flexbox">
                    <ion-icon name="folder-open-outline">Reptiles</ion-icon>
                </div>
                <span class="link-text"> Lizards, Turtles, Snakes</span>
            </a>
        </li>
        <li class="navbar-item flexbox-left">
            <a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=cats">
                <div class="navbar-item-inner-icon-wrapper flexbox">
                    <ion-icon name="pie-chart-outline">Cats</ion-icon>
                </div>
                <span class="link-text">Various Breeds, Exotic Varieties</span>
            </a>
        </li>
        <li class="navbar-item flexbox-left">
            <a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=birds">
                <div class="navbar-item-inner-icon-wrapper flexbox">
                    <ion-icon name="people-outline">Birds</ion-icon>
                </div>
                <span class="link-text"> Exotic Varieties</span>
            </a>
        </li>
    </ul>
</nav>
</body>
</html>
<style>

    :root {
        --primary: 237, 94%, 81%;
        --background: 266, 16%, 92%;
        --background-secondary: 256, 12%, 12%;
        --background-secondary-dark: 256, 10%, 10%;
        --background-secondary-light: 257, 11%, 16%;
        --text-primary: 0, 0%, 0%;
        /* Colors */
        --black: 0, 0%, 0%;
        --white: 0, 0%, 100%;
        --quite-gray: 0, 0%, 50%;
        --grooble: 10, 28%, 93%;
        /* Sizes */
        --heading-large: 5.6rem;
        --heading-medium: 3.6rem;
        --heading-small: 2.4rem;
        --paragraph: 1.11rem;
        --navbar-buttons: 2.4rem;
        /* misc */
        --transition-main: .175, .685, .32;
        /* Fonts */
        --font-main: "Poppins";
    }

    /* ===========
        Variabels
       =========== */

    /* ===============
        Global Styles
       =============== */

    /**, *::before, *::after {*/
    /*    box-sizing: inherit;*/
    /*}*/

    /*html, body {*/
    /*    margin: 0;*/
    /*    width: 100%;*/
    /*    color: hsl(var(--text-primary));*/
    /*    font-family: var(--font-main);*/
    /*    background-color: hsl(var(--background));*/
    /*    -webkit-font-smoothing: antialiased;*/
    /*    scroll-behavior: smooth;*/
    /*    box-sizing: border-box;*/
    /*}*/

    /* ============
        Typography
       ============ */

    /* Headings */
    h1, h2, h3, h4, h5, h6 {
        margin: 0;
    }

    /* Font Size */
    h1 {
        font-size: var(--heading-large);
    }

    h2 {
        font-size: var(--heading-medium);
    }

    h3 {
        font-size: var(--heading-small);
    }

    h4 {
        font-size: calc(var(--heading-small) - .2rem);
    }

    h5 {
        font-size: calc(var(--heading-small) - .4rem);
    }

    h6 {
        font-size: calc(var(--heading-small) - .6rem);
    }

    /* Font Weight */
    h1, h2 {
        font-weight: 900;
    }

    h3, h4, h5, h6 {
        font-weight: 800;
    }

    /* Paragraphs */
    p {
        margin: 0;
        font-size: var(--paragraph);
    }

    /* Links */
    a {
        color: hsla(var(--primary), 1);
        font-size: var(--paragraph);
        text-decoration: underline;
    }

    a:visited {
        color: hsla(var(--primary), .5);
    }

    /* =========
        Buttons
       ========= */

    button {
        /*padding: .8em 1.2em;*/
        border: 1px solid hsl(var(--black));
        background-color: hsl(var(--background));
        font-size: var(--paragraph);
        cursor: pointer;
        outline: none;
    }

    button:focus {
        box-shadow: 0 0 0 2px hsl(var(--black)),
        0 0 0 3px hsl(var(--white));
        border: 1px solid transparent;
    }

    /* =======
        Lists
       ======= */

    ul, ol {
        margin: 1em 0;
    }

    /* =======
        Forms
       ======= */

    form {
        margin: 0;
    }

    fieldset {
        margin: 0;
        padding: .5em 0;
        border: none;
    }

    input {
        padding: .8em 1.2em;
        font-size: var(--paragraph);
        background-color: hsl(var(--grooble));
        border: 2px solid hsl(var(--grooble));
        outline: none;
    }

    textarea {
        padding: .8em 1.2em;
        font-size: var(--paragraph);
        font-family: var(--font-main);
        background-color: hsl(var(--grooble));
        border: 2px solid hsl(var(--grooble));
        outline: none;
    }

    input, textarea {
        transition: all .2s ease-in-out;
    }

    input:hover, input:focus, textarea:hover, textarea:focus {
        box-shadow: 0 0 0 2px hsl(var(--black)),
        0 0 0 3px hsl(var(--white));
        border: 2px solid transparent;
    }

    select {
        padding: .8em 1.2em;
        border: 1px solid hsl(var(--black));
        font-size: var(--paragraph);
        outline: none;
    }

    /* =========
        Classes
       ========= */

    /* ================
        Global classes
       ================ */

    /* =========
        Flexbox
       ========= */

    .flexbox {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .flexbox-left {
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    .flexbox-right {
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }

    /* Columns */
    .flexbox-col {
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }

    .flexbox-col-left {
        display: flex;
        justify-content: flex-start;
        flex-direction: column;
        align-items: flex-start;
    }

    .flexbox-col-left-ns {
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: flex-start;
    }

    .flexbox-col-right {
        display: flex;
        justify-content: flex-end;
        flex-direction: column;
        align-items: flex-end;
    }

    .flexbox-col-start-center {
        display: flex;
        justify-content: flex-start;
        flex-direction: column;
        align-items: center;
    }

    /* Spacings */
    .flexbox-space-bet {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    /* =========
        Classes
       ========= */

    .view-width {
        width: 70%;
    }

    /* ========
        Navbar
       ======== */

    #navbar {
        top: 0;
        padding: 0;
        width: 7em;
        height: 100vh;
        position: fixed;
        background-color: hsl(var(--background-secondary));
        transition: width .35s cubic-bezier(var(--transition-main), 1);
        overflow-y: auto;
        overflow-x: hidden;
    }

    #navbar:hover {
        width: 19em;
    }

    #navbar::-webkit-scrollbar-track {
        background-color: hsl(var(--background-secondary));
    }

    #navbar::-webkit-scrollbar {
        width: 8px;
        background-color: hsl(var(--background-secondary));
    }

    #navbar::-webkit-scrollbar-thumb {
        background-color: hsl(var(--primary));
    }

    .navbar-items {
        margin: 0;
        padding: 0;
        list-style-type: none;
    }

    /* Navbar Logo */
    .navbar-logo {
        margin: 0 0 2em 0;
        width: 100%;
        height: 5em;
        background: hsl(var(--background-secondary-dark));
    }

    .navbar-logo > .navbar-item-inner {
        width: calc(5rem - 8px);
    }

    .navbar-logo > .navbar-item-inner:hover {
        background-color: transparent;
    }

    .navbar-logo > .navbar-item-inner > svg {
        height: 2em;
        fill: hsl(var(--white));
    }

    /* Navbar Items */
    .navbar-item {
        padding: 0 .5em;
        width: 100%;
        cursor: pointer;
    }

    .navbar-item-inner {
        height: 70px;
        padding: 1em 0;
        width: 100%;
        font-size: 10px;
        position: relative;
        color: hsl(var(--quite-gray));
        border-radius: .25em;
        text-decoration: none;
        transition: all .2s cubic-bezier(var(--transition-main), 1);
    }

    .navbar-item-inner:hover {
        height: 70px;
        color: hsl(var(--white));
        background: hsl(var(--background-secondary-light));
        box-shadow: 0 17px 30px -10px hsla(var(--black), .25);
    }

    .navbar-item-inner-icon-wrapper {
        width: calc(8rem - 1em - 8px);
        position: relative;
    }

    .navbar-item-inner-icon-wrapper ion-icon {
        position: absolute;
        font-size: calc(var(--navbar-buttons) - 1rem);
    }

    .link-text {
        margin: 0;
        width: 0;
        text-overflow: ellipsis;
        white-space: nowrap;
        transition: all .35s cubic-bezier(var(--transition-main), 1);
        overflow: hidden;
        opacity: 0;
    }

    #navbar:hover .link-text {
        width: calc(100% - calc(5rem - 8px));
        opacity: 1;
    }

    /*!* ======*/
    /*    Main*/
    /*   ====== *!*/

    /*#main {*/
    /*    margin: 0 0 0 5em;*/
    /*    min-height: 150vh;*/
    /*}*/

    /*#main > h2 {*/
    /*    width: 80%;*/
    /*    max-width: 80%;*/
    /*}*/

    /*#main > p {*/
    /*    width: 80%;*/
    /*    max-width: 80%;*/
    /*}*/

    /* =============
        ::Selectors
       ============= */

    /* Selection */
    ::selection {
        color: hsl(var(--white));
        background: hsla(var(--primary), .33);
    }

    /* Scrollbar */
    ::-webkit-scrollbar-track {
        background-color: hsl(var(--background));
    }

    ::-webkit-scrollbar {
        width: 8px;
        background-color: hsl(var(--background));
    }

    ::-webkit-scrollbar-thumb {
        background-color: hsl(var(--primary));
    }

    /* ===============
        5. @keyframes
       =============== */

    /* ==============
        @media rules
       ============== */

    @media only screen and (max-width: 1660px) {
        :root {
            /* Sizes */
            --heading-large: 5.4rem;
            --heading-medium: 3.4rem;
            --heading-small: 2.2rem;
        }
    }

    @media only screen and (max-width: 1456px) {
        :root {
            /* Sizes */
            --heading-large: 5.2rem;
            --heading-medium: 3.2rem;
            --heading-small: 2rem;
        }

        .view-width {
            width: 80%;
        }
    }

    @media only screen and (max-width: 1220px) {
        .view-width {
            width: 70%;
        }
    }

    @media only screen and (max-width: 1024px) {
        :root {
            /* Sizes */
            --heading-large: 5rem;
            --heading-medium: 3rem;
            --heading-small: 1.8rem;
        }

        .view-width {
            width: 75%;
        }
    }

    @media only screen and (max-width: 756px) {
        :root {
            /* Sizes */
            --heading-large: 4rem;
            --heading-medium: 2.6rem;
            --heading-small: 1.6rem;
            --paragraph: 1rem;
            --navbar-buttons: 2.2rem;
        }

        .view-width {
            width: calc(100% - 5em);
        }
    }

    @media only screen and (max-width: 576px) {
        .view-width {
            width: calc(100% - 3em);
        }
    }

    @media only screen and (max-width: 496px) {

    }
</style>
