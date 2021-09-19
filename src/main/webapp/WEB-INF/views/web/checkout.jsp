<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APICheckout" value="/api/checkout" />
<c:url var="accountUrl" value="/web/account" />
<c:url var="payPalUrl" value="/web/pay" />

<c:url var="Pricture"
	value='/template/web/assets/images/products/cart/product-1.jpg' />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
	<main class="main">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container"></div>
			<!-- End .container -->
		</nav>
		<!-- End .breadcrumb-nav -->

		<div class="page-content">
			<div class="checkout">
				<div class="container">
					<!-- End .checkout-discount -->
					<form  id="checkOutForm">
						<div class="row">
							<div class="col-lg-9">
								<h2 class="checkout-title">Chi tiết thanh toán</h2>
								<!-- End .checkout-title -->
								<input type="hidden" id="id" value="${userDTO.id}" />

								<div class="form-group">
									<label>Họ Và Tên</label> <input type="text" class="form-control"
										value="${userDTO.fullName }" name="fullName" id="fullName">
									<p class="statusfullName"></p>
									<p class="status"></p>
								</div>

								<div class="form-group">
									<label>Địa Chỉ*</label> <input type="text" class="form-control"
										value="${userDTO.address }" name="address" required
										id="address">
									<p class="statusaddress"></p>
										<p class="status"></p>
								</div>

								<div class="form-group">
									<label>Số Điện Thoại *</label> <input type="tel"
										value="${userDTO.phoneNumber }" class="form-control"
										name="PhoneNumber" id="phoneNumber" required>
									<p class="statusphoneNumber"></p>
										<p class="status"></p>
								</div>
								<div class="form-group">
									<label>Email *</label> <input type="email"
										class="form-control" value="${userDTO.email }" required
										id="email">
									<p class="statusEmail"></p>
										<p class="status"></p>
								</div>
								<label>Lưa ý nhận hàng</label>
								<textarea class="form-control" cols="30" rows="4"></textarea>
							</div>
							<!-- End .col-lg-9 -->
							<aside class="col-lg-3">
								<div class="summary">
									<h3 class="summary-title">Đơn hàng của bạn</h3>
									<!-- End .summary-title -->

									<table class="table table-summary">


										<tbody>
											<tr>
												<td>Hình Thức Vận Chuyển:</td>
												<td><c:if test="${orderDTO.shipping == 0} ">Miễn Phí Vận Chuyển</c:if>
													<c:if test="${orderDTO.shipping == 15.0}">Giao Hàng Tiết Kiệm</c:if> <c:if
														test="${orderDTO.shipping == 25.0}">Giao Hàng Nhanh</c:if></td>
											</tr>
											<tr class="summary-total">
												<td>Tổng Tiền:</td>
												<td><span><fmt:formatNumber type="number" groupingUsed="true"
														value="${orderDTO.total}" /></span> VND <input
													type="hidden" id="price" name="price"
													value="${orderDTO.total}"></td>
											</tr>
											<!-- End .summary-total -->
										</tbody>
									</table>
									<!-- End .table table-summary -->

									<div class="accordion-summary" id="accordion-payment">

										<div class="card">
											<div class="card-header" id="heading-1">
												<h2 class="card-title">
													<a onclick="checkPay(1)" role="button"
														data-toggle="collapse" href="#collapse-1"
														aria-expanded="true" aria-controls="collapse-1">
														Thanh Toán Khi Nhận Hàng</a>
												</h2>
											</div>
											<!-- End .card-header -->
											<div id="collapse-1" class="collapse show"
												aria-labelledby="heading-1" data-parent="#accordion-payment">
												<div class="card-body"></div>
												<!-- End .card-body -->
											</div>
											<!-- End .collapse -->
										</div>
										<!-- End .card -->
										<!-- End .card -->

										<div class="card">
											<div class="card-header" id="heading-4">
												<h2 class="card-title">
													<!-- <a onclick="checkPay(2)" class="collapsed" role="button"
														data-toggle="collapse" href="#collapse-4"
														aria-expanded="false" aria-controls="collapse-4">
														PayPal <small class="float-right paypal-link">What
															is PayPal?</small>
													</a> -->
												</h2>
											</div>
											<!-- End .card-header -->
											<div id="collapse-4" class="collapse"
												aria-labelledby="heading-4" data-parent="#accordion-payment">
												<div class="card-body"></div>
												<!-- End .card-body -->
											</div>
											<!-- End .collapse -->
										</div>
										<!-- End .card -->
										<!-- End .card -->


									</div>
									<!-- End .accordion -->
									<input type="hidden" id="checkPayNumber" value="1">
									<button id="btnCheckOut" type="submit"
										class="btn btn-outline-primary-2 btn-order btn-block">
										<span class="btn-text">Đặt hàng</span> <span
											class="btn-hover-text">Tiến hàng đặt hàng</span>
									</button>
								</div>
								<!-- End .summary -->
							</aside>
							<!-- End .col-lg-3 -->
						</div>
						<!-- End .row -->
					</form>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .checkout -->
		</div>
		<!-- End .page-content -->
	</main>
	<!-- End .main -->
	<script>
	
	$("#btnCheckOut").click(function (e) {
		 e.preventDefault();
		var fullName = $('#fullName').val();
		var address = $('#address').val();
		var email = $('#email').val();
		var phoneNumber = $('#phoneNumber').val(); 
		if(fullName == '' || address == '' || email =='' || phoneNumber== '' ){
			swal("Thất bại", "Vui lòng điền đẩy đủ thông tin giao hàng :)", "error");
		}else {
			 checkOut(); 
		}
		
	});
	
	 function checkOut() {
			$.ajax({
				type : "GET",
				url : "${APICheckout}",
				contentType : "application/json",
				success : function(response) {
					if (response != null) {
					//	if (response.quantityAfter > 0) {
							saveOrderDetail(response.id);
						//}else{
						//	alert('So luong chi con '+ response.quantityAfter);
						//}
					}
				},
				error : function(response) {

				}
			});

		} 
		
		function checkPay(number) {
			$('#checkPayNumber').val(number);

		}

		function saveOrderDetail(response) {
			var id = $('#id').val();
			$.ajax({
				type : 'post',
				url : '${APICheckout}',
				data : JSON.stringify(response),
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					if (data == "success") {
						swal("Thành công", "Sản phẩm đã được xóa", "success");
						window.location.href = "${accountUrl}/" + id;
					}
				}
			});
		}

		$("#email").blur(function emailExists() {
							var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
							var email = $("#email").val();
							if (!regex.test(email)) {
								$(".statusEmail").html("<font>Email không đúng định dạng</font>");
								$(".statusEmail").css("color", "red");
								$("#btnCheckOut").prop('disabled', true);
							} else {
								$(".statusEmail").html("<font></font>");
								$("#btnCheckOut").prop('disabled', false);

							}

						});

		$("#phoneNumber").blur(
				function phoneNumber() {
					var phoneNumber = $("#phoneNumber").val();
					if (phoneNumber.length > 0) {
						$(".statusphoneNumber").html("<font></font>");
						return true;
					} else {
						$(".statusphoneNumber").html(
								"<font>Vui lòng nhập số điện thoại</font>");
						$(".statusphoneNumber").css("color", "red");
						return false;
					}
				});

		$("#fullName").blur(
				function fullName() {
					var fullName = $("#fullName").val();
					if (fullName.length > 0) {
						$(".statusfullName").html("<font></font>");
						return true;
					} else {
						$(".statusfullName").html(
								"<font>Vui lòng nhập họ và tên</font>");
						$(".statusfullName").css("color", "red");
						return false;
					}
				});

		$("#address").blur(function address() {
			var address = $("#address").val();
			if (address.length > 0) {
				$(".statusaddress").html("<font></font>");
				return true;
			} else {
				$(".statusaddress").html("<font>Vui lòng nhập địa chỉ</font>");
				$(".statusaddress").css("color", "red");
				return false;
			}
		});

		$( document ).ready(function() {
			 $('#bodyCart').css("display","none"); 
			console.log( "ready!" );
		});
	</script>
</body>
</html>