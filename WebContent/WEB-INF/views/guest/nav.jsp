<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">GROUPWARE</a>
<input class="form-control form-control-dark w-75" type="text"
	placeholder="Search" aria-label="Search">
<ul class="nav-item" style="color: white;">
	<small>${user.NAME }님 ,
	${user.DNAME}/${user.PNAME}</small>
</ul>
<ul class="navbar-nav px-3">
	<a href="${pageContext.servletContext.contextPath }/logout.do">
	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
	</a>
</ul>
