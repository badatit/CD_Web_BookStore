<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="uploadUrl" value="/api/home" />
<c:url var="listUserUrl" value="/admin/user/list" />
<c:url var="ApiUrl" value="/api/user" />
<section id="main-content">
	<section class="wrapper">
		<h3 style="font-weight: bolder;">
			<c:if test="${user.id != null }">
				<i class="fa fa-angle-right"></i> Chỉnh Sửa Thông Tin Người Dùng
	</c:if>

			<c:if test="${user.id == null }">
				<i class="fa fa-angle-right"></i> Thêm Mới Người Dùng
	</c:if>

		</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<div class=" form" >
						<form class="cmxform form-horizontal style-form" id="formEdit">
							<div class="form-group ">
								<label for="fullName" class="control-label col-lg-2 fullName">Họ
									Và Tên </label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="fullName"
										name="fullName" value="${user.fullName }" />
								</div>
								<p class="statusFullName" id="statusFullName"
									style="margin-left: 200px"></p>
							</div>

							<div class="form-group ">
								<label for="userName" class="control-label col-lg-2">Tên
									Đăng nhập</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="userName"
										name="userName" value="${user.userName }" />
								</div>
								<p class="status" id="status" style="margin-left: 200px"></p>
							</div>

							<div class="form-group ">
								<label for="password" class="control-label col-lg-2">Mật
									Khẩu</label>
								<div class="col-lg-10">
									<input class="form-control" type="password" id="password"
										name="password" value="${user.password }" />
								</div>
								<p class="statusPassword" style="margin-left: 200px"></p>
							</div>


							<div class="form-group ">
								<label for="email" class="control-label col-lg-2"> Email</label>
								<div class="col-lg-10">
									<input class="form-control" type="email" id="email"
										name="email" min=0 value="${user.email }" />
								</div>
								<p class="statusEmail" style="margin-left: 200px"></p>
							</div>
							<div class="form-group ">
								<label for="phoneNumber" class="control-label col-lg-2">Số
									Điện Thoại</label>
								<div class="col-lg-10">
									<input class="form-control" type="number" id="phoneNumber"
										name="phoneNumber" value="${user.phoneNumber }" />
								</div>
								<p class="statusphoneNumber" style="margin-left: 200px;"></p>
							</div>
							<div class="form-group ">
								<label for="address" class="control-label col-lg-2">Địa
									Chỉ</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="address"
										name="address" value="${user.address }" />
								</div>
								<p class="statusaddress" style="margin-left: 200px"></p>
							</div>
							<div class="form-group col-md-4">
								<label for="inputState">Chọn trạng thái</label> 
								<select id="status" class="form-control" name="status">
									<option  value="">Choose...</option>
									<c:forEach var="item" items="${status}">
										<option value="${item.value }"
											${item.value == book.status  ? 'selected' : '' }>${item.key }</option>
									</c:forEach>

								</select>
							</div>
							<c:if test="${user.id != null}">
								<input type="hidden" name="id" value="${user.id}">
							</c:if>
							<div class="form-group col-md-4" style="margin-left: 75px;">
								<label for="inputState">Chọn Quyền</label> 
								<select id="roleId" class="form-control" name="roleId">
									<option  value="">Choose...</option>
									<c:forEach var="item" items="${role}">
										<option value="${item.id }"
											${item.id == book.role  ? 'selected' : '' }>${item.name }</option>
									</c:forEach>

								</select>
							</div>
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10" style="margin-left: 39%;">
									<button class="btn btn-theme " type="submit" id="editUser">Save</button>
									<c:if test="${user.id > 0}">
										<button class="btn btn-theme04">
											<a href="${listUserUrl}" style="color: white">Quay Lại</a>
										</button>
									</c:if>
									<c:if test="${user.id == null}">
										<button class="btn btn-theme04" type="reset">Làm mới
										</button>
									</c:if>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<script>
 
$("#formEdit").validate({
	rules : {
		fullName : {
			required : true,
		},
		userName : {
			required : true,
		},
		password:{
			required : true,
		},
		email:{
			required : true,
			
		},
		phoneNumber:{
			required : true,
		},
		address:{
			required : true,
		},
		status:{
			required : true,
		},
		roleId:{
			required : true,
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
		},
		email : {
			required : "Vui lòng không để trống",
			
		},
		phoneNumber : {
			required : "Vui lòng không để trống",
		},
		address : {
			required : "Vui lòng không để trống",
		},
		status:{
			required : "Vui lòng không để trống",
		},
		roleId:{
			required : "Vui lòng không để trống",
		},

	},
	submitHandler : function(form) {
		$("#editUser").load("submit", function(e) {
			var data = {};
			var formData = $('#formEdit').serializeArray();
			$.each(formData, function(index, v) {
				data["" + v.name + ""] = v.value;
			});
			if (data["id"] != null) {
					updateUser(data);
				} else {
					addingUser(data);
				}
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
				swal("Thành Công!", "Hãy nhấn vào nút!", "success");
			},
			error : function(response) {
				swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
			}
		});
	}

	function updateUser(data) {
		$.ajax({
			type : "PUT",
			url : "${ApiUrl}",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json",
			success : function(response) {
				swal("Thành Công!", "Hãy nhấn vào nút!", "success");
			},
			error : function(response) {
				swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
			}
		});
	}
	// Check jquery validation

</script>
