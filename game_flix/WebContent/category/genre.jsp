<%@page import="content.Games"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/genre.css" />
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String value = request.getParameter("select");
request.setAttribute("value", value);
if(value==null)
	value="Game";

InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
ArrayList<Games> gameList = new ArrayList<Games>();
try {
	ic = new InitialContext();
	ds = (DataSource) ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	ps = conn.prepareStatement("SELECT * FROM gamecontent where category=?");
	ps.setString(1, value);
	rs = ps.executeQuery();

	while (rs.next()) {
		gameList.add(new Games(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
		rs.getString(6), rs.getString(7), rs.getDate(8)));

	}

} catch (Exception e) {
	out.println(e);
} finally {
	if (rs != null) try {rs.close();} catch (Exception ex) {}
	if (ps != null)try {ps.close();} catch (Exception ex) {}
	if (conn != null)try {conn.close();} catch (Exception ex) {}
	if (ic != null)try {ic.close();} catch (Exception ex) {}
	}
%>
<jsp:include page="../header.jsp"/>
<table class="gameTable">

		<tr>
			<td><div class="gameLeftText">GAME</td>
			</div>
			<td class="gameText">장르</td>

			<td><div class="selectbox">
					<label class="label" for="select"><%=value %></label> 
					<select id="select" name="select" size="1">
						<option value="액션" <c:if test="${value eq '액션'}"> selected </c:if>>액션</option>
						<option value="인디" <c:if test="${value eq '인디'}"> selected </c:if>>인디</option>
						<option value="전략" <c:if test="${value eq '전략'}"> selected </c:if>>전략</option>
						</select>
						</div>
						</td>
		</tr>
	</table>
<div id="main">
<div class="inner">
<div class="thumbnails">
<c:forEach var="item" items="<%=gameList%>">
<div class="box">
<a href="${item.videoLink}" class="image fit"><img src="${item.imageLink}" alt=""/></a>
<div class="inner">
<h3>${item.title }</h3>
<p>${item.description }</p>
<a href="${item.downloadLink }" class="button fit">download</a>
</div>
</div>
</c:forEach>
</div>
</div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
<script src="../js/jquery.min.js"></script>
<script type="text/javascript">
$("#select").change(function() {
	var data = $(this).val();
	window.open('genre.jsp?select='+data,"_self");
	});

$(document).ready(function() {
	var selectTarget = $('.selectbox select'); 
	selectTarget.change(function(){ 
		var select_name = $(this).children('option:selected').text(); 
		$(this).siblings('label').text(select_name); 
		}); 
	
	});
</script>
</html>