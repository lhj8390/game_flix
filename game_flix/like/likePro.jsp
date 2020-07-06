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
String contentId = request.getParameter("id");
String sessionId = (String)session.getAttribute("sessionId");
String msg = request.getParameter("msg");

if(sessionId==null){
	out.println("<script>alert('로그인해 주세요');history.back();</script>");
}
boolean checkData = false;
InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
try {
	ic = new InitialContext();
	ds = (DataSource) ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	
	ps = conn.prepareStatement("select * from likecontent");
	rs = ps.executeQuery();

	while (rs.next()) {
		if(rs.getString(1).equals(sessionId)&&rs.getInt(2)==Integer.parseInt(contentId)){
			checkData=true;
		}
	}
	if(checkData){
		ps = conn.prepareStatement("delete from likecontent where userid=? and contentid=?");
		ps.setString(1, sessionId);
		ps.setInt(2, Integer.parseInt(contentId));
		ps.executeUpdate();
	}
	else{
		ps = conn.prepareStatement("insert into likecontent values(?,?)");
		ps.setString(1, sessionId);
		ps.setInt(2, Integer.parseInt(contentId));
		ps.executeUpdate();
	}
	


} catch (Exception e) {
} finally {
	if (rs != null)
		try {
	rs.close();
		} catch (Exception ex) {
		}
	if (ps != null)
		try {
	ps.close();
		} catch (Exception ex) {
		}
	if (conn != null)
		try {
	conn.close();
		} catch (Exception ex) {
		}
	if (ic != null)
		try {
	ic.close();
		} catch (Exception ex) {
		}
}
if(msg.equals("1")){
	response.sendRedirect("../main.jsp");
}
else if(msg.equals("2")){
	response.sendRedirect("like.jsp");
}

%>
</body>
</html>