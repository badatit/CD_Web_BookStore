<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APICartUrl" value="/api/carts" />
<c:url var="APIGetSumCartUrl" value="/api/sumPrice" />
<c:url var="APIDeleteCartUrl" value="/api/delete" />
<c:url var="APIGetQuantityCartUrl" value="/api/getQuantityCart" />
<c:url var="APIGetCartUrl" value="/api/cart" />
<c:url var="LoginUrl" value="/login" />
<c:url var="searchIssuingCompany" value="/web/api/search/catalog" />
<c:url var="APISearchBook" value="/web/api/search/book" />
<c:url var="productURL" value="/web/product" />
<c:url var="APIBookFavorite" value="/api/bookfavorite" />
<c:url var="Pricture"
	value='/template/web/assets/images/products/cart/product-1.jpg' />
<c:url var="APIBookFavorite" value="/api/bookfavorite" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="page-content">
		<input type="hidden" value="${userId}" name="userId" id="userId">
		<form:form action="/bookstore/web/product" id="formSubmit"
			method="get" modelAttribute="searchBookDTO">
			<form:input type="hidden" value="${currentPage}" id="page1"
				name="page" path="page" />
			<form:input type="hidden" value="9" id="limit1" name="limit"
				path="limit" />
			<%-- <form:input type="hidden" value="${searchName}" id="searchName1" name="searchName" path="searchName" />
			 <form:input type="hidden" value="${categoryName}" id="categoryName1" name="categoryName" path="categoryName" />  --%>
			<c:if test="${searchName != null}">
				<input type="hidden" value="" id="searchName" name="searchName" />
			</c:if>
			<c:if test="${categoryId != null}">
				<input type="hidden" value="${categoryId}" id="categoryId"
					name="categoryId" />
			</c:if>




			<div class="container">
				<div class="row">
					<nav aria-label="breadcrumb" class="breadcrumb-nav mb-2">
						<div class="container">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Trang
										Chủ </a></li>
								<li class="breadcrumb-item"><a href="#">Sản Phẩm</a></li>
								<li class="breadcrumb-item active" aria-current="page"><span
									id="titelProduct">Tất Cả</span></li>
							</ol>
						</div>
					</nav>
				</div>
				<div class="row">

					<div class="col-lg-9">
						<div class="toolbox">
							<div class="toolbox-left"></div>
							<!-- End .toolbox-left -->

							<div class="toolbox-right">
								<div class="toolbox-sort"></div>
								<!-- End .toolbox-sort -->
							</div>
							<!-- End .toolbox-right -->
						</div>
						<!-- End .toolbox -->

						<div class="products mb-3">
							<div class="row justify-content-center" id="productBody">
								<h3 class="message">${message}</h3>
								<c:if test="${books == '[]' }">
									<img class="imgOpps" alt=""
										src="https://muahangnhatonline.com/default/template/img/cart-empty.png">
								</c:if>
							
								<c:forEach var="item" items="${books}">
									<div class="col-6 col-md-4 col-lg-4">
										<div class="product product-7 text-center">
											<figure class="product-media" style="box-shadow: none">
												<span class="product-label label-new">New</span>
												<a href="<c:url value='/web/product/${item.id}' />"> <img
													src="${item.img1}" alt="Product image"
													class="product-image">

												</a>

												<div class="product-action-vertical">
													<c:if test="${item.favorite == null || item.favorite == '' }">
														<a onclick="addFavourite(${item.id})"
															class="btn-product-icon btn-wishlist btn-expandable favorite_${item.id}">
															<span class="messageFavorite_${item.id}">Thêm yêu
																thích</span>
														</a>
													</c:if>
													<c:if test="${item.favorite != null}">
														<a style="color: red;" onclick="addFavourite(${item.id})"
															class="btn-product-icon btn-wishlist btn-expandable favorite_${item.id}">
															<span style="color: red;"
															class="messageFavorite_${item.id}">Đã yêu thích</span>
														</a>
													</c:if>
												</div>
												<!-- End .product-action-vertical -->

												<div class="product-action">
													<a class="btn-product btn-cart"
														onclick="addCart(${item.id})"><span>Thêm vào
															giỏ hàng</span></a>
												</div>
												<!-- End .product-action -->
											</figure>
											<!-- End .product-media -->

											<div class="product-body">
												<div class="product-cat">
													<a href="<c:url value='/web/product/${item.id}' />">${item.issuingCompany}</a>
												</div>
												<!-- End .product-cat -->
												<h3 class="product-title">
													<a href="<c:url value='/web/product/${item.id}' />">${item.name}</a>
												</h3>
												<!-- End .product-title -->
												<div class="product-price">
													<fmt:formatNumber type="number" groupingUsed="true"
														value="${item.price}" />
													<span style="margin-left: 7px;"> VND</span>
												</div>
												<!-- End .product-price -->
												<div class="ratings-container">
													<div class="ratings">
														<div class="ratings-val" style="width: 20%;"></div>
														<!-- End .ratings-val -->
													</div>
													<!-- End .ratings -->
													<span class="ratings-text">( 2 Reviews )</span>
												</div>
												<!-- End .rating-container -->


												<!-- End .product-nav -->
											</div>
											<!-- End .product-body -->
										</div>
										<!-- End .product -->
									</div>
									<!-- End .col-sm-6 col-lg-4 -->
								</c:forEach>
							</div>
							<!-- End .row -->
						</div>
						<!-- End .products -->

						<nav aria-label="Page navigation" style="margin-left: 130px;">
							<ul class="pagination" id="pagination">
							</ul>
						</nav>
					</div>
					<!-- End .col-lg-9 -->
					<aside class="col-lg-3 order-lg-first">
						<div class="sidebar sidebar-shop">
							<div class="widget widget-collapsible">
								<h3 class="widget-title">
									<a data-toggle="collapse" href="#widget-4" role="button"
										aria-expanded="true" aria-controls="widget-4"> Loại Bìa </a>
								</h3>
								<!-- End .widget-title -->

								<div class="collapse show" id="widget-4">
									<div class="widget-body">
										<div class="filter-items">

											<div class="filter-item">
												<c:set var="joinedNumbers" value="${fn:join(coverType,',')}" />
												<c:forEach var="item" items="${coverTypes}">
													<div>
														<input type="checkbox" name="coverType" id="coverType"
															value="${item}"
															${fn:contains(joinedNumbers , item ) ? 'checked' : ''} />
														<label for="coverTypes">${item}</label>
													</div>
													<!-- End .custom-checkbox -->
												</c:forEach>
												<%-- <c:set var="joinedNumbers" value="${fn:join(issu,',')}" /> --%>
												<%-- <p>Joined Numbers: ${joinedNumbers}</p> --%>
											</div>
											<!-- End .filter-item -->
										</div>
										<!-- End .filter-items -->
									</div>
									<!-- End .widget-body -->
								</div>
								<!-- End .collapse -->
							</div>
							<!-- End .widget -->

							<div class="widget widget-collapsible">
								<h3 class="widget-title">
									<a data-toggle="collapse" href="#widget-4" role="button"
										aria-expanded="true" aria-controls="widget-4"> Nhà Xuất
										Bản </a>
								</h3>
								<!-- End .widget-title -->

								<div class="collapse show" id="widget-4">
									<div class="widget-body">
										<div class="filter-items">

											<div class="filter-item">
												<c:set var="joinedNumbers" value="${fn:join(issu,',')}" />
												<c:forEach var="item" items="${issuingCompanys}">
													<div>
														<input type="checkbox" name="issuingCompany"
															id="issuingCompany" value="${item}"
															${fn:contains(joinedNumbers, item ) ? 'checked' : ''} />
														<label for="issuingCompany">${item}</label>
													</div>
													<!-- End .custom-checkbox -->
												</c:forEach>
											</div>
											<!-- End .filter-item -->
										</div>
										<!-- End .filter-items -->
									</div>
									<!-- End .widget-body -->
								</div>
								<!-- End .collapse -->
							</div>
							<!-- End .widget -->

							<div class="widget widget-collapsible">
								<h3 class="widget-title">
									<a data-toggle="collapse" href="#widget-4" role="button"
										aria-expanded="true" aria-controls="widget-4"> Giá </a>
								</h3>
								<!-- End .widget-title -->

								<div class="collapse show" id="widget-4">
									<div class="widget-body">
										<div class="filter-items">
											<div class="filter-item">
												<div>
													<input type="radio" name="price" id="price" value="0,80000"
														${fn:contains(price, '0,80000' ) ? 'checked' : ''}>
													<label for="price">Dưới 80.000</label>
												</div>
												<!-- End .custom-checkbox -->
											</div>
											<!-- End .filter-item -->

											<div class="filter-item">
												<div>
													<input type="radio" name="price" id="price1"
														value="80000,150000"
														${fn:contains(price, '80000,150000' ) ? 'checked' : ''}>
													<label for="price1">Từ 80.000 đến 150.000</label>
												</div>
												<!-- End .custom-checkbox -->
											</div>
											<!-- End .filter-item -->

											<div class="filter-item">
												<div>
													<input type="radio" name="price" id="price3"
														value="150000,220000"
														${fn:contains(price, '150000,220000' ) ? 'checked' : ''}>
													<label for="price3">Từ 150.000 đến 220.000</label>
												</div>
												<!-- End .custom-checkbox -->
											</div>
											<!-- End .filter-item -->

											<div class="filter-item">
												<div>
													<input type="radio" name="price" id="price4"
														value="220000,10000000"
														${fn:contains(price, '220000,10000000' ) ? 'checked' : ''}>
													<label for="price4">Trên 220.000</label>
												</div>
												<!-- End .custom-checkbox -->
											</div>
											<!-- End .filter-item -->
										</div>
										<!-- End .filter-items -->
									</div>
									<!-- End .widget-body -->
								</div>
								<!-- End .collapse -->
							</div>
							<!-- End .widget -->

						</div>
						<!-- End .sidebar sidebar-shop -->
					</aside>
					<!-- End .col-lg-3 -->
				</div>
				<!-- End .row -->
			</div>
			<!-- End .container -->
		</form:form>
	</div>
	<!-- End .page-content -->

	<script type="text/javascript"> 
	/**/
	var nameBook = $('#searchName').val();
	var categoyBook = $('#categoryId').val();
    document.forms['formSubmit']['searchName'].value = nameBook;
    document.forms['formSubmit']['categoryId'].value = categoyBook;

