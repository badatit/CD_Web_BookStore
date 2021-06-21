<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APICartUrl" value="/api/carts" />
<c:url var="APIOrderUrl" value="/api/orders" />
<c:url var="APIOrderDetailUrl" value="/api/orderdetails" />
<c:url var="CheckoutUrl" value="/web/checkout" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
	<main class="main" style="margin-top: 50px;">

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
									<c:forEach var="item" items="${listCart}">
										<tr class="prduct-cart" id="cart_${item.id}">
											<td class="product-col">
												<div class="product" style="padding: 0px;">
													<figure class="product-media">
														<a href="#"> <img
															src="${item.img1 }"
															alt="Product image">
														</a>
													</figure>

													<h3 class="product-title">
														<a href="#">${item.name }</a>
													</h3>
													<!-- End .product-title -->
												</div> <!-- End .product -->
											</td>
											<td class="price-col">	<fmt:formatNumber type="number" groupingUsed="true" value="${item.price}"/></td>
											<td class="quantity-col">
												<div class="cart-product-quantity">
													<button onclick="addCart(${item.bookId},${item.id})">
														<input type="number"
															class="form-control amount_${item.id}"
															value="${item.amount}" step="1" min="1" max="10"
															data-decimals="0" required>
													</button>
												</div> <!-- End .cart-product-quantity -->
											</td>
											<td class="total-col" id="priceTotal_${item.id}">
											<fmt:formatNumber type="number" groupingUsed="true" value="${item.amountTotal}"/>
										</td>
											<td class="remove-col"><button class="btn-remove"
													onclick="deleteCart(${item.id})">
													<i class="icon-close"></i>
												</button></td>
											<input type="hidden" class="id" class="id" id="id"
												value="${item.id}" />
										</tr>

									</c:forEach>
								</tbody>
							</table>
							<!-- End .table table-wishlist -->

							<div class="cart-bottom">
								<div class="cart-discount">
									<form action="#">
										<div class="input-group">
											<input type="text" class="form-control" required
												placeholder="coupon code">
											<div class="input-group-append">
												<button class="btn btn-outline-primary-2" type="submit">
													<i class="icon-long-arrow-right"></i>
												</button>
											</div>
											<!-- .End .input-group-append -->
										</div>
										<!-- End .input-group -->
									</form>
								</div>
								<!-- End .cart-discount -->

								<a href="#" class="btn btn-outline-dark-2"><span>UPDATE
										CART</span><i class="icon-refresh"></i></a>
							</div>
							<!-- End .cart-bottom -->
						</div>
						<!-- End .col-lg-9 -->
						<aside class="col-lg-3">
							<div class="summary summary-cart">
								<h3 class="summary-title">Cart Total</h3>
								<!-- End .summary-title -->

								<table class="table table-summary">
									<tbody>
										<tr class="summary-subtotal">
											<td>Subtotal:</td>
											<td><span class="sumprice"></span><span id="subTotal">
												<fmt:formatNumber type="number"  groupingUsed="true" value="${sumPrice}"  />
											
											</span>
											<span id="vnd">VND</span>
											</td>
										</tr>
										<!-- End .summary-subtotal -->
										<tr class="summary-shipping">
											<td>Shipping:</td>
											<td>&nbsp;</td>
										</tr>

										<tr class="summary-shipping-row">
											<td>
												<div class="custom-control custom-radio">
													<input value="0" type="radio" onclick="myFunction()"
														id="free-shipping" name="shipping"
														class="custom-control-input" required="required">
													<label class="custom-control-label" for="free-shipping">Free
														Shipping</label>
												</div> <!-- End .custom-control -->
											</td>
											<td>0đ</td>
										</tr>
										<!-- End .summary-shipping-row -->

										<tr class="summary-shipping-row">
											<td>
												<div class="custom-control custom-radio">
													<input value="15.000" type="radio" onclick="myFunction()"
														id="standart-shipping" name="shipping"
														class="custom-control-input" required="required">
													<label class="custom-control-label" for="standart-shipping">Standart:</label>
												</div> <!-- End .custom-control -->
											</td>
											<td>15.000đ</td>
										</tr>
										<!-- End .summary-shipping-row -->

										<tr class="summary-shipping-row">
											<td>
												<div class="custom-control custom-radio">
													<input value="25.000" type="radio" onclick="myFunction()"
														id="express-shipping" name="shipping"
														class="custom-control-input" required="required">
													<label class="custom-control-label" for="express-shipping">Express:</label>
												</div> <!-- End .custom-control -->
											</td>
											<td>25.000đ</td>
										</tr>
										<!-- End .summary-shipping-row -->

										<tr class="summary-shipping-estimate">
											<td>Estimate for Your Country<br> <a
												href="dashboard.html">Change address</a></td>
											<td>&nbsp;</td>
										</tr>
										<!-- End .summary-shipping-estimate -->

										<tr class="summary-total">
											<td>Total:</td>
											<td><span class="totalPrice" id="total">	
											<c:set value="${sumPrice}"  var="names"></c:set> 
											<fmt:formatNumber type="number" groupingUsed="true" value="${names}" />
											</span>
												<span id="vnd">VND</span></td>
											<!-- <td class ="test">0</td> -->
										</tr>
										<!-- End .summary-total -->
									</tbody>
								</table>
								<!-- End .table table-summary -->

								<a onclick="addOrder()" 
									class="btn btn-outline-primary-2 btn-order btn-block">PROCEED
									TO CHECKOUT</a>
							</div>
							<!-- End .summary -->

							<a href="category.html"
								class="btn btn-outline-dark-2 btn-block mb-3"><span>CONTINUE
									SHOPPING</span><i class="icon-refresh"></i></a>
						</aside>
						<!-- End .col-lg-3 -->
					</div>
					<!-- End .row -->
				</div>
				<!-- End .container -->
			</div>
			<!-- End .cart -->
		</div>
		<!-- End .page-content -->
	</main>
	<!-- End .main -->





	<script>
