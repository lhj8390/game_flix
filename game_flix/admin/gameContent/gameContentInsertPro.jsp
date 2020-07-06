<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String description = request.getParameter("description");
String imageLink = request.getParameter("imageLink");
String videoLink = request.getParameter("videoLink");
String downloadLink = request.getParameter("downloadLink");
String category = request.getParameter("category");

InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
try{
	ic = new InitialContext();
	ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	ps = conn.prepareStatement("insert into gamecontent"+
	"(title,description,imagelink,videolink,downloadlink,category,updatetime)"+
	"values(?,?,?,?,?,?,DEFAULT)");
	ps.setString(1, title);
	ps.setString(2, description);
	ps.setString(3, imageLink);
	ps.setString(4, videoLink);
	ps.setString(5, downloadLink);
	ps.setString(6, category);
	ps.executeUpdate();
			
}catch(Exception e){
	out.println(e);
}finally{
	if(rs!=null)try{rs.close();}catch(Exception ex){}
	if(ps!=null)try{ps.close();}catch(Exception ex){}
	if(conn!=null)try{conn.close();}catch(Exception ex){}
	if(ic!=null)try{ic.close();}catch(Exception ex){}
}

response.sendRedirect("gameContent.jsp");
%>

</body>
</html>