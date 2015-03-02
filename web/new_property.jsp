<%-- 
    Document   : new_property
    Created on : Feb 21, 2015, 9:07:35 AM
    Author     : kelli
--%>

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
        <form action="new_prop" method="POST">
            <table class="unmarked-table">
                <thead><strong>New Property</strong></thead>
            <div style="color: red; font-size: smaller;font-family: sans-serif;"></div>
            <tr class="unmarked-tr"></tr>
            <tr class="unmarked-tr"><td class="unmarked-td">Property ID</td><td class="unmarked-td"><input class="author_txfield" type="text" name="tx_propid" id="txpropid"/></td></tr>
            <tr class="unmarked-tr"><td class="unmarked-td">Location</td><td class="unmarked-td"><input type="text" class="author_txfield"   name="tx_location" id="txlocation"/></td></tr>
            <tr><td class="unmarked-td">Type</td><td class="unmarked-td"> <input class="author_txfield"  type="text" name="tx_type" id="txtype"/></td>
                <td class="unmarked-td">Price&nbsp; &nbsp;<input type="text" class="author_txfield" name="tx_price" id="txprice"/></td></tr>
            <tr><td class="unmarked-td">Email</td><td class="unmarked-td"><input class="author_txfield"  type="email" name="tx_email" id="txemail"/></td>
                <td class="unmarked-td"> Phone   <input type="tel" class="author_txfield"   name="tx_phone" id="txphone"/></td></tr>
                <br>
                <tr class="unmarked-tr"><td class="unmarked-td"></td><td class="unmarked-td"></td><td class="unmarked-td"><br><input class="btns" type="submit" value="Save" name="bt_submit"/></td></tr>
            </table>
        </form>
    </body>
</html>
