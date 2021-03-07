<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Assignment 6</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>


<body>
<div style=" background: seagreen; color: white ; margin: 10px ; border-radius: 20px; padding: 20px">
    <center><h2>Insert, Update and Delete<br><br>(Assignment 6)</h2></center>
</div>
<br>

<%

    try {
        //adding mysql class
        Class.forName("com.mysql.jdbc.Driver");
        //table name
        final String DB_URL = "jdbc:mysql://localhost:3306/insert_update_delete?";
        //id and password of sql
        final String DB_USER = "root";
        final String DB_PASSWORD = "1234";

        //establishing connection
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        //Sql Query
        String sqlQuery= "SELECT * FROM `ins_upd_del`";
        PreparedStatement stmt= conn.prepareStatement(sqlQuery);
        ResultSet result= stmt.executeQuery(sqlQuery);

%>

<div style="padding: 10px">
    <table class="table bordered" style="border: 2px solid royalblue">
        <tr>
            <th>Name</th>
            <th>Address</th>
            <th>Number</th>
        </tr>
        <%
            while(result.next())
            {
                String number= result.getString("number");
                String name= result.getString("name");
                String address= result.getString("address");

        %>

        <tr style="color: saddlebrown">
            <td><%=name%></td>
            <td><%=address%></td>
            <td style="color: midnightblue"><%=number%></td>
        </tr>

        <%
            }
        %>
    </table>

    <form action="InsertPage.jsp" method="post" >
        <button class="btn btn-primary">Insert</button>
    </form>

    <form action="UpdatePage.jsp" method="post">

        <button class="btn btn-warning">Update</button>
    </form>
    <form action="DeletePage.jsp" method="post">

        <button class="btn btn-danger">Delete</button>
    </form>




</div>

<%
    }
    catch (Exception e)
    {
        System.out.println(e.getMessage());
    }

%>







</body>
</html>
