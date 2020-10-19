<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="member" class="member.Members" />
<jsp:setProperty property="*" name="member" />
<meta charset="UTF-8">
<title>Login_Action</title>
</head>
<body>
	<%
	//1. 로그인 페이지에서 파라미터 정보 (ID와 PW정보 취득)
	String id = (String) request.getParameter("id");
	String pw = (String) request.getParameter("pw");	

	//2. SQL 연동 후 MEMBERS 정보 취득 후 일치여부 확인
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM MEMBERS WHERE USERID='" + id + "'");	
	ResultSet rs = pstmt.executeQuery();	
	if (rs.next()) {

		if (id.equals(rs.getString(1)) == true && pw.equals(rs.getString(2)) == true) {
			rs.close();
			session.setAttribute("sessionId", id);
			response.sendRedirect("main.jsp");
		} else if (pw.equals(rs.getString(2)) == false) {
			rs.close();
			out.println("<script> alert(\"비밀번호 불일치\"); history.back();</script>");
		}
	} else {
		rs.close();
		out.println("<script> alert(\"아이디 불일치\"); history.back();</script>");

	}
	rs.close();	pstmt.close(); conn.close(); ic.close();
	%>

</body>
</html>