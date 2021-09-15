<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="uploadUrl" value="/api/home" />
<c:url var="listUserUrl" value="/admin/user/list" />
<c:url var="ApiUrl" value="/web/api/user" />
<c:url var="ApiUrlName" value="/web/api/user/check" />
<c:url var="ApiUrlPass" value="/web/api/user/password" />
<c:url var="ApiFavoriteBookUrl" value="/api/bookfavorite" />
<c:url var="listOrderDetailUrl" value="/web/api/user/findall" />
<c:url var="OrderUrl" value="/web/api/user/findone" />
<c:url var="updateStatusUrl" value="/web/api/user/updatestatus" />
<c:url var="acountURL" value="/web/account" />
<c:url var="APICartUrl" value="/api/carts" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<main class="main">
        <input type="hidden" class="form-control" id="idUser" name="id" value = "${user.id}">
            <nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
                <div class="container">
                    
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
            	<div class="dashboard">
	                <div class="container">
	                	<div class="row" style="margin-right: -130px">
	                		<aside class="col-md-4 col-lg-3" style="max-width: 20%; margin-left: 10px">
	                			<ul class="nav nav-dashboard flex-column mb-3 mb-md-0" role="tablist">
								    <li class="nav-item">
								        <a class="nav-link active" id="tab-orders-link" data-toggle="tab" href="#tab-orders" role="tab" aria-controls="tab-orders" aria-selected="false">Đơn Mua</a>
								    </li>
								    <li class="nav-item">
								        <a class="nav-link" id="tab-downloads-link" data-toggle="tab" href="#tab-downloads" role="tab" aria-controls="tab-downloads" aria-selected="false">Đã Thích</a>
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
											<th>Tên Người Nhận</th>
											<th>Ngày Đặt Hàng</th>
											<th style="text-align: center;"> Sản Phẩm</th>
											<th>Tổng Tiền</th>
											<th>Trạng Thái</th>
											<th></th>
											<th></th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="item" items="${listOrders}">
										<tr>
											<td class="product-col" style="width: 130px">${item.name}</td>
											<td class="price-col" style="width: 126px" >${item.orderDate}</td>
											<td class="quantity-col" style="text-align: center;">${item.amount}</td>
											<td class="price-col" style="width: 110px;"><fmt:formatNumber type="number" groupingUsed="true"
														value="${item.total}" />VND
											<td class="remove-col">
											<div class="product-title" style="text-align: center;width: 110px;">${item.status}</div>
											</td>
											<td> 
												<button type="button" onclick="orderDetails(${item.id})" class="btn btn-info btn-lg" data-toggle="modal" data-target="#assignmentBuildingModal" style="height: 50px;background: #15A78A"> Xem Chi Tiết</button>
											</td>
											<td>
											<c:if test="${item.status == 'Đã Hủy'}">
											<button type="button" onclick="cancelOrder(${item.id})" class="btn btn-info btn-lg" data-toggle="modal" data-target="#cancelOrder" style="height: 50px;background: red ;display: none;"> Hủy Đơn Hàng</button>
											</c:if>
											
											<c:if test="${item.status == 'Đã Nhận Hàng'}">
											<button type="button" onclick="cancelOrder(${item.id})" class="btn btn-info btn-lg" data-toggle="modal" data-target="#cancelOrder" style="height: 50px;background: red ;display: none;"> Hủy Đơn Hàng</button>
											</c:if>
											
											<c:if test="${item.status == 'Chưa Nhận Hàng'}">
											<button type="button" onclick="cancelOrder(${item.id})" class="btn btn-info btn-lg" data-toggle="modal" data-target="#cancelOrder" style="height: 50px;background: red ;"> Hủy Đơn Hàng</button>
											</c:if>
											 </td>
										</tr>
										</c:forEach>
									</tbody>
								</table><!-- End .table table-wishlist -->
	                		</div><!-- End .col-lg-9 -->
							</div><!-- .End .tab-pane -->

								    <div class="tab-pane fade" id="tab-downloads" role="tabpanel" aria-labelledby="tab-downloads-link">
								     <div class="col-lg-9" style="max-width: 100%;">
	                			<table class="table table-cart table-mobile">
									<thead>
										<tr>
											<th>Sản Phẩm</th>
											<th>Giá</th>
											<th></th>
											<th></th>
										</tr>
									</thead>

									<tbody>
									<c:forEach var="item" items="${favoriteBooks}">
										<tr id="favorite_${item.id}">
											<td class="product-col" style="width: 63%">
												<div class="product"style="padding-top: 13px;">
													<figure class="product-media">
														<a >
															<img src="${item.bookIMG1}" alt="Product image" class="product-image">
														</a>
													</figure>

													<h3 class="product-title">
														${item.bookName}
													</h3><!-- End .product-title -->
												</div><!-- End .product -->
											</td>
											<td class="price-col" >
												<fmt:formatNumber type="number" groupingUsed="true" value="${item.bookPrice}"></fmt:formatNumber>VND</td>
											<td class="remove-col">
											
											<a href="<c:url value='/web/product/${item.bookId}' />" class="btn btn-outline-dark-2" style="background: lavender;"><span>Chi Tiết Sản Phẩm</span></a>
											
											</td>
											 <td class="remove-col"><button onclick="deleteFavoriteBook(${item.id})" class="btn-remove"><i class="icon-close"></i></button></td> 
										</tr>
										</c:forEach>
									</tbody>
								</table><!-- End .table table-wishlist -->
	                		</div><!-- End .col-lg-9 -->
								    	
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
			                						<small class="statusUserName"></small>
			                					</div><!-- End .col-sm-6 -->
			                				</div><!-- End .row -->
			                				
			                				
											<div >
		            						<label>Số Điện Thoại *</label>
		            						<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value = "${user.phoneNumber}" required>
		            						<span class="statusphoneNumber"></span>
											</div>
												
											<div class="row" style="margin-left: 1px;">
		                					<label>Email  *</label>
		        							<input type="email" class="form-control" id="email" name = "email" value= "${user.email}" required>
		        							<span class="statusEmail"></span>
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
        
        <div class="modal fade" id="assignmentBuildingModal" role="dialog">
	<div class="modal-dialog modal-lg" style="max-width: 930px">
		<div class="modal-content">
			<!-- <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="position: fixed;">Thông Tin Chi Tiết</h4>
			</div> -->
			<div class="group">
				<div class="content has-table" style="margin-top: 7px">
					<table >
						<tbody>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Họ Và Tên
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:white; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="name" name="name" disabled="disabled" /></td>
							</tr>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Email
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:#FAFAFA; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="email" name="email" disabled="disabled" /></td>
							</tr>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								 Số Điện Thoại
								 </td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:white; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="phoneNumber" name="phoneNumber" disabled="disabled" /></td>
							</tr>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Địa Chỉ 
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:#FAFAFA; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="address" name="address" disabled="disabled" /></td>
							</tr>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Hình Thức Vận Chuyển
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:white; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="shipping" name="shipping" disabled="disabled" /></td>
							</tr>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Ghi Chú
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:#FAFAFA; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="note" name="note" disabled="disabled" /></td>
							</tr>
							
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Ngày Đặt Hàng
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:white; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="orderDate" name="orderDate" disabled="disabled" /></td>
							</tr>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Trạng Thái
								</td>
							<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:#FAFAFA; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="status" name="status" disabled="disabled" /></td>
							
							</tr>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Chi tiết Sản phẩm
								</td>
								
							</tr>
							<table class="table table-cart table-mobile" id="cartBody">
								<thead>
									<tr>
										<th>Ảnh</th>
										<th>Tên Sách</th>
										<th>Giá</th>
										<th>Số Lượng</th>
									</tr>
								</thead>

								<tbody>
										<tr class="prduct-cart" id="cart">
											<td class="product-col">
												<div class="product" style="padding: 0px;">
													<figure class="product-media">
														<a href="#"> <img
															src=" <c:url value='/template/web/assets/images/products/cart/product-1.jpg'/>"
															alt="Product image">
														</a>
													</figure>
													<!-- End .product-title -->
												</div> <!-- End .product -->
											</td>
											<td class="product-title"></td>
											<td class="price-col"></td>
											<td class="quantity-col"></td>
										</tr>
								</tbody>
							</table>
							
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" style="background: #15A78A">Đóng</button>
			</div>
		</div>
	</div>
