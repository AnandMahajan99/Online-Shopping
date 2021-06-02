<%-- 
    Document   : displayProductByCategory
    Created on : 26 Sep, 2019, 7:59:09 PM
    Author     : DELL
--%>

<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
         String categoryname = request.getParameter("txtcategoryname");
         if(categoryname != null)
         {
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=categoryname%></title>
    </head>
    <script type="text/javascript">
        function alertbox(msg)
        {
            alert(msg);
        }
    </script>
    <body>
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
        <%
        Category C = null;
        byte[] img = null;
        try
        {
           C = CategoryDAO.displayAllProductofCategory(categoryname);
           if(C != null)
           {
        %>
        <div class="new_arrivals_agile_w3ls_info"> 
            <div class="container" >
		<h3 class="wthree_text_info"><%=C.getName()%></h3>  
           <%
               List<Product> list = null;
               list = C.getProduct();
               for(Product P : list)
            {   
                long id = P.getId();
           %>
        		
		<div class="tab1">
		    <div class="col-md-3 product-men">
			<div class="men-pro-item simpleCart_shelfItem">
			    <div class="men-thumb-item">
			        <img src="<%=P.getImage()%>" width="255px" height="250px"/>
				<div class="men-cart-pro">
				    <div class="inner-men-cart-pro">
					<a href="#" class="link-product-add-cart">View</a>
				    </div>
				</div>
				<span class="product-new-top">New</span>
			    </div>
			    <div class="item-info-product ">
				<h4><a href="#"><%=P.getName()%></a></h4>
			        <div class="info-product-price">
				    <span class="item_price">Rs<%=P.getPrice()-P.getDiscount()%></span>
				    <del>Rs<%=P.getPrice()%></del>
				</div>
                                <div>
                                       <%=P.getDescription()%>
                                </div>
                                       <% double price=P.getPrice()-P.getDiscount();%>
				<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
				    <form action="AddCartitem" method="post">
					<fieldset>
                                            <input type="hidden" name="txtproductid" value="<%=P.getId()%>">
                                            <input type="hidden" name="txttotal" value="<%=price%>">
				            <input type="submit" name="submit" value="Add to cart" class="button" />
					</fieldset>
				    </form>
				</div>
                                <div class="snipcart-details button2">
				    <form action="AddCartitem" method="post">
					<fieldset>
                                            <input type="hidden" name="txtproductid" value="<%=P.getId()%>">
                                            <input type="hidden" name="txttotal" value="<%=price%>">
					    <input type="submit" name="submit" value="Order Now" class="button" style="background-color : red" />
					</fieldset>
				    </form>
				</div>
		            </div>
		        </div>
		    </div>
                    <div class="col-md-1"></div>
        <%
             }
           }
        else
            out.println("<center><h1 style='margin-top:50px; margin-bottom:200px;'>No Product Found</h1>");
        }
        catch(Exception e)
        {
            out.println(e);
        }
        %>
        
        <div class="clearfix"></div>
		</div>
            </div>
        </div>
    </div>
    </div>
 </div>
</div>
<%
               String msg = null;
               msg = request.getParameter("message");
               if(msg != null)
               {
                  out.println("<script>alertbox('"+msg+"');</script>");
               }
%>
<jsp:include page="footer.html"/>
    <%
         }
         else
             response.sendRedirect("index.jsp");
    %>
</body>
</html>
