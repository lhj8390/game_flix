<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/boardContent.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>
<%
InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
ArrayList<board> boardList = new ArrayList<board>();

try{
	ic = new InitialContext();
	ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	ps = conn.prepareStatement("SELECT * FROM board");
	rs = ps.executeQuery();
	
	while(rs.next()){
		boardList.add(new board(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6)));
		
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
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="limiter">
		<div class="container">
			<div class="wrap">
				<div class="table">
					<table>
						<thead>
							<tr class="table_head">
								<th class="column1">ID</th>
								<th class="column2">TITLE</th>
								<th class="column3">WRITER</th>
								<th class="column4">UPDATE</th>
								<th class="column5">ACTIVE</th>
                                
							</tr>
						</thead>
						<tbody>
								
								<c:set var="boardList" value="<%=boardList%>" />
								<c:forEach var="item" items="${boardList}">
								<tr class="myrow">
									<td class="column1">${item.id}</td>
									<td class="column2">
									<p onclick="document.location='boardContentDetail.jsp?id=${item.id}'">${item.title}</p></td>
									<td class="column3">${item.writer}</td>
									<td class="column4">${item.regdate}</td>
                                    <td class="column5">
                                        <button><i class="fa fa-arrows" aria-hidden="true"></i></button>
                                        <button onclick="document.location='boardContentUpdate.jsp?id=${item.id}'">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </button>
                                        <button onclick="deleteConfirm(${item.id})">
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
								</tr>
								</c:forEach>
						</tbody>
					</table>
				</div>
				
				<button class="insert" onclick="location.href='boardContentInsert.jsp'">추가</button>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
function deleteConfirm(id) {
	if(confirm("해당 컨텐츠를 삭제하시겠습니까?")){
		location.href="boardContentDelete.jsp?id="+id;
	}
	else{
		location.reload();
	}
	
}
</script>
</html>