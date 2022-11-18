package com.example.pp_project04_jspwebservice.bean;


public class UsersVO {
    private int id;
    private String name;
    private String uid;
    private String pass;
    private String email;
    private String gender;
    private String birthday;

    private String img;

    public int getPK() {
        return id;
    }
    public void setPK(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getID() {
        return uid;
    }
    public void setID(String uid) {
        this.uid = uid;
    }
    public String getPW() {
        return pass;
    }
    public void setPW(String pass) {
        this.pass = pass;
    }
    public String getEMail() {
        return email;
    }
    public void setEMail(String email) {
        this.email = email;
    }
    public String getGender(){ return gender;}
    public void setGender(String gender){this.gender = gender;}
    public String getBirthday() {
        return birthday;
    }
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
    public String getImg(){return img;}
    public void setImg(String img){this.img = img;}


}
