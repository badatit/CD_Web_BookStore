<%@ page import="springmvc.Utils.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="searchUrl" value="/web/api/search" />
<c:url var="detailUrl" value="/web/search" />
<c:url var="searchIssuingCompany" value="/web/api/search/catalog" />
<c:url var="ProductDetail" value="/web/product?page=1&limit=9" />
<c:url var="searchBook" value="/web/api/search/book" />
<c:url var="productURL" value="/web/product" />
<c:url var="APICartUrl" value="/api/carts" />
<c:url var="APIDeleteCartUrl" value="/api/delete" />
<c:url var="accountUrl" value="/web/account" />
<c:url var="adminUrl" value="/admin/home" />
<!DOCTYPE html>
<html>
<head>
<style>
#result {
	position: absolute;
	width: 88%;
	max-width: 870px;
	cursor: pointer;
	overflow-y: auto;
	max-height: 280px;
	box-sizing: border-box;
	z-index: 1001;
}

#result li {
	color: green;
	font-size: 16px;
	border: 0px;
	border-radius: 0px;
}

#result li  span {
	margin-left: 30px;
}

.link-class:hover {
	background-color: #f1f1f1;
	color: red;
}

.input-spinner .input-group-prepend {
	z-index: 3;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<header class="header header-12">
		<div class="header-top">
			<div class="container">
				<div class="header-right">
					<ul class="top-menu">
						<li>
							<ul class="dropdown-links">
							 <li>
							<security:authorize access="hasAnyRole('ADMIN')">
							 <a class="logout" href="${adminUrl}">Page Admin</a>
							 </security:authorize>
							 </li>
							
								<li>
								<security:authorize access="isAuthenticated()">
								 
										<a href="<c:url value='/web/logout'/>">LogOut</a>
									</security:authorize> <security:authorize access="isAnonymous()">
										<a href="<c:url value='/login'/>">Sign in / Sign up</a>
									</security:authorize></li>
							
							</ul>
						</li>
						
						
					</ul>
					
					
					
					<!-- End .top-menu -->
				</div>
				
				<!-- End .header-right -->

			</div>
			<!-- End .container -->
		</div>
		<!-- End .header-top -->

		<div class="header-middle">
			<div class="container">
				<div class="header-left">
					<button class="mobile-menu-toggler">
						<span class="sr-only">Toggle mobile menu</span> <i
							class="icon-bars"></i>
					</button>

					<a href="<c:url value='/web/home'/>" class="logo"> <img
						src="<c:url value='/template/web/assets/images/demos/demo-20/logo.png'/>"
						alt="Molla Logo" width="105" height="25">
					</a>
				</div>
				<!-- End .header-left -->

				<div class="header-right">
					<div
						class="header-search header-search-extended header-search-visible header-search-no-radius">
						<a href="#" class="search-toggle" role="button"><i
							class="icon-search"></i></a> <input type="hidden"
							value="${totalPages}" id="totalPage" name="totalPage" /> <input
							type=hidden class="form-control" name="name" id="name"
							value="${searchName}" />
						<form:form action="/bookstore/web/product" id="formSearch"
							method="get" modelAttribute="searchBookDTO">
							<div class="header-search-wrapper search-wrapper-wide">
								<c:if test="${currentPage == null}">
									<input type="hidden" value="1" id="page" name="page" />
								</c:if>
								<c:if test="${currentPage != null}">
									<input type="hidden" value="${currentPage}" id="page"
										name="page" />
								</c:if>
								<input type="hidden" value="9" id="limit" name="limit" /> <label
									for="q" class="sr-only">Tìm Kiếm</label> <input type="search"
									class="form-control" name="searchName" id="searchName"
									value="${searchName}" placeholder="Tìm kiếm Sản Phẩm...."
									required autocomplete="off" />
								<div class="select-custom">
									<select name="categoryId" id="categoryId">
										<option value="0">Tất Cả</option>
										<c:forEach var="item" items="${categorys}">
											<option value="${item.id }"
												${item.id == categoryId  ? 'selected' : '' }>${item.name }</option>
										</c:forEach>
									</select>
								</div>
								<!-- End .select-custom -->



								<button class="btn btn-primary" type="submit" id="buttonSearch">
									<i class="icon-search"></i>
								</button>
							</div>
							<!-- End .header-search-wrapper -->

							<ul class="list-group" id="result">
								<!-- <li class="list-group link-class">'+value.name+'</li> -->
							</ul>
						</form:form>
					</div>
					<!-- End .header-search -->

					<div class="header-dropdown-link">
						<div class="account">
							<c:if test="${userId != null }">

								<a href="${accountUrl}/${userId}" title="My account">
									<div class="icon">
										<i class="icon-user"></i>
									</div>
									<p><%=SecurityUtils.getPrincipal().getFullName()%></p>
								</a>
							</c:if>

							<security:authorize access="isAnonymous()">

								<a href="<c:url value='/login'/>" title="My account"> 
									<div class="icon">
										<i class="icon-user"></i>
									</div>
									<p>account</p>
									</a>
							</security:authorize>

						</div>
						<!-- End .compare-dropdown -->

						<div class="wishlist">
						
						<c:if test="${userId != null }">
								<a href="${accountUrl}/${userId}" title="Wishlist">
									<div class="icon">
									<i class="icon-heart-o"></i> <span class="wishlist-count badge">${countFavo}</span>
								</div>
								<p>Wishlist</p>
									
								</a>
							</c:if>
							
								<security:authorize access="isAnonymous()">

								<a href="<c:url value='/login'/>" title="Wishlist"> 
								<div class="icon">
									<i class="icon-heart-o"></i> <span class="wishlist-count badge">0</span>
								</div>
								<p>Wishlist</p>
								</a>
							</security:authorize>
							
						</div>
						<!-- End .compare-dropdown -->

						<security:authorize access="isAnonymous()">
							<div class="dropdown cart-dropdown">
								<a href="<c:url value='/login'/>" class="dropdown-toggle">
									<div class="icon">
										<i class="icon-shopping-cart"></i>
										<span class="cart-count">0</span>
									</div>
									<p>Cart</p>
								</a>
							</div>
							<!-- End .cart-dropdown -->
						</security:authorize>


						<security:authorize access="isAuthenticated()">
							<div class="dropdown cart-dropdown">


								<a href="<c:url value='/web/cart/${userId}'/>"
									class="dropdown-toggle" role="button" aria-haspopup="true"
									aria-expanded="false" data-display="static">
									<div class="icon">
										<i class="icon-shopping-cart"></i> <span class="cart-count"
											id="sizeCart">${sizeCart}</span>
									</div>
									<p>Cart</p>
								</a>

								<div class="dropdown-menu dropdown-menu-right" id="bodyCart">

									<div class="dropdown-cart-products" id="cartMini">
										<c:forEach var="item" items="${listCart}">
											<div class="product">
												<div class="product-cart-details">
													<h4 class="product-title">
														<a href="product.html">${item.name}</a>
													</h4>

													<span class="cart-product-info"> <span
														class="cart-product-qty"></span> ${item.amount} x <fmt:formatNumber
															type="number" groupingUsed="true" value="${item.price}" />
													</span>
												</div>
												<!-- End .product-cart-details -->

												<figure class="product-image-container">
													<a href="product.html" class="product-image"> <img
														alt="" src="${item.img1 }">
													</a>
												</figure>
												<a onclick="deleteCart(${item.id})" class="btn-remove"
													title="Remove Product"> <i class="icon-close"></i>
												</a>
											</div>
											<!-- End .product -->
										</c:forEach>
									</div>
									<!-- End .cart-product -->

									<div class="dropdown-cart-total">
										<span>Total</span> <span class="cart-total-price "> <fmt:formatNumber
												type="number" groupingUsed="true" value="${subTotal}" />
										</span><span>đ</span>
									</div>
									<!-- End .dropdown-cart-total -->

									<div style="margin-left: 80px" class="dropdown-cart-action">
										<a href="<c:url value='/web/cart/${userId}'/>"
											class="btn btn-primary">View Cart</a>
									</div>
									<!-- End .dropdown-cart-total -->
								</div>
								<!-- End .dropdown-menu -->
							</div>
							<!-- End .cart-dropdown -->
						</security:authorize>
					</div>
				</div>
				<!-- End .header-right -->
			</div>
			<!-- End .container -->
		</div>
		<!-- End .header-middle -->

		<div class="header-bottom sticky-header">
			<div class="container">
				<div style="background-color: #333; display: flex; width: 100%;">
					<div class="header-left">
						<div class="dropdown category-dropdown">
							<a href="#" class="dropdown-toggle" role="button"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" data-display="static"
								title="Browse Categories"> Categorys </a>

							<div class="dropdown-menu">

								<nav class="side-nav">
									<ul class="menu-vertical sf-arrows">
										<c:forEach var="item" items="${categorys}">
											<li class="item-lead"><a
												href="<c:url value='/web/product?page=1&limit=9&categoryId=${item.id}'/>">${item.name}</a></li>
										</c:forEach>
									</ul>
									<!-- End .menu-vertical -->
								</nav>
								<!-- End .side-nav -->
							</div>
							<!-- End .dropdown-menu -->
						</div>
						<!-- End .category-dropdown -->
					</div>
					<!-- End .header-left -->

					<div class="header-center">

						<nav class="main-nav">
							<ul class="menu sf-arrows">
								<li class="megamenu-container active"><a
									href="<c:url value='/web/home'/>">Home</a></li>
								<li><a href="<c:url value='/web/product?page=1&limit=9'/>"
									class="sf-with-ul">Products</a></li>

								<li><a href="#" class="sf-with-ul">Pages</a>

									<ul>
										<li><a href="about.html" class="sf-with-ul">About</a>

											<ul>
												<li><a href="about.html">About 01</a></li>
												<li><a href="about-2.html">About 02</a></li>
											</ul></li>
										<li><a href="contact.html" class="sf-with-ul">Contact</a>

											<ul>
												<li><a href="contact.html">Contact 01</a></li>
												<li><a href="contact-2.html">Contact 02</a></li>
											</ul></li>
										<li><a href="login.html">Login</a></li>
										<li><a href="faq.html">FAQs</a></li>
										<li><a href="404.html">Error 404</a></li>
										<li><a href="coming-soon.html">Coming Soon</a></li>
									</ul></li>
								<li><a href="blog.html" class="sf-with-ul">Blog</a>

									<ul>
										<li><a href="blog.html">Classic</a></li>
										<li><a href="blog-listing.html">Listing</a></li>
										<li><a href="#">Grid</a>
											<ul>
												<li><a href="blog-grid-2cols.html">Grid 2 columns</a></li>
												<li><a href="blog-grid-3cols.html">Grid 3 columns</a></li>
												<li><a href="blog-grid-4cols.html">Grid 4 columns</a></li>
												<li><a href="blog-grid-sidebar.html">Grid sidebar</a></li>
											</ul></li>
										<li><a href="#">Masonry</a>
											<ul>
												<li><a href="blog-masonry-2cols.html">Masonry 2
														columns</a></li>
												<li><a href="blog-masonry-3cols.html">Masonry 3
														columns</a></li>
												<li><a href="blog-masonry-4cols.html">Masonry 4
														columns</a></li>
												<li><a href="blog-masonry-sidebar.html">Masonry
														sidebar</a></li>
											</ul></li>
										<li><a href="#">Mask</a>
											<ul>
												<li><a href="blog-mask-grid.html">Blog mask grid</a></li>
												<li><a href="blog-mask-masonry.html">Blog mask
														masonry</a></li>
											</ul></li>
										<li><a href="#">Single Post</a>
											<ul>
												<li><a href="single.html">Default with sidebar</a></li>
												<li><a href="single-fullwidth.html">Fullwidth no
														sidebar</a></li>
												<li><a href="single-fullwidth-sidebar.html">Fullwidth
														with sidebar</a></li>
											</ul></li>
									</ul></li>
								<li><a href="elements-list.html" class="sf-with-ul">Elements</a>

									<ul>
										<li><a href="elements-products.html">Products</a></li>
										<li><a href="elements-typography.html">Typography</a></li>
										<li><a href="elements-titles.html">Titles</a></li>
										<li><a href="elements-banners.html">Banners</a></li>
										<li><a href="elements-product-category.html">Product
												Category</a></li>
										<li><a href="elements-video-banners.html">Video
												Banners</a></li>
										<li><a href="elements-buttons.html">Buttons</a></li>
										<li><a href="elements-accordions.html">Accordions</a></li>
										<li><a href="elements-tabs.html">Tabs</a></li>
										<li><a href="elements-testimonials.html">Testimonials</a></li>
										<li><a href="elements-blog-posts.html">Blog Posts</a></li>
										<li><a href="elements-portfolio.html">Portfolio</a></li>
										<li><a href="elements-cta.html">Call to Action</a></li>
										<li><a href="elements-icon-boxes.html">Icon Boxes</a></li>
									</ul></li>
							</ul>
							<!-- End .menu -->
						</nav>
						<!-- End .main-nav -->
					</div>

					<div class="header-right">
						<i class="la la-lightbulb-o"></i>
						<p>Clearance Up to 30% Off</p>
					</div>
					<!-- End .header-right -->
				</div>
			</div>
			<!-- End .container -->
		</div>
		<!-- End .header-bottom -->
	</header>
	<!-- End .header -->

	<script>
$(document).ready(function(){
  $("#formSearch").submit(function(){
	  document.getElementById("page").value = 1;
    
  });
});
</script>

	<script>
	
	 $('#searchName').keyup(function (e){
		 e.preventDefault();
		  var data={};
		  var category = " ";
		  var formData = $('#formSearch').serializeArray();  
		  $.each(formData, function (index, v) {
		        data["" + v.name + ""] = v.value;
		    });
		  if(data.categoryId == "Tất Cả"){
			  data.categoryId == category;
		  }
		$('#result').empty();
		
		if(data.searchName.length > 0 ){
			$.ajax({
				url : '${searchUrl}',
				type :'POST',
				data : JSON.stringify(data),
				dataType: "json",
	            contentType: "application/json",
				success : function(data){
					$.each(data, function (key, value) {
                        $('#result').append('<a href="${productURL}?searchName='+ value.name +'&categoryId='+value.categoryId+'&page=1&limit=9" ><li class="list-group-item link-class"><i class="icon-search"></i><span>'+value.name+'</span></li></a>'); 
                       
					});
					
				},
				error : function(error){
					console.log(error)
					alert("Lỗi hệ thống");
				}
			});
		}
	
		 $('#searchName').focusout(function () {
			    $(window).click(function () {
			        $('#result').empty();
			    });
			});	
			
				
	}); 
	</script>

</body>
</html>