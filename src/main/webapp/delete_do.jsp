<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'delete_do.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<center>
    <h1>删除操作</h1>
    <hr>
    <jsp:include page="common/dataconn.jsp"/>
    <!--这里是包含数据库连接的页面 -->
    <%
        Connection conn = (Connection) request.getAttribute("conn"); // 数据库连接
        PreparedStatement pstmt = null;    // 数据库预处理操作
        ResultSet rs = null;        // 查询要处理结果集
        boolean flag = false;    // 保存标记

    %>
    <%
        try {
    %>
    <%
        String sql = "DELETE FROM  user WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        String id = request.getParameter("id").toString();
        pstmt.setString(1, id);
        if (pstmt.executeUpdate() > 0) {    // 如果有数据，则可以执行
            flag = true;    //  表示更新成功
        }
    %>
    <%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
    %>
    <jsp:include page="common/dataclose.jsp"/><!--这里是包含数据库关闭的页面 -->
    <%
        }
    %>
    <%
        if (flag) {    // 删除成功
    %>

    <jsp:forward page="list.jsp"/>
    <%

    } else {        // 删除失败
    %>
    <h2>删除失败</h2>
    <%
        }
    %>
</center>

</body>
</html>
