package com.zero.users;

import java.text.SimpleDateFormat;
import java.util.Date;

public class User_Content {
    private int c_id;
    private int u_id;
    private String title;
    private String category;
    private String content;
    private Date up_time;
    private String new_time;
    private String img_url;
    private String author;

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    @Override
    public String toString() {
        return "User_Content{" +
                "c_id=" + c_id +
                ", u_id=" + u_id +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", content='" + content + '\'' +
                ", up_time=" + up_time +
                ", new_time='" + new_time + '\'' +
                ", img_url='" + img_url + '\'' +
                ", author='" + author + '\'' +
                ", dateFormat=" + dateFormat +
                '}';
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getNew_time() {
        return dateFormat.format(up_time);
    }

    public void setNew_time(String new_time) {
        this.new_time = new_time;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getUp_time() {
        return up_time;
    }

    public void setUp_time(Date up_time) {
        this.up_time = up_time;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
