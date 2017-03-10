<%@ page import="java.sql.*"%>
<%!// 定义若干个数据库的连接常量
    public static final String DBDRIVER = "org.gjt.mm.mysql.Driver";//定义数据库驱动程序
    public static final String DBURL = "jdbc:mysql://localhost:3306/user";//数据库连接地址
    public static final String DBUSER = "root";//数据库连接用户名
    public static final String DBPASS = "admin";//数据库连接密码%>

<%
    Connection conn = null; // 数据库连接
    Class.forName(DBDRIVER);  //加载驱动程序
    conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);//取得数据库的连接

    PreparedStatement pstmt = null; // 数据库预处理操作
    ResultSet rs = null; // 查询要处理结果集
    request.setAttribute("conn",conn);//设置数据库连接
    request.setAttribute("pstmt",pstmt);
    request.setAttribute("rs",rs);

%>

<%@ page import="java.sql.*"%>
<%
    try {
        ((ResultSet)request.getAttribute("rs")).close();//关闭查询对象
        ((PreparedStatement)request.getAttribute("pstmt")).close();//关闭操作对象
        ((Connection)request.getAttribute("conn")).close();//关闭数据库连接
    } catch (Exception e) {
    }
%>