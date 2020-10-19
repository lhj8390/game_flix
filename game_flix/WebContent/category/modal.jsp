<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="../css/modal.css" rel="stylesheet">
<style>
body{
background-color: black;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div id="myModal" class="modal modal-center fade" role="dialog">
		<div class="modal-dialog modal-center">
			<!-- Modal content-->
			<div class="modal-content">
				<form id="modalForm" action="genre.jsp">
					<div class="modal-header">
						<div class="modal-title">
							<h2>장르 선택</h2>
						</div>
					</div>
					<div class="modal-body">

						<div class="container">

							<div class="col-md-5">
								<div class="funkyradio">
									<div class="funkyradio-danger">
										<input type="radio" name="select" id="radio1" value="전략"
											checked /> <label for="radio1">전략</label>
									</div>
									<div class="funkyradio-danger">
										<input type="radio" name="select" id="radio2" value="인디" /> <label
											for="radio2">인디</label>
									</div>
									<div class="funkyradio-danger">
										<input type="radio" name="select" id="radio3" value="액션" /> <label
											for="radio3">액션</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" id="sendButton" type="submit">저장</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</body>
<script type="text/javascript">
$(window).load(function(){        
	   $('#myModal').modal({backdrop: 'static', keyboard: false});
	    });
	   
$(function(){
    $('#sendButton').submit(function(e){
      e.preventDefault();
      $('#myModal').modal('hide')
      
    });
});
</script>
</html>