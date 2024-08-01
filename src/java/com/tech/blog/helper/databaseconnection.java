/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;
import java.sql.*;

/**
 *
 * @author lalit
 */
/*public class databaseconnection {
    public static Connection con;
    public static Connection getConnection(){
        try{
            if(con==null){
                //load driver
                Class.forName("com.mysql.jdbc.Driver");
                //create connection
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}*/
public class databaseconnection{
    private static Connection con;
    public static Connection getConnection(){
        try{
            if(con==null){
                Class.forName("com.mysql.jdbc.Driver");
                //connection
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","");
            }    
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}