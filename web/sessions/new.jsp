<%-- 
    Document   : new
    Created on : Oct 20, 2014, 6:23:17 PM
    Author     : Sabina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootswatch/3.2.0/superhero/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StartStop add session</title>
    </head>
    <body>
        <div class="container">
            <h2>Name your new session</h2>
            <!-- TODO add servlet -->
            <form action="create.jsp" method="post">
                <table border="0">
                    <tr>
                        <td><textarea name="name" rows="1" cols="20"></textarea></td>
                    </tr>
                </table>
                <div>
                    <input type="reset" value="Reset" /><input type="submit" value="Start session" />
                </div>
            </form>
            <br>
            <p><a href="../index.jsp">Go back</a></p>
        </div>
    </body>
</html>
