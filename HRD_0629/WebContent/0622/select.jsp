<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
<link type="text/css" rel="stylesheet" href="st.css">

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

			<form action="" method="post" name="empform">
				<h2>직원 정보 조회</h2>
				<table>
					<tr>
						<th>no.</th>
						<th>성명</th>
						<th>사번</th>
						<th>직급</th>
						<th>직책</th>
						<th>연락처</th>
						<th>소속부서</th>
					</tr>

					<%@include file="DBconn.jsp"%>
					<%
						ResultSet rs = null;
						PreparedStatement pstmt = null;
						int cnt = 0;

						try {
							String sql = "select name,id,position,duty,phone,dept from personnel order by id";
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();

							while (rs.next()) {

								String name = rs.getString("name");
								int id = rs.getInt("id");
								String position = rs.getString("position");
								String duty = rs.getString("duty");
								String phone = rs.getString("phone");
								String dept = rs.getString("dept");

								cnt++;//조회화면 no.
					%>
					<tr>
						<td><%=cnt%></td>
						<td><%=name%></td>
						<td><%=id%></td>
						<td><%=position%></td>
						<td><%=duty%></td>
						<td><%=phone%></td>
						<td><%=dept%></td>
					</tr>
					<%
						}
						} catch (SQLException e) {
							System.out.println("테이블 호출 실패ㅠㅠ" + e.getMessage());
						} finally {
							if (rs != null)
								rs.close();
							if (pstmt != null)
								pstmt.close();
							if (conn != null)
								conn.close();
						}
					%>
				</table>
			</form>
		</div>
	</section>

	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>