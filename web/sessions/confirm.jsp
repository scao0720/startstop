<%-- 
    Document   : confirm
    Created on : Oct 20, 2014, 10:00:28 PM
    Author     : Sabina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/superhero/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <form action="delete.jsp" method="post">
                <p>Are you sure you want to delete session #${param.id}?</p>
                <input type="submit" value="Yes, delete this session." />
                <input type="hidden" name="id" value="${param.id}"/>
                <p><a href="show.jsp?id=${param.id}">Cancel</a></p>
            </form>
        </div>
    </body>
</html>
