<%--
  Created by IntelliJ IDEA.
  User: Bogdan Volokhonenko
  Date: 20.02.2021
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>
<html>
<head>
    <link href="/styles/login.css" rel="stylesheet">
    <link href="/styles/register.css" rel="stylesheet">
    <title><fmt:message key="registration.title"/></title>
    <style>
        <%@include file="styles/login.css" %>
        <%@include file="styles/register.css" %>

    </style>
</head>
<body>
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <li class="left-item"><a href="${pageContext.request.contextPath}/registration?lang=en">EN</a></li>
            <li class="left-item"><a href="${pageContext.request.contextPath}/registration?lang=ru">RU</a></li>
            <li class="right-item"><a href="${pageContext.request.contextPath}/login"><fmt:message key="main.menu.book"/></a></li>

        </ul>
    </nav>
</header>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">

            <form class="main-form first" action="${pageContext.request.contextPath}/registration" method="post">
                <h2><fmt:message key="registration.signup"/></h2>
                <div class="form-group">
                    <label for="name" class="control-label"><fmt:message key="registration.username"/></label>
                    <input id="name" class="form-control" name="username"/>
                    <span errors="*{name}"></span>
                </div>
                <div class="form-group">
                    <label for="email" class="control-label"><fmt:message key="registration.email"/></label>
                    <input id="email" class="form-control" name="email"/>
                </div>
                <div class="form-group">
                    <label for="password" class="control-label"><fmt:message key="registration.password"/></label>
                    <input id="password" class="form-control" type="password"
                           name="password"/>
                </div>
                <c:if test="${errorRegister != null}">
                    <div>
                        <p>
                            <c:out value="${errorRegister}"/>
                        </p>
                    </div>
                </c:if>

                <div class="form-group">
                    <button id="button" type="submit" class="btn btn-success"><fmt:message
                            key="registration.register"/></button>
                    <span><fmt:message key="registration.span.login"/> </span> <a href="${pageContext.request.contextPath}/login"> <fmt:message
                        key="registration.login"/></a>
                </div>

            </form>
        </div>
    </div>
</div>
</body>

</html>
