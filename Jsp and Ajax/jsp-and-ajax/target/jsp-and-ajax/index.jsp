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


<body onload="tableChanged()">
<div style=" background: seagreen; color: white ; margin: 10px ; border-radius: 20px; padding: 20px">
    <center><h2>Insert, Update and Delete<br><br>(Assignment 6)</h2></center>
</div>
<br>

<div style="padding: 10px" >
    <table class="table bordered" style="border: 2px solid royalblue">
        <tr>
            <th>Name</th>
            <th>Address</th>
            <th>Number</th>
        </tr>

        <%--new div is made--%>

        <tbody id="table-body">

        </tbody>

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



<script>

    function tableChanged(){
        fetchData()
    }

    function  fetchData()
    {
        $.ajax({
                url:'DisplayServlet',

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
            let colThree=row.insertCell(0);
            let colTwo=row.insertCell(0);
            let colOne=row.insertCell(0);
            colOne.innerHTML=response[i].name;
            colTwo.innerHTML=response[i].address;
            colThree.innerHTML=response[i].number;

        }

    }

</script>


</body>
</html>
