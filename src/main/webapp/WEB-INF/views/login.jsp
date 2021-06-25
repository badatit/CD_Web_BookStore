<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<c:url var="home" value="/login" />
<c:url var="ApiUrl" value="/web/api/user" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>

</head>
	  <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('assets/images/backgrounds/login-bg.jpg')">
            	<div class="container">
            		<div class="form-box">
            			<div class="form-tab">
	            			<ul class="nav nav-pills nav-fill" role="tablist">
							    <li class="nav-item">
							        <a class="nav-link active" id="signin-tab-2" data-toggle="tab" href="#signin-2" role="tab" aria-controls="signin-2" aria-selected="false">Sign In</a>
							    </li>
							    <li class="nav-item">
							        <a class="nav-link " id="register-tab-2" data-toggle="tab" href="#register-2" role="tab" aria-controls="register-2" aria-selected="true">Register</a>
							    </li>
							</ul>
							<div class="tab-content">
							    <div class="tab-pane fade show active" id="signin-2" role="tabpanel" aria-labelledby="signin-tab-2">
							    	<c:if test="${param.incorrectAccount != null}">
								<div class="alert alert-danger">	
									Tên Hoặc Mật Khẩu Không Đúng !
								</div>
								</c:if>
							<c:if test="${param.accessDenied != null}">
									<div class="alert alert-danger">	
									Bạn Không Phải Admin
									</div>
								</c:if>
							    	
							    	<form action="j_spring_security_check" id="formLogin" method="post">
							    		<div class="form-group">
							    			<label for="singin-email-2">Tên đăng nhập *</label>
							    			<input type="text" class="form-control" id="userNameLogin" name="j_username" required>
							    		</div><!-- End .form-group -->

							    		<div class="form-group">
							    			<label for="singin-password-2">Mật Khẩu *</label>
							    			<input type="password" class="form-control" id="passwordLogin" name="j_password" required>
							    		</div><!-- End .form-group -->
							    		
							    		

							    		<div class="form-footer">
							    			<button type="submit" class="btn btn-outline-primary-2">
			                					<span>LOG IN</span>
			            						<i class="icon-long-arrow-right"></i>
			                				</button>

			                				<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="signin-remember-2">
												<label class="custom-control-label" for="signin-remember-2">Remember Me</label>
											</div><!-- End .custom-checkbox -->

											<a href="#" class="forgot-link">Forgot Your Password?</a>
							    		</div><!-- End .form-footer -->
							    	</form>
							    </div><!-- .End .tab-pane -->
							    <div class="tab-pane fade  " id="register-2" role="tabpanel" aria-labelledby="register-tab-2">
							    	<form id="formRegister">

									<div class="form-group ">
										<label for="fullName">Họ và Tên *</label> <input type="text"
											class="form-control" id="fullName" name="fullName"  />
										<p class="statusfullName"></p>
									</div>
									<!-- End .form-group -->


									<div class="form-group ">
										<label for="userName">Tên Đăng Nhập *</label> <input
											type="text" class="form-control" id="userName"
											name="userName"  />
										<p class="status" ></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group ">
										<label for="email">Email*</label> <input type="text"
											class="form-control" id="email" name="email"  />
										<p class="statusEmail" ></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group">
										<label for="phoneNumber">Số Điên Thoại *</label> <input
											type="number" class="form-control" id="phoneNumber"
											name="phoneNumber"  />
										<p class="statusphoneNumber" style="color: red;"></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group ">
										<label for="address">Địa Chỉ *</label> <input type="text"
											class="form-control" id="address" name="address"  />
										<p class="statusaddress" ></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group ">
										<label for="password">Mật Khẩu *</label> <input
											type="password" class="form-control" id="password"
											name="password"  />
										<p class="statusPassword" ></p>
									</div>
									<!-- End .form-group -->

									<div class="form-group ">
										<label for="repeatPass">Nhập lại mật khẩu *</label> <input
											type="password" class="form-control" id="repeatPass"
											name="repeatPass"  />
										<p class="statusrepeatPass" ></p>
									</div>
									<!-- End .form-group -->

									<div class="form-footer">
										<button type="submit" id="createUser"
											class="btn btn-outline-primary-2">
											<span>SIGN UP</span> <i class="icon-long-arrow-right"></i>
										</button>
									</div>
									<!-- End .form-footer -->
								</form>
							    	<div class="form-choice">
								    	<p class="text-center">or sign in with</p>
								    	<div class="row">
								    		<div class="col-sm-6">
								    			<a href="#" class="btn btn-login btn-g">
								    				<i class="icon-google"></i>
								    				Login With Google
								    			</a>
								    		</div><!-- End .col-6 -->
								    		<div class="col-sm-6">
								    			<a href="#" class="btn btn-login  btn-f">
								    				<i class="icon-facebook-f"></i>
								    				Login With Facebook
								    			</a>
								    		</div><!-- End .col-6 -->
								    	</div><!-- End .row -->
							    	</div><!-- End .form-choice -->
							    </div><!-- .End .tab-pane -->
							</div><!-- End .tab-content -->
						</div><!-- End .form-tab -->
            		</div><!-- End .form-box -->
            	</div><!-- End .container -->
            </div><!-- End .login-page section-bg -->
        </main><!-- End .main -->
        
        
        <script>
        
        $("#formRegister").validate({
    		rules : {
    			fullName : {
    				required : true,
    			},
    			userName : {
    				required : true,
    			},
    			password:{
    				required : true,
    				minlength: 6,
    				
    			},
    			email:{
    				required : true,
    				
    			},
    			phoneNumber:{
    				required : true,
    				minlength: 9
    			},
    			address:{
    				required : true,
    			},
    			status:{
    				required : true,
    			},
    			repeatPass:{
    				required : true,
    				minlength: 6,
    				equalTo: "#password",	
    			},
    			
    		},
    		messages : {
    			fullName : {
    				required : "Vui lòng không để trống",
    			},
    			userName : {
    				required : "Vui lòng không để trống",
    			},
    			password : {
    				required : "Vui lòng không để trống",
    				minlength: 'Vui lòng nhập ít nhất 6 kí tự'
    			},
    			email : {
    				required : "Vui lòng không để trống",
    				
    			},
    			phoneNumber : {
    				required : "Vui lòng không để trống",
    				minlength: "Số máy quý khách vừa nhập là số không có thực"
    			},
    			address : {
    				required : "Vui lòng không để trống",
    			},
    			status:{
    				required : "Vui lòng không để trống",
    			},
    			repeatPass:{
    				required : "Vui lòng không để trống",
    				minlength: 'Vui lòng nhập ít nhất 6 kí tự',
					equalTo: 'Mật khẩu không trùng'
    			},

    		},
    		submitHandler : function(form) {
    			$("#createUser").load("submit", function(e) {
    				var data = {};
    				var formData = $('#formRegister').serializeArray();
    				$.each(formData, function(index, v) {
    					data["" + v.name + ""] = v.value;
    				});
    				 /* addingUser(data);  */
    			});
    		}
    	});
 
			

	function addingUser(data) {
		$.ajax({
			type : "POST",
			url : "${ApiUrl}",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json",
			success : function(response) {
				swal("Đăng ký thành công!", "Mời bạn đăng nhập", "success");
				window.location.href = "${home}?message=success";

			},
			error : function(response) {
				swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
			}
		});
	}
	$(document).ready(function() {
		
						$("#userName").blur(function userNameExists() {
											var userName = $("#userName").val();
											if (userName.length > 6 && userName.length < 32) {
												var data = {};
												data["userName"] = userName;
												$.ajax({
														type : "POST",
														url : "/bookstore/web/check",
														contentType : "application/json",
														data : JSON.stringify(data),
														success : function(result) {
																if (result.code == 1) {
																	$(".status").html(result.msg);
																	$(".status").css("color","red");
																	$("#createUser").prop('disabled', true);
																	return false;
																} else {
																	$(".status").html(result.msg);
																	$(".status").css("color","green");
																	$("#createUser").prop('disabled', false);
																	return true;

																}
															},
															error : function(error) {
																swal("Thất bại","Sản phẩm vẫn an toàn","error");
															}
														});
											} else {
												$(".status").html("<font>Tên đăng nhập phải dài hơn 6 ký tự và nhỏ hơn 32 ký tự.</font>");
												return false;
											}
										});

						$("#email").blur(function emailExists() {
									var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
									var email = $("#email").val();
									if (!regex.test(email)) {
										$(".statusEmail").html("<font>Email không đúng định dạng</font>");
										$(".statusEmail").css("color", "red");
									}else {
										var data = {};
										data["email"] = email;
										$.ajax({
											type : "POST",
											url : "/bookstore/web/checkEmail",
											contentType : "application/json",
											data : JSON.stringify(data),
											success : function(result) {
												if (result.code == 1) {
													$(".statusEmail").html(result.msg);
													$(".statusEmail").css("color","red");
													$("#createUser").prop('disabled', true);
													return false;
												} else {$(".statusEmail").html(result.msg);
													$(".statusEmail").css("color","green");
													$("#createUser").prop('disabled', false);
													return true;
												}
											},
											error : function(error) {
												console.log(error);
												alert("error");
											}
										});
									}
									
									
								});

					});
	
	
</script>
</html>