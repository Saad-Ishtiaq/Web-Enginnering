<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.lang.String" %>
<html>
<head>
    <title>Assignment 4</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
    String clientName= request.getParameter("name");
    String clientNumber= request.getParameter("number");
    int result=0;
    try {
        //adding mysql class
        Class.forName("com.mysql.jdbc.Driver");
        //table name
        final String DB_URL = "jdbc:mysql://localhost:3306/client_details?";
        //id and password of sql
        final String DB_USER = "root";
        final String DB_PASSWORD = "1234";
        //establishing connection
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        //Sql Query
        String sqlQuery= "INSERT INTO clientinfo(clientNumber,clientName) VALUES ( ?, ?)";;
        PreparedStatement stmt= conn.prepareStatement(sqlQuery);
        stmt.setString(1,clientNumber);
        stmt.setString(2,clientName);
        result= stmt.executeUpdate();

        if(result==1)
        {
%>
        <div style=" margin: 30px; color: #26b85c ;text-align: center; border: 1px solid green">
            <form action="index.html">
                <h2>Client Successfully Added!!!</h2>
                <button class="btn btn-outline-success">Return</button>
            </form>
        </div>
<%
        }
    }
    catch (Exception e)
    {
%>
    <div style=" margin: 30px; color: #ea3030 ;text-align: center ; border: 1px solid darkred">
        <form action="index.html">
            <h2>Client Not Added!!!</h2>
            <h4>Client Number Already Exist</h4>
            <button class="btn btn-outline-danger">Return</button>
        </form>
    </div>
<%
        System.out.println(e.getMessage());
    }
%>





















</body>
</html>
