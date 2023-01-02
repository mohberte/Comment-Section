<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "org.mohsoft.dto.Comment"
    %>
    
    <%@ page import="java.util.List" %>
    <%@ page import="org.mohsoft.dto.User" %>
    
<!DOCTYPE html>
<html lang="en">

  <head>
   <link href="css/bootstrap.css" rel="stylesheet">

     <link href="css/style.css" rel="stylesheet">
	
    <title>User Page</title>
  </head>

  <body onload = "displayButton()"> 

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

      <div class="starter-template">
        
              <div class="starter-template">
        <h3>Welcome <b>${customerUser.fullname} (${customerUser.email})</b></h3>
        
        <div style="text-align: left">
        <h3>Please enter your comment here </h3>
        
        <form action="AddCommentServlet" method="post">
            <label for="subject"></label>
            <textarea name="subject" />Enter text here...</textarea>
            <br><br>        
            <button type="submit">Add comment</button>
        </form>
        
         <form action="LogoutServlet" method="get">          
            <button type="submit">Logout</button>
        </form>
        
        <jsp:useBean id="comment2" class="org.mohsoft.dto.Comment" scope="request" >
</jsp:useBean> <br>
<div id ="myTable">
        <%
    if(request.getAttribute("comments")!=null)
			{
    	List<Comment> comments  = (List<Comment>) request.getAttribute("comments");
    	
    	   for(Comment c: comments)
			{
			%>
			
			  <table  class="table table-striped  ">
  <tbody class=" ">
    <tr id="<%=c.getId()%>" class="">
      <td class="row col-xs-1"style="text-align: left;border-style: ;"><%out.println(c.getId());%> </td>
      <td class="row col-xs-2" style="border-style: ;"}><%out.println(c.getEmail());%> </td>
      <td class="row col-xs-8"style="text-align: left;border-style: ;"><%out.println(c.getSubject());%> </td>
      <td class="row col-xs-1"style="text-align: left;border-style: ;"><svg  onclick="deleteFunction('<%=c.getId()%>')" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
		  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
		  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
		</svg> 
	  </td>
    </tr>
  </tbody>
</table>

<% 	}	}
			%> 
   </div>
        </div>
        </div>
        </div>
        </div>
        
         <form style="display: none;" action="CommentServlet" method="post">          
            <button id ="click"  value = "Click" type="submit">Show Comments</button>
        </form>
        <form action="DeleteCommentServlet" method="post">
            <label for="email"></label>
            <input style="display: none;"  id="id" value="permval" name="id" size="30" />          
            <button style="display: none;"  id = "delete" type="submit" class="btn btn-primary">Login</button>
        </form>
    </div><!-- /.container -->

	<script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript">
        function redirect(){
        window.location = "/CommentSection/index.jsp"
        }
</script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var comments = '<%= request.getAttribute("comments") %>';

	if (comments=="null")
		{
		
		document.getElementById("click").click();
		
		}
</script>
 <script>
function deleteFunction (temp){
	document.getElementById("id").value=temp;
	document.getElementById("delete").click();
} 	
</script>
 <script>
function displayButton (){

	if ('<%= ((User)request.getSession().getAttribute("customerUser")).getEmail()%>'!=null)
		{
		var currentEmail ='<%= ((User)request.getSession().getAttribute("customerUser")).getEmail()%>';
	tr = document.getElementById("myTable").getElementsByTagName("tr");
for (i = 0; i < tr.length; i++) {
		
		var currentUser = tr[i].childNodes[3].textContent.substring(0,tr[i].childNodes[3].textContent.length-2));
	
		
	  if(currentUser != currentEmail)
	  {
		  tr[i].childNodes[7].style.visibility = "hidden"; 
	  } 
  }
} 
	
	}
</script>
<script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>

  </body>
</html>