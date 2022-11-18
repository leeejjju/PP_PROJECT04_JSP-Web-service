<%--
  Created by IntelliJ IDEA.
  User: Pearl LEE
  Date: 2022-11-16
  Time: 오전 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>filetest
    </title>
</head>
<body>

  <form method="post" action="fileupload.jsp" enctype="multipart/form-data">
      <h1>File Upload test form</h1><hr>
    <input type="file" name="img"><br>
      name:
      <input type="text" name="name"><br>
    <input type="submit" value="upload">
  </form>

</body>
</html>
