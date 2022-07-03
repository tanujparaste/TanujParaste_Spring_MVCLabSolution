<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form</title>
<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />"></link>
</head>
<body>
	<div class="content">
		<header>
			<nav>
				<a href="${pageContext.request.contextPath}">🏠 HOME</a>
			</nav>
		</header>
		<div class="student-form">
			<h1>New Student Registration</h1>
			<p>Please fill the details below.</p>
			<form action="save" method="post">
				<input type="hidden" name="id" value="${student.id}" /> <label
					for="name">Name:</label> <input type="text" name="name" id="name"
					value="${student.name}" /> <br /> <label for="department">Department:</label>
				<input type="text" name="department" id="department"
					value="${student.department}" /> <br /> <label for="country">Country:</label>
				<input type="text" name="country" value="${student.country}" /> <br />
				<button class="btn-register">Register</button>
			</form>
			<p>
				<a href="${pageContext.request.contextPath}/student/list">See
					student list</a>
			</p>
		</div>
	</div>
</body>
</html>