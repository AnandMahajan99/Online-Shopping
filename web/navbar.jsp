
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>

<!-- banner -->
<div class="ban-top">
    <% 
        session = request.getSession();
        String role = (String)session.getAttribute("role");
        if(role == "admin")
        {
    %>  
    <div class="container">
	<div class="top_nav_left">
	    <nav class="navbar navbar-default">
	        <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			    <span class="sr-only">Toggle navigation</span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			</button>
		    </div>
		    <!-- Collect the nav links, forms, and other content for toggling -->               
		    <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
		        <ul class="nav navbar-nav menu__list">
                            <li class=" menu__item"><a class="menu__link" href="index.html">Home</a></li>
			    <li class="dropdown menu__item">
				<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Services <span class="caret"></span></a>
				<ul class="dropdown-menu multi-column columns-3">
				    <div class="agile_inner_drop_nav_info">
                                        <div class="col-sm-3 multi-gd-img">
					    <ul class="multi-column-dropdown">
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                            </ul>
					</div>
					<div class="col-sm-3 multi-gd-img">
					    <ul class="multi-column-dropdown">
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                            </ul>
					</div>
                                        <div class="col-sm-3 multi-gd-img">
					    <ul class="multi-column-dropdown">
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                            </ul>
					</div>
                                        <div class="col-sm-3 multi-gd-img">
					    <ul class="multi-column-dropdown">
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                                <li><a href="">Add Product</a></li>
                                            </ul>
					</div>
					<div class="clearfix"></div>
				    </div>
				</ul>
			    </li>
                            <li class=" menu__item"><a class="menu__link" href="logout.jsp">Logout</a></li>
			</ul>
		    </div>
	        </div>
	    </nav>	
        </div>
    </div>
    <%
        }
        else
        {
    %>
    <div class="container">
	<div class="top_nav_left">
	    <nav class="navbar navbar-default">
	        <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			    <span class="sr-only">Toggle navigation</span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
			    <span class="icon-bar"></span>
		        </button>
		    </div>
		    <!-- Collect the nav links, forms, and other content for toggling -->               
		    <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav menu__list">
                            <li class=" menu__item"><a class="menu__link" href="index.jsp">Home</a></li>
			    <li class="dropdown menu__item">
			        <a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Category <span class="caret"></span></a>
				<ul class="dropdown-menu multi-column columns-3">
				    <div class="agile_inner_drop_nav_info">
					<%
                                            List<Category> list = null;
                                            list = CategoryDAO.displayAllCategory();
                                            for(Category C : list)
                                            {
                                        %>
					<div class="col-sm-3 multi-gd-img">
					    <ul class="multi-column-dropdown">
						<li><a href="displayProductByCategory.jsp?txtcategoryname=<%=C.getName()%>"><%=C.getName()%></a></li>
					    </ul>
					</div>
                                        <%
                                            }
                                        %>
                                        <div class="clearfix"></div>
				    </div>
				</ul>
			    </li>
                            <% 
                                session = request.getSession();
                                String emailid = (String)session.getAttribute("emailid");
                                if(emailid == null)
                                {
                            %>                    
                            <li class=" menu__item"><a class="menu__link" href="register.jsp">Register</a></li>
                            <li class=" menu__item"><a class="menu__link" href="login.jsp">Login</a></li>
                            <%
                                }
                                else
                                {
                            %>
                            <li class=" menu__item"><a class="menu__link" href="logout.jsp">Logout</a></li>
                            <li class=" menu__item"><a class="menu__link" href="profile.jsp">View Profile</a></li>
                            <%
                                }
                            %>
			    <li class=" menu__item"><a class="menu__link" href="about.html">About</a></li>
			    <li class=" menu__item"><a class="menu__link" href="contact.html">Contact</a></li>
		        </ul>
		    </div>
		</div>
	    </nav>	
	</div>
	<div class="top_nav_right">
	    <div class="wthreecartaits wthreecartaits2 cart cart box_1"> 
	        <form action="cart.jsp" method="post" class="last">
                    <%
                        String query = request.getQueryString();
                        if(query != null)
                        {
                            
                           query = query.replaceAll("%20", " ");
                        %>
                    <input type="hidden" value="<%=request.getRequestURI()+"?"+query%>" name="page"/>
                    <%
                        }
                        else
                        {  
                    %>
                    <input type="hidden" value="<%=request.getRequestURI()%>" name="page"/>
                    <%
                    }
%>
		    <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
	        </form> 
            </div>
	</div>
	<div class="clearfix"></div>
    </div>
    <%
        }
    %>
</div>
<!-- //banner-top -->
