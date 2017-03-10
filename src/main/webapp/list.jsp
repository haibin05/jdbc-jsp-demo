<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
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

    <title>My JSP 'list.jsp' starting page</title>

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
<table border="1" width="80%">
    <tr>
        <td>id</td>
        <td>登录用户名</td>
        <td>用户名</td>
        <td>邮箱</td>
        <td>电话</td>
        <td>座机</td>
        <td>操作||<a href="insert.jsp">添加</a>
        </td>
    </tr>


    <jsp:include page="common/dataconn.jsp" flush="true"/>
    <!--这里是包含数据库连接的页面 -->
    <%
        Connection conn = ((Connection) request.getAttribute("conn")); // 数据库连接
        PreparedStatement pstmt = null; // 数据库预处理操作
        ResultSet rs = null; // 查询要处理结果集
        boolean flag = false; // 保存标记
    %>
    <%
        String id = null; //保存id
        String loginname = null; //保存用户名
        String name = null; //保存密码
        String email = null; //保存密码
        String phone = null; //保存密码
        String contacttel = null; //保存密码
        try {//JDBC操作会抛出异常，使用try...catch处理
    %>
    <%
        String sql = "SELECT id,loginname,name,email,phone, contacttel FROM T_USER_V  limit 10";//此sql语句是从usre表中查出所有的记录，select后面的字段全部改为*也可以
        pstmt = conn.prepareStatement(sql);//实例化数据库操作对象
        rs = pstmt.executeQuery();//实行查询

        while (rs.next()) { // 如果有数据，则可以执行
            id = rs.getString(1); //将从数据库查询出来的记录集第1位赋给id
            loginname = rs.getString(2); //将从数据库查询出来的记录集第2位赋给name(用户名)
            name = rs.getString(3); //将从数据库查询出来的记录集第3位赋给pass(密码)
            email = rs.getString(4); //将从数据库查询出来的记录集第3位赋给pass(密码)
            phone = rs.getString(5); //将从数据库查询出来的记录集第3位赋给pass(密码)
            contacttel = rs.getString(6); //将从数据库查询出来的记录集第3位赋给pass(密码)
    %>
    <tr>


        <td><%=id%></td><!--显示id-->
        <td><%=loginname%></td><!--显示用户名-->
        <td><%=name%></td><!--显示密码-->
        <td><%=email%></td><!--显示密码-->
        <td><%=phone%></td><!--显示密码-->
        <td><%=contacttel%></td><!--显示密码-->
        <td>
            <a href="update.jsp?id=<%=id%>">修改</a>||
            <!--因为要根据id修改，修改时需要将id通过地址重写的方式传过去-->
            <a href="delete_do.jsp?id=<%=id%>">删除</a>
            <!--要根据id删除-->
        </td>
    </tr>
    <%
        }//注意：我们的<tr>元素是在while循环里面，所以才能将全部记录列出来
    } catch (Exception e) {
        e.printStackTrace();
    } finally {//不管怎么样都要关闭数据库连接
    %>
    <jsp:include page="common/dataclose.jsp"/><!--这里是包含数据库包含的页面 -->
    <%
        }
    %>


</table>
</body>
</html>