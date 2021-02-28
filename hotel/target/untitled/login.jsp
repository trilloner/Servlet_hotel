<%--
  Created by IntelliJ IDEA.
  User: Bogdan Volokhonenko
  Date: 19.02.2021
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>
<html>
<head>
    <link href="/styles/login.css" rel="stylesheet" type="text/css">
    <link href="/styles/register.css" rel="stylesheet" type="text/css">
    <style>
        <%@include file="styles/login.css" %>
    </style>
    <style>
        <%@include file="styles/register.css" %>
    </style>

    <title><fmt:message key="login.title"/></title>
</head>
<body>
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <li class="left-item"><a href="${pageContext.request.contextPath}/login?lang=en">EN</a></li>
            <li class="left-item"><a href="${pageContext.request.contextPath}/login?lang=ru">RU</a></li>
            <li class="right-item"><a href="/login">
                <fmt:message key="main.menu.book"/>
            </a></li>
        </ul>
    </nav>
</header>

<div class="loginForm">
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div><label> <fmt:message key="login.email"/></label> <input id="name" type="text" name="username"/></div>
        <div><label> <fmt:message key="login.password"/> </label><input id="password" type="password" name="password"/>
        </div>
        <div><input id="button" type="submit" value=<fmt:message key="login.login"/>></div>
        <c:if test="${errorMessage != null}">
            <div><c:out value="${errorMessage}"/></div>
        </c:if>
    </form>
</div>
</body>
</html>
