<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APICartUrl" value="/api/carts" />
<c:url var="APIGetSumCartUrl" value="/api/sumPrice" />
<c:url var="APIDeleteCartUrl" value="/api/delete" />
<c:url var="APIGetQuantityCartUrl" value="/api/getQuantityCart" />
<c:url var="APIGetCartUrl" value="/api/cart" />
<c:url var="LoginUrl" value="/login" />
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
	<main class="main">
		<input type="hidden" value="${userId}" name="userId" id="userId">
		<nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
		</nav>

		<div class="page-content" style="margin-top: 42px;">
			<div class="container">
				<div class="product-details-top mb-2">
					<div class="row">
						<div class="col-md-6">
							<div class="product-gallery product-gallery-vertical">
								<div class="row">
									<figure class="product-main-image">
										<img id="product-zoom"
											src="${bookId.img1 }"
											data-zoom-image="${bookId.img1 }"
											alt="product image">

										<!--  <a href="#" id="btn-product-gallery" class="btn-product-gallery">
                                                <i class="icon-arrows"></i>
                                            </a> -->
									</figure>
									<!-- End .product-main-image -->

									<div id="product-zoom-gallery" class="product-image-gallery">
										<a class="product-gallery-item active" href="#"
											data-image="${bookId.img1 }"
											data-zoom-image="${bookId.img1 }">
											<img
											src="${bookId.img1}"
											alt="product side">
										</a> <a class="product-gallery-item" href="#"
											data-image="${bookId.img2 }"
											data-zoom-image="${bookId.img2 }">
											<img
											src="${bookId.img2 }"
											alt="product cross">
										</a> <a class="product-gallery-item" href="#"
											data-image="${bookId.img3 }"
											data-zoom-image="${bookId.img3 }">
											<img
											src="${bookId.img3 }"
											alt="product with model">
										</a> <a class="product-gallery-item" href="#"
											data-image="${bookId.img4 }"
											data-zoom-image="${bookId.img4 }">
											<img
											src="${bookId.img4 }"
											alt="product back">
										</a>
									</div>
									<!-- End .product-image-gallery -->
								</div>
								<!-- End .row -->
							</div>
							<!-- End .product-gallery -->
						</div>
						<!-- End .col-md-6 -->

						<div class="col-md-6">
							<div class="product-details product-details-centered">
								<h1 class="product-title">${bookId.name}</h1>
								<!-- End .product-title -->

								<div class="ratings-container">
									<div class="ratings">
										<div class="ratings-val" style="width: 80%;"></div>
										<!-- End .ratings-val -->
									</div>
									<!-- End .ratings -->
									<a class="ratings-text" href="#product-review-link"
										id="review-link">( 2 Reviews )</a>
								</div>
								<!-- End .rating-container -->

								<div class="product-price">
									<fmt:formatNumber type="number" groupingUsed="true" value="${bookId.price}" />
									<span style="margin-left: 7px;"> VND</span>
								</div>
								<!-- End .product-price -->

								<div class="product-content">
									<p>Sed egestas, ante et vulputate volutpat, eros pede
										semper est, vitae luctus metus libero eu augue. Morbi purus
										libero.</p>
								</div>
								<!--End .product-content -->

								<div class="product-details-action">
									<div class="details-action-col">
										<div class="product-details-quantity">
											<input type="number" id="qty" class="form-control" value="1"
												min="1" max="10" step="1" data-decimals="0" required>
										</div>
										<!-- End .product-details-quantity -->

										<a class="btn-product btn-cart"
											onclick="addCart(${bookId.id})"><span>add to cart</span></a>
									</div>
									<!-- End .details-action-col -->

									<div class="details-action-wrapper">
										 <c:if test="${bookId.favorite == '[]'}">
													<a onclick="addFavourite(${bookId.id})"
														class="btn-product btn-wishlist favorite_${bookId.id}">
														<span class="messageFavorite_${bookId.id}">Th??m y??u
															th??ch</span>
													</a>
												</c:if>
												<c:if test="${bookId.favorite != '[]'}">
													<a style="color: red;" onclick="addFavourite(${bookId.id})"
														class="btn-product btn-wishlist favorite_${bookId.id}">
														<span style="color: red;" class="messageFavorite_${bookId.id}">???? y??u
															th??ch</span>
													</a>
												</c:if>
												 
									</div>
									<!-- End .details-action-wrapper -->
								</div>
								<!-- End .product-details-action -->

								<div class="product-details-footer">
									
									<!-- End .product-cat -->

									<div class="social-icons social-icons-sm">
										<span class="social-label">Share:</span> <a href="#"
											class="social-icon" title="Facebook" target="_blank"><i
											class="icon-facebook-f"></i></a> <a href="#" class="social-icon"
											title="Twitter" target="_blank"><i class="icon-twitter"></i></a>
										<a href="#" class="social-icon" title="Instagram"
											target="_blank"><i class="icon-instagram"></i></a> <a
											href="#" class="social-icon" title="Pinterest"
											target="_blank"><i class="icon-pinterest"></i></a>
									</div>
								</div>
								<!-- End .product-details-footer -->
							</div>
							<!-- End .product-details -->
						</div>
						<!-- End .col-md-6 -->
					</div>
					<!-- End .row -->
				</div>
				<!-- End .product-details-top -->

				<div class="product-details-tab">
					<ul class="nav nav-pills justify-content-center" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="product-desc-link" data-toggle="tab" href="#product-desc-tab"
							role="tab" aria-controls="product-desc-tab" aria-selected="true">Description</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							id="product-info-link" data-toggle="tab" href="#product-info-tab"
							role="tab" aria-controls="product-info-tab" aria-selected="false">Additional
								information</a></li>
						<li class="nav-item"><a class="nav-link"
							id="product-shipping-link" data-toggle="tab"
							href="#product-shipping-tab" role="tab"
							aria-controls="product-shipping-tab" aria-selected="false">Shipping
								& Returns</a></li>
						<li class="nav-item"><a class="nav-link"
							id="product-review-link" data-toggle="tab"
							href="#product-review-tab" role="tab"
							aria-controls="product-review-tab" aria-selected="false">Reviews
								(2)</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="product-desc-tab"
							role="tabpanel" aria-labelledby="product-desc-link">
							<div class="product-desc-content">
								<h3>Product Information</h3>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat
									ut turpis. Suspendisse urna viverra non, semper suscipit,
									posuere a, pede. Donec nec justo eget felis facilisis
									fermentum. Aliquam porttitor mauris sit amet orci. Aenean
									dignissim pellentesque felis. Phasellus ultrices nulla quis
									nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem
									tristique cursus.</p>
								<ul>
									<li>Nunc nec porttitor turpis. In eu risus enim. In vitae
										mollis elit.</li>
									<li>Vivamus finibus vel mauris ut vehicula.</li>
									<li>Nullam a magna porttitor, dictum risus nec, faucibus
										sapien.</li>
								</ul>

								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat
									ut turpis. Suspendisse urna viverra non, semper suscipit,
									posuere a, pede. Donec nec justo eget felis facilisis
									fermentum. Aliquam porttitor mauris sit amet orci. Aenean
									dignissim pellentesque felis. Phasellus ultrices nulla quis
									nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem
									tristique cursus.</p>
							</div>
							<!-- End .product-desc-content -->
						</div>
						<!-- .End .tab-pane -->
						<div class="tab-pane fade" id="product-info-tab" role="tabpanel"
							aria-labelledby="product-info-link">
							<div class="product-desc-content">
								<h3>Information</h3>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat
									ut turpis. Suspendisse urna viverra non, semper suscipit,
									posuere a, pede. Donec nec justo eget felis facilisis
									fermentum. Aliquam porttitor mauris sit amet orci.</p>

								<h3>Fabric & care</h3>
								<ul>
									<li>Faux suede fabric</li>
									<li>Gold tone metal hoop handles.</li>
									<li>RI branding</li>
									<li>Snake print trim interior</li>
									<li>Adjustable cross body strap</li>
									<li>Height: 31cm; Width: 32cm; Depth: 12cm; Handle Drop:
										61cm</li>
								</ul>

								<h3>Size</h3>
								<p>one size</p>
							</div>
							<!-- End .product-desc-content -->
						</div>
						<!-- .End .tab-pane -->
						<div class="tab-pane fade" id="product-shipping-tab"
							role="tabpanel" aria-labelledby="product-shipping-link">
							<div class="product-desc-content">
								<h3>Delivery & returns</h3>
								<p>
									We deliver to over 100 countries around the world. For full
									details of the delivery options we offer, please view our <a
										href="#">Delivery information</a><br> We hope you???ll love
									every purchase, but if you ever need to return an item you can
									do so within a month of receipt. For full details of how to
									make a return, please view our <a href="#">Returns
										information</a>
								</p>
							</div>
							<!-- End .product-desc-content -->
						</div>
						<!-- .End .tab-pane -->
						<div class="tab-pane fade" id="product-review-tab" role="tabpanel"
							aria-labelledby="product-review-link">
							<div class="reviews">
								<h3>Reviews (2)</h3>
								<div class="review">
									<div class="row no-gutters">
										<div class="col-auto">
											<h4>
												<a href="#">Samanta J.</a>
											</h4>
											<div class="ratings-container">
												<div class="ratings">
													<div class="ratings-val" style="width: 80%;"></div>
													<!-- End .ratings-val -->
												</div>
												<!-- End .ratings -->
											</div>
											<!-- End .rating-container -->
											<span class="review-date">6 days ago</span>
										</div>
										<!-- End .col -->
										<div class="col">
											<h4>Good, perfect size</h4>

											<div class="review-content">
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Ducimus cum dolores assumenda asperiores facilis
													porro reprehenderit animi culpa atque blanditiis commodi
													perspiciatis doloremque, possimus, explicabo, autem fugit
													beatae quae voluptas!</p>
											</div>
											<!-- End .review-content -->

											<div class="review-action">
												<a href="#"><i class="icon-thumbs-up"></i>Helpful (2)</a> <a
													href="#"><i class="icon-thumbs-down"></i>Unhelpful (0)</a>
											</div>
											<!-- End .review-action -->
										</div>
										<!-- End .col-auto -->
									</div>
									<!-- End .row -->
								</div>
								<!-- End .review -->

								<div class="review">
									<div class="row no-gutters">
										<div class="col-auto">
											<h4>
												<a href="#">John Doe</a>
											</h4>
											<div class="ratings-container">
												<div class="ratings">
													<div class="ratings-val" style="width: 100%;"></div>
													<!-- End .ratings-val -->
												</div>
												<!-- End .ratings -->
											</div>
											<!-- End .rating-container -->
											<span class="review-date">5 days ago</span>
										</div>
										<!-- End .col -->
										<div class="col">
											<h4>Very good</h4>

											<div class="review-content">
												<p>${bookId.productDescription}</p>
											</div>
											<!-- End .review-content -->

											<div class="review-action">
												<a href="#"><i class="icon-thumbs-up"></i>Helpful (0)</a> <a
													href="#"><i class="icon-thumbs-down"></i>Unhelpful (0)</a>
											</div>
											<!-- End .review-action -->
										</div>
										<!-- End .col-auto -->
									</div>
									<!-- End .row -->
								</div>
								<!-- End .review -->
							</div>
							<!-- End .reviews -->
						</div>
						<!-- .End .tab-pane -->
					</div>
					<!-- End .tab-content -->
				</div>
				<!-- End .product-details-tab -->

				<h2 class="title text-center mb-4">You May Also Like</h2>
				<!-- End .title text-center -->
				<div
					class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow"
					data-toggle="owl"
					data-owl-options='{
                            "nav": false, 
                            "dots": true,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":1
                                },
                                "480": {
                                    "items":2
                                },
                                "768": {
                                    "items":3
                                },
                                "992": {
                                    "items":4
                                },
                                "1200": {
                                    "items":4,
                                    "nav": true,
                                    "dots": false
                                }
                            }
                        }'>
                        <c:forEach var="item" items="${listBooks}">
					<div class="product product-7 text-center">
						<figure class="product-media">
							<span class="product-label label-new">New</span>
							<a href="<c:url value='/web/product/${item.id}' />"> <img
								src="${item.img1}" alt="Product image"
								class="product-image">
							</a>

							<div class="product-action-vertical">
								<c:if test="${item.favorite == '[]'}">
									<a onclick="addFavourite(${item.id})" class="btn-product-icon btn-wishlist btn-expandable favorite_${item.id}">
										<span class="messageFavorite_${item.id}">Th??m y??u th??ch</span>
									</a>
								</c:if>
								<c:if test="${item.favorite != '[]'}">
									<a  style="color: red;" onclick="addFavourite(${item.id})" class="btn-product-icon btn-wishlist btn-expandable favorite_${item.id}">
										<span  style="color: red;" class="messageFavorite_${item.id}">???? y??u th??ch</span>
									</a>
									</c:if>
										
							</div>
							<!-- End .product-action-vertical -->

							<div class="product-action">
								<a  class="btn-product btn-cart" onclick="addCart(${item.id})">
								<span>add to cart</span>
										</a>
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
								<span class="new-price"> 
									<fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" />
								<span> VND</span></span>
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
					</c:forEach>
					<!-- End .product -->
					<!-- End .product -->
				</div>
				<!-- End .owl-carousel -->
			</div>
			<!-- End .container -->
		</div>
		<!-- End .page-content -->
	</main>
	<!-- End .main -->

	<script>
	function addCart(id) {
		var userId= $('#userId').val();
		if (userId == null || userId =='') {
			window.location.href = "${LoginUrl}";
		}else{
		$("#cartMini").html('');
		var data = {};
		var qty = $('#qty').val();
		data['bookId'] = id;
		data['amount'] =qty;
		   $.ajax({
         type: "POST",
		 url: "${APICartUrl}",
         data: JSON.stringify(data),
         dataType: "json",
         contentType: "application/json",
         success: function (response) {  
         	swal("Th??nh c??ng", "S???n ph???m ???? ???????c l??a", "success");
         	$('#sizeCart').html(response.sizeCart);
         	// call subtotal
         	getSubTotal();
         	getCart();
         },
         
         error: function (response) {
        	 swal("Th???t b???i", "S???n ph???m v???n an to??n :)", "error");
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
					alert("L???i h??? th???ng");
				}
         });
}
	 function getQuantitCart() {
			$.ajax({
				type : "POST",
				url : "${APIGetQuantityCartUrl}",
				contentType : "application/json",
				success : function(response) {
					 swal("Th??nh c??ng", "S???n ph???m ???? ???????c x??a", "success"); 
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
					swal("Th??nh c??ng", "S???n ph???m ???? ???????c x??a", "success");
					$('#sizeCart').text(response);
					getCart();
					 getSubTotal() ;
		         
				},
				error : function(response) {
					swal("Th???t b???i", "S???n ph???m v???n an to??n :)", "error");
					
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
  					swal("Th??nh c??ng", "S???n ph???m ???? ???????c x??a", "success");
  		         	 $('.cart-total-price').text(response);
  				},
  				error : function(response) {
  					swal("Th???t b???i", "S???n ph???m v???n an to??n :)", "error");
  					
  				}
  			});
  		}
	 
	 function addFavourite(id){
		 var userId= $('#userId').val();
			if (userId == null || userId =='') {
				alert("Vui l??ng ????ng nh???p");
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
		         	 	$(messageWish).text("???? y??u th??ch");
		         	 	$(messageWish).css("color","red");
					}else{
						 $(classWish).css("color","black");
						 $(messageWish).text("Th??m y??u th??ch");
			         	 	$(messageWish).css("color","black");
					}
		         }, 
		         
		         error: function (response) {
		        	 swal("Th???t b???i", "S???n ph???m v???n an to??n :)", "error");
		         }
		      });
			}
	 }
	
	</script>


</body>
</html>