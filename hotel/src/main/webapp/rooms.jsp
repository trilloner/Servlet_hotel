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
    <title><fmt:message key="rooms.title"/></title>
    <link href="/styles/main.css" rel="stylesheet" type="text/css">


</head>
<body style="'background-color: #f3efe8;'">
<header>
    <nav class="top-menu">
        <ul class="menu-main">
            <li class="left-item"><a href="${pageContext.request.contextPath}/rooms?lang=en">EN</a></li>
            <li class="left-item"><a href="${pageContext.request.contextPath}/rooms?lang=ru">RU</a></li>
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

    <div class="right-block">
        <div class="left-block">
            <a href="${pageContext.request.contextPath}/rooms?field=price&direction=asc"><fmt:message
                    key="rooms.price.asc"/></a>
            <a href="${pageContext.request.contextPath}/rooms?field=price&direction=desc"><fmt:message
                    key="rooms.price.desc"/></a>
            <a href="${pageContext.request.contextPath}/rooms?field=number_of_seats&direction=asc"><fmt:message
                    key="rooms.guests.asc"/></a>
            <a href="${pageContext.request.contextPath}/rooms?field=number_of_seats&direction=desc"><fmt:message
                    key="rooms.guests.desc"/></a>
        </div>
        <div style="'display: flex; flex-flow: column nowrap; padding-top: 50px;'">
            <c:forEach items="${rooms}" var="room">
                <div class="card-side img-room">
                    <div style="'width: 25%;'">
<%--                        <img src="${pageContext.request.contextPath}/img/room.jpg" alt="No">--%>

                    </div>
                    <div class="card-content">
                        <div class="text-content">
                            <h3 id="card-title"><c:out value="${room.getName()}"/></h3>
                            <h4 class="price-title">Class: <c:out value="${room.getApartment()}"/></h4>
                            <h4 class="price-title">Price: <c:out value="${room.getPrice()}"/></h4>
                            <h4 class="price-title">Number of seats: <c:out value="${room.getNumberOfSeats()}"/></h4>
                            <h4 class="price-title">Status : <c:out value="${room.getState()}"/></h4>
                        </div>
                        <div class="booking-btn">
                            <button><fmt:message key="rooms.booking"/></button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="col-sm-1">
            <c:choose>
                <c:when test="${page == 1}"><fmt:message key="rooms.prev"/> </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/rooms?field=${field}&direction=${direction}&page=${page-1}"><fmt:message
                            key="rooms.prev"/></a>
                </c:otherwise>
            </c:choose>


            <c:choose>
                <c:when test="${page == maxPage}"><fmt:message key="rooms.next"/></c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/rooms?field=${field}&direction=${direction}&page=${page+1}"><fmt:message
                            key="rooms.next"/></a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>
</body>

</html>
