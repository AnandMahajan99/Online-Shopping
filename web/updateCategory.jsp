<%-- 
    Document   : updateCategory
    Created on : 31 Aug, 2019, 11:10:01 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Category</title>
    </head>
    <body>
        <center>
            <h1>Update Category</h1><br/>
            <h2>By Id</h2><br/>
                <form action="UpdateCategory" method="post">
                    Enter Category Id <input type="text" name="txtid"><br/>
                    <button type="submit" value="show">Show</button>
                </form>
                <%
                   String msg = null;
                   msg = request.getParameter("message");
                   if(msg != null)
                      out.println("<h2>"+msg+"</h2>");
                %>
        </center>
    </body>
</html>
