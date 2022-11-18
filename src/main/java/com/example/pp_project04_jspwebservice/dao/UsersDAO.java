package com.example.pp_project04_jspwebservice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.pp_project04_jspwebservice.bean.UsersVO;
import com.example.pp_project04_jspwebservice.util.JDBCUtil;

public class UsersDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String USERS_INSERT = "INSERT INTO users (name, uid, pw, email, gender, birthday, img) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private final String USERS_UPDATE = "UPDATE users SET name=?, uid=?, pw=?, email=?, gender=?, birthday=?, img=? where id=?";
    private final String USERS_DELETE = "DELETE FROM users  WHERE id=?";
    private final String USERS_GET = "SELECT * FROM users  WHERE id=?";
    private final String USERS_LIST = "SELECT * FROM users ORDER BY id ASC";
    private final String USERS_FILE = "SELECT img FROM users  WHERE id=?";

    public int insertUser(UsersVO vo) {
        System.out.println("===> JDBC로 insertUser() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USERS_INSERT);
            stmt.setString(1, vo.getName());
            stmt.setString(2, vo.getID());
            stmt.setString(3, vo.getPW());
            stmt.setString(4, vo.getEMail());
            stmt.setString(5, vo.getGender());
            stmt.setString(6, vo.getBirthday());
            stmt.setString(7, vo.getImg());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 글 삭제
    public void deleteUser(UsersVO vo) {
        System.out.println("===> JDBC로 deleteUser() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USERS_DELETE);
            stmt.setInt(1, vo.getPK());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updateUser(UsersVO vo) {
        System.out.println("===> JDBC로 updateUser() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USERS_UPDATE);
            stmt.setString(1, vo.getName());
            stmt.setString(2, vo.getID());
            stmt.setString(3, vo.getPW());
            stmt.setString(4, vo.getEMail());
            stmt.setString(5, vo.getGender());
            stmt.setString(6, vo.getBirthday());
            stmt.setString(7, vo.getImg());
            stmt.setInt(8, vo.getPK());

            System.out.println("[UPDATE Info] " + vo.getName() + " - " + vo.getImg() + " | Primary key: " + vo.getPK());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public UsersVO getUser(int id) {
        UsersVO one = new UsersVO();
        System.out.println("===> JDBC로 getUser() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USERS_GET);
            stmt.setInt(1, id);
            rs = stmt.executeQuery(); //쿼리실행 후 결과 받아오기
            if(rs.next()) {
                one.setPK(rs.getInt("id"));
                one.setName(rs.getString("name"));
                one.setID(rs.getString("uid"));
                one.setPW(rs.getString("pw"));
                one.setEMail(rs.getString("email"));
                one.setGender(rs.getString("gender"));
                one.setBirthday(rs.getString("birthday"));
                one.setImg(rs.getString("img"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<UsersVO> getUserList(){
        List<UsersVO> list = new ArrayList<UsersVO>();
        System.out.println("===> JDBC로 getUserList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USERS_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                UsersVO one = new UsersVO();
                one.setPK(rs.getInt("id"));
                one.setName(rs.getString("name"));
                one.setID(rs.getString("uid"));
                one.setPW(rs.getString("pw"));
                one.setEMail(rs.getString("email"));
                one.setGender(rs.getString("gender"));
                one.setBirthday(rs.getString("birthday"));
                one.setImg(rs.getString("img"));
                //one.setCnt(rs.getInt("cnt"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getFilename(int id) {
        String filename = null;

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USERS_FILE);
            stmt.setInt(1, id);
            rs = stmt.executeQuery(); //쿼리실행 후 결과 받아오기
            if(rs.next()) {
                filename = rs.getString("img");
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("===> JDBC로 getFilename() 기능 처리");
        return filename;
    }


}
