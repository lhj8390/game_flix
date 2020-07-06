<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<link rel="stylesheet" href="${contextPath}/css/footer.css">
</head>
<body>
<footer>
        <table>
            <tr>
                <td><a href="#">유튜브</a></td>
                <td><a href="#">인스타그램</a></td>
                <td><a href="#">트위터</a></td>
                <td><a href="#">유튜브</a></td>
            </tr>
            <tr>
                <td><a href="#">고객센터</a></td>
                <td><a href="#">미디어센터</a></td>
                <td><a href="#">입사정보</a></td>
                <td><a href="#">이용약관</a></td>
            </tr>
            <tr>
                <td><a href="#">개인정보</a></td>
                <td><a href="#">법적 고지</a></td>
                <td><a href="#">쿠키 설정</a></td>
                <td><a href="#">문의하기</a></td>
            </tr>
        </table>

        <p>G A M E F L I X</p>

    </footer>
</body>
</html>