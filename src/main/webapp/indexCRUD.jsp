<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.example.pp_project04_jspwebservice.dao.UsersDAO, com.example.pp_project04_jspwebservice.bean.UsersVO,java.util.*"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>userList - leeejjju</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="boot.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

  <script>
    $(document).ready(function() {
      // Activate tooltip
      $('[data-toggle="tooltip"]').tooltip();
      // Select/Deselect checkboxes
      var checkbox = $('table tbody input[type="checkbox"]');
      $("#selectAll").click(function() {
        if (this.checked) {
          checkbox.each(function() {
            this.checked = true;
          });
        } else {
          checkbox.each(function() {
            this.checked = false;
          });
        }
      });
      checkbox.click(function() {
        if (!this.checked) {
          $("#selectAll").prop("checked", false);
        }
      });
    });

    function validateFrom() {
      let NAME = document.forms["myForm"]["uname"].value;
      if (NAME.length < 2) {
        alert("Name should be more than 2 letters.");
        NAME.focus();
        return false;
      }
      let ID = document.forms["myForm"]["uid"].value;
      if (ID.length < 2) {
        alert("ID should be more than 2 letters.");
        ID.focus();
        return false;
      } else if (ID.length >= 20) {
        alert("ID should be less than 20 letters.");
        ID.focus();
        return false;
      }
      let PW = document.forms["myForm"]["password"].value;
      if (PW.length < 2) {
        alert("PW should be more than 2 letters.");
        PW.focus();
        return false;
      } else if (PW.length >= 20) {
        alert("PW should be less than 20 letters.");
        PW.focus();
        return false;
      }
      let EMAIL = document.forms["myForm"]["email"].value;
      if (!EMAIL.contains('@')) {
        alert("Please use valid E-mail format.");
        EMAIL.focus();
        return false;
      }
    }
  </script>
</head>
<body>
<!--Main Table -->
<div class="container-xl">
  <div class="table-responsive">
    <div class="table-wrapper">
      <div class="table-title">
        <div class="row">
          <div class="col-sm-6">
            <h2>Manage <b>Users</b></h2>
          </div>
          <%
            UsersDAO usersDAO = new UsersDAO();
            List <UsersVO> list = usersDAO.getUserList();
            request.setAttribute("list",list);
          %>
          <div class="col-sm-6" id="primeButton">
            <!--
            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
            -->
            <a href="addUserInfo.jsp" class="btn btn-success">
              <span>Add New User</span>
            </a>
            <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal">
              <span>Delete User</span>
            </a>
          </div>
        </div>
      </div>
      <table class="table table-striped table-hover">
        <thead>
        <tr>
          <th>
                  <span class="custom-checkbox">
                    <input type="checkbox" id="selectAll">
                    <label for="selectAll"></label>
                  </span>
          </th>
          <th>Photo</th>
          <th>Name</th>
          <th>User ID</th>
          <th>Password</th>
          <th>E-mail</th>
          <th>Gender</th>
          <th>Birth day</th>
          <th>Actions</th>
        </tr>
        </thead>


        <tbody>
        <c:forEach items="${list}" var="u">
          <tr>
            <td>
            <span class="custom-checkbox">
              <input type="checkbox" id="checkbox1" name="options[]" value="1">
              <label for="checkbox1"></label>
            </span>
            </td>
            <td>
              <img src="./upload/${u.getImg()}" width="50">
            </td>
            <td>${u.getName()}</td>
            <td>${u.getID()}</td>
            <td>${u.getPW()}</td>
            <td>${u.getEMail()}</td>
            <td>${u.getGender()}</td>
            <td>${u.getBirthday()}</td>
            <td>
              <a href="#editEmployeeModal" class="edit" data-toggle="modal">
                <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
              </a>
              <a href="#deleteEmployeeModal" class="delete" data-toggle="modal">
                <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>

        <!--<tbody>
        <tr>
          <td>
            <span class="custom-checkbox">
              <input type="checkbox" id="checkbox1" name="options[]" value="1">
              <label for="checkbox1"></label>
            </span>
          </td>
          <td>Park Hanmin</td>
          <td>im_hanmin_2</td>
          <td>1234</td>
          <td>hanmin0786@handong.ac.kr</td>
          <td>Male</td>
          <td>2003-10-07</td>
          <td>
            <a href="#editEmployeeModal" class="edit" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
            </a>
            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
            </a>
          </td>
        </tr>
        <tr>
          <td>
                  <span class="custom-checkbox">
                    <input type="checkbox" id="checkbox2" name="options[]" value="1">
                    <label for="checkbox2"></label>
                  </span>
          </td>
          <td>SeungHoon Jung</td>
          <td>seungHoonJung</td>
          <td>1234</td>
          <td>21800665@handong.ac.kr</td>
          <td>Male</td>
          <td>1998-03-28</td>
          <td>
            <a href="#editEmployeeModal" class="edit" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
            </a>
            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
            </a>
          </td>
        </tr>
        <tr>
          <td>
                  <span class="custom-checkbox">
                    <input type="checkbox" id="checkbox3" name="options[]" value="1">
                    <label for="checkbox3"></label>
                  </span>
          </td>
          <td>Yeji Song</td>
          <td>yejiSong</td>
          <td>1234</td>
          <td>22100396@handong.ac.kr</td>
          <td>Female</td>
          <td>2001-04-21</td>
          <td>
            <a href="#editEmployeeModal" class="edit" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
            </a>
            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
            </a>
          </td>
        </tr>
        <tr>
          <td>
                  <span class="custom-checkbox">
                    <input type="checkbox" id="checkbox4" name="options[]" value="1">
                    <label for="checkbox4"></label>
                  </span>
          </td>
          <td>Gildong Hong</td>
          <td>redLoadBronze</td>
          <td>1234</td>
          <td>redLoadBronze@handong.ac.kr</td>
          <td>Male</td>
          <td>1000-01-01</td>
          <td>
            <a href="#editEmployeeModal" class="edit" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
            </a>
            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
            </a>
          </td>
        </tr>
        <tr>
          <td>
                  <span class="custom-checkbox">
                    <input type="checkbox" id="checkbox5" name="options[]" value="1">
                    <label for="checkbox5"></label>
                  </span>
          </td>
          <td>Amugea Kim</td>
          <td>blahblahKim</td>
          <td>1234</td>
          <td>blahblahKim@handong.ac.kr</td>
          <td>Female</td>
          <td>2022-12-31</td>
          <td>
            <a href="#editEmployeeModal" class="edit" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
            </a>
            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal">
              <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
            </a>
          </td>
        </tr>
        </tbody>
        -->

      </table>
      <div class="clearfix">
        <ul class="pagination">
          <li class="page-item disabled">
            <a href="#">back</a>
          </li>
          <li class="page-item">
            <a href="#" class="page-link">1</a>
          </li>
          <li class="page-item">
            <a href="#" class="page-link">2</a>
          </li>
          <li class="page-item active">
            <a href="#" class="page-link">3</a>
          </li>
          <li class="page-item">
            <a href="#" class="page-link">4</a>
          </li>
          <li class="page-item">
            <a href="#" class="page-link">5</a>
          </li>
          <li class="page-item">
            <a href="#" class="page-link">Next</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>

