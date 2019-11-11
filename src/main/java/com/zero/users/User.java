package com.zero.users;

public class User {
    private int code;
    private String userName;
    private String id;
    private String passWord;
    private String email;
    private int phone;

    public User() {
    }


    public User(String userName, String passWord, String email, int phone) {
        this.userName = userName;
        this.passWord = passWord;
        this.email = email;
        this.phone = phone;
        this.id = userName;
    }

    @Override
    public String toString() {
        return "User{" +
                "code=" + code +
                ", userName='" + userName + '\'' +
                ", id='" + id + '\'' +
                ", passWord='" + passWord + '\'' +
                ", email='" + email + '\'' +
                ", phone=" + phone +
                '}';
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
        this.id = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public void setId(String id) {
        this.id = id;
        this.userName = id;
    }

    public String getId() {
        return id;
    }

}
