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
    <link href="../css/select2.min.css" rel="stylesheet" media="all">
    
    <!-- Main CSS-->
    <link href="../css/gameContentInsert.css" rel="stylesheet" media="all">
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>

    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">컨텐츠 등록</h2>
                </div>
                <div class="card-body">
                    <form method="POST" action="gameContentInsertPro.jsp">
                        <div class="form-row">
                            <div class="name">TITLE</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="title">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">DESCRIPTION</div>
                            <div class="value">
                                <div class="input-group">
                                    
                                    <textarea class="input--style-5" rows="6" name="description"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">IMAGE LINK</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="imageLink">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">VIDEO LINK</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="videoLink">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">DOWNLOAD LINK</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="downloadLink">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">CATEGORY</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="category">
                                            <option disabled="disabled" selected="selected">Choose option</option>
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
                            <button class="btn btn--radius-2 btn--red" type="submit">Register</button>
                            <button class="btn btn--radius-2 btn--red" type="button" onclick="location.href='gameContent.jsp'">List</button>
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