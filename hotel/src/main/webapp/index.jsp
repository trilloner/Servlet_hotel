
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="ru"/>
<fmt:setBundle basename="messages"/>
<html>
<head>
    <link href="/styles/main.css" rel="stylesheet" type="text/css">
    <title>Hotel</title>
    <!--    <script type="text/javascript" th:src="@{/js/logout.js}"></script>-->
<style> <%@include file="styles/main.css"%></style>
</head>
<body style="'background: url(/img/background.png) no-repeat; background-size: 100%;width: 100%;'">
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <div>
                <li class="left-item"><a href="?lang=en">EN</a></li>
                <li class="left-item"><a href="?lang=ru">RU</a></li>
                <li class="right-item"><a href="/login">
                    <fmt:message key="main.menu.book"/>
                </a></li>
            </div>
        </ul>

    </nav>
</header>
<div id="overlay">
    <div id="text">
        <h2><fmt:message key="main.welcome"/></h2>
        <h2></h2>
        <!--            <a href="#" class="btn btn-primary btn-lg">Book Now</a>-->

    </div>

</div>
</body>
</html>
