<%--
  Created by IntelliJ IDEA.
  User: Bogdan Volokhonenko
  Date: 22.02.2021
  Time: 14:06
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
        <%@include file="styles/main.css" %>
    </style>

</head>
<body style="'background-color: #f3efe8;'">
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <li class="left-item"><a href="?lang=en">EN</a></li>
            <li class="left-item"><a href="?lang=ru">RU</a></li>
            <li class="right-item"><a href="/rooms"> <fmt:message key="main.menu.rooms"/></a></li>
            <li class="right-item"><a href="/cabinet"> <fmt:message key="main.menu.cabinet"/></a></li>
            <li class="right-item"><a href="/order"> <fmt:message key="main.menu.book"/></a></li>
        </ul>
    </nav>
</header>
<div class="container">

    <div class="right-block">
        <div class="left-block">
            <a href="/rooms?field=price">Price ASC</a>
            <a href="/rooms/1?field=price&direction=desc">Price DESC</a>
            <a href="/rooms/1?field=numberOfSeats&direction=asc">Guests ASC</a>
            <a href="/rooms/1?field=numberOfSeats&direction=desc">Guests DESC</a>
            <a href="/rooms">Class</a>
        </div>
        <div style="'display: flex; flex-flow: column nowrap; padding-top: 50px;'">
            <c:forEach items="${rooms}" var="room">
                <div class="card-side">
                    <div style="'width: 25%;'">
                        <img src="/img/room.jpg" style="'width: 100%;height: 100%;'">
                    </div>
                    <div class="card-content">
                        <div class="text-content">
                            <h3 id="card-title"><c:out value="${room.getName()}"/></h3>
                            <h4 class="price-title">Class: <c:out value="${room.getApartment()}"/></h4>
                            <h4 class="price-title"><c:out value="${room.getPrice()}"/></h4>
                            <h4 class="price-title">Number of seats: <c:out value="${room.getNumberOfSeats()}"/></h4>
                            <h4 class="price-title">Status : <c:out value="${room.getState()}"/></h4>
                        </div>
                        <div class="booking-btn">
                            <button> Booking</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="col-sm-1">
            <c:choose>
                <c:when test="${page == 1}">Previous </c:when>
                <c:otherwise>
                    <a href="/rooms?field=${field}&page=${page-1}">Previous</a>
                </c:otherwise>
            </c:choose>


            <c:choose>
                <c:when test="${page == maxPage}">Next</c:when>
                <c:otherwise>
                    <a href="/rooms?field=${field}&page=${page+1}">Next</a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>
</body>

</html>
