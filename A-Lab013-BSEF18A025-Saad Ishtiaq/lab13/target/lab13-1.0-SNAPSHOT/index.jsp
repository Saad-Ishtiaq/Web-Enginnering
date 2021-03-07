<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Web Lab 13 (T1)</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div style="border: 3px solid #c11e1e; background: midnightblue; color: white; margin: 10px ; border-radius: 20px; padding: 20px">
    <center><h2>Student Management System (SMS)</h2>
<br>

        <div style="border: 1px solid #ff8300; font-size: 20px;background: #c11e1e; color: white; margin-left: 500px; margin-right: 500px ; border-radius: 20px; padding: 10px"> Select</div>

        <br>
<%
    try {
        //adding mysql class
        Class.forName("com.mysql.jdbc.Driver");
        //table name
        final String DB_URL = "jdbc:mysql://localhost:3306/lab12?";
        //id and password of sql
        final String DB_USER = "root";
        final String DB_PASSWORD = "1234";

        //establishing connection
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        //Sql Query
        String sqlQuery= "SELECT * FROM `class`";
        Statement stmt= conn.createStatement();
        ResultSet result= stmt.executeQuery(sqlQuery);
%>

    <select name="selectClass" id="selectedClass" onchange="classChanged()" style="background:#695f5f; color: white">
        <option value="-1">Select Class</option>
        <%
            while(result.next())
            {
                String cName= result.getString("c_name");
                String cId= result.getString("c_id");
        %>
            <option style="background: #433e3e ; color: white" value="<%=cId%>"><%=cName%></option>

        <%
            }
        %>
    </select>
    </center>
</div>
<%
    }
    catch (Exception e)
    {
        System.out.println(e.getMessage());
    }

%>


<div style="padding: 10px" >
    <table class="table bordered" style="border: 2px solid #ff8300">
        <thead style="background: #450475; color: white">
        <tr>
            <th>Student's ID</th>
            <th>Name</th>
            <th>Father Name</th>
        </tr>
        </thead>

        <tbody id="table-body">
        </tbody>

    </table>
</div>








<script>

    function classChanged(){
        let classNumber= document.getElementById("selectedClass").value;

        fetchData(classNumber)


    }

    function  fetchData(classNumber)
    {
        $.ajax({
            url:'DisplayServlet',
            data:{
                classNumber:classNumber,
            },

            success: function (response){
                populateTable(response);


            },
            error: function (){


                }
            }
        )
    }


    function populateTable(response){
        const body= document.getElementById("table-body");
        body.innerHTML="";

        for(let i=0; i<response.length;i++)
        {
            const row=body.insertRow();
            let colOne=row.insertCell(0);
            let colTwo=row.insertCell(0);
            let colThree=row.insertCell(0);
            colOne.innerHTML=response[i].fname;
            colTwo.innerHTML=response[i].name;
            colThree.innerHTML=response[i].s_id;

        }




    }



</script>
</body>
</html>