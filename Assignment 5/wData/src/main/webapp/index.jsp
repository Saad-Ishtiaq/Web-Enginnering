<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Assignment 5</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>


<body>
<div style=" background: seagreen; color: white ; margin: 10px ; border-radius: 20px; padding: 20px">
<center><h2>Practice of DataBase Creation, Updating, Reading and Deleting<br><br>(Assignment 5 : Read from Database)</h2></center>
</div>
<br>
<br>
<br>

<%

    try {
        //adding mysql class
        Class.forName("com.mysql.jdbc.Driver");
        //table name
        final String DB_URL = "jdbc:mysql://localhost:3306/wData?";
        //id and password of sql
        final String DB_USER = "root";
        final String DB_PASSWORD = "1234";

        //establishing connection
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        //Sql Query
        String sqlQuery= "SELECT * FROM `studentinfo`";
        PreparedStatement stmt= conn.prepareStatement(sqlQuery);
        ResultSet result= stmt.executeQuery(sqlQuery);

%>

    <div style="padding: 10px">
        <table class="table bordered" style="border: 2px solid royalblue">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Address</th>
            </tr>
            <%
                while(result.next())
                {
                    int id= result.getInt("idstudentInfo");
                    String name= result.getString("name");
                    String address= result.getString("address");

            %>

            <tr style="color: saddlebrown">
                <td style="color: midnightblue"><%=id%></td>
                <td><%=name%></td>
                <td><%=address%></td>
            </tr>

            <%
                }
            %>

        </table>


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
