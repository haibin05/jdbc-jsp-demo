<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'update_do.jsp' starting page</title>

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
    <h1>更新操作</h1>
    <hr>
    <jsp:include page="common/dataconn.jsp"  />
    <!--这里是包含数据库连接的页面 -->
    <%
        Connection conn = ((Connection)request.getAttribute("conn")); // 数据库连接
        PreparedStatement pstmt = null ;	// 数据库预处理操作
        ResultSet rs = null ;		// 查询要处理结果集
        boolean flag = false ;	// 保存标记
    %>
    <%
        try{
    %>
    <%
        String sql = "UPDATE user  SET username=?,password=? WHERE id=?" ;//此sql语句是
        pstmt = conn.prepareStatement(sql) ;
        pstmt.setString(1,request.getParameter("name")) ;//设置用户名
        pstmt.setString(2,request.getParameter("password")) ;//设置密码
        pstmt.setString(3,request.getParameter("id")) ;//设置id
        if(pstmt.executeUpdate()>0){	// 如果有数据，则可以执行
            flag = true ;	//  表示更新成功
        }
    %>
    <%
    }catch(Exception e)	{
        e.printStackTrace() ;
    }
    finally{
    %>
    <jsp:include page="common/dataclose.jsp"/><!--这里是包含数据库关闭的页面 -->
    <%
        }
    %>
    <%
        if(flag){	// 更新成功
    %>
    <h2>更新成功</h2>
    <jsp:forward page="list.jsp" />//跳转到list.jsp
    <%
    } else {		// 更新失败
    %>
    <h2>更新失败</h2>
    <%
        }
    %>
</center>
<h2>返回首页<a href="list.jsp">点击这里</a></h2>
</body>
</html>