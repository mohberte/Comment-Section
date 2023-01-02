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

    <div class="container " style = " margin-top: 50px;">

      <section id="index">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                        <h2>How it works !</h2>
                        <p class="lead">You can log in using one of the accounts provided and start posting comments</p>
                        <ul>
                            <li>This boostrap theme was a free design found on the internet</li>
                            <li>The login and comment features were all implemented by me</li>
                            <li>Added some javascript to dynamically display the comments once you log in</li>
                            <li> The login is enforced using a user filter and an admin filter</li>
                        	<li>The user can add, remove or edit his own comments</li>
                            <li>The admin can delete any comment</li>
                       
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