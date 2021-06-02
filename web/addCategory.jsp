<%-- 
    Document   : addCategory
    Created on : 28 Aug, 2019, 1:45:08 PM
    Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category Page</title>
    </head>
    <body>
    <center>
        Enter Category Data<br>
        <form action="AddCategory" method="post">
            Category Name  <input type="text" name="txtname"><br>
            <button type="submit" value="submit">Add</button>
        </form>
        <%
               String msg = null;
               msg = request.getParameter("message");
               if(msg != null)
                  out.println("<h2>"+msg+"<h2>");
         %>
    </center>
    </body>
</html>
