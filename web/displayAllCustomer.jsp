<%-- 
    Document   : displayAllCustomer
    Created on : 17 Sep, 2019, 5:05:15 PM
    Author     : DELL
--%>

<%@page import="dao.CustomerDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display All Customer</title>
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
        <center>
           <h1 style="margin-top: 30px">All Customer Details</h1> 
           <%
        List<Customer> list = null;

        try
        {
            list = CustomerDAO.displayAllCustomer();
              if(list != null)
              {
         %>
              <center>
                <table border="1" class="table table-responsive center" style="text-size:3em">
                  <thead class="">
                     <tr>
                        <th scope="col">Id</th>
                        <th scope="col">FirstName</th>
                        <th scope="col">LastName</th>
                        <th scope="col">EmaiId</th>
                        <th scope="col">MobileNo.</th>
                        <th scope="col">Gender</th>
                        <th scope="col">State</th>
                        <th scope="col">City</th>
                        <th scope="col">Address</th>
                        <th scope="col">PostalCode</th>
                        <th scope="col"></th>
                     </tr>
                  </thead>
                  <tbody>
                      <%
                           for(Customer C : list)
                           {
                       %>
                     <tr>
                         <td><%= C.getId() %></td>
                         <td><%= C.getFirstname() %></td>
                         <td><%= C.getLastname()%></td>
                         <td><%= C.getEmailid() %></td>
                         <td><%= C.getMobileno() %></td>
                         <td><%= C.getGender() %></td>
                         <td><%= C.getState() %></td>
                         <td><%= C.getCity() %></td>
                         <td><%= C.getAddress() %></td>
                        <td><%= C.getPostalcode() %></td>
                          <td>
                              <a href="#"><button>Delete</button></a><br/><br/>
                              <a href="#"><button>Edit</button></a>
                          </td>
                     </tr>
                  </tbody>
            
        <%                  }
              }
              else
                  out.println("No Record Exist");
        }
        catch(Exception e)
        {
            out.println(e);
        }
        }
        else
            response.sendRedirect("index.jsp");
        %>
        </center>
        <jsp:include page="footer.html"/>
    </body>
</html>
