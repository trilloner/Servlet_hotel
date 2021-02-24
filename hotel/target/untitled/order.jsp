<%--
  Created by IntelliJ IDEA.
  User: Bogdan Volokhonenko
  Date: 21.02.2021
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="messages"/>
<html>
<head>
    <title>Create Reservation</title>
    <style>
        <%@include file="styles/login.css" %>
    </style>
    <style>
        <%@include file="styles/register.css" %>
    </style>
</head>
<body>
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
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form class="main-form first" action="/order/create"
                  method="post">
                <h2>Reservation</h2>
                <div class="form-group">
                    <label for="name" class="control-label">Check in</label>
                    <input id="name" class="form-control" type="date"
                           name="checkIn"/>

                </div>
                <div class="form-group">
                    <label for="email" class="control-label">Check out</label>
                    <input id="email" class="form-control" type="date"
                           name="checkOut"/>
                </div>
                <div class="form-group">
                    <label for="password" class="control-label">Number of people</label>
                    <input id="password" class="form-control" type="number"
                           name="numberOfSeats"/>

                </div>
                <div class="form-group">
                    <label for="class" class="control-label">Class</label>
                    <select name="apartments" id="class" class="form-control">
                        <option name="standart" value="standart"> Standart</option>
                        <option name="lux" value="lux">Lux</option>
                        <option name="supelux" value="superlux">SuperLux</option>
                    </select>
                </div>
                <div class="form-group">
                    <button id="button" type="submit" class="btn btn-success">Book now</button>
                </div>


            </form>
        </div>
    </div>
</div>
</body>
</html>
