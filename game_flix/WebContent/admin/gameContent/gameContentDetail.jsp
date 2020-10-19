<%@page import="content.Games"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/gameContentDetail.css" rel="stylesheet" media="all">
</head>
<body>
<%
String id = request.getParameter("id");
InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
Games selected = new Games();

try{
	ic = new InitialContext();
	ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	ps = conn.prepareStatement("SELECT * FROM gamecontent where id=?");
	ps.setInt(1, Integer.parseInt(id));
	rs = ps.executeQuery();
	
	while(rs.next()){
		selected = new Games(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
				rs.getString(5),rs.getString(6),rs.getString(7),rs.getDate(8));
		request.setAttribute("selected", selected);
	}
			
}catch(Exception e){
	out.println(e);
}finally{
	if(rs!=null)try{rs.close();}catch(Exception ex){}
	if(ps!=null)try{ps.close();}catch(Exception ex){}
	if(conn!=null)try{conn.close();}catch(Exception ex){}
	if(ic!=null)try{ic.close();}catch(Exception ex){}
}
%>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">

        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">상세 정보</h2>
                </div>
                <div class="card-body">
                    <form method="POST" action="gameContentUpdate.jsp">
                    <input type="hidden" name="id" value="<%=id %>"/>
                        <div class="form-row">
                            <div class="name">TITLE</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" name="title" value="${selected.title}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">DESCRIPTION</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="input--style-5" rows="5" name="description" readonly>${selected.description}
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">IMAGE LINK</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" name="imageLink" value="${selected.imageLink}" readonly>
                                </div>
                                
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">VIDEO LINK</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" name="videoLink" value="${selected.videoLink}" readonly>
                                </div>
                                <span class="tooltip">${selected.videoLink}</span>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">DOWNLOAD LINK</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" name="downloadLink" value="${selected.downloadLink}" readonly>
                                </div>
                                <span class="tooltip">${selected.downloadLink}</span>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">CATEGORY</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" name="category" value="${selected.category}" readonly>
                                </div>
                            </div>
                        </div>
                        
                        <div>
                            <button class="btn btn--radius-2 btn--red" type="submit">수정</button>
                            <button class="btn btn--radius-2 btn--red" type="button" onclick="location.href='gameContent.jsp'">목록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>


</html>
