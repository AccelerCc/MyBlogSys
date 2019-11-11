package com.zero.users;

public class ContentsCategory {
    private int num = 0;
    private String contCategory;

    @Override
    public String toString() {
        return "ContentsCategory{" +
                "num=" + num +
                ", contCategory='" + contCategory + '\'' +
                '}';
    }

    public int getNum() {
        return num;
    }

    public void setNum() {
        this.num++;
    }

    public String getContCategory() {
        return contCategory;
    }

    public void setContCategory(String contCategory) {
        this.contCategory = contCategory;
    }
}
