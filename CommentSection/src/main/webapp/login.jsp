<%@ page import="org.mohsoft.dto.User" %>
    

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
    <div id="loginForm" class="container loginForm" style = " margin-top: 50px;">

     <div style="text-align: left">
        <h1>User Login</h1>
        <form action="LoginServlet" method="post">
            <label for="email">Email:</label>
            <input name="email" size="30" />
            <br><br>
            <label for="password">Password:</label>
            <input type="password" name="password" size="30" required />
            <br>${message}
            <br><br>           
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <span id="currentUser"></span>
    </div>
    </div>

	<script>
<% User user = (User) request.getSession().getAttribute("adminUser");%>
	var userObj='<%=user%>';
				
    if (userObj!="null")
	{
	var strong  = document.createElement("strong")
	strong.innerText = "This will disconnect the Admin"
	document.querySelector("#currentUser").append(strong);
	}
		
	
</script>
<script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>