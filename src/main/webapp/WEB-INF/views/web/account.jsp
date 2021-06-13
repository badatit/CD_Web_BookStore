<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="uploadUrl" value="/api/home" />
<c:url var="listUserUrl" value="/admin/user/list" />
<c:url var="ApiUrl" value="/web/api/user" />
<c:url var="ApiUrlName" value="/web/api/user/check" />
<c:url var="ApiUrlPass" value="/web/api/user/password" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<main class="main">
        
            <nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">My Account</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
            	<div class="dashboard">
	                <div class="container">
	                	<div class="row">
	                		<aside class="col-md-4 col-lg-3" style="max-width: 25%;">
	                			<ul class="nav nav-dashboard flex-column mb-3 mb-md-0" role="tablist">
								    <li class="nav-item">
								        <a class="nav-link active" id="tab-orders-link" data-toggle="tab" href="#tab-orders" role="tab" aria-controls="tab-orders" aria-selected="false">Đơn Mua</a>
								    </li>
								    <li class="nav-item">
								        <a class="nav-link" id="tab-downloads-link" data-toggle="tab" href="#tab-downloads" role="tab" aria-controls="tab-downloads" aria-selected="false">Downloads</a>
								    </li>
								    <li class="nav-item">
								        <a class="nav-link " id="tab-account-link" data-toggle="tab" href="#tab-account" role="tab" aria-controls="tab-account" aria-selected="false">Hồ Sơ</a>
								    </li>
								     <li class="nav-item">
								        <a class="nav-link" id="tab-address-link" data-toggle="tab" href="#tab-address" role="tab" aria-controls="tab-address" aria-selected="false">Thay Đổi Mật Khẩu</a>
								    </li>
								</ul>
	                		</aside><!-- End .col-lg-3 -->

	                		<div class="col-md-8 col-lg-9">
	                			<div class="tab-content">
								    <div class="tab-pane fade show active" id="tab-orders" role="tabpanel" aria-labelledby="tab-orders-link">
								  <div class="col-lg-9" style="max-width: 100%;">
	                			<table class="table table-cart table-mobile">
									<thead>
										<tr>
											<th>Sản Phẩm</th>
											<th>Giá</th>
											<th>Số Lượng</th>
											<th>Tổng Tiền</th>
											<th>Trạng Thái</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td class="product-col">
												<div class="product"style="padding-top: 13px;">
													<figure class="product-media">
														<a href="#">
															<img src="<c:url value='/template/web/assets/images/products/product-4.jpg'/>" alt="Product image" class="product-image">
														</a>
													</figure>

													<h3 class="product-title">
														<a href="#">Beige knitted elastic runner shoes</a>
													</h3><!-- End .product-title -->
												</div><!-- End .product -->
											</td>
											<td class="price-col" >$84.00</td>
											<td class="quantity-col"><p style="margin-left: 26px;">1</p></td>
											<td class="price-col" style="width: 110px;">$84.00</td>
											<td class="remove-col">
											<div class="product-title" style="text-align: center;width: 110px;">Hoàn Thành</div>
											<!-- <div><a href="#" class="btn btn-outline-dark-2"><span>UPDATE CART</span><i class="icon-refresh"></i></a></div> -->
											
											</td>
										</tr>
									</tbody>
								</table><!-- End .table table-wishlist -->
	                		</div><!-- End .col-lg-9 -->
							</div><!-- .End .tab-pane -->

								    <div class="tab-pane fade" id="tab-downloads" role="tabpanel" aria-labelledby="tab-downloads-link">
								    	<p>No downloads available yet.</p>
								    	<a href="category.html" class="btn btn-outline-primary-2"><span>GO SHOP</span><i class="icon-long-arrow-right"></i></a>
								    </div><!-- .End .tab-pane -->

								    <div class="tab-pane fade" id="tab-address" role="tabpanel" aria-labelledby="tab-address-link">

								    		<form id="formEditPass">
								    		<div class="row" style="margin-left: 1px;" >
		            						<label>Mật Khẩu mới</label>
		            						<input type="password" id="password" name="password" class="form-control">
		            						<span class="statusPassword"></span>
		            						</div>

		            						<div class="row" style="margin-left: 1px;" >
		            						<label>Nhập Lại mật khẩu</label>
		            						<input type="password" id="repeatPass" name="repeatPass"  class="form-control mb-2">
		            						<span class="statusrepeatPass"></span>
		            						</div>
		            						
		            						<input type="hidden" class="form-control" id="id" name="id" value = "${user.id}">

		                					<button type="submit" id = "editPassword" class="btn btn-outline-primary-2">
			                					<span>Thay Đổi</span>
			            						<i class="icon-long-arrow-right"></i>
			                				</button>
			                			</form>
								    </div><!-- .End .tab-pane -->

								    <div class="tab-pane fade " id="tab-account" role="tabpanel" aria-labelledby="tab-account-link">
								    	<form id="formEdit">
			                				<div class="row">
			                					<div class="col-sm-6">
			                						<label>Họ Và Tên *</label>
			                						<input type="text" class="form-control" id="fullName" name = "fullName" value = "${user.fullName}" required>
			                						<span class="statusfullName"></span>
			                					</div><!-- End .col-sm-6 -->

			                					<div class="col-sm-6">
			                						<label>Tên Đăng Nhập *</label>
			                						<input type="text" class="form-control" id="userName" name= "userName" value = "${user.userName}" required>
			                						<small class="status"></small>
			                					</div><!-- End .col-sm-6 -->
			                				</div><!-- End .row -->
			                				
			                				
											<div >
		            						<label>Số Điện Thoại *</label>
		            						<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value = "${user.phoneNumber}" required>
		            						<small class="statusphoneNumber"></small>
											</div>
												
											<div class="row" style="margin-left: 1px;">
		                					<label>Email  *</label>
		        							<input type="email" class="form-control" id="email" name = "email" value= "${user.email}" required>
		        							<span class="statusemail"></span>
		        							</div>
		        							
		        							<div class="row" style="margin-left: 1px;" >
		        							<label>Địa Chỉ *</label>
		            						<input type="text" class="form-control" id="address" name="address" value = "${user.address}" required>
											<span class="statusaddress"></span>
											</div>
											
											<input type="hidden" class="form-control" id="id" name="id" value = "${user.id}">
											
		                					<button type="submit" id = "editUser" class="btn btn-outline-primary-2">
			                					<span>Thay Đổi</span>
			            						<i class="icon-long-arrow-right"></i>
			                				</button>
			                			</form>
								    </div><!-- .End .tab-pane -->
								</div>
	                		</div><!-- End .col-lg-9 -->
	                	</div><!-- End .row -->
	                </div><!-- End .container -->
                </div><!-- End .dashboard -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->
        
	<script>
	$('#editUser').click(function (e) {
		 e.preventDefault();
		  var data={};
		  var formData = $('#formEdit').serializeArray();  
		  $.each(formData, function (index, v) {
		        data["" + v.name + ""] = v.value;
		    });
		  updateUser(data);
			
		});
		
		function updateUser(data) {
			   $.ajax({
	            type: "PUT",
	  		    url: "${ApiUrl}",
	            data: JSON.stringify(data),
	            dataType: "json",
	            contentType: "application/json",
	            success: function (response) {  
	            	swal("Thành Công!", "Hãy nhấn vào nút!", "success");
	            },
	            error: function (response) {
	            	swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
	            }
	         });
	}
		$('#editPassword').click(function (e) {
			 e.preventDefault();
			  var data={};
			  var formData = $('#formEditPass').serializeArray();  
			  $.each(formData, function (index, v) {
			        data["" + v.name + ""] = v.value;
			    });
			  var password = $('#password').val();
			  var repeatPass = $('#repeatPass').val();
			  if(password !="" && repeatPass != ""){
				  updateUser(data);
			  }else {
				  swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
			  }
			
				
			});
			
			function updateUser(data) {
				   $.ajax({
		            type: "PUT",
		  		    url: "${ApiUrlPass}",
		            data: JSON.stringify(data),
		            dataType: "json",
		            contentType: "application/json",
		            success: function (response) {  
		            	swal("Thành Công!", "Hãy nhấn vào nút!", "success");
		            },
		            error: function (response) {
		            	swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
		            }
		         });
		}
		$(document).ready(function() {		
			$("#password").blur(function password() {
				var password = $("#password").val();
				if (password.length > 6) {
					$(".statusPassword").html("<font>Mật Khẩu hợp lệ</font>");
					$(".statusPassword").css('color' , 'green');
					return true;
				} else {
					$(".statusPassword").html("<font>Mật khẩu phải dài hơn 6 ký tự.</font>");
					$(".statusPassword").css('color' , 'red');
					return false;
				}
			});
			
			$("#fullName").blur(function fullName() {
				var fullName = $("#fullName").val();
				if (fullName.length > 6) {
					$(".statusfullName").html("<font> Hợp lệ</font>");
					$("#editUser").prop('disabled', false);
					return true;
				} else {
					$(".statusfullName").html("<font>Tên phải dài hơn 6 ký tự.</font>");
					$("#editUser").prop('disabled', true);
					return false;
				}
			});
			
			$("#repeatPass").blur(function repeatPass() {
					var repeatPass = $("#repeatPass").val();
				var password = $("#password").val();
				if (repeatPass == password) {
					$(".statusrepeatPass").html("<font>Hợp lệ</font>");
					$("#editPassword").prop('disabled', false);
					$(".statusrepeatPass").css('color', 'green'); 
					return true;
				} else {
					$(".statusrepeatPass").html("<font>Mật khẩu không trùng khớp</font>");
					$(".statusrepeatPass").css('color', 'red'); 
					$("#editPassword").prop('disabled', true);
					return false;
				}
			});
			
			$("#phoneNumber").blur(function phoneNumber() {
				var phoneNumber = $("#phoneNumber").val();
				if (phoneNumber.length > 0) {
					$(".statusphoneNumber").html("<font> Hợp lệ</font>");
					$("#editUser").prop('disabled', false);
					return true;
				} else {
					$(".statusphoneNumber").html("<font>Vui lòng nhập số điện thoại</font>");
					$("#editUser").prop('disabled', true);
					return false;
				}
			});
			$("#address").blur(function address() {
				var address = $("#address").val();
				if (address.length > 0) {
					$(".statusaddress").html("<font>Địa chỉ hợp lệ</font>");
					$("#editUser").prop('disabled', false);
					return true;
				} else {
					$(".statusaddress").html("<font>Vui lòng nhập địa chỉ</font>");
					$("#editUser").prop('disabled', true);
					return false;
				}
			}); 
			
		});
	</script>


</body>
</html>