package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userdao {
    private Connection con;

    public userdao(Connection con) {
        this.con = con;
    }

    // Method to insert user in database
    public boolean saveuser(User user) {
        boolean f = false;
        try {
            // Query
            String query = "insert into user(name, email, password, gender) values(?, ?, ?, ?)";
            PreparedStatement pstm = this.con.prepareStatement(query);
            pstm.setString(1, user.getName());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getPassword());
            pstm.setString(4, user.getGender());
            pstm.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return f;
    }

    public void saveuser() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public User getuserbynameandemail(String email, String password) {
        User user = null;
        try {
            String query = "select * from user where email = ? and password = ?";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, email);
            pstm.setString(2, password);
            ResultSet set = pstm.executeQuery();

            if (set.next()) {
                user = new User();
                // Data from db
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setRdate(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return user;
    }
    //Update user
    public boolean updateUser( User user){
        boolean f=false;
        try{
            String query="update user set name=?,email=?,password=?,profile=? where id=?";
             PreparedStatement pstm = this.con.prepareStatement(query);
             pstm.setString(1, user.getName());
             pstm.setString(2, user.getEmail());
             pstm.setString(3, user.getPassword());
             pstm.setString(4, user.getProfile());
             pstm.setInt(5, user.getId());
             pstm.executeUpdate();
             f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
