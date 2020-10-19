<%@page import="board.board"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>컨텐츠 추가</title>

    <!-- Icons font CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- drop box-->
    <link href="../css/select2.min.css" rel="stylesheet" media="all">
    
    <!-- Main CSS-->
    <link href="../css/gameContentInsert.css" rel="stylesheet" media="all">
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
board selected = new board();

try{
	ic = new InitialContext();
	ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	ps = conn.prepareStatement("SELECT * FROM board where id=?");
	ps.setInt(1, Integer.parseInt(id));
	rs = ps.executeQuery();
	
	while(rs.next()){
		selected = new board(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),
				rs.getString(5),rs.getString(6));
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
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">게시판 수정</h2>
                </div>
                <div class="card-body">
                    <form method="POST" action="boardContentUpdatePro.jsp">
                    <input name="id" value="${selected.id}" hidden="hidden">
                        <div class="form-row">
                            <div class="name">TITLE</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="title" value="${selected.title}">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">CONTENTS</div>
                            <div class="value">
                                <div class="input-group">
                                    
                                    <textarea class="input--style-5" rows="6" name="description">${selected.description}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">CATEGORY</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="num_check">
                                            <option disabled="disabled" selected="selected">${selected.num_check}</option>
                                            <option>액션</option>
                                            <option>인디</option>
                                            <option>전략</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="buttons">
                            <button class="btn btn--radius-2 btn--red" type="submit">UPDATE</button>
                            <button class="btn btn--radius-2 btn--red" type="button" onclick="location.href='boardContent.jsp'">Back</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="../js/jquery_insert.min.js"></script>
    <!-- Vendor JS-->
    <script src="../js/select2.min.js"></script>
    
    <!-- Main JS-->
    <script src="../js/global_insert.js"></script>

</body>

</html>