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
String writer = (String)session.getAttribute("adminId");
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
	ps = conn.prepareStatement("insert into board"+
	"(title,description,num_check,writer)" + "values(?,?,?,?)"); 
	ps.setString(1, " [공지사항] "+title);
	ps.setString(2, description);
	ps.setString(3, num_check);
	ps.setString(4, writer);
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