function update() {
	alert("Check box in Checked");
}
function addOrder() {
	var subTotal =$('#subTotal').text();
	 var radioValue = $("input[name='shipping']:checked").val();
	 if (radioValue == null || subTotal == 0) {
		 if (subTotal == 0) {
			 alert('Bạn chưa có sản phẩm.');

		}else{	
			alert('Vui lòng chọn Shipping');
		}
		}else{
	var data={};
	var l = $('.id').length;
	var data={};
	 var total = $('.totalPrice').text();
	var result = [];
	for (i = 0; i < l; i++) { 
	  result.push($('.id').eq(i).val());
	}
	data['cartIds']=result;
	
	 var shipping = radioValue;
	data['shipping'] = shipping;
	data['total']=total;
	 $.ajax({
         type: 'post',
         url: '${APIOrderUrl}/saveOrders',
         data: JSON.stringify(data),
         contentType: "application/json; charset=utf-8",
         success: function (data) {
             if (data == "success") {
            	 window.location.href = "${CheckoutUrl}";
			}
         }
     });
		}
	/*
	 var radioValue = $("input[name='shipping']:checked").val();
	 if (radioValue == null) {
			alert('Vui lòng chọn Shipping');
		}else{
			var data={};
			var l = $('.id').length;
			var data={};
			var result = [];
			for (i = 0; i < l; i++) { 
			  result.push($('.id').eq(i).val());
			}
			data['cartIds']=result;
			 var total = $('.totalPrice').text();
			 var shipping = radioValue;
			data['shipping'] = shipping;
			data['total']=total;
			
	 $.ajax({
         type: 'post',
         url: '${APIOrderUrl}/saveOrders',
         data: JSON.stringify(data),
         contentType: "application/json; charset=utf-8",
         success: function (data) {
             if (data.message != null) {
            	 saveOrderDetail(data.id);
            	 $('orderId').val(id);
			}
         }
     });
	}
	 
	*/
}
/*
function saveOrderDetail(orderId){
	var l = $('.id').length;
	var data={};
	var result = [];
	for (i = 0; i < l; i++) { 
	  result.push($('.id').eq(i).val());
	}
	data['cartIds']=result;
	data['orderId']=orderId;
	 $.ajax({
         type: 'post',
         url: '${APIOrderDetailUrl}',
         data: JSON.stringify(data),
         contentType: "application/json; charset=utf-8",
         success: function (data) {
             if (data == "success") {
				alert('oki all');
			}
         }
     });
}
*/
function addCart(bookId,id) {
	$("#cartMini").html('');
	var data = {};
	var qty_id =".amount_"+id;
	var qty = $(qty_id).val();
	
	var id =id;  
	 
	data['bookId'] = bookId;
	data['amount'] =qty;
	data['id'] =id;
	data['checkBookInCartPage'] = true;
	   $.ajax({
     type: "POST",
	 url: "${APICartUrl}",
     data: JSON.stringify(data),
     dataType: "json",
     contentType: "application/json",
     success: function (response) {  
     	$('#sizeCart').html(response.sizeCart);
     	
     	// call subtotal
     	getSubTotal();
     	getCart();
     	//change cart when click + -
    	 getOneCartChange(id);
     	// function currency
     	
     },
     
     error: function (response) {
    	 swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
     }
  });
}

 function getSubTotal() {
	 var radioValue = $("input[name='shipping']:checked").val();
		$.ajax({
			type : "GET",
			url : "${APICartUrl}/subTotal",
			contentType : "application/json",
			success : function(response) {
				 $('.cart-total-price').text(response);
				 $('#subTotal').text(response);
				 $('#total').text(response);
				 if (radioValue != null) {
				 myFunction();
				}
			},
			error : function(response) {
				 alert('Loi subTotal');
			}
		});
}
	
 function getOneCartChange(id) {
	 var idTotal ='#priceTotal_'+id;
		$.ajax({
		    url : '${APICartUrl}/changeCart?id='+id,
	         type : 'GET',
	         dataType: "json",
	         contentType: "application/json",
			success : function(data) {
				$(idTotal).text(data);
			},
			error : function(response) {
				alert('loi change cart');
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
 function deleteCart(id) {
		var data = {};
		data['id'] = id;
		var l = $('.id').length;
		//Initialize default array
		var result = [];
		for (i = 0; i < l; i++) { 
		  //Push each element to the array
		  result.push($('.id').eq(i).val());
		}
		for (i = 0; i < result.length; i++) {
			 if (result[i]== id) {
			 $('#cart_'+id).remove();
			}
		}
		
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
 /*
 $("input:radio").click(
	function currency() { 
	  var radioValue = $("input[name='shipping']:checked").val();
	  var total =$('#subTotal').text();
	  if (radioValue > 0) {
		  
		  $.ajax({
		         url : '${APICartUrl}/totalClickShipping?radio='+radioValue+"&total="+total,
		         type : 'GET',
		         dataType: "json",
		         contentType: "application/json",
		         success : function(data){
		        	 $('#total').text(data);
					},
					error : function(error){
						console.log(error)
						alert("Lỗi hệ thống");
					}
		     });
		  
		  var result = (total*1000) -radioValue;
		  x = result.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
		  console.log(x);
		  $('#total').text(x);
		  $('#vnd').remove();
	}else{
		  $('#total').text(total);

	}
	 
   }); 
 */
 function myFunction() {
	 var radioValue = $("input[name='shipping']:checked").val();
	  var total =$('#subTotal').text();
	  if (radioValue > 0) {
		 
		  $.ajax({
		         url : '${APICartUrl}/totalClickShipping?radio='+radioValue+"&total="+total,
		         type : 'GET',
		         dataType: "json",
		         contentType: "application/json",
		         success : function(data){
		        	 $('#total').html(data);
					},
					error : function(error){
						console.log(error)
						alert("Lỗi hệ thống");
					}
		     });
		}
	  if (radioValue == 0) {
		  $('#total').text(total);
	}
	}

 
</script>

</body>
</html>