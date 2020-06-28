<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>
<%
	request.getParameter("utf-8");

	ResultSet rs = null;
	PreparedStatement pstmt = null;

	try {
		String sql = "insert into personnel values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, request.getParameter("id"));//폼에서 입력한 값을 가져와서(get) 디비에 넣는다(set)
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("dept"));
		pstmt.setString(4, request.getParameter("position"));
		pstmt.setString(5, request.getParameter("duty"));
		pstmt.setString(6, request.getParameter("phone"));

		pstmt.executeUpdate();
%>
<script type="text/javascript">
	alert("입력성공");
	location.href = "select.jsp";
</script>
<%
	} catch (SQLException e) {
		System.out.println("insert fail " + e.getMessage());
%>
<script type="text/javascript">
	alert("입력실패");
	location.href = "javascript:history.back(-1)";
</script>
<%
	} finally {
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

	}
%>
