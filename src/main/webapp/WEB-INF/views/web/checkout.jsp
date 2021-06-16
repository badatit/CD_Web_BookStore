<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APICheckout" value="/api/checkout" />
<c:url var="accountUrl" value="/web/account" />

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
					<div class="checkout-discount">
						<form action="#">
							<input type="text" class="form-control" required
								id="checkout-discount-input"> <label
								for="checkout-discount-input" class="text-truncate">Have
								a coupon? <span>Click here to enter your code</span>
							</label>
						</form>
					</div>
					<!-- End .checkout-discount -->
					<form action="#" id="checkOutForm">
						<div class="row">
							<div class="col-lg-9">
								<h2 class="checkout-title">Billing Details</h2>
								<!-- End .checkout-title -->
								<input type="hidden" id="id" value="${userDTO.id}" /> <label>Full
									Name</label> <input type="text" class="form-control"
									value="${userDTO.fullName }" name="fullName"> <label>Address
									*</label> <input type="text" class="form-control"
									value="${userDTO.address }"
									placeholder="House number and Street name" name="address"
									required>


								<!-- <div class="row">
		                					<div class="col-sm-6">
		                						<label>Postcode / ZIP *</label>
		                						<input type="text" class="form-control" required>
		                					</div>End .col-sm-6

		                					<div class="col-sm-6">
		                						<label>Phone *</label>
		                						<input type="tel" class="form-control" required>
		                					</div>End .col-sm-6
		                				</div>End .row -->
								<label>Phone *</label> <input type="tel"
									value="${userDTO.phoneNumber }" class="form-control"
									name="Phone Number" required> <label>Email
									address *</label> <input type="email" name="email" class="form-control"
									value="${userDTO.email }" required> <label>Order
									notes (optional)</label>
								<textarea class="form-control" cols="30" rows="4"
									placeholder="Notes about your order, e.g. special notes for delivery"></textarea>
							</div>
							<!-- End .col-lg-9 -->
							<aside class="col-lg-3">
								<div class="summary">
									<h3 class="summary-title">Your Order</h3>
									<!-- End .summary-title -->

									<table class="table table-summary">


										<tbody>
											<tr>
												<td>Shipping:</td>
												<td><c:if test="${orderDTO.shipping == 0} ">Free shipping</c:if>
													<c:if test="${orderDTO.shipping == 15.0}">Standart</c:if> <c:if
														test="${orderDTO.shipping == 25.0}">Express</c:if></td>
											</tr>
											<tr class="summary-total">
												<td>Total:</td>
												<td>${orderDTO.total}VND</td>
											</tr>
											<!-- End .summary-total -->
										</tbody>
									</table>
									<!-- End .table table-summary -->

									<div class="accordion-summary" id="accordion-payment">

										<div class="card">
											<div class="card-header" id="heading-3">
												<h2 class="card-title">
													<a class="collapsed" role="button" data-toggle="collapse"
														href="#collapse-3" aria-expanded="false"
														aria-controls="collapse-3"> Cash on delivery </a>
												</h2>
											</div>
											<!-- End .card-header -->
											<div id="collapse-3" class="collapse"
												aria-labelledby="heading-3" data-parent="#accordion-payment">
												<div class="card-body">Quisque volutpat mattis eros.
													Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
													Donec odio. Quisque volutpat mattis eros.</div>
												<!-- End .card-body -->
											</div>
											<!-- End .collapse -->
										</div>
										<!-- End .card -->

										<div class="card">
											<div class="card-header" id="heading-4">
												<h2 class="card-title">
													<a class="collapsed" role="button" data-toggle="collapse"
														href="#collapse-4" aria-expanded="false"
														aria-controls="collapse-4"> PayPal <small
														class="float-right paypal-link">What is PayPal?</small>
													</a>
												</h2>
											</div>
											<!-- End .card-header -->
											<div id="collapse-4" class="collapse"
												aria-labelledby="heading-4" data-parent="#accordion-payment">
												<div class="card-body">Nullam malesuada erat ut
													turpis. Suspendisse urna nibh, viverra non, semper
													suscipit, posuere a, pede. Donec nec justo eget felis
													facilisis fermentum.</div>
												<!-- End .card-body -->
											</div>
											<!-- End .collapse -->
										</div>
										<!-- End .card -->


									</div>
									<!-- End .accordion -->

									<button onclick="checkOut()" type="submit"
										class="btn btn-outline-primary-2 btn-order btn-block">
										<span class="btn-text">Place Order</span> <span
											class="btn-hover-text">Proceed to Checkout</span>
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
		function checkOut() {
			
				$.ajax({
					type : "GET",
					url : "${APICheckout}",
					contentType : "application/json",
					success : function(response) {
						if (response != null) {
							saveOrderDetail(response);
						}
					},
					error : function(response) {
						
					}
				});

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
	</script>
</body>
</html>