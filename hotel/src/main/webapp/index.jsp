<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>
<html>
<head>
    <link href="/styles/main.css" rel="stylesheet" type="text/css">
    <title><fmt:message key="main.title"/></title>
    <style>
        <%@include file="styles/main.css" %>

        body {
            background-image: url("img/background.png");
            background-size: 100%;
            width: 100%;
        }
    </style>
</head>
<body>
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <div>
                <li class="left-item"><a href="${pageContext.request.contextPath}?lang=en">EN</a></li>
                <li class="left-item"><a href="${pageContext.request.contextPath}?lang=ru">RU</a></li>
                <c:if test="${sessionScope.user == null}">
                    <li class="right-item"><a href="${pageContext.request.contextPath}/registration">
                        <fmt:message key="main.menu.book"/>
                    </a></li>
                </c:if>
                <c:if test="${sessionScope.user != null && sessionScope.user.role.equals('ROLE_USER')}">
                    <li class="right-item"><a href="${pageContext.request.contextPath}/cabinet">
                        <fmt:message key="main.menu.cabinet"/>
                    </a></li>
                    <li class="right-item"><a href="${pageContext.request.contextPath}/rooms">
                        <fmt:message key="main.menu.rooms"/>
                    </a></li>
                    <li class="right-item"><a href="${pageContext.request.contextPath}/order">
                        <fmt:message key="main.menu.book"/>
                    </a></li>
                </c:if>

                <c:if test="${sessionScope.user.role.equals('ROLE_ADMIN')}">
                    <li class="right-item"><a href="${pageContext.request.contextPath}/admin">
                        <fmt:message key="main.menu.cabinet"/>
                    </a></li>
                </c:if>

            </div>
        </ul>
    </nav>

</header>
<div id="overlay">
    <div id="text">
        <h2><fmt:message key="main.welcome"/></h2>
        <h2></h2>

    </div>

</div>
</body>
</html>
