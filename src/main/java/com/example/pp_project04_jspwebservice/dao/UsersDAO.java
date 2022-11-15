package com.example.pp_project04_jspwebservice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.pp_project04_jspwebservice.bean.UsersVO;
import com.example.pp_project04_jspwebservice.util.JDBCUtil;
import sun.rmi.server.UnicastServerRef;

public class UsersDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String USERS_INSERT = "INSERT INTO users (name, uid, pw, email, gender, birthday, img) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private final String USERS_UPDATE = "UPDATE users SET name=?, uid=?, pw=?, email=?, gender=?, birthday=?, img=? where id=?";
    private final String USERS_DELETE = "DELETE FROM users  WHERE id=?";
    private final String USERS_GET = "SELECT * FROM users  WHERE id=?";
    private final String USERS_LIST = "SELECT * FROM users ORDER BY id DESC";

    public int insertBoard(UsersVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
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
    public void deleteBoard(UsersVO vo) {
        System.out.println("===> JDBC로 deleteBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USERS_DELETE);
            stmt.setInt(1, vo.getPK());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updateBoard(UsersVO vo) {
        System.out.println("===> JDBC로 updateBoard() 기능 처리");
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


            System.out.println(vo.getName() + "-" + vo.getID() + "-" + vo.getPW() + "- ... -" + vo.getPK() + "updated.");
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public UsersVO getBoard(int seq) {
        UsersVO one = new UsersVO();
        System.out.println("===> JDBC로 getBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USERS_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one.setPK(rs.getInt("id"));
                one.setName(rs.getString("uname"));
                one.setID(rs.getString("uid"));
                one.setPW(rs.getString("pass"));
                one.setEMail(rs.getString("email"));
                one.setGender(rs.getString("gender"));
                one.setBirthday(rs.getString("birth"));
                one.setImg(rs.getString("img"));
                //one.setCnt(rs.getInt("cnt"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<UsersVO> getBoardList(){
        List<UsersVO> list = new ArrayList<UsersVO>();
        System.out.println("===> JDBC로 getBoardList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USERS_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                UsersVO one = new UsersVO();
                one.setPK(rs.getInt("id"));
                one.setName(rs.getString("uname"));
                one.setID(rs.getString("uid"));
                one.setPW(rs.getString("pass"));
                one.setEMail(rs.getString("email"));
                one.setGender(rs.getString("gender"));
                one.setBirthday(rs.getString("birth"));
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
}
