<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>addUser-leeejjju</title>

</head>

<body style="justify-content: center">

    <div style="border: 2px dotted darkolivegreen; padding: 20px; margin: 30px; width: 40%; display: block">
        <h1>Add New User</h1>
        <form action="addpost.jsp" method="post" enctype="multipart/form-data">
            <table>
                <tr><td>Name</td><td><input type="text" name="name" autofocus="autofocus" required></td></tr>
                <tr><td>User ID</td><td><input type="text" name="uid" required></td></tr>
                <tr><td>Password</td><td><input type="password" name="pw" placeholder="type over 4 letters" pattern="*{4,20}" required></td></tr>
                <tr><td>Email</td><td><input type="email" name="email" class="form-control" required></td></tr>
                <tr><td>Gender</td><td>
                    Male<input type="radio" name="gender" value="Male" checked style="margin: 5px">
                    Female<input type="radio" name="gender" value="Female" style="margin: 5px;">
                </td></tr>
                <tr><td>Birthday</td><td><input type="date" name="birthday" min="1900-01-01"></td></tr>
                <tr><td>Photo</td><td><input type="file" name="img"></td></tr>
                <tr><td><a href="posts.jsp">View All Users</a></td><td align="right"><input type="submit" value="Add User"/></td></tr>
            </table>
        </form>
    </div>
</body>

</html>