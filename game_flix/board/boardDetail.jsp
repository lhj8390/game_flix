<%@page import="board.board"%>
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
<title>game 게시판 글</title>
<link href="../css/gameContentDetail.css" rel="stylesheet" media="all">
<link href="css/insert.css" rel="stylesheet" media="all">
<!-- Icons font CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- drop box-->
    <link href="css/select2.min.css" rel="stylesheet" media="all">
    
  
</head>
<body>
<jsp:include page="../header.jsp"/>
<%

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
		//디비에서 불러온 데이터를 작성하기 위해 필요한 데이터가 들어있는 완전한 board 객체가 필요하므로 board 객체를 생성한것이다. 그래야 form에 있는 이름,넘버 등등 값을 채울 수있다.
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


<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">게시글</h2>
                </div>
                <div class="card-body">
                    <form action="boardDetailPro.jsp" method="POST">
                    <input type="text" name="id" value="${selected.id}" hidden>
                        <div class="form-row">
                            <div class="name">제목</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" name="title" value="${selected.title}">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">내용</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="input--style-5" rows="5" name="description" >${selected.description}
                                    </textarea>
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
                                            <option>레이싱</option>
                                            <option>롤플레잉</option>
                                            <option>스포츠</option>
                                            <option>시뮬레이션</option>
                                            <option>액션</option>
                                            <option>어드벤쳐</option>
                                            <option>인디</option>
                                            <option>전략</option>
                                            <option>캐주얼</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                      <button class="btn btn--radius-2 btn--red" type="submit">수정</button>
                      <button  type="button" class="btn btn--radius-2 btn--red" onclick="location.href='board2.jsp'">돌아가기</button>
                      <button type="button" class="btn btn--radius-2 btn--red" onclick="deleteConfirm(${selected.id})">글삭제</button>  
                    </form>
                    		
                            
                      
                  
                </div>
            </div>
        </div>
    </div> 
    <jsp:include page="../footer.jsp"/>
</body>


<script type="text/javascript">
function deleteConfirm(id){
	if(confirm("해당 컨텐츠를 삭제하시겠습니까?")){
		location.href="boardDeletePro.jsp?id="+id;
	}else{
		location.reload();
	}
}
</script>

<!-- Jquery JS-->
    <script src="js/jquery_insert.min.js"></script>
    <!-- Vendor JS-->
    <script src="js/select2.min.js"></script>
    
    <!-- Main JS-->
    <script src="js/global_insert.js"></script>



</html>