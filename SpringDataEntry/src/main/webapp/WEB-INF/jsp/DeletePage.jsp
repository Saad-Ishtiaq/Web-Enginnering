<%--
  Created by IntelliJ IDEA.
  User: Saad  Ishtiaq
  Date: 1/11/2021
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
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
<div style=" background: #9d1c2c; color: white ; margin: 10px ; border-radius: 20px; padding: 20px">
    <center><h2>Delete Form</h2></center>
</div>
<br>
<br>
<br>

<div style="color: red ; margin-left: 30px">
    <%
        String error = (String) session.getAttribute("error");
        if(error!=null)
        {
            out.print(error);
        }
        request.getSession().removeAttribute("error");
    %>
</div>
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
    <form action="http://localhost:8081/SpringDataEntry_war_exploded/del" method="post">

        <table class="table bordered" style="border: 2px solid royalblue">
            <tr>
                <th>Select</th>
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
                <td><input type="radio" name="checkedRow" value="<%=number%>" ></td>
                <td><%=name%></td>
                <td><%=address%></td>
                <td style="color: midnightblue"><%=number%></td>
            </tr>

            <%
                }
            %>
        </table>
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

