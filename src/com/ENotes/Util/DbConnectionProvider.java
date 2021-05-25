package com.ENotes.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionProvider {
    private static Connection con=null;

    public static Connection getConnection(){

        try{
            if(con == null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes","root","root");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


        return con;

    }
}
