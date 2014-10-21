<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/startstop"
                   user="root"  password=""/>

<%-- 
    Document   : index
    Created on : Oct 20, 2014, 6:06:02 PM
    Author     : Sabina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StartStop</title>
    </head>
    <body>
        <h2>StartStop Note Taker</h2>
        <sql:query var="result">
            SELECT id, name, start from sessions
        </sql:query>
        <p><strong>Session notes</strong></p>
        <ol>
            <c:forEach var="row" items="${result.rowsByIndex}">
                <li><a href="sessions/show.jsp?id=${row[0]}"><c:out value="${row[1]}" /></a></li>
                </c:forEach>
        </ol>
        <a href="../sessions/new.jsp">Start new session note</a>
    </body>
</html>