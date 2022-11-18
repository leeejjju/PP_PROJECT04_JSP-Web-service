<%--
  Created by IntelliJ IDEA.
  User: Pearl LEE
  Date: 2022-11-16
  Time: 오전 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import ="java.io.File"%>
<%@page import ="com.example.pp_project04_jspwebservice.util.*"%>
<%@page import ="com.oreilly.servlet.*" %>
<%@page import="com.oreilly.servlet.multipart.*"%>


    <%
    String filename = ""; //업로드되는 파일명
    int sizeLimit = 15*1024*1024; //최대파일크기 15MB

    //실제로 서버에 저장되는 path를 upload로 지정한다
    String realPath = request.getServletContext().getRealPath("upload");
    System.out.println("real path is " + realPath);

    File dir = new File(realPath); //해당 경로에 빈 파일 생성

    //혹시 저장될 경로가 없으면 경로도 생성한다. (TODO: 근데 이게 어ㅔ케하는거지)
    if(!dir.exists()) dir.mkdirs();

    //파일 업로드 처리
    //파라미터: 리퀘스트, 파일저장경로, 최대용량, 인코딩, 중복파일명에 대한 규칙
    //DefaultFileRenamePolicy(): 중복 이름이 존재할 경우 뒤에 숫자 붙여서 어쩌구.
    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    //img라는 이름으로 전송되어 업로드된 파일 이름을 가져옴.
    filename = multipartRequest.getFilesystemName("img");
    //String n = getValue(request.getPart("description"));
    System.out.println(multipartRequest.getParameter("name") + ", " + request.getParameter("name"));
    %>


<html>
<head>
    <title>(hidden)fileUpload-leeejjju</title>
</head>
<body>

<p>
    제발왜이러는거야진짜: <%=multipartRequest.getParameter("name")%><br>
    폼에서 전송된 원래 파일명: <%=multipartRequest.getOriginalFileName("img")%><br>
    업로드한 파일의 경로: ${pageContext.request.contextPath}/upload/<%=filename%><br>
    물리적인 저장경로: <%=realPath%><br>
</p>

<img src="${pageContext.request.contextPath}/upload/<%=filename%>"><br>
    파일명: <%=filename%>

</body>
</html>
