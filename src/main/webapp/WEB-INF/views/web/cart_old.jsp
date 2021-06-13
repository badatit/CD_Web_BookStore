<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
    <c:url var="APIDeleteCartUrl" value="/api/delete" />
     <c:url var="APIGetCartUrl" value="/api/cart" />
     <c:url var="APIGetSumCartUrl" value="/api/sumPrice" />
     <c:url var="APIGetQuantityCartUrl" value="/api/getQuantityCart" />
      <c:url var="APIOrderUrl" value="/api/order/saveOrder" />
       <c:url var="APIGetTotalOfQuantityUrl" value="/api/totalOfQuantity" />
     <c:url var="APIGetCartByIdUserUrl" value="/api/cartsByIdUser" />
     <c:url var ="Pricture" value='/template/web/assets/images/products/cart/product-1.jpg'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
       <main class="main" style="margin-top: 50px;">
      <input type="hidden" value="${userId}" name="userId" id="userId">
      <input type="text" value="" name="orderId" id="orderId">
            <div class="page-content">
            	<div class="cart">
	                <div class="container">
	                	<div class="row">
	                		<div class="col-lg-9">
	                			<table class="table table-cart table-mobile" id="cartBody">
									<thead>
										<tr>
											<th>Product</th>
											<th>Price</th>
											<th>Quantity</th>
											<th>Total</th>
											<th></th>
										</tr>
									</thead>

									<tbody>
									<c:forEach var="item" items="${carts}">
									<input name = "id" class = "idCarts" id="id" value="${item.id}"/> 
										<tr class = "prduct-cart" id="cart_${item.id}" >
										
											<td class="product-col">
												<div class="product" style="padding: 0px;">
													<figure class="product-media">
														<a href="#">
															<img src=" <c:url value='/template/web/assets/images/products/cart/product-1.jpg'/>" alt="Product image">
														</a>
													</figure>

													<h3 class="product-title">
														<a href="#">${item.name}</a>
													</h3><!-- End .product-title -->
												</div><!-- End .product -->
											</td>
											<td class="price-col" id="price_${item.id}">${item.price}</td>
											<td class="quantity-col">
                                                <div class="cart-product-quantity">
                                               <button onclick="amount(${item.id})"><input type="number" id="amount_${item.id}" class="form-control amount"  value="${item.amount}" min="1" max="10" step="1" data-decimals="0" required></button>
                                                </div><!-- End .cart-product-quantity -->
                                            </td>
											<td class="total-col_${item.id}" id="priceTotal">${item.price*item.amount}</td>
											<td class="remove-col"><button onclick="deleteCart(${item.id})" class="btn-remove"><i class="icon-close"></i></button></td>
										 	<%-- <td class = "id"  id="id" >${item.id}</td>  --%>
										</tr>
										  
									</c:forEach>
									</tbody>
								</table><!-- End .table table-wishlist -->

	                			<div class="cart-bottom">
			            			<div class="cart-discount">
			            				<form action="#">
			            					<div class="input-group">
				        						<input type="text" class="form-control" required placeholder="coupon code">
				        						<div class="input-group-append">
													<button class="btn btn-outline-primary-2" type="submit"><i class="icon-long-arrow-right"></i></button>
												</div><!-- .End .input-group-append -->
			        						</div><!-- End .input-group -->
			            				</form>
			            			</div><!-- End .cart-discount -->

			            			<a href="#" class="btn btn-outline-dark-2"><span>UPDATE CART</span><i class="icon-refresh"></i></a>
		            			</div><!-- End .cart-bottom -->
	                		</div><!-- End .col-lg-9 -->
	                		<aside class="col-lg-3">
	                			<div class="summary summary-cart">
	                				<h3 class="summary-title">Cart Total</h3><!-- End .summary-title -->

	                				<table class="table table-summary">
	                					<tbody>
	                						<tr class="summary-subtotal">
	                							<td>Subtotal:</td>
	                							<td >
	                							<span class ="sumprice">${sumPrice}</span><span>đ</span>
	                							</td>
	                						</tr><!-- End .summary-subtotal -->
	                						<tr class="summary-shipping">
	                							<td>Shipping:</td>
	                							<td>&nbsp;</td>
	                						</tr>

	                						<tr class="summary-shipping-row">
	                							<td>
													<div class="custom-control custom-radio">
														<input value="0" type="radio" id="free-shipping" name="shipping" class="custom-control-input" required="required">
														<label class="custom-control-label" for="free-shipping">Free Shipping</label>
													</div><!-- End .custom-control -->
	                							</td>
	                							<td>0đ</td>
	                						</tr><!-- End .summary-shipping-row -->

	                						<tr class="summary-shipping-row">
	                							<td>
	                								<div class="custom-control custom-radio">
														<input value="15000" type="radio" id="standart-shipping" name="shipping" class="custom-control-input" required="required">
														<label class="custom-control-label" for="standart-shipping">Standart:</label>
													</div><!-- End .custom-control -->
	                							</td>
	                							<td>15.000đ</td>
	                						</tr><!-- End .summary-shipping-row -->

	                						<tr class="summary-shipping-row">
	                							<td>
	                								<div class="custom-control custom-radio">
														<input value="25000" type="radio" id="express-shipping" name="shipping" class="custom-control-input" required="required">
														<label class="custom-control-label" for="express-shipping">Express:</label>
													</div><!-- End .custom-control -->
	                							</td>
	                							<td>25.000đ</td>
	                						</tr><!-- End .summary-shipping-row -->

	                						<tr class="summary-shipping-estimate">
	                							<td>Estimate for Your Country<br> <a href="dashboard.html">Change address</a></td>
	                							<td>&nbsp;</td>
	                						</tr><!-- End .summary-shipping-estimate -->

	                						<tr class="summary-total">
	                							<td>Total:</td>
	                							<td ><span class="totalPrice">${sumPrice}</span><span>đ</span></td>
	                							<!-- <td class ="test">0</td> -->
	                						</tr><!-- End .summary-total -->
	                					</tbody>
	                				</table><!-- End .table table-summary -->

	                				<a href="checkout.html" class="btn btn-outline-primary-2 btn-order btn-block">PROCEED TO CHECKOUT</a>
	                			</div><!-- End .summary -->

		            			<a href="category.html" class="btn btn-outline-dark-2 btn-block mb-3"><span>CONTINUE SHOPPING</span><i class="icon-refresh"></i></a>
	                		</aside><!-- End .col-lg-3 -->
	                	</div><!-- End .row -->
	                </div><!-- End .container -->
                </div><!-- End .cart -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

       
   
   <script>
   /* function myFunction() {
     var x=document.getElementsByClassName("amount");
   		for (i = 0; i < 10000; i++) {
       	x[i].value="100";
       }
   } */
