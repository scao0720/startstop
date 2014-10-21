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
        <link href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/superhero/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StartStop</title>
    </head>
    <body>
        <div class="container">
            <h2>StartStop Note Taker</h2>
            <sql:query var="result">
                SELECT id, name, cast(start as date) from sessions
            </sql:query>
            <p><strong>Session notes</strong></p>
            <ol>
                <c:forEach var="row" items="${result.rowsByIndex}">
                    <li><c:out value="${row[2]}" />: <a href="sessions/show.jsp?id=${row[0]}"><c:out value="${row[1]}" /></a></li>
                    </c:forEach>
            </ol>
            <a href="sessions/new.jsp">Start new session note</a>
        </div>
    </body>
</html>