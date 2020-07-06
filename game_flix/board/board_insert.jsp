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
    <!-- 드롭박스 --> 
    <link href="css/select2.min.css" rel="stylesheet" media="all">
    
    <!-- Main CSS--> 
    <link href="css/insert.css" rel="stylesheet" media="all">
</head>
<body>
<jsp:include page="../header.jsp"/>
	<%String sessionId = (String)session.getAttribute("sessionId");%>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">글쓰기</h2>
                </div>
                <div class="card-body">
                    <form action="boardPro.jsp" method="post">
                        <div class="form-row">
                            <div class="name">제목</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="title">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">내용</div>
                            <div class="value">
                                <div class="input-group">
                                    
                                    <textarea class="input--style-5" rows="4" name="description"></textarea>
                                </div>
                            </div>
                        </div>
                       
                        
                        <div class="form-row">
                            <div class="name">CATEGORY</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="num_check">
                                            <option disabled="disabled" selected="selected">Choose option</option>
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
                      
                        <div class="button_submit">
                            <button class="btn btn--radius-2 btn--red" type="submit" > 보내기</button>
                            <button class="btn btn--radius-2 btn--red" type="reset" >내용 삭제</button>
                            <button class="btn btn--radius-2 btn--red" onclick="board2.jsp" >돌아가기</button>
                        </div>
                    </form>
                   
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <!-- MODIFYME -->
    <script src="js/jquery_insert.min.js"></script>
    <!-- Vendor JS-->
    <script src="js/select2.min.js"></script>
    
    <!-- Main JS-->
    <script src="js/global_insert.js"></script>
<jsp:include page="../footer.jsp"/>	
</body>

</html>