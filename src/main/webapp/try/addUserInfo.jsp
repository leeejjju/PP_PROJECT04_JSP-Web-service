<%--
  Created by IntelliJ IDEA.
  User: Pearl LEE
  Date: 2022-11-15
  Time: 오후 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>addUser-leeejjju</title>
    <link rel="stylesheet" href="../boot.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="justify-content: center">

    <form action="add_ok.jsp" method="post" style="width: 30%;">
        <div class="modal-header">
            <h4 class="title">Add User</h4>
            <button type="button" class="close" aria-hidden="true" href="indexCRUD.jsp">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="name" autofocus="autofocus" required>
            </div>
            <div class="form-group">
                <label>User ID</label>
                <input type="text" class="form-control" name="uid" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="pw" class="form-control" placeholder="type over 4 letters" pattern="*{4,20}" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Gender</label>
                <tmp class="form-control">
                    <input type="radio" name="gender" value="Female" style="float: right; margin: 5px;">
                    <label style="color: black; font-weight: normal; margin-left: 10px; float: right">Female</label>
                    <input type="radio" name="gender" value="Male" checked style="float: right; margin: 5px">
                    <label style="color: black; font-weight: normal; margin-left: 10px; float: right">Male</label>
                </tmp>
            </div>
            <div class="form-group">
                <label>Birth day</label>
                <input type="date" class="form-control" name="birthday" min="1900-01-01" max="2022-10-15">
            </div>
            <div class="form-group">
                <label>Photo</label>
                <input type="file" name="img" class="form-control" required>
            </div>
        </div>
        <div class="modal-footer">
            <input type="button" class="btn btn-default" value="Cancel" href="indexCRUD.jsp">
            <input type="submit" class="btn btn-success" value="Add">
        </div>
    </form>

</body>
</html>
