<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'insert_do.jsp' starting page</title>

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
    <h1>
        注册操作
    </h1>
    <hr>
    <jsp:include page="common/dataconn.jsp" flush="true" />
    <!--这里是包含数据库连接的页面 -->
    <%
        Connection conn = ((Connection)request.getAttribute("conn")); // 数据库连接
        PreparedStatement pstmt = null; // 数据库预处理操作
        ResultSet rs = null; // 查询要处理结果集
        boolean flag = false; // 保存标记
    %>
    <%
        try {
    %>
    <%
        String sql = "INSERT INTO user(username,password) VALUES(?,?)";//插入语句
        pstmt = conn.prepareStatement(sql);//实例化数据库操作对象
        pstmt.setString(1, request.getParameter("name"));//设置用户名
        pstmt.setString(2, request.getParameter("password"));//设置密码

        if (pstmt.executeUpdate() > 0) { // 如果有数据，则可以执行
            flag = true; //  表示注册成功
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
        if (flag) { // 注册成功
    %>
    <h2>
        注册成功
    </h2>
    <jsp:forward page="list.jsp" /><!--跳转到list.jsp -->
    <%
    } else { // 注册失败
    %>
    <h2>
        注册失败
    </h2>
    <%
        }
    %>
</center>

</body>
</html>