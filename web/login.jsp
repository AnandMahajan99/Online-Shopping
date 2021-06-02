<%-- 
    Document   : login
    Created on : 1 Oct, 2019, 6:12:42 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <script language="javascript">
               function a()
               {
                   setTimeout(function(){
                       $('#div1').fadeOut('fast');
                   },3000);
                  
               }
        </script>
    </head>
    <body onload="a()">
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
        <%
            String msg = null;
            msg = request.getParameter("message");
            if(msg != null)
            {
        %>
        <div  id="div1" class="alert alert-danger alert-dismissible">
            <a class="close" data-dismiss="alert" aria-lable="close">&times;</a>
            <p id="msg1"><%=msg%></p>  
        </div>
        <%
            }
        %>
        <center style="margin: 120px">
          <h1 style="margin: 50px">Login</h1>
        <form action="CheckLogin" method="post">
            Enter Email Id <input type="email" name="txtemailid" required autofocus/><br/><br/>
            Enter Password <input type="password" name="txtpassword" required/><br/><br/>
            <button type="submit" value="login">Login</button>
            <button type="reset" value="reset">Reset</button>
        </form>
          <h1 id="msg1"></h1>
        </center>
        
        <jsp:include page="footer.html"/>
    </body>
</html>
