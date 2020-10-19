<%@page import="content.Games"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<meta http-equiv="content-type" content="text/html;">


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<!--이미지 슬라이더 js-->
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!--이미지 슬라이더 js-->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!--음소거 아이콘 관련 js-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!--이미지 슬라이더 css-->

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/main.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Main | Home</title>
<style>
img.item_Picture {
	float: left;
	margin-top: 30px;
}

.mutedButton, .unmutedButton {
	width: 50px;
	height: 50px;
	margin: 0 0;
	line-height: 26px;
	border-radius: 50%;
	border-width: 1px;
	font-size: 30px;
	z-index: 5;
	position: absolute;
	bottom: 30px;
	right: 5px;
}
</style>
</head>
<%
String sessionId = (String)session.getAttribute("sessionId");
InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
ArrayList<Games> gameList = new ArrayList<Games>();//지금 뜨는 콘텐츠 표시할 List
ArrayList<Games> strategyList = new ArrayList<Games>();//전략 콘텐츠 표시할 List
ArrayList<Games> indyList = new ArrayList<Games>();//인디 콘텐츠 표시할 List
ArrayList<Games> actionList = new ArrayList<Games>();//액션 콘텐츠 표시할 List
ArrayList<Integer> likeList = new ArrayList<Integer>();//찜리스트 

