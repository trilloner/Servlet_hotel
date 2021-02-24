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
    <title>Cabinet</title>
    <style>
        <%@include file="styles/login.css" %>
    </style>
</head>
<body style="'background-color: #f3efe8;'">
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <li class="left-item"><a href="?lang=en">EN</a></li>
            <li class="left-item"><a href="lang=ru">RU</a></li>
            <li class="right-item"><a href="/rooms"> <fmt:message key="main.menu.rooms"/></a></li>
            <li class="right-item"><a href="/cabinet"> <fmt:message key="main.menu.cabinet"/></a></li>
            <li class="right-item"><a href="/order"> <fmt:message key="main.menu.book"/></a></li>
        </ul>
    </nav>
</header>
<div class="container">
    <section class="filterBar">
        <div class="search-ui">
            <label for="search">Search</label>
            <div class="search-container">
                <form action="">
                    <input class="search-input" type="text" placeholder="Search by user name or email address..."
                           name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
        <div class="filter-ui">
            <label for="filters">Show me</label>
            <div class="styled-select">
                <select name="accountStatus" id="filters">
                    <option value="active">Everyone</option>
                    <optgroup label="Audience">
                        <option value="commenters">Commenters</option>
                    </optgroup>
                    <optgroup label="Organization">
                        <option value="admins">Admins</option>
                        <option value="moderators">Moderators</option>
                        <option value="banned">Staff</option>
                    </optgroup>
                </select>
            </div>
        </div>
    </section>

    <table>
        <tr class="table-header">
            <th>Username</th>
            <th>Check in</th>
            <th>Check out</th>
            <th class="roleHead">Number of guests</th>
            <th class="statusHead">Room</th>
            <th class="statusHead">Status</th>
            <th class="statusHead">Payment</th>
        </tr>
        <tr>
            <c:forEach var="reservation" items="${reservations}">
                <td class="username"><c:out value="${reservation.getId()}"/></td>
                <td><c:out value="${reservation.getCheckIn()}"/></td>
                <td><c:out value="${reservation.getCheckOut()}"/></td>
                <td class="commenter"><i class="fas fa-angle-down"> <c:out
                        value="${reservation.getNumberOfSeats()}"/> </i></td>

                <c:choose>
                    <c:when test="${reservation.getRoomId() != null}">
                        <
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
                <th>
                <c:choose>
                    <c:when test="${reservation.getStatus().equals('CONFIRMED')}">
                        <td><a>Accept</a></td>
                    </c:when>
                    <c:otherwise>
                        <td></td>
                    </c:otherwise>
                </c:choose>
                </th>
            </c:forEach>

            <%--            <th:block th:if="${reservation.getRoomId()}">--%>
            <%--                <td class="commenter" th:text="${reservation.getRoomId().getName()}"><i class="fas fa-angle-down"></i>--%>
            <%--                </td>--%>
            <%--            </th:block>--%>
            <%--            <th:block th:unless="${reservation.getRoomId()}">--%>
            <%--                <td class="commenter"><i class="fas fa-angle-down"></i></td>--%>
            <%--            </th:block>--%>
            <%--            <td class="activeUser" th:text="${reservation.getStatus()}"><i class="fas fa-angle-down"></i></td>--%>
            <%--            <th:block th:switch="${reservation.getStatus()}">--%>
            <%--                <td th:case="${reservation.getStatus().CONFIRMED}"><a>Accept</a></td>--%>
            <%--                <td th:case="*"></td>--%>
            <%--            </th:block>--%>
        </tr>
    </table>
</div>
<form action="/logout" method="post">
    <input type="submit" value="LOG OUT">
</form>
</body>
</html>
