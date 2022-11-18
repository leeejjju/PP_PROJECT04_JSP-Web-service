<%--
  Created by IntelliJ IDEA.
  User: Pearl LEE
  Date: 2022-11-15
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.pp_project04_jspwebservice.dao.UsersDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.pp_project04_jspwebservice.bean.UsersVO" />
<jsp:setProperty property="*" name="u"/>

<%
    UsersDAO userDAO = new UsersDAO();
    int i = userDAO.insertUser(u);
    String msg = "데이터 추가 성공 !";
    if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
    alert('<%=msg%>');
    location.href='indexCRUD.jsp';
</script>