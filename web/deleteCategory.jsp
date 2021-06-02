<%-- 
    Document   : deleteCategory
    Created on : 29 Aug, 2019, 5:25:10 PM
    Author     : DELL
--%>

<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Category</title>
        <script language="javascript">
            function check()
            {
                var id=document.getElementById("id").value;
                if(id==null || id=="")
                {
                    document.getElementById("msg1").innerHTML="Id can,t be null";
                    return false;
                }
                if(isNaN(id))
                {
                  document.getElementById("msg1").innerHTML="Enter numeric value only";
                  return false;
                }  
                return true;
            }
        </script>
    </head>
    <body>
       <center>
           <h1>Delete Category By Id</h1>
           <form action="deleteCategory.jsp" method="post" onsubmit="return check()">
               Enter Category Id<br>
               <input type="text" name="txtid" id="id"><br><br>
               <button type="submit" value="show">show</button>
               <h4 id="msg1"></h4>
           </form>
       <%
        Category C=new Category();
        String name;       
        String sid=null;
        sid=request.getParameter("txtid");
        if(sid != null)
        {
            try 
            {
                int id = Integer.parseInt(sid);
                C=CategoryDAO.searchCategoryById(id);
                if(C != null)
                {
                session.setAttribute("categoryid", C.getId());
        %>        
                <form action=DeleteCategory method=post >
                    <table>
                        <thead>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Time</th>
                        </thead>
                        <tbody>
                            <tr>
                               <td><%=C.getId()%></td>
                               <td><%=C.getName()%></td>
                               <td><%=C.getLastupdatedate().toLocalDate()%></td>
                               <td><%=C.getLastupdatetime().toLocalTime()%></td>
                            </tr>
                            <tr>
                                <td colspan=4>
                                    <center>
                                        <button type=submit value=delete>Delete</button>
                                    </center>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <form action=deleteCategory.jsp method="post">
                    <table>
                        <tr>
                             <td><button type=submit value=cancel>Cancel</button></td>
                        </tr>
                    </table>
                </form>
                <%            
                }
                else
                {
                    out.println("<h1>Record not Found</h1>");
                }          
            }
            catch (Exception e) 
            {
                out.println(e);
            }
        }
               %>
               <%
               String msg = null;
               msg = request.getParameter("message");
               if(msg != null)
                  out.println("<h2>"+msg+"<h2>");
              %>
        </center>
    </body>
</html>
