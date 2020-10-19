//아이디 중복체크

function idCheck(){
	if(document.join.id.value==""){
		alert("ID를 입력하세요.");
		return;
	}
	
	url = "idChk.jsp?id=" + document.join.id.value;
	open (url, "confirm", "toolblr=no, location=no, status=no, scrollbars=no, resizable=no, width=500, height=200");	
}