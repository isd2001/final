<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">GROUPWARE</h1>
	<!--  <div class="btn-toolbar mb-2 mb-md-0">
		<div class="btn-group mr-2">
			<button class="btn btn-sm btn-outline-secondary">${sessionScope.user.NAME }</button>
			<button class="btn btn-sm btn-outline-secondary">${sessionScope.user.DNAME }
				${sessionScope.user.PNAME }</button>
		</div>
		<button class="btn btn-sm btn-outline-secondary dropdown-toggle">
			<span data-feather="calendar"></span> ${sessionScope.userId }
		</button>
	</div>-->
</div>

<h4>Change Password</h4>
<form
	action="${pageContext.servletContext.contextPath }/private/modify.do"
	method="post">
	<div class="form-group row">
		<label for="opass" class="col-sm-2 col-form-label">Old
			Password</label>
		<div class="col-sm-8">
			<input type="password" class="form-control" name="opass" id="opass" />
		</div>
	</div>
	<div class="form-group row">
		<label for="npass" class="col-sm-2 col-form-label">New
			Password(*)</label>
		<div class="col-sm-8">
			<input type="password" class="form-control" name="npass" id="npass" />
		</div>
	</div>
	<div class="form-group row">
		<label for="npassC" class="col-sm-2 col-form-label">Password
			Confirm(*)</label>
		<div class="col-sm-8">
			<input type="password" class="form-control" name="npassC" id="npassC" />
		</div>
	</div>
	<hr />
	<p></p>
	<button type="submit" class="btn btn-primary" disabled="disabled"
		id="result">Submit</button>

	<script>
		document.getElementById("npassC").onchange = function() {
			document.getElementsByTagName("p")[0].innerHTML ="";
			var p1 = document.getElementById("npass").value;
			var p2 = document.getElementById("npassC").value;
			console.log(p1);
			console.log(p2);
			var html = "";
			if (p1 != p2) {
				html += "<div class=\"alert alert-danger\" role=\"alert\">";
				html += "수정한 비밀번호가 맞지 않습니다."
				html += "</div>";
				document.getElementById("result").disabled = true;
			} else {
				html += "<div class=\"alert alert-primary\" role=\"alert\">";
				html += "비밀번호 변경이 가능합니다."
				html += "</div>";
				document.getElementById("result").disabled = false;
			}
			document.getElementsByTagName("p")[0].innerHTML += html;
			
		}//end function
	</script>

</form>
