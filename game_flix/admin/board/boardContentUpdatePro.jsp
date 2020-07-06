<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
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
String id = request.getParameter("id");
String title = request.getParameter("title");
String description = request.getParameter("description");
String num_check = request.getParameter("num_check");

InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
try{
	ic = new InitialContext();
	ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	ps = conn.prepareStatement("update board set title=?, description=?, num_check=? where id=?");
	ps.setString(1, title);
	ps.setString(2, description);
	ps.setString(3, num_check);
	ps.setString(4, id);
	ps.executeUpdate();
			
}catch(Exception e){
	out.println(e);
}finally{
	if(rs!=null)try{rs.close();}catch(Exception ex){}
	if(ps!=null)try{ps.close();}catch(Exception ex){}
	if(conn!=null)try{conn.close();}catch(Exception ex){}
	if(ic!=null)try{ic.close();}catch(Exception ex){}
}

response.sendRedirect("boardContent.jsp");
%>
</body>
</html>