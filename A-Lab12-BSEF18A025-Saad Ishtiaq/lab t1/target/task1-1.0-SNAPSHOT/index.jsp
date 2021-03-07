<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lab-12 task1</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body style="background: black">

<div style=" margin-right: 500px ; margin-left: 500px ">
    <h1 style="text-align: center;background: dodgerblue;color:ghostwhite ; border-radius: 35px ; margin-top: 10px; padding: 10px">Digital Diary</h1>

    <div style="margin-left: 50px; margin-top: 50px">

        <form action="OpenDiaryButton.jsp" method="post">
            <button type="submit" class="btn btn-outline-primary">Open Diary</button>
        </form>
        <br>
        <br>
        <form action="AddEntryButton.jsp" method="post">
            <button type="submit" class="btn btn-outline-success">Add an Entry</button>
        </form>
        <br>
        <br>
        <form action="DeleteEntryButton.jsp" method="post">
            <button type="submit" class="btn btn-outline-danger">Delete Multiple Entries</button>
        </form>
        <br>
        <br>
        <form action="UpdateEntryButton.jsp" method="post">
            <button type="submit" class="btn btn-outline-warning">Update an Entry</button>
        </form>
        <br>
        <br>
        <form action="SearchEntryButton.jsp" method="post">
            <button type="submit" class="btn btn-outline-dark" style="color: white">Search an Entry</button>
        </form>


    </div>
</div>
<br/>

</body>
</html>