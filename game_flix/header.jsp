<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<link rel="stylesheet" href="${contextPath}/css/header.css">
<title>HEADER | HOME</title>
</head>
<body>
<% String sessionId = (String)session.getAttribute("sessionId");%>

	<div id="wrapper">
		<header>
			<nav id="topMenu">
				<ul>
					<c:choose>
					<c:when test="${empty sessionId}">
					<li><a class="title" href="${contextPath}/index.html">GAMEFLIX</a></li>
					</c:when>
					<c:otherwise>
					<li><a class="title" href="${contextPath}/main.jsp">GAMEFLIX</a></li>
					<li><a class="menuLink" href="${contextPath}/main.jsp">Home</a></li>
					<li><a class="menuLink" href="${contextPath}/category/modal.jsp">Category</a></li>
					<li><a class="menuLink" href="${contextPath}/board/board2.jsp">Notice</a></li>
					<li><a class="menuLink" href="${contextPath}/like/like.jsp">ILike</a></li>
					</c:otherwise>
					</c:choose>					
				</ul>
			</nav>
			<nav id="userMenu">
				<ul>
					<c:choose>
						<c:when test="${empty sessionId}">
							<li><a class="userLink" href="${contextPath}/login.jsp">로그인</a></li>
							<li><a class="userLink" href="${contextPath}/member.jsp">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li class="userLink">[<%=sessionId%>님]
							</li>							
							<li><a class="userLink" href="${contextPath}/member_account.jsp">회원정보</a></li>
							<li><a class="userLink" href="${contextPath}/logout.jsp">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</header>
	</div>
	
</body>
</html>