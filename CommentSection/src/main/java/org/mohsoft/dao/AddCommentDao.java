package org.mohsoft.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.mohsoft.dto.User;
 
public class AddCommentDao {
 
    public void add(String text, User user ) throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:h2:tcp://localhost/~/test";
        String dbUser = "sa";
        String dbPassword = "";
 
        text  =text;
        
        Class.forName("org.h2.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "\r\n"
        		+ "insert into comments (name, email, subject,submittime,status) values"
        		+ " ( ?, ? , ?, LOCALTIMESTAMP, 'ACTIVE')";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, user.getFullname());
        statement.setString(2, user.getEmail());
        statement.setString(3, text);
        
        statement.executeUpdate ();

        connection.close();

    }
}