package com.ENotes.DAO;

import com.ENotes.Entity.User;
import com.ENotes.Util.DbConnectionProvider;

import java.sql.*;

public class UserDao {

    Connection con;

    public boolean registerUser(String uname,String email, String pass){

       try{
           con = DbConnectionProvider.getConnection();

           PreparedStatement ps = con.prepareStatement("insert into user(uname,email,password) values(?,?,?)");
           ps.setString(1,uname);
           ps.setString(2,email);
           ps.setString(3,pass);

           ps.executeUpdate();


       } catch (SQLException throwables) {
           throwables.printStackTrace();

           return false;
       }

       return true;


    }

    public boolean validateUser(String email, String pass){

        try{
            con = DbConnectionProvider.getConnection();

            PreparedStatement ps = con.prepareStatement("select password from user where email = ?");
            ps.setString(1,email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                if(rs.getString(1).equals(pass)){
                    return true;
                }
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }


        return false;


    }

    public User getUser(String email){

        User user = new User();

        try{
            con = DbConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from user where email = ?");
            ps.setString(1,email);

            ResultSet rs = ps.executeQuery();


          if(rs.next()){
               user.setuId(rs.getInt("userId"));
               user.setEmail(rs.getString("email"));
               user.setPassword(rs.getString("password"));
               user.setUname(rs.getString("uname"));
           }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return  user;

    }


    public String getUserId(String uname){

        String uId="";

        try{
            con = DbConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement("select userId from user where uname = ?");
            ps.setString(1,uname);

            ResultSet rs = ps.executeQuery();


            while(rs.next()){
                uId = rs.getString(1);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return  uId;

    }


}
