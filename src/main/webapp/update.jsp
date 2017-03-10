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

    <title>My JSP 'update.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
<link rel="stylesheet" type="text/css" href="styles.css">
-->

</head>

<jsp:include page="common/dataconn.jsp" flush="true" />
<!--这里是包含数据库连接的页面 -->
<%
    Connection conn =(Connection)request.getAttribute("conn"); // 数据库连接
    PreparedStatement pstmt = null; // 数据库预处理操作
    ResultSet rs = null; // 查询要处理结果集
    boolean flag = false; // 保存标记
    int userid=0; //保存id
    String name = null; //保存用户名
    String pass = null; //保存密码
%>
<%
    try {//JDBC操作会抛出异常，使用try...catch处理
%>
<%


    String sql = "SELECT id,username,password FROM user WHERE id=? ";//此sql语句是根据id查询出一条记录
    String id = request.getParameter("id").toString();//接收从上个表单传过来的id(从地址栏传来)
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);//设置第一个“?”的内容，即id的内容
    rs = pstmt.executeQuery();//执行查询
    if (rs.next()) {
        userid = rs.getInt(1);//取出id
        name = rs.getString(2);//取出用户名
        pass = rs.getString(3);//取出密码

    }
%>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            rs.close();//关闭查询对象
            pstmt.close();//关闭操作对象
            conn.close();//关闭数据库连接
        } catch (Exception e) {
        }
    }
%>


<body>
<center>
    <h1>
        更新操作
    </h1>
    <hr>
    <form action="update_do.jsp" method="post">
        <table border="1">
            <tr>
                <td colspan="2">
                    更新资料
                </td>
            </tr>
            <tr>
                <td>
                    登陆名：
                </td>
                <td>
                    <input type="text" name="name" value="<%=name%>">
                </td>
            </tr>
            <tr>
                <td>
                    登陆密码：
                </td>
                <td>
                    <input type="text" name="password" value="<%=pass%>">
                </td>
                <input type="hidden" name="id" id="id" value="<%=userid%>"><!--用隱藏域來儲存id -->
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="修改">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>