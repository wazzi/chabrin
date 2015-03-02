<%-- 
    Document   : search
    Created on : Feb 26, 2015, 6:27:52 PM
    Author     : kelli
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <%@include file="banner.html" %>      
        <%@include file="menu.html" %>
        <link href="css/branding.css" rel="stylesheet" type="text/css"/>
    </head>
   <body>
       <table class="marked-table">
                       <tr style="font-weight: bold; background: #cccccc; text-align: center;"><td>ID</td><td>Location</td>
                <td>Price </td><td>Email</td><td>Type </td><td>Phone</td></tr>

                    
                    <%--<c:out value="${results}"></c:out>--%>
        <c:forEach  items="${results}" var="current">
            <tr>
                <td><c:out value="${current.propertyID}"></c:out></td>
                <td><c:out value="${current.location}"></c:out></td>
                <td><c:out value="${current.type}"></c:out></td>
                <td><c:out value="${current.price}"></c:out></td>
                <td><c:out value="${current.email}"></c:out></td>
                <td><c:out value="${current.phone}"></c:out></td>
            </tr>
                </c:forEach>
        </table>
   </body>
</html>
