<%--
  Created by IntelliJ IDEA.
  User: Pearl LEE
  Date: 2022-11-04
  Time: 오전 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>leeejjju-fomr_ok</title>
</head>

<body>

<h2>입력하신 데이터는 다음과 같습니다.</h2><br/>
<%
  request.setCharacterEncoding("UTF-8");

  String uname = request.getParameter("uname");
  String uid = request.getParameter("uid");
  String pass = request.getParameter("pass");
  String email = request.getParameter("email");
  String edomain = request.getParameter("edomain");
  String gender = request.getParameter("gender");
  String birth = request.getParameter("birth");
  String pnum = request.getParameter("pnum");
  String address = request.getParameter("address");
  String yakOK = request.getParameter("yakOK");
  String infoOK = request.getParameter("infoOK");


  out.println("이름 : " + uname + "<br />");
  out.println("아이디 : " + uid + "<br />");
  out.println("비밀번호 : " + pass + "<br />");
  out.println("이메일 : " + email + "@" + edomain + "<br />");
  out.println("성별 : " + gender + "<br />");
  out.println("생년월일 : " + birth + "<br />");
  out.println("휴대전화 : " + pnum + "<br />");
  out.println("주소 : " + address + "<br />");



  out.println("약관동의 : " + yakOK + "<br />");
  out.println("정보제공동의 : " + infoOK + "<br />");


%>


</body>
</html>
