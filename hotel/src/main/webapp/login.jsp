<%--
  Created by IntelliJ IDEA.
  User: mamko
  Date: 19.02.2021
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="ru"/>
<fmt:setBundle basename="messages"/>
<html>
<head>
    <link href="/styles/login.css" rel="stylesheet" type="text/css">
    <link href="/styles/register.css" rel="stylesheet" type="text/css">
    <style> <%@include file="styles/login.css"%></style>
    <style> <%@include file="styles/register.css"%></style>

    <title>Login</title>
</head>
<body>
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <li class="left-item"><a href="?lang=en">EN</a></li>
            <li class="left-item"><a href="?lang=ru">RU</a></li>
            <li class="right-item"><a href="" >
            <fmt:message key="main.menu.book"/>
            </a></li>
        </ul>
    </nav>
</header>

<div class="loginForm">
    <form action="/login" method="post">
        <div><label> User Name : <input id="name" type="text" name="username"/> </label></div>
        <div><label> Password: <input id="password" type="password" name="password"/> </label></div>
        <div><input id="button" type="submit" value="Sign In"/></div>
    </form>
</div>
</body>
</html>
