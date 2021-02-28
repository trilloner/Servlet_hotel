<%--
  Created by IntelliJ IDEA.
  User: Bogdan Volokhonenko
  Date: 20.02.2021
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>
<html>
<head>
    <title><fmt:message key="cabinet.title"/></title>
    <style>
        <%@include file="styles/login.css" %>
    </style>
</head>
<body style="'background-color: #f3efe8;'">
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <li class="left-item"><a href="${pageContext.request.contextPath}/cabinet?lang=en">EN</a></li>
            <li class="left-item"><a href="${pageContext.request.contextPath}/cabinet?lang=ru">RU</a></li>
            <li class="right-item"><a href="${pageContext.request.contextPath}/rooms"> <fmt:message
                    key="main.menu.rooms"/></a></li>
            <li class="right-item"><a href="${pageContext.request.contextPath}/cabinet"> <fmt:message
                    key="main.menu.cabinet"/></a></li>
            <li class="right-item"><a href="${pageContext.request.contextPath}/order"> <fmt:message
                    key="main.menu.book"/></a></li>
        </ul>
    </nav>
</header>
<div class="container">
    <section class="filterBar">
        <div class="search-ui">
            <label for="search"><fmt:message key="cabinet.search"/></label>
            <div class="search-container">
                <form action="">
                    <input class="search-input" type="text" placeholder="Search by user name or email address..."
                           name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>

    </section>

    <table>
        <tr class="table-header">
            <th><fmt:message key="cabinet.username"/></th>
            <th><fmt:message key="cabinet.checkin"/></th>
            <th><fmt:message key="cabinet.checkout"/></th>
            <th class="roleHead"><fmt:message key="cabinet.people"/></th>
            <th class="statusHead"><fmt:message key="cabinet.room"/></th>
            <th class="statusHead"><fmt:message key="cabinet.status"/></th>
            <th class="statusHead"><fmt:message key="cabinet.payment"/></th>
        </tr>

        <c:forEach var="reservation" items="${reservations}" varStatus="loop">
            <tr>
                <td class="username"><c:out value="${loop.index+1}"/></td>
                <td><c:out value="${reservation.getCheckIn()}"/></td>
                <td><c:out value="${reservation.getCheckOut()}"/></td>
                <td class="commenter"><i class="fas fa-angle-down"> <c:out
                        value="${reservation.getNumberOfSeats()}"/> </i></td>

                <c:choose>
                    <c:when test="${reservation.getRoomId() != null}">
                        <td class="commenter">
                            <c:out value="${reservation.getRoomId().getName()}"/>
                        </td>

                    </c:when>
                    <c:otherwise>
                        <th>
                        <td class="commenter"></td>
                        </th>
                    </c:otherwise>
                </c:choose>
                <td><c:out value="${reservation.getStatus()}"></c:out></td>

                <c:choose>
                    <c:when test="${reservation.getStatus().equals('CONFIRMED')}">
                        <td><a><fmt:message key="cabinet.accept"/></a></td>
                    </c:when>
                    <c:otherwise>
                        <td></td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>

    </table>
</div>
<form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value=<fmt:message key="cabinet.logout"/>>
</form>
</body>
</html>
