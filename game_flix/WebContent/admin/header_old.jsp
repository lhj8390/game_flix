<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
<link rel="stylesheet" href="${contextPath}/admin/css/header_old.css">
</head>
<body>
<div id="headerbody">
<nav id="topMenu">
                <ul>
                    <li><a class="title">GAMEFLIX-ADMIN</a></li>
                    <li><a class="menuLink" 
                    href="${contextPath}/admin/gameContent/gameContent.jsp">홈</a></li>
                    <li><a class="menuLink" 
                    href="${contextPath}/admin/gameContent/gameContent.jsp">컨텐츠 관리</a></li>
                    <li><a class="menuLink" href="#">유저 관리</a></li>
                    
                </ul>
            </nav>
            <nav id="userMenu">
                <ul>
                    <c:choose>
                    <c:when test="${empty adminId}">
                    <li><a class="userLink" 
                    href="${contextPath}/admin/member/loginResult.jsp">Login</a></li>
                    </c:when>
                    <c:otherwise>
                    <li>${adminId}님</li>
                    <li><a class="userLink" 
                    href="${contextPath}/admin/member/logout.jsp">Logout</a></li>
                    </c:otherwise>
                    </c:choose>
                    
                    

                </ul>
            </nav>
            </div>
</body>
</html>