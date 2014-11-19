<%-- 
    Document   : showby
    Created on : Nov 18, 2014, 7:13:05 PM
    Author     : Sabina
--%>

<h2>Sessions created by ${param.username}</h2>
<table class="table table-condensed" width: auto>
    <thead>
        <tr>
            <th width="auto">Date</th>
            <th>Title</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="session" items="${sessions}">
        <tr>
            <td><fmt:formatDate value="${session.start}" pattern="yyyy-MM-dd" /></td>
            <td><a href="${pageContext.request.contextPath}/show?id=${session.id}"><c:out value="${session.name}" /></a></td>
        </tr>
        </c:forEach>
    </tbody>
</table>