<%-- 
    Document   : index
    Created on : Oct 20, 2014, 6:06:02 PM
    Author     : Sabina
--%>

<h2>StartStop Note Taker</h2>
<p><strong>Session notes</strong></p>
<ol>
    <c:forEach var="session" items="${sessions}">
        <li><strong><fmt:formatDate value="${session.start}" pattern="yyyy-MM-dd" />:</strong> <a href="${pageContext.request.contextPath}/show?id=${session.id}"><c:out value="${session.name}" /></a></li>
    </c:forEach>
</ol>
<a href="${pageContext.request.contextPath}/new">Start new session note</a>