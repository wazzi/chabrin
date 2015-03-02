<%-- 
    Document   : properties
    Created on : Feb 21, 2015, 9:07:05 AM
    Author     : kelli
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chabrin Properties Ltd</title>
        <link href="css/branding.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="banner.html" %>      
        <%@include file="menu.html" %>      
        <!--populate the table with results from the database-->
        <div class="search">
            <!--search form-->
            <form action="search" method="POST">
            <select name="selector_box">
                <option value="prop_id">ID</option>
                <option value="_type">Type</option>
                <option value="price">Price</option>
                <option value="location" selected>Location</option>
                <option value="email" selected>Email</option>
                <option value="phone" selected>Phone</option>
            </select>
                <input type="text" class="author_txfield" name="tx_target" id="txtarget"/>
            <input type="submit" class="btns-smaller" value="Search"/>
        </form>
        </div>
        <table class="marked-table">
            <tr style="background: #9999ff; font-weight: bolder; text-align: center;"><td>ID</td><td>Location</td>
                <td>Price </td><td>Email</td><td>Type </td><td>Phone</td></tr>
        <c:forEach  items="${properties}" var="current">
            <tr>
                <td ><c:out value="${current.propertyID}"></c:out></td>
                <td ><c:out value="${current.location}"></c:out></td>
                <td ><c:out value="${current.type}"></c:out></td>
                <td ><c:out value="${current.price}"></c:out></td>
                <td ><c:out value="${current.email}"></c:out></td>
                <td ><c:out value="${current.phone}"></c:out></td>
            </tr>
                </c:forEach>
        </table>
            
    </body>
</html>
