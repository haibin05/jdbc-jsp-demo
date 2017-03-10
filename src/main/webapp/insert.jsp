<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'insert.jsp' starting page</title>

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
    <h1>注册操作</h1>
    <hr>
    <form action="insert.jsp" method="post">
        <table border="1">
            <tr>
                <td colspan="2">
                    用户注册
                </td>
            </tr>
            <tr>
                <td>登陆名：</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>登陆密码：</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="注册">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>