<%-- 
    Document   : logout
    Created on : 24 Sep, 2019, 5:44:19 PM
    Author     : DELL
--%>
<% 
    session.removeAttribute("role");
    session.removeAttribute("emailid");
    session.invalidate();
    session=null;
    response.sendRedirect("index.jsp");
%>