</script>
	<script>

$(document).ready(function() {
	
	  $("#UpdateButton").click(update);
	 
	});

	function update() {
		alert("Check box in Checked");
	}
	function addCart(id) {
		var userId= $('#userId').val();
		if (userId == null || userId =='') {
			window.location.href = "${LoginUrl}";
		}else{
		$("#cartMini").html('');
		var data = {};
		data['bookId'] = id;
		   $.ajax({
         type: "POST",
		 url: "${APICartUrl}",
         data: JSON.stringify(data),
         dataType: "json",
         contentType: "application/json",
         success: function (response) {  
         	swal("Thành công", "Sản phẩm đã được lưa", "success");
         	$('#sizeCart').html(response.sizeCart);
         	
         	// call subtotal
         	getSubTotal();
         	getCart();
         },
         
         error: function (response) {
        	 swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
         }
      });
		}
}

	 function getSubTotal() {
			$.ajax({
				type : "GET",
				url : "${APICartUrl}/subTotal",
				contentType : "application/json",
				success : function(response) {
					 $('.cart-total-price').text(response);
				},
				error : function(response) {
					 alert('Loi subTotal');
				}
			});
}
	 function getCart() {
		 $.ajax({
             url : '${APICartUrl}',
             type : 'GET',
             dataType: "json",
             contentType: "application/json",
             success : function(data){
            	 $("#cartMini").html('');
            	 $.each(data, function (key, value) {
              		$("#cartMini").append('<div class="product">' +
              						'<div class="product-cart-details">'+
              						'<h4 class="product-title">'+
              						'<a href="${ProductDetailsURL}'+value.bookId+'">'+value.name+'</a>'+
              						'</h4>'+
              						'<span class="cart-product-info"><span class="cart-product-qty">'+value.amount+'</span>x'+value.price+'</span>'+
              						'</div>'+
              						' <figure class="product-image-container">'+
              						'<a href="${ProductDetailsURL}'+value.bookId+'">'+
              						'<img src="'+value.img1+'" alt="product">'+
              						'</a>'+
              						'</figure>'+
              						'<a onclick="deleteCart('+value.id+')" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>'+
              						'</div>');
              	}); 
            		
				},
				error : function(error){
					console.log(error)
					alert("Lỗi hệ thống");
				}
         });
}
	
	$(document).ready(function() {
		  $("input:checkbox,input:radio").click(function() { 
			  var data = {};
			  var issuingCompany = [];
			  var coverType = [];
			  var formData = $('#formSubmit').serializeArray();
			  
			  $.each(formData, function (index, v) {
				  if (v.name == 'issuingCompany') {
					  issuingCompany.push(v.value)
		            }else if(v.name == 'coverType'){
		            	coverType.push(v.value)
		            }else {
		                data["" + v.name + ""] = v.value;
		            }
		            
		        });
			  		data['issuingCompany'] = issuingCompany;
			  		data['coverType'] = coverType;
			  		searchByIssu(data);
			  		$('#productBody').html('');
	        }); 
	});
	
	            	 function searchByIssu(data) {
	            		 $.ajax({
		                     url : '${searchIssuingCompany}',
		                     type : 'POST',
		                     data : JSON.stringify(data),
		                     dataType: "json",
		                     contentType: "application/json",
		                     success : function(data){
		     					$.each(data, function (key, value) {
		     						$('#productBody').append('<div class="col-6 col-md-4 col-lg-4">'+
		     						'<div class="product product-7 text-center">'+
		     						'<figure class="product-media">'+
		     						'<span class="product-label label-new">New</span> '+
		     						'<a href="${ProductDetail}'+value.id+'"><img src="'+value.img1+'" alt="Product image" class="product-image"></a>'+
		     						
		     						' <div class="product-action-vertical">'+
		     						'<c:if test="${value.favorite == null}">'+
		     						'<a onclick="addFavourite('+value.id+')" class="btn-product-icon btn-wishlist btn-expandable favorite_'+value.id+'"><span class="messageFavorite_'+value.id+'">Thêm yêu thích</span></a>'+
		     						'</c:if>'+
		     						'<c:if test="${value.favorite != null}">'+
		     						'<a style="color: red;" onclick="addFavourite('+value.id+')" class="btn-product-icon btn-wishlist btn-expandable favorite_'+value.id+'"><span class="messageFavorite_'+value.id+'">Đã yêu thích</span></a>'+
		     						'</c:if>'+
		     						'</div>'+
		     						
		     						'<div class="product-action">'+
		     						'<a  class="btn-product btn-cart" onclick="addCart('+value.id+')"><span>Thêm vào giỏ hàng</span></a>'+
		     						'</div>'+
		     						'</figure>'+
		     						
		     						' <div class="product-body">'+
		     						
		     						'  <div class="product-cat">'+
		     						' <a href="${ProductDetail}'+value.id+'">'+value.issuingCompany+'</a>'+
		     						'</div>'+
		     						'<h3 class="product-title"><a href="${ProductDetail}'+value.id+'">'+value.name+'</a></h3>'+
		     						'<div class="product-price">'+value.price+'<span style="margin-left: 7px;"> VND</span></div>'+
		     						
		     						' <div class="ratings-container">'+
		     						'  <div class="ratings">'+
		     						' <div class="ratings-val" style="width: 20%;"></div>'+
		     						'</div>'+
		     						' <span class="ratings-text">( 2 Reviews )</span>'+
		     						'</div>'+
		     						
		     						'</div>'+
		     						'</div>'+
		     						'</div>');
		                      	});
		     					
		     					if (data == '') {
		     						$('#imgOpp').attr('src', "https://muahangnhatonline.com/default/template/img/cart-empty.png");
								}
		     				},
		     				error : function(error){
		     					console.log(error)
		     					alert("Lỗi hệ thống");
		     				}
		                 });
	      	}
	            	 
	            	 function searchAllBook(data) {
	            		 $.ajax({
		                     url : '${APISearchBook}',
		                     type : 'POST',
		                     data : JSON.stringify(data),
		                     dataType: "json",
		                     contentType: "application/json",
		                     success : function(data){
		     					$.each(data, function (key, value) {
		     						$('#productBody').append('<div class="col-6 col-md-4 col-lg-4">'+
		     						'<div class="product product-7 text-center">'+
		     						'<figure class="product-media">'+
		     						'<span class="product-label label-new">New</span> '+
		     						'<a href="${ProductDetail}'+value.id+'"><img src="'+value.img1+'" alt="Product image" class="product-image"></a>'+
		     						
		     						' <div class="product-action-vertical">'+
		     						'<c:if test="${value.favorite == null}">'+
		     						'<a onclick="addFavourite('+value.id+')" class="btn-product-icon btn-wishlist btn-expandable favorite_'+value.id+'"><span class="messageFavorite_'+value.id+'">Thêm yêu thích</span></a>'+
		     						'</c:if>'+
		     						'<c:if test="${value.favorite != null}">'+
		     						'<a style="color: red;" onclick="addFavourite('+value.id+')" class="btn-product-icon btn-wishlist btn-expandable favorite_'+value.id+'"><span class="messageFavorite_'+value.id+'">Đã yêu thích</span></a>'+
		     						'</c:if>'+
		     						'</div>'+
		     						
		     						'<div class="product-action">'+
		     						'<a  class="btn-product btn-cart" onclick="addCart('+value.id+')"><span>Thêm vào giỏ hàng</span></a>'+
		     						'</div>'+
		     						'</figure>'+
		     						
		     						' <div class="product-body">'+
		     						
		     						'  <div class="product-cat">'+
		     						' <a href="${ProductDetail}'+value.id+'">'+value.issuingCompany+'</a>'+
		     						'</div>'+
		     						'<h3 class="product-title"><a href="${ProductDetail}'+value.id+'">'+value.name+'</a></h3>'+
		     						'<div class="product-price">'+value.price+'<span style="margin-left: 7px;"> VND</span></div>'+
		     						
		     						' <div class="ratings-container">'+
		     						'  <div class="ratings">'+
		     						' <div class="ratings-val" style="width: 20%;"></div>'+
		     						'</div>'+
		     						' <span class="ratings-text">( 2 Reviews )</span>'+
		     						'</div>'+
		     						
		     						'</div>'+
		     						'</div>'+
		     						'</div>');
		                      	});
		     					if (data == '') {
		     						$('#imgOpp').attr('src', "https://muahangnhatonline.com/default/template/img/cart-empty.png");
								}
		     				},
		     				error : function(error){
		     					console.log(error)
		     					alert("Lỗi hệ thống");
		     				}
		                 });
	      	}
	            	 
	            	 function getQuantitCart() {
	           			$.ajax({
	           				type : "POST",
	           				url : "${APIGetQuantityCartUrl}",
	           				contentType : "application/json",
	           				success : function(response) {
	           					 swal("Thành công", "Sản phẩm đã được xóa", "success"); 
	           		         	 $('#sizeCart').html(response);
	           		         	
	           				},
	           				error : function(response) {
	           					
	           					
	           				}
	           			});
	           		}
	            	
	            	 function deleteCart(id) {
	         			var data = {};
	         			data['id'] = id;
	         			$.ajax({
	         				type : "DELETE",
	         				url : "${APICartUrl}/delete",
	         				data : JSON.stringify(data),
	         				contentType : "application/json",
	         				success : function(response) {
	         					swal("Thành công", "Sản phẩm đã được xóa", "success");
	         					$('#sizeCart').text(response);
	         					getCart();
	         					 getSubTotal() ;
	         		         
	         				},
	         				error : function(response) {
	         					swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
	         					
	         				}
	         			});
	         		}
	            	 function sumPrice() {
	        			 $('.cart-total-price').text('');
	        	  			$.ajax({
	        	  				type : "POST",
	        	  				url : "${APIGetSumCartUrl}",
	        	  				
	        	  				 dataType: "json",
	        	  				contentType : "application/json",
	        	  				success : function(response) {
	        	  					swal("Thành công", "Sản phẩm đã được xóa", "success");
	        	  		         	 $('.cart-total-price').text(response);
	        	  				},
	        	  				error : function(response) {
	        	  					swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
	        	  					
	        	  				}
	        	  			});
	        	  		}
	</script>

	<script type="text/javascript">
	
    $(function () {
    	var totalPage = $('#totalPage').val();
    	var pageC = $('#page1').val();
    	var searchName = $('#searchName').val();
    	var category = $('#categoryId').val(); 
    	var limit = $('#limit1').val();
        window.pagObj = $('#pagination').twbsPagination({
        	startPage : pageC,
            totalPages: totalPage,
            visiblePages: 9,
            onPageClick: function (event, page) { // 1 2 3
            	if (pageC != page ) {
            		$('#limit1').val(limit);
					$('#page1').val(page); // 1 bam 2 thì 1 se thanh 2
					$('#formSubmit').submit();
				}
            }
        });
    });
   
	 function addFavourite(id){
		 var userId= $('#userId').val();
			if (userId == null || userId =='') {
				alert("Vui lòng đăng nhập");
			}else{
		 var data ={};
		 data['bookId'] =id;
		   $.ajax({
		         type: "POST",
				 url: "${APIBookFavorite}",
		         data: JSON.stringify(data),
		         contentType: "application/json",
		         success: function (response) { 
		        	 $('.wishlist-count').text(response.count);
		        	 var classWish = ".favorite_"+id;
		        	 var messageWish =".messageFavorite_"+id;
		        	 if (response.message == "success_save") {
		         	 	$(classWish).css("color","red");
		         	 	$(messageWish).text("Đã yêu thích");
		         	 	$(messageWish).css("color","red");
					}else{
						 $(classWish).css("color","black");
						 $(messageWish).text("Thêm yêu thích");
			         	 $(messageWish).css("color","black");
					}
		         }, 
		         
		         error: function (response) {
		        	 swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
		         }
		      });
			}
	 }
	 
	 
</script>
	<script>
	var url_string = window.location.href;
	var url = new URL(url_string);
	var c = url.searchParams.get("categoryId");
	if (c == 1) {
		$('#titelProduct').text("");
		$('#titelProduct').text("Tư Duy");
	}else if(c == 2){
		$('#titelProduct').text("Kỹ Năng Sống");
	}else if(c == 3){
		$('#titelProduct').text("Tiểu Thuyết");
	}
	else if(c == 4){
		$('#titelProduct').text("Truyện Ngắn");
	}else if(c == 5){
		$('#titelProduct').text("Kiến Thức - Bách Khoa");
	}else if(c==6){
		$('#titelProduct').text("Làm Việc Kỹ Năng");
	}

</script>


</body>
</html>