</div>
        
        
          <div class="modal fade" id="cancelOrder" role="dialog">
	<div class="modal-dialog modal-lg" style="max-width: 630px">
		<div class="modal-content">
			<!-- <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="position: fixed;">Thông Tin Chi Tiết</h4>
			</div> -->
			<div class="group" id="bodyModalCancel">
				<div class="content has-table" style="margin-top: 7px">
					<h3>Bạn Muốn Hủy Đơn Hàng</h3>
					<form class="cmxform form-horizontal style-form" id="formEditOrder">
					<input id ="id" name = "id" type="hidden">
					<input id = "status" name ="status" value="Đã Hủy" type="hidden">
					<button class="btn btn-theme " type="submit" id="editOrder" style="background: #15A78A; margin-left: 10px;border-radius: 5px; ">Xác Nhận</button>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" style="background: center;">Đóng</button>
			</div>
		</div>
	</div>
</div>
     

	<script>
	/* func click call form update user  */
	$('#editUser').click(function (e) {
		 e.preventDefault();
		  var data={};
		  var formData = $('#formEdit').serializeArray();  
		  $.each(formData, function (index, v) {
		        data["" + v.name + ""] = v.value;
		    });
		  	var fullName = $('#fullName').val();
			var address = $('#address').val();
			var email = $('#email').val();
			var phoneNumber = $('#phoneNumber').val(); 
			var userName = $('#userName').val();
		  if(fullName == '' || address == '' || email == '' || phoneNumber == '' || userName == ''){
			  swal("Thất bại", "Vui lòng điền đẩy đủ thông tin :)", "error");
			  
		  }
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
	            	swal("Thất bại", "Thông tin vẫn chưa được thay đổi:)", "error");
	            }
	         });
	}
		/* func click call form update passowrd  */
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
				  updatePassword(data);
			  }else {
				  swal("Thất bại", "Mật khẩu chưa được thay đổi :)", "error");
			  }
			
				
			});
			
			function updatePassword(data) {
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
			/* func validator form  */
		$(document).ready(function() {		
			$("#email").blur(function emailExists() {
				var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				var email = $("#email").val();
				if (!regex.test(email)) {
					$(".statusEmail").html("<font>Email không đúng định dạng</font>");
					$(".statusEmail").css("color", "red");
					$("#editUser").prop('disabled', true);
				} else {
					$(".statusEmail").html("<font></font>");
					$("#editUser").prop('disabled', false);

				}

			});
			
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
					$(".statusfullName").html("<font></font>");
					$("#editUser").prop('disabled', false);
					return true;
				} else {
					$(".statusfullName").html("<font>Tên phải dài hơn 6 ký tự.</font>");
					$(".statusfullName").css("color", "red");
					$("#editUser").prop('disabled', true);
					return false;
				}
			});
			$("#userName").blur(function statusUserName() {
				var statusUserName = $("#statusUserName").val();
				if (statusUserName.length > 6) {
					$("#editUser").prop('disabled', false);
					$(".statusUserName").html("<font></font>");
					return true;
				} else {
					$(".statusUserName").html("<font>Tên phải dài hơn 6 ký tự.</font>");
					$(".statusUserName").css("color", "red");
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
					$(".statusphoneNumber").html("<font></font>");
					$("#editUser").prop('disabled', false);
					return true;
				} else {
					$(".statusphoneNumber").html("<font>Vui lòng nhập số điện thoại</font>");
					$("#editUser").prop('disabled', true);
					$(".statusphoneNumber").css('color', 'red');
					return false;
				}
			});
			$("#address").blur(function address() {
				var address = $("#address").val();
				if (address.length > 0) {
					$(".statusaddress").html("<font></font>");
					$("#editUser").prop('disabled', false);
					return true;
				} else {
					$(".statusaddress").html("<font>Vui lòng nhập địa chỉ</font>");
					$("#editUser").prop('disabled', true);
					$(".statusaddress").css('color', 'red');
					return false;
				}
			}); 
			
		});
		/* function delete favorite book  */
		function deleteFavoriteBook(id) {
			var data = {};
  			data['id'] = id;
  			$.ajax({
  				type : "DELETE",
  				url : "${ApiFavoriteBookUrl}",
  				data : JSON.stringify(data),
  				contentType : "application/json",
  				success : function(response) {
  		         	 $('#favorite_'+response.id).remove();
  		         	swal("Thành công", "Sản phẩm đã được xóa", "success"); 
  		          $('.wishlist-count').text(response.count);
  				},
  				error : function(response) {
  				}
  			});
			
		}
		

		function orderDetails(orderId){
			openModalAsssignmentBuilding();
			 findOneOrder(orderId);
			 findAllOrderDetail(orderId) 
			
		}
		/* Tìm 1 order theo orderId */
		function findOneOrder(orderId) {
			var id = orderId;
			$.ajax({
				type : 'GET',
				url : '${OrderUrl}?id='+id,
				dataType: "json",
				contentType : "application/json",
				success : function(data) {
					var ship = data.shipping;
					
					 $('#assignmentBuildingModal #name').val(data.name);
					$('#assignmentBuildingModal #email').val(data.email);
					$('#assignmentBuildingModal #phoneNumber').val(data.phoneNumber);
					$('#assignmentBuildingModal #address').val(data.address);
					$('#assignmentBuildingModal #status').val(data.status);
					$('#assignmentBuildingModal #orderDate').val(data.orderDate);
					$('#assignmentBuildingModal #note').val(data.note);
					if(ship  ==  0){
						document.getElementById('shipping').value='Miễn Phí Vận Chuyển';
					}
					if(ship  ==  15){
						document.getElementById('shipping').value='Giao Hàng Tiết Kiệm';
					}
					if(ship  ==  25){
						document.getElementById('shipping').value='Giao Hàng Nhanh';
					}
					
				}
			});
		}

		/* Tìm tất cả order detail theo orderId  */
		function findAllOrderDetail(orderId) {
			var id = orderId;
			$('#cartBody tbody').html('');
			$.ajax({
				type : 'GET',
				url : '${listOrderDetailUrl}?id='+id,
				dataType: "json",
				contentType : "application/json",
				success : function(data) {
					 $.each(data, function (key, value) {
							$('#cartBody tbody').append('<tr class="prduct-cart" id="cart">'+
									'<td class="product-col">'+
									'<figure class="product-media">'+
									'<a > <img src="'+value.img+'" alt="Product image"></a>'+
									'</figure>'+
									'</div>'+
									'</td>'+
									'<td class="product-title">'+value.nameBook+'</td>'+
									'<td class="quantity-col">'+value.price+'</td>'+
									'<td class="price-col">'+value.amount+'</td>'+
									'</tr>');
			          	});
					
				},
				error : function(response) {
					alert("lỗi");
					
				}
			});
			
		}
		/* p/t lấy id cho modal   */
		function cancelOrder(orderId) {
			var id = orderId;
			$.ajax({
				type : 'GET',
				url : '${OrderUrl}?id='+id,
				dataType: "json",
				contentType : "application/json",
				success : function(data) {
					var ship = data.shipping;
					 $('#cancelOrder #id').val(data.id);
				}
			});
		}
		/* function save update cancel status  */
		$("#editOrder").click(function (e) {
			 e.preventDefault();
			var data = {};
			var formData = $('#formEditOrder').serializeArray();
			$.each(formData, function(index, v) {
				data["" + v.name + ""] = v.value;
			});
			updateStatusOrder(data);
		});
		
		function updateStatusOrder(data) {
			var id = $('#idUser').val();
			$.ajax({
				type : "PUT",
				url : "${updateStatusUrl}",
				data : JSON.stringify(data),
				dataType : "json",
				contentType : "application/json",
				success : function(response) {
					window.location.href = '${acountURL}/' + id ;
				},
				error : function(response) {
					swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
				}
			});
		}
		
		function openModalAsssignmentBuilding() {
			$('#assignmentBuildingModal').modal();
		}

		/* show cart mini  */
		
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
	</script>


</body>
</html>