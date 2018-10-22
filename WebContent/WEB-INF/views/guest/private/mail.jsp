<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">GROUPWARE</h1>
	
</div>

<h4>Mail</h4>

<form action="${pageContext.servletContext.contextPath }/private/mail.do" method="post" >
<button type="submit">메일 쓰기</button>
</form>



<c:forEach var="m" items="${mail }">
	${m.sender } ${m.content }  ${m.senddate }
	
	



</c:forEach>