try {
	ic = new InitialContext();
	ds = (DataSource) ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	ps = conn.prepareStatement("SELECT * FROM gamecontent");
	rs = ps.executeQuery();

	while (rs.next()) {
		gameList.add(new Games(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
		rs.getString(6), rs.getString(7), rs.getDate(8)));//DB에 저장된 모든 정보들을 리스트에 삽입
		if(rs.getString(7).equals("전략")){//카테고리가 전략인 데이터만 리스트에 삽입
			strategyList.add(new Games(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getDate(8)));
		}
		else if(rs.getString(7).equals("인디")){//카테고리가 인디인 데이터만 리스트에 삽입
			indyList.add(new Games(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getDate(8)));
		}
		else if(rs.getString(7).equals("액션")){//카테고리가 액션인 데이터만 리스트에 삽입
			actionList.add(new Games(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getDate(8)));
		}

	}
	
	ps = conn.prepareStatement("SELECT * FROM likecontent where userid=?");
	ps.setString(1, sessionId);//지금 로그인 중인 유저가 찜한 콘텐츠 찾기
	rs = ps.executeQuery();
	while(rs.next()){
		likeList.add(rs.getInt(2));//리스트에 삽입(콘텐츠 아이디만)
		
	}
	request.setAttribute("likeList", likeList);

} catch (Exception e) {
	out.println(e);
} finally {//DB 닫기
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
%>
<body>
<jsp:include page="header.jsp"/>
	

	<section id="mainPage">
		<div id="main">
			<h1>지금 뜨는 콘텐츠</h1>
			<div class="items">
				<div class="bxslider">
					<!--이미지 슬라이더-->
					<c:forEach var="item" items="<%=gameList%>">
						<img src="${item.imageLink }" width="300" height="150"
							class="item_Picture" onclick="openImg('panel${item.id}')"><!-- 클릭 시 패널 오픈 -->
					</c:forEach>
				</div>

			</div>
			<c:forEach var="item" items="<%=gameList%>"><!-- 반복문으로 리스트안의 값 차례로 뽑아내기 -->
				<div id="panel${item.id }" class="picture" style="display: none;">
					<!--이미지 클릭 시 해당 div 노출-->
					<span onclick="this.parentElement.style.display='none'"
						class="closeButton">&times;</span><!--닫기 버튼-->
						
					<button class="mutedButton" onclick="enableMute('panel${item.id}')"><!-- 음소거 버튼 클릭 시 패널 안의 비디오 찾아내어 음소거 실행 -->
						<!--음소거 버튼-->
						<i class='fas fa-volume-mute'></i>
					</button>
					<button class="unmutedButton"
						onclick="enableMute('panel${item.id}')" style="display: none;">
						<!--음소거 해제 버튼-->
						<i class='fas fa-volume-off'></i>
					</button>
					<div class="explain">
						<div class="explain_data">


							<div class="title">
								<p>${item.title }</p><!-- 리스트 안의 title값  -->
							</div>
							<div class="description">
								<textarea>${item.description}</textarea><!-- 리스트 안의 description값  -->

							</div>
							<div class="buttons">
								<button type="button" class="download"
									onclick="window.open('${item.downloadLink}')">다운로드</button><!-- 리스트 안의 downloadLink값  -->
								<button class="like" name="${item.id}" onclick="location.href='like/likePro.jsp?id=${item.id}&msg=1'"
								style="background-image: url(images/star.png); background-repeat:no-repeat; background-position:center;
								background-size: 20px;"></button><!-- 찜 클릭 시 likePro.jsp 진입하여 DB에 값 삽입/삭제 -->
							</div>
						</div>
						<div class="gradient_video">
							<div class="gradient"></div>
							<!--영상 옆 gradient 처리-->
							<video class="gamevideo" src="${item.videoLink}" autoplay loop
								muted></video><!-- 리스트 안의 videoLink값  -->
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<div id="main">
			<h1>전략</h1><!-- 전략 카테고리->상단과 내용 중복 -->
			<div class="items">
				<div class="bxslider">
					<!--이미지 슬라이더-->
					<c:forEach var="item" items="<%=strategyList%>">
						<img src="${item.imageLink }" width="300" height="150"
							class="item_Picture" onclick="openImg('panels${item.id}')">
					</c:forEach>
				</div>

			</div>
			<c:forEach var="item" items="<%=strategyList%>">
				<div id="panels${item.id }" class="picture" style="display: none;">
					<!--이미지 클릭 시 해당 div 노출-->
					<span onclick="this.parentElement.style.display='none'"
						class="closeButton">&times;</span>
					<!--닫기 버튼-->
					<button class="mutedButton" onclick="enableMute('panel${item.id}')">
						<!--음소거 버튼-->
						<i class='fas fa-volume-mute'></i>
					</button>
					<button class="unmutedButton"
						onclick="enableMute('panel${item.id}')" style="display: none;">
						<!--음소거 해제 버튼-->
						<i class='fas fa-volume-off'></i>
					</button>
					<div class="explain">
						<div class="explain_data">


							<div class="title">
								<p>${item.title }</p>
							</div>
							<div class="description">
								<textarea>${item.description}</textarea>

							</div>
							<div class="buttons">
								<button type="button" class="download"
									onclick="window.open('${item.downloadLink}')">다운로드</button>
								<button class="like" name="${item.id}" onclick="location.href='like/likePro.jsp?id=${item.id}&msg=1'"
								style="background-image: url(images/star.png); background-repeat:no-repeat; background-position:center;
								background-size: 20px;"></button>
							</div>
						</div>
						<div class="gradient_video">
							<div class="gradient"></div>
							<!--영상 옆 gradient 처리-->
							<video class="gamevideo" src="${item.videoLink}" autoplay loop
								muted></video>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<div id="main">
			<h1>인디</h1><!-- 인디 카테고리->상단과 내용 중복 -->
			<div class="items">
				<div class="bxslider">
					<!--이미지 슬라이더-->
					<c:forEach var="item" items="<%=indyList%>">
						<img src="${item.imageLink }" width="300" height="150"
							class="item_Picture" onclick="openImg('paneli${item.id}')">
					</c:forEach>
				</div>

			</div>
			<c:forEach var="item" items="<%=indyList%>">
				<div id="paneli${item.id }" class="picture" style="display: none;">
					<!--이미지 클릭 시 해당 div 노출-->
					<span onclick="this.parentElement.style.display='none'"
						class="closeButton">&times;</span>
					<!--닫기 버튼-->
					<button class="mutedButton" onclick="enableMute('panel${item.id}')">
						<!--음소거 버튼-->
						<i class='fas fa-volume-mute'></i>
					</button>
					<button class="unmutedButton"
						onclick="enableMute('panel${item.id}')" style="display: none;">
						<!--음소거 해제 버튼-->
						<i class='fas fa-volume-off'></i>
					</button>
					<div class="explain">
						<div class="explain_data">


							<div class="title">
								<p>${item.title }</p>
							</div>
							<div class="description">
								<textarea>${item.description}</textarea>

							</div>
							<div class="buttons">
								<button type="button" class="download"
									onclick="window.open('${item.downloadLink}')">다운로드</button>
								<button class="like" name="${item.id}" onclick="location.href='like/likePro.jsp?id=${item.id}&msg=1'"
								style="background-image: url(images/star.png); background-repeat:no-repeat; background-position:center;
								background-size: 20px;"></button>
							</div>
						</div>
						<div class="gradient_video">
							<div class="gradient"></div>
							<!--영상 옆 gradient 처리-->
							<video class="gamevideo" src="${item.videoLink}" autoplay loop
								muted></video>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<div id="main">
			<h1>액션</h1><!-- 액션 카테고리->상단과 내용 중복 -->
			<div class="items">
				<div class="bxslider">
					<!--이미지 슬라이더-->
					<c:forEach var="item" items="<%=actionList%>">
						<img src="${item.imageLink }" width="300" height="150"
							class="item_Picture" onclick="openImg('panela${item.id}')">
					</c:forEach>
				</div>

			</div>
			<c:forEach var="item" items="<%=actionList%>">
				<div id="panela${item.id }" class="picture" style="display: none;">
					<!--이미지 클릭 시 해당 div 노출-->
					<span onclick="this.parentElement.style.display='none'"
						class="closeButton">&times;</span>
					<!--닫기 버튼-->
					<button class="mutedButton" onclick="enableMute('panel${item.id}')">
						<!--음소거 버튼-->
						<i class='fas fa-volume-mute'></i>
					</button>
					<button class="unmutedButton"
						onclick="enableMute('panel${item.id}')" style="display: none;">
						<!--음소거 해제 버튼-->
						<i class='fas fa-volume-off'></i>
					</button>
					<div class="explain">
						<div class="explain_data">


							<div class="title">
								<p>${item.title }</p>
							</div>
							<div class="description">
								<textarea>${item.description}</textarea>

							</div>
							<div class="buttons">
								<button type="button" class="download"
									onclick="window.open('${item.downloadLink}')">다운로드</button>
								<button class="like" name="${item.id}" onclick="location.href='like/likePro.jsp?id=${item.id}&msg=1'"
								style="background-image: url(images/star.png); background-repeat:no-repeat; background-position:center;
								background-size: 20px;"></button>
							</div>
						</div>
						<div class="gradient_video">
							<div class="gradient"></div>
							<!--영상 옆 gradient 처리-->
							<video class="gamevideo" src="${item.videoLink}" autoplay loop
								muted></video>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script>
if (${likeList} !== undefined || ${likeList}.length != 0) {
	var list = ${likeList};
	for(var i=0;i<list.length;i++){//찜리스트 길이로 반복문을 돌려서
		x = document.getElementsByName(list[i]);//name이 찜 리스트 안의 값과 같은 항목들 다 찾기
		for(var j=0;j<x.length;j++){
			x[j].style.backgroundImage = "url('images/starClick.png')";
		}//해당 항목은 클릭상태의 이미지로 배경 변경
	}
}


	function openImg(imgName) {//이미지 클릭 시 하단 패널 노출 함수
		var i, x;
		x = document.getElementsByClassName("picture");//class가 picture인것 다 찾기
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";//모두 숨기기
		}
		document.getElementById(imgName).style.display = "block";//이미지를 클릭한 해당 패널만 노출
	}
	$(document).ready(function() {//이미지 슬라이더 설정
		$('.bxslider').bxSlider({
			minSlides : 1,
			maxSlides : 5,
			slideWidth : 300,
			slideMargin : 35,
			responsive : true,
			touchEnabled : false,
			adaptiveHeight : true,
			tickerHover : true,
			shrinkItems : true,
			infiniteLoop : true,
			preloadImages : 'visible'
		});
		$('body').hide().fadeIn('slow');//Page를 오픈할때마다 fadein이벤트 실행
	});

	function enableMute(panel) {//음소거/음소거 해제 함수

		var video = $('#' + panel).find($('.gamevideo'))[0];//panel안의 비디오 찾기

		if (video.muted == true) {//비디오가 음소거일경우
			video.muted = false;//비디오 음소거 해제
			$('#' + panel).find($('.mutedButton'))[0].style.display = "none";//음소거 UI 사라지고
			$('#' + panel).find($('.unmutedButton'))[0].style.display = "block";//음소거 해제 UI 보여주기

		} else {//반대로
			video.muted = true;
			$('#' + panel).find($('.mutedButton'))[0].style.display = "block";
			$('#' + panel).find($('.unmutedButton'))[0].style.display = "none";

		}

	}
	
</script>