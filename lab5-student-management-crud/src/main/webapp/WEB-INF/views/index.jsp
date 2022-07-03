<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Portal Home</title>
<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />"></link>
</head>
<body>
	<div class="content">
		<header>
			<nav>
				<a href="${pageContext.request.contextPath}">🏠 HOME</a>
			</nav>
		</header>
		<h1>Student Management Portal</h1>
		<p>
			<a href="${pageContext.request.contextPath}/student/register">Register</a>
			a new student?
		</p>
		<p>
			<a href="${pageContext.request.contextPath}/student/list">See</a> all
			students.
		</p>
	</div>

</body>
</html>