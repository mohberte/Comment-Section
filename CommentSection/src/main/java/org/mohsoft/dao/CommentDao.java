package org.mohsoft.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mohsoft.dto.Comment;
 
public class CommentDao {
 
    public List<Comment> retrieveCommnent() throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:h2:tcp://localhost/~/test";
        String dbUser = "sa";
        String dbPassword = "";
 
        Class.forName("org.h2.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        String sql = "SELECT * FROM comments ";
        PreparedStatement statement = connection.prepareStatement(sql);
    
        ResultSet result = statement.executeQuery();
 
        List<Comment> comments = new ArrayList<>();
        Comment comment = null;
 
        while (result.next()) {
            comment = new Comment();
            comment.setEmail(result.getString("email"));
            comment.setId(result.getInt("id"));
            comment.setName(result.getString("name"));
            comment.setSubject(result.getString("subject"));
            comment.setStatus(result.getString("status"));
            comment.setSubmittime(result.getDate("submittime"));
            
            comments.add(comment);
        }
        connection.close();
 
        return comments;
    }
}