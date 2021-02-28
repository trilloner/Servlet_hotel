<%--
  Created by IntelliJ IDEA.
  User: Bogdan Volokhonenko
  Date: 23.02.2021
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>
<html>
<head>
    <title><fmt:message key="admin.title"/></title>
    <style>
        <%@include file="styles/login.css" %>
    </style>
</head>
<body style="'background-color: #f3efe8;'">
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <li class="left-item"><a href="${pageContext.request.contextPath}/admin?lang=en">EN</a></li>
            <li class="left-item"><a href="${pageContext.request.contextPath}/admin?lang=ru">RU</a></li>
            <li class="right-item"><a href="${pageContext.request.contextPath}/admin"> <fmt:message key="main.menu.cabinet"/></a></li>
        </ul>
    </nav>
</header>
<div class="container">
    <section class="filterBar">
        <div class="search-ui">
            <label for="search"><fmt:message key="cabinet.search"/></label>
            <div class="search-container">
                <form action="">
                    <input class="search-input" type="text" placeholder=""
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
        <c:forEach items="${allReservations}" var="reservation">
            <tr>
                <form action="${pageContext.request.contextPath}/admin/update?id=${reservation.getId()}" method="post">
                    <td class="email">
                        <a href="mailto:email@email.com">
                            <c:out value="${reservation.getUserByUserId().getEmail()}"/>
                        </a>
                    </td>
                    <td><c:out value="${reservation.getCheckIn()}"/></td>
                    <td><c:out value="${reservation.getCheckOut()}"/></td>
                    <td><c:out value="${reservation.getNumberOfSeats()}"/></td>
                    <c:if test="${reservation.getRoomId().getName() != null}">
                        <td><c:out value="${reservation.getRoomId().getName()}"/></td>

                    </c:if>
                    <c:if test="${reservation.getRoomId().getName() == null }">
                        <td>
                            <select name="room_id">
                                <c:forEach items="${allRooms}" var="room" varStatus="loop">
                                    <option value="${loop.index}"><c:out value="${room.getName()}"/></option>
                                </c:forEach>
                            </select>
                        </td>
                    </c:if>

                    <td class="activeUser">
                        <c:out value="${reservation.getStatus()}"/> <i class="fas fa-angle-down"></i></td>

                    <c:choose>
                        <c:when test="${reservation.getStatus().equals('PENDING')}">
                            <td>
                                <button class="yes-button blur-hover" type="submit">&#10004;</button>
                                <button class="no-button blur-hover"> &#10006;</button>

                            </td>
                        </c:when>
                        <c:otherwise>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                </form>
            </tr>
        </c:forEach>


    </table>
</div>
<form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value=<fmt:message key="cabinet.logout"/>>
</form>
</body>
</html>
