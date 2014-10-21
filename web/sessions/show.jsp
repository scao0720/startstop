<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/startstop"
                   user="root"  password=""/>

<%-- 
    Document   : show
    Created on : Oct 20, 2014, 6:22:58 PM
    Author     : Sabina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StartStop Session #${param.id}</title>
    </head>
    <body>
        <h2>Session #${param.id}</h2>
        <sql:query var="result">
            SELECT id, body, created from bullets where session_id = ${param.id}
        </sql:query>
        <p><strong>Notes</strong></p>
        <ul>
            <c:forEach var="row" items="${result.rowsByIndex}">
                <li><c:out value="${row[1]}" /></li>
                </c:forEach>
        </ul>
<p><a href="../index.jsp">Go back</a></p>
    </body>
</html>
