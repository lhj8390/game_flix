<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/home.css">
</head>
<body>
<%
InitialContext ic = null;
DataSource ds = null;
Connection conn = null;
ResultSet rs = null;
PreparedStatement ps = null;
int contentCount = 0;

try{
	ic = new InitialContext();
	ds = (DataSource)ic.lookup("java:comp/env/jdbc/bizmooc");
	conn = ds.getConnection();
	ps = conn.prepareStatement("SELECT count(*) FROM gamecontent");
	rs = ps.executeQuery();
	
	while(rs.next()){
		contentCount=rs.getInt(1);
	}
			
}catch(Exception e){
	out.println(e);
}finally{
	if(rs!=null)try{rs.close();}catch(Exception ex){}
	if(ps!=null)try{ps.close();}catch(Exception ex){}
	if(conn!=null)try{conn.close();}catch(Exception ex){}
	if(ic!=null)try{ic.close();}catch(Exception ex){}
}
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "Work"); map.put("y", 44); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Gym"); map.put("y", 9); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Leisure"); map.put("y", 8); list.add(map);

String dataPoints = gsonObj.toJson(list);
%>
    <div id="panel">
        <div class="card">
            <p class="count">0</p>
            <p>총 사용자 수</p>
        </div>
        <div class="card">
            <p class="count"><%=contentCount %></p>
            <p>총 콘텐츠 수</p>
        </div>
    </div>
    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
</body>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	exportEnabled: false,
	animationEnabled: true,
	title: {
		text: "장르별 선호"
	},
	data: [{
		type: "pie",
		indexLabel: "{y}%",
		indexLabelPlacement: "inside",
		toolTipContent: "<b>{label}</b>: {y}%",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</html>