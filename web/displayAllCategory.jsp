<%-- 
    Document   : displayAllCategory
    Created on : 30 Aug, 2019, 4:51:48 PM
    Author     : DELL
--%>
<%@page import="dao.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        session = request.getSession();
        String role = (String)session.getAttribute("role");
        if(role == "admin")
        {
        %>  

        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
        <%
        List<Category> list=null;
      
        try
        {
           list = CategoryDAO.displayAllCategory();
           if(list != null)
           {
         %>
         <center>
             <h1 style="margin-top: 30px">All Categories</h1>
             <table class="table table-bordered table-dark table-hover" style="margin-top: 30px">
                 <thead class="thead-dark">
                     <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">LastUpdate</th>
                    <th scope="col"></th>
                </tr>
                 </thead>
          <%
            for(Category C: list)
            {    
                Category C1=new Category();
                
           %>
           <tbody>
                <tr>
                    <td><%= C.getId() %></td>
                    <td><%= C.getName() %></td>
                    <td>
                        <%= C.getLastupdatedate().toLocalDate() %>
                        <%= C.getLastupdatetime().toLocalTime() %>
                    </td>
                    <td>
                        <a href='DeleteCategory?txtid=<%=C.getId()%>'><button class="btn btn-primary"> Delete </button></a><br/><br/>
                        <a href="#"><button class="btn btn-primary"> Edit </button></a>
                    </td>
                </tr>
           </tbody>
        <%
            }
            out.println("</table>");
         }
        else
            out.println("<h1>No Category Found</h1>");
      }
        catch(Exception e)
        {
            out.println(e);
        }
        }
        else
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
