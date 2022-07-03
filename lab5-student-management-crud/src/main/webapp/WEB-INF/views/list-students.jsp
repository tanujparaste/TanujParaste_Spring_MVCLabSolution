<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/styles.css" />" />
</head>
<body>
	<div class="content">
		<header>
			<nav>
				<a href="${pageContext.request.contextPath}">🏠 HOME</a>
			</nav>
		</header>
		<h1>Directory - Registered Students</h1>

		<c:choose>
			<c:when test="${empty students}">
				<p>No record found.</p>
			</c:when>
			<c:otherwise>
				<table>
					<thead>
						<tr>
							<th>Student Id</th>
							<th>Name</th>
							<th>Department</th>
							<th>Country</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${students}" var="student">
							<tr>
								<td>${student.id}</td>
								<td>${student.name}</td>
								<td>${student.department}</td>
								<td>${student.country}</td>
								<td class="form-edit-button">
									<!-- update student detail --> <a
									href="update?id=${student.id}">📝Update</a> <!-- delete student -->
									<a href="delete?id=${student.id}">❌Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
		<p>
			<a href="${pageContext.request.contextPath}/student/register">Add
				student</a>
		</p>
	</div>
</body>
</html>