<!-- Add Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <form name="myForm" action="add_ok.php" onsubmit="return validateFrom()" method="post">
        <div class="modal-header">
          <h4 class="modal-title">Add User</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
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
          <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
          <input type="submit" class="btn btn-success" value="Add">
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Edit Modal HTML-->
<div id="editEmployeeModal" class="modal fade">


  <div class="modal-dialog">
    <div class="modal-content">
      <form name="myForm" action="edit_ok.jsp" onsubmit="return validateFrom()" method="post">
        <div class="modal-header">
          <h4 class="modal-title">Edit User</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Name</label>
            <input type="text" class="form-control" name="name" autofocus="autofocus" required  >
          </div>
          <div class="form-group">
            <label>User ID</label>
            <input type="text" class="form-control" name="uid" required  >
          </div>
          <div class="form-group">
            <label>Password</label>
            <input type="password" name="pw" class="form-control" placeholder="type over 4 letters" pattern="*{4,20}" required  >
          </div>
          <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required  >
          </div>
          <div class="form-group">
            <label>Gender</label>
            <!--이거어케해???-->
            <tmp class="form-control">
              <input type="radio" name="gender" value="Female" style="float: right; margin: 5px;">
              <label style="color: black; font-weight: normal; margin-left: 10px; float: right">Female</label>
              <input type="radio" name="gender" value="Male" checked style="float: right; margin: 5px">
              <label style="color: black; font-weight: normal; margin-left: 10px; float: right">Male</label>
            </tmp>
          </div>
          <div class="form-group">
            <label>Birth day</label>
            <input type="date" class="form-control" name="birthday" min="1900-01-01" max="2022-10-15" >
          </div>
          <div class="form-group">
            <label>Photo</label>
            <img src="./upload/ham1.png" width="100" height="100" style="display: block">
            <input type="file" name="img" class="form-control" required>


          </div>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
          <input type="submit" class="btn btn-info" value="Save">
        </div>
      </form>
    </div>
  </div>
</div>


<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <form>
        <div class="modal-header">
          <h4 class="modal-title">Delete User(s)</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">
          <p>Are you sure you want to delete these Records?</p>
          <p class="text-warning">
            <small>This action cannot be undone.</small>
          </p>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
          <input type="submit" class="btn btn-danger" value="Delete">
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>