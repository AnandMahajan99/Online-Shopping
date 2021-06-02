<%-- 
    Document   : searchCustomer
    Created on : 16 Sep, 2019, 7:11:59 PM
    Author     : DELL
--%>

<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Customer</title>
    </head>
    <body>
        <center>
           <h1 style="margin-top: 30px">Search Customer Details</h1>
           <form action="searchCustomer.jsp" method="post" style="margin-top: 30px">
               <h3>Enter Customer Id</h3><input type="text" name="txtid"><br/><br/>
               <button type="submit" value="search">Search</button>
           </form> 
           <br/><br/><h1>OR</h1><br/><br/>
           <form action="searchCustomer.jsp" method="post">
               <h3>Enter Customer EmailId</h3><input type="email" name="txtemailid"><br/><br/>
               <button type="submit" value="search">Search</button>
           </form> 
           <%
        Customer C=null;
        String sid=null;
        String emailid=null;
        int id;
        sid=request.getParameter("txtid");
        emailid=request.getParameter("txtemailid");
        try
        {
           if(sid != null || emailid!=null)
           {
               if(sid!=null)
               {
                 id = Integer.parseInt(sid);
                 C = CustomerDAO.searchCustomerByid(id);
               }
               else if(emailid!=null)
               {
                 C = CustomerDAO.searchCustomerByemailid(emailid);
               }
              if(C != null)
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
            
        <%
                 out.println("</table>");
              }
              else
                 out.println("<h1>No Record Found</h1>");
           }
        }
        catch(Exception e)
        {
            out.println(e);
        }
        %>
        </center>
    </body>
</html>