</script>
       
<script>
		
			
			
		 function amount(id) {
				var data = {};
				var priceTotal = $('#priceTotal').val();
				var amount_id = '#amount_'+id;
				var price_id = '#price_'+id;
				var amount = $(amount_id).val();
				var price = $(price_id).text();
				data['price'] = price;
				data['amount'] = amount;
				data['id'] = id;
				
			   $.ajax({
				         type: "POST",
						 url: '${APIGetTotalOfQuantityUrl}',
				         data: JSON.stringify(data),
				         dataType: "json",
				         contentType: "application/json",
				         success: function (response) { 
				        	 var test = '.total-col_'+response.id;
				        	 $(test).text(response.totalAmount);
				        	 
				        	 sumPrice();
				         },
				         error: function (response) {
				        	 alert("amount");
				         }
				      }); 
		}
		
		function getCart() {
			$("#cartMini").html('');
			 $.ajax({
	            url : '${APIGetCartUrl}',
	            type : 'POST',
	            dataType: "json",
	            contentType: "application/json",
	            success : function(data){
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
	             						'<img src="${Pricture}" alt="product">'+
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
  			$("#cartMini").html('');
  			$.ajax({
  				type : "DELETE",
  				url : "${APIDeleteCartUrl}",
  				data : JSON.stringify(data),
  				contentType : "application/json",
  				success : function(response) {
  		         	 getQuantitCart();
  		         	 $('#cart_'+response).remove();
  		         	getCart();
  		         	sumPrice();
  		         	swal("Thành công", "Sản phẩm đã được xóa", "success"); 
  				},
  				error : function(response) {
  					
  					
  				}
  			});
  		}
		 
		 
		 function getCartByIdUser() {
			 
	  			$.ajax({
	  				type : "POST",
	  				url : "${APIGetCartByIdUserUrl}",
	  				contentType : "application/json",
	  				success : function(data) {
	  					$("#cartBody tbody").html('');
	  					swal("Thành công", "Sản phẩm đã được xóa", "success");
	  		         	
	  		         	getCart();
	  		         	$.each(data, function (key, value) {
		             		$("#cartBody tbody").append('<tr class = "prduct-cart">'+
		             				'<td class="product-col">'+
		             				'<div class="product" style="padding: 0px;">'+
		             				'<figure class="product-media">'+
		             				'<a href="#"><img src="${Pricture}"></a>'+
		             				'</figure>'+
		             				'<h3 class="product-title">'+
		             				'<a href="#">'+value.name+'</a>'+
		             				'</h3>'+
		             				'</div>' +
		             				'</td>'+
		             				
		             				'<td class="price-col" id="price">'+value.price+'</td>'+
		             				
		             				'<td class="quantity-col">'+
		             				'<div class="cart-product-quantity">'+
		             				 '<input type="number" id="amount" class="form-control"  value="1" min="1" max="10" step="1" data-decimals="0" required>'+
		             				'</div>'+
		             				
		             				'</td>'+
		             				'<td class="total-col" id="priceTotal">'+value.price * value.amount+'</td>'+
		             				'<td class="remove-col"><button onclick="deleteCart('+value.id+')" class="btn-remove"><i class="icon-close"></i></button></td>'+
		             				'</tr>');
		             	}); 
	  		         	
	  				},
	  				error : function(response) {
	  					swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
	  					
	  				}
	  			});
	  		}
		 function sumPrice() {
			 
	  			$.ajax({
	  				type : "POST",
	  				url : "${APIGetSumCartUrl}",
	  				 dataType: "json",
	  				contentType : "application/json",
	  				success : function(response) {
	  					
	  		         	 $('.sumprice').text(response);
	  		         	 $('.cart-total-price').text(response);
	 				  total();
	  		         	 
	  				},
	  				error : function(response) {
	  					alert("Lỗi sumcart")
	  					
	  				}
	  			});
	  		}
			  $("input:radio").click(function() { 
				  /* $('.totalPrice').text('');
				  var l = $('.idCarts').length;
				
				var result = [];
				for (i = 0; i < l; i++) { 
				 
				  result.push($('.idCarts').eq(i).val());
				}
				
				console.log(result);
				  var radioValue = $("input[name='shipping']:checked").val();
				   var data = {}; 
				  var orderId = $('#orderId').val();
				    data['shipping'] = radioValue; 
				    var totalPrice = $('.sumprice').text() ;
				   data['subTotal'] = totalPrice; 
				   data['checkOrder'] = false; 
				   data['cartIds'] = result;
				   data['id'] = orderId; */
				   total();
				   
				  
		        }); 
			  /* Tổng tiền đã tính tiền ship */
			  function total() {
				  $('.totalPrice').text('');
				  var l = $('.idCarts').length;
				
				var result = [];
				for (i = 0; i < l; i++) { 
				 
				  result.push($('.idCarts').eq(i).val());
				}
				
				console.log(result);
				  var radioValue = $("input[name='shipping']:checked").val();
				   var data = {}; 
				  var orderId = $('#orderId').val();
				    data['shipping'] = radioValue; 
				    var totalPrice = $('.sumprice').text() ;
				   data['subTotal'] = totalPrice; 
				   data['checkOrder'] = false; 
				   data['cartIds'] = result;
				   data['id'] = orderId;
				  $.ajax({
					   type: "POST",
			  		    url: "${APIOrderUrl}",
			  		 	 data : JSON.stringify(data),
			  		 	 dataType: "json",
			  		 	 contentType : "application/json",
		  				success : function(response) {
		  		         	 $('.totalPrice').text(response.totalPrice);
		  		         	 
		  		         		 $('#orderId').val(response.id);
		  		         	
		  		         	 
		  				},
		  				error : function(response) {
		  					alert("Lỗi total")
		  					
		  				}
		  			});
			}
</script>

</body>
</html>