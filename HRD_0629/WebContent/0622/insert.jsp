<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원등록</title>

<link type="text/css" rel="stylesheet" href="st.css">

<script>
function check(){
	if(document.insertform.name.value==""){
		alert("이름을 입력하세요.");
		document.insetform.name.focus();
	}
	if(document.insertform.id.value==""){
		alert("사번을 입력하세요.");
		document.insertform.id.focus();
	}
	if(document.insertform.duty.value==""){
		alert("직책을 입력하세요.");
		document.insertform.duty.focus();
	}else{
		document.insertform.submit();
	}
}
</script>

<style>
table {
	width: 50%
}
td {
	text-align: left
}
</style>


</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<nav>
		<%@include file="nav.jsp"%>
	</nav>

	<section>
		<div id=section>

			<form action="insert_process.jsp" method="post" name="insertform">
				<h2>직원 정보 등록</h2>

				<table>
					<tr>
						<th>성명</th>
						<td><input type=text size=20 name="name"></td>
					</tr>

					<tr>
						<th>사원번호</th>
						<td><input type=text size=20 placeholder="세자리수입력" name="id"></td>
					</tr>

					<tr>
						<th>소속부서</th>
						<td><select name=dept>
								<!-- value는 전송되는 값 -->
								<option value=인사부 selected>인사부</option>
								<option value=기획부>기획부</option>
								<option value=홍보부>홍보부</option>
								<option value=영업부>영업부</option>
								<option value=경리부>경리부</option>
						</select></td>
					</tr>

					<tr>
						<th>직급</th>
						<td>
						<select name="position">
								<option value=1 selected>1급</option>
								<option value=2>2급</option>
								<option value=3>3급</option>
								<option value=4>4급</option>
						</select></td>
					</tr>

					<tr>
						<th>직책</th>
						<td><input type="text" size=20 name="duty" ></td>
					</tr>

					<tr>
						<th>연락처</th>
						<td><input type=text size=20 name="phone" placeholder="010-0000-0000"></td>
					</tr>

					<tr>
						<th colspan=2>
						<input type="button" onclick="javascript:check()" value="등  록">
						<input type="reset" value="취   소"></th>
					</tr>
				</table>
			</form>

		</div>
	</section>

	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>