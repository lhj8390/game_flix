<%@page import="content.Games"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<!--이미지 슬라이더 js-->
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="../css/genre.css" />
<link rel="stylesheet" href="../css/like.css">
</head>
<body>
<%
String sessionId = (String)session.getAttribute("sessionId");
InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
ArrayList<Games> gameList = new ArrayList<Games>();
String recommend = "no recommend";
ArrayList<Games> recommendList = new ArrayList<Games>();
ArrayList<Integer> likeList = new ArrayList<Integer>();
try {
	ic = new InitialContext();
	ds = (DataSource) ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	
	ps = conn.prepareStatement("SELECT id, title, description,"+ 
			"imagelink, videolink, downloadlink, category, updatetime "+
			"FROM likecontent,gamecontent "+
			"WHERE likecontent.contentid = gamecontent.id");
	rs = ps.executeQuery();
	
	while (rs.next()) {
		gameList.add(new Games(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
		rs.getString(6), rs.getString(7), rs.getDate(8)));

	}
	ps = conn.prepareStatement("SELECT COUNT(*), category "+
			"FROM gamecontent,likecontent "+
			"WHERE likecontent.contentid =gamecontent.id "+
			"GROUP BY category "+
			"ORDER BY COUNT(*) desc");
	rs = ps.executeQuery();
	while(rs.next()){
		recommend = rs.getString(2);
		break;
	}
	ps = conn.prepareStatement("SELECT * FROM gamecontent where category=?");
	ps.setString(1, recommend);
	rs = ps.executeQuery();
	while (rs.next()) {
		recommendList.add(new Games(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
		rs.getString(6), rs.getString(7), rs.getDate(8)));

	}
	ps = conn.prepareStatement("SELECT * FROM likecontent where userid=?");
	ps.setString(1, sessionId);
	rs = ps.executeQuery();
	while(rs.next()){
		likeList.add(rs.getInt(2));
		
	}
	request.setAttribute("likeList", likeList);

} catch (Exception e) {out.println(e);} 
finally {
	if (rs != null)try {rs.close();} catch (Exception ex) {}
	if (ps != null)try {ps.close();} catch (Exception ex) {}
	if (conn != null)try {conn.close();} catch (Exception ex) {}
	if (ic != null)try {ic.close();} catch (Exception ex) {}
}
%>
<jsp:include page="../header.jsp"/>
<div id="main">

<div class="inner">
<h1>찜한 컨텐츠</h1>
<div class="thumbnails">
<c:forEach var="item" items="<%=gameList%>">
<div class="box">
<a href="${item.videoLink }" data-poptrox="iframe,800x400" class="image fit"><img src="${item.imageLink}" alt="" /></a>
<div class="inner">
<h3>${item.title }</h3>
<p>${item.description }</p>
<a href="${item.downloadLink }" class="button fit" data-poptrox="ignore">download</a>
</div>
</div>
</c:forEach>
</div>
</div>

</div>
<div id="recommendPage">
<h1>${sessionId}님 추천 콘텐츠 - <%=recommend %></h1>
			<div class="items">
				<div class="bxslider">
					<!--이미지 슬라이더-->
					<c:forEach var="item" items="<%=recommendList%>">
						<img src="${item.imageLink }" width="300" height="150"
							class="item_Picture" onclick="openImg('panel${item.id}')">
					</c:forEach>
				</div>

			</div>
			<c:forEach var="item" items="<%=recommendList%>">
				<div id="panel${item.id }" class="picture" style="display: none;">
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
								<button class="like" name="${item.id}" onclick="location.href='likePro.jsp?id=${item.id}&msg=2'"
								style="background-image: url(../images/star.png); background-repeat:no-repeat; background-position:center;
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
<jsp:include page="../footer.jsp"/>
</body>
<script type="text/javascript">
if (${likeList} !== undefined || ${likeList}.length != 0) {
	var list = ${likeList};
	for(var i=0;i<list.length;i++){
		x = document.getElementsByName(list[i]);
		for(var j=0;j<x.length;j++){
			x[j].style.backgroundImage = "url('../images/starClick.png')";
		}
	}
}
function openImg(imgName) {
	var i, x;
	x = document.getElementsByClassName("picture");
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	document.getElementById(imgName).style.display = "block";
}
$(document).ready(function() {
	$('.bxslider').bxSlider({
		minSlides : 1,
		maxSlides : 5,
		slideWidth : 330,
		slideMargin : 35,
		responsive : true,
		touchEnabled : false,
		adaptiveHeight : true,
		tickerHover : true,
		shrinkItems : true,
		infiniteLoop : true,
		preloadImages : 'visible'
	});
});
function enableMute(panel) {

	var video = $('#' + panel).find($('.gamevideo'))[0];

	if (video.muted == true) {
		video.muted = false;
		$('#' + panel).find($('.mutedButton'))[0].style.display = "none";
		$('#' + panel).find($('.unmutedButton'))[0].style.display = "block";

	} else {
		video.muted = true;
		$('#' + panel).find($('.mutedButton'))[0].style.display = "block";
		$('#' + panel).find($('.unmutedButton'))[0].style.display = "none";

	}

}
</script>
</html>