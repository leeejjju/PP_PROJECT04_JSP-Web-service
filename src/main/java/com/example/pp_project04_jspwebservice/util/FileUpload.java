package com.example.pp_project04_jspwebservice.util;
import com.example.pp_project04_jspwebservice.bean.UsersVO;
import com.example.pp_project04_jspwebservice.dao.UsersDAO;
import jdk.nashorn.internal.ir.RuntimeNode;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

import com.oreilly.servlet.* ;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUpload {
    //회원정보 추가시 첨부파일 저장, 실제 저장명을 DB에 전송
    //회원정보 수정시 다른파일을 새로 올린다면 기존파일 삭제, 새로 올릴 파일이 엉ㅄ다면 기존파일명 유지
    //회원정보 삭제시 첨부파일이 있다면 함께 삭제

    public UsersVO uploadPhoto(HttpServletRequest request){
        String filename = ""; //업로드되는 파일명
        int sizeLimit = 15*1024*1024; //최대파일크기 15MB

        //실제로 서버에 저장되는 path를 upload로 정한다.
        String realPath = request.getServletContext().getRealPath("upload");
        System.out.println("real path is " + realPath);
        File dir = new File(realPath); //파일 핸들러...?인가?

        if(!dir.exists()) dir.mkdirs();//혹시 저장될 경로가 없으면 생성한다.

        UsersVO one = null; //파일명을 포함할 유저 객체...?
        MultipartRequest multipartRequest = null;

        try{
            //파일 업로드 처리
            //파라미터: 리퀘스트, 파일저장경로, 최대용량, 인코딩, 중복파일명에 대한 규칙
            //DefaultFileRenamePolicy(): 중복 이름이 존재할 경우 뒤에 숫자 붙여서 어쩌구.
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            //img라는 이름으로 전송되어 업로드된 파일 이름을 가져옴.
            filename = multipartRequest.getFilesystemName("img");

            one = new UsersVO();
            String id = multipartRequest.getParameter("id"); //있을수도(edit의 hidden input) 없을수도(add)
            if(id != null && !id.equals("")) one.setPK(Integer.parseInt(id)); //edit용 처리인 듯. else는 add case, id가 없고 새로 생성될 것.

            one.setName(multipartRequest.getParameter("name"));
            one.setID(multipartRequest.getParameter("uid"));
            one.setPW(multipartRequest.getParameter("pw"));
            one.setEMail(multipartRequest.getParameter("email"));
            one.setGender(multipartRequest.getParameter("gender"));
            one.setBirthday(multipartRequest.getParameter("birthday"));

            System.out.println("[File] "+ one.getName() + "'s PK is " + one.getPK());


            if( id != null && !id.equals("")){ //edit case
                UsersDAO dao = new UsersDAO();
                String oldfilename = dao.getFilename(Integer.parseInt(id)); //만약 이미지를 새로 첨부 안 하면, 기존거를 가져와서 다시 넣어줄라구...
                if(filename != null && oldfilename != null){ //원래도 있었는데 새로 등록했으면
                    FileUpload.deleteFile(request, oldfilename); //원래거 지우기. (새로 넣을거니께)
                }else if(filename == null && oldfilename != null){ //원래 있었고 새로 안등록했으면
                    filename = oldfilename; //원래거 다시 넣기
                }
            }
            one.setImg(filename); //최종적으로 filename에 남아있는걸 유저 객체에 넣어주고

        }catch (IOException e){
            e.printStackTrace();
        }
        return one; //리턴함니다
    }

    //서버 디렉토리에서 인자로 받은 파일명에 해당하는걸 지워줌 (위 메서드에서 콜할거임)
    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");
        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }
}
