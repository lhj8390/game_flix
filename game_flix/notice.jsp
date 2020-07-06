<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/notice.css">
<title>Notice</title>
</head>
<body>
<jsp:include page="header.jsp"/>        
        <table class="table">
            <caption>
                <h2>공지사항</h2>
            </caption>
            
            <thead>
                
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>날짜</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>1</th>
                    <td><b>[공지사항]</b> 테스트 공지 입니다.</td>
                    <th>2020-06-28</th>
                    <th>1</th>
                </tr>
            </tbody>
        </table>
        <div class="modify">
            <button>글쓰기</button>
            <button>수정</button>
            <button>삭제</button>
        </div>
        
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">&raquo;</a>
        </div>
 <jsp:include page="footer.jsp"/>
</body>
</html>