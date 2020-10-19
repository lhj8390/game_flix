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
String id = request.getParameter("id");
String pwd = request.getParameter("password");

InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;

boolean checkID=false;

try{
	ic = new InitialContext();
	ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	ps = conn.prepareStatement("SELECT * FROM adminmembers");
	rs = ps.executeQuery();
	
	while(rs.next()){
		if(id.equals(rs.getString(1))&&pwd.equals(rs.getString(2))){
			session.setAttribute("adminId", rs.getString(1));
			//session.setAttribute("PWD", rs.getString(2));
			checkID=true; 
			
			response.sendRedirect("../gameContent/gameContent.jsp");
		}
		else if(id.equals(rs.getString(1))){
			out.println("<script>alert('비밀번호가 틀렸습니다.');history.back();</script>");
			checkID=true; 
			break;
		}
		
	}
			
}catch(Exception e){
	out.println(e);
}finally{
	if(rs!=null)try{rs.close();}catch(Exception ex){}
	if(ps!=null)try{ps.close();}catch(Exception ex){}
	if(conn!=null)try{conn.close();}catch(Exception ex){}
	if(ic!=null)try{ic.close();}catch(Exception ex){}
}

if(!checkID){
	out.println("<script>alert('등록된 정보가 없습니다.');history.back();</script>");
}
%>
</body>
</html>