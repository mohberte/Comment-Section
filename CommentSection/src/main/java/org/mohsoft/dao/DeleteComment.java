package org.mohsoft.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
public class DeleteComment {
 
    public void deleteCommnent(int id) throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:h2:tcp://localhost/~/test";
        String dbUser = "sa";
        String dbPassword = "";
 
        Class.forName("org.h2.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "Delete FROM comments where id=? ";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        statement.executeUpdate();
 
        connection.close();
 
    }
}