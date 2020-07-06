<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="contebt-type" content="text/html;">
 
    <title>game 게시판</title> <!-- css path MODIFYME -->
    <link rel="stylesheet" href="css/BoardStyle.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
   
    
   
</head>

<body>
 

	<%
	String sessionId = (String)session.getAttribute("sessionId");
	
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/bizmooc");
	Connection conn = ds.getConnection();
	PreparedStatement ps = conn.prepareStatement("SELECT * FROM board ");
	ResultSet rs = ps.executeQuery();
	
	
	ArrayList<board> pI = new ArrayList<board>();
	
	board bbs = new board();
	while (rs.next()) {
		pI.add(new board(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6)));
		
	}
	rs.close(); ps.close();	conn.close(); ic.close();
	
%>


<jsp:include page="../header.jsp"/> 
<div class=container>
   <div class="board_list_wrap">
    <table class="board_list">
        <caption class="table_caption">game 게시판</caption>
        <thead>
            <tr class="border_tr">
                <th>번호</th>
                <th >제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>조회</th>
            </tr>
        </thead>
        <tbody>
        	<c:set var="list" value="<%=pI%>" />
        	<c:forEach var="item" items="${list }" >
	            <tr>
	                <td>${item.id }</td>
	                
	                <td class="tit" class="myrow" onClick="document.location='boardDetail.jsp?id=${item.id}'">${item.title}
	                </td>
	                
	                <td>${item.writer}</td>
	                
	                <td>${item.regdate}</td>
	                
	                <td>${item.num_check}</td>
	              
	            </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="paging">
        <a href="#" class="bt">첫 페이지</a>
        <a href="#" class="bt">이전 페이지</a>
        <a href="#" class="num on">1</a>
        <a href="#" class="num">2</a>
        <a href="#" class="num">3</a> 
        <a href="#" class="bt">다음 페이지</a>
        <a href="#" class="bt">마지막 페이지</a>
        <input type="button" name="write_button" ><a href="board_insert.jsp" class="btn_write">글쓰기</a>
    </div>
</div>
</div>
  
<jsp:include page="../footer.jsp"/>
</body>
</html>