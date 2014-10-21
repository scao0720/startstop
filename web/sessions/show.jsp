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
        <link href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/superhero/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StartStop Session #${param.id}</title>
    </head>
    <body>
        <div class="container">
            <sql:query var="result">
                SELECT cast(start as date), cast(start as time), cast(stop as time) from sessions where id = ${param.id}
            </sql:query>
            <h2>Session #${param.id} </h2>

            <p>${result.rowsByIndex[0][0]}</p>
            <ul class="list-inline">
                <li>Start: ${result.rowsByIndex[0][1]}</li>
                <li>Stop: ${result.rowsByIndex[0][2]}</li>
            </ul>
            <strong>Add notes</strong>
            <form action="update.jsp" method="post">
                <input type="hidden" name="session_id" value="${param.id}"/>
                <table border="0">
                    <tr>
                        <td><textarea name="body" rows="1" cols="20"></textarea></td>
                    </tr>
                </table>
                <div>
                    <input type="reset" value="Reset" /><input type="submit" value="Submit" />
                </div>
            </form>
                <br>
            <c:if test="${result.rowsByIndex[0][2] == null}">
                <form action="finish.jsp" method="post">
                    <input type="hidden" name="id" value="${param.id}"/>
                    <input type="submit" value="Stop session" />
                </form>
            </c:if>
            <!--Bullet stuff -->
            <sql:query var="result">
                SELECT body, cast(created as time) from bullets where session_id = ${param.id}
            </sql:query>
            <br>
            <dl class="dl-horizontal">
                <c:forEach var="row" items="${result.rowsByIndex}">
                    <dt><b><c:out value="${row[1]}" />:</b></dt>
                    <dd><c:out value="${row[0]}" /></dd>
                </c:forEach>
            </dl>
            <a href="../index.jsp">Go back</a> | <a href="confirm.jsp?id=${param.id}">Delete session</a>
        </div>
    </body>
</html>

