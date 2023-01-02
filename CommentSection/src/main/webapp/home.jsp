<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "org.mohsoft.dto.Comment"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Comment Section</title>

    <link href="css/bootstrap.css" rel="stylesheet">

    <link href="css/style.css" rel="stylesheet">

  </head>
  <body>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">Comment Section</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="home.jsp">Home</a></li>
                <li><a href="userPage.jsp">user</a></li>
            <li><a href="adminPage.jsp">admin</a></li>
          </ul>
        </div>
      </div>
    </div>
  
    <div class="container" style = " margin-top: 50px;">
      <section id="home">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                        <h2>Log in Info</h2>
                        <p class="lead">The database is prepopulated with one admin account and 2 user accounts.</p>
                        <ul>
                            <li>The admin log in is: admin@gmail.com Password: admin </li>
                            <li>User one john Email: john@gmail.com Password: john</li>
                            <li>User one jane Email: jane@gmail.com Password: jane</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
      </div>
     <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>