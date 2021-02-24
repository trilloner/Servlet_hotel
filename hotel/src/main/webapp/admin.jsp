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
    <title>Title</title>
    <style>
        <%@include file="styles/login.css" %>
    </style>
</head>
<body style="'background-color: #f3efe8;'">
<header>

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

            <th>Email Address</th>
            <th>Check in</th>
            <th>Check out</th>
            <th>Number of guests</th>
            <th>Room</th>
            <th class="statusHead">Status</th>
            <th>Confirmation</th>
        </tr>
        <c:forEach items="${allReservations}" var="reservation">
            <tr>
                <form action="/admin/update?id=${reservation.getId()}" method="post">
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
<form action="/logout" method="post">
    <input type="submit" value="LOG OUT">
</form>
</body>
</html>
