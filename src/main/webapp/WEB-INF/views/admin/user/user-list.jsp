<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="ApiUrl" value="/api/user" />
<c:url var="listUserUrl" value="/admin/user/list" />
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3 style="font-weight: bolder;">
			<i class="fa fa-angle-right"></i> Danh Sách Người Dùng
		</h3>
		<hr>

		<table id="example"
			class="table table-striped table-bordered dt-responsive nowrap"
			style="width: 100%; font-size: 1.5rem;">
			<thead>
				<tr
					style="font-weight: bold; color: #156964; background-color: #abceee">
					<th></th>
					<th>Tên Người Dùng</th>
					<th>Địa Chỉ</th>
					<th>Số Điện Thoại</th>
					<th>Status</th>
					<th></th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${users}">
					<tr>
						<td><input type="checkbox" id="checkbox_${item.id}"
							value="${item.id}"></td>
						<td>${item.fullName}</td>
						<td>${item.email}</td>
						<td>${item.phoneNumber}</td>
						<td></td>
						<td style="text-align: center;"><a title="Thêm tòa nhà"
							style="padding: 2px 6px" class="btn btn-white btn-info btn-bold"
							data-toggle="tooltip" href="<c:url value='/admin/user/edit/${item.id}'/>">
								<i class="fas fa-pen" style="color: black" aria-hidden="true" id="button"></i>
						</a>
							<button style="padding: 2px 6px" class="btn btn-xs btn-info"
								data-toggle="tooltip" id="submit_modal"
								title="Chi Tiết Sản Phẩm" onclick="productDetails(${item.id})">
								<i class="fas fa-eye" style="color: black;" aria-hidden="true" id="button"></i>
							</button></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td style="text-align: center;">
						<button class="btn btn-theme" id="removeUser"
							onclick="warningBeforeDelete()" style="background-color: #ed5565"
							type="submit"><i class="fas fa-trash-alt"></i></button>
					</td>
				</tr>

			</tfoot>
		</table>
	</section>
</section>
<!-- START modal giao toa nha cho nhan vien quan ly -->


<div class="modal fade" id="assignmentBuildingModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Thông Tin Chi Tiết</h4>
			</div>
			<div class="group">
				<div class="content has-table">
					<table>
						<tbody>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Họ Và Tên
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:white; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="fullName" name="fullName" disabled="disabled" /></td>
							</tr>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px; ">
								Tên Đăng Nhập
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:#FAFAFA; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="userName" name="userName" disabled="disabled" /></td>
							</tr>
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;"> 
								Mật Khẩu
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:white; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="password" id="password" name="password" disabled="disabled" /></td>
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
								Trạng Thái
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:white; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="status" name="status" disabled="disabled" /></td>
							</tr>
							
							<tr>
								<td style="width: 220px;;color: rgb(79, 79, 79);font-size: 16px;font-weight: 500;background: rgb(239, 239, 239); padding: 10px 15px;">
								Quyền Đăng Nhập
								</td>
								<td style="flex: 1 1 0%;border-right: 0px; "><input style="background:#FAFAFA; width: 700px; border-top-style: hidden;  border-right-style: hidden;border-left-style: hidden;border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color:black;"
							type="text" id="name" name="name" disabled="disabled" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
			</div>
		</div>
	</div>
</div>


<script>
function productDetails(userId){
	openModalAsssignmentBuilding();
	var id = userId;
	$.ajax({
		type : 'GET',
		url : '/bookstore/api/user/find/' + id,
		contentType : "application/json",
		success : function(user) {
			$('#assignmentBuildingModal #id').val(user.id);
			$('#assignmentBuildingModal #fullName').val(user.fullName);
			$('#assignmentBuildingModal #userName').val(user.userName);
			$('#assignmentBuildingModal #password').val(user.password);
			$('#assignmentBuildingModal #email').val(user.email);
			$('#assignmentBuildingModal #phoneNumber').val(user.phoneNumber);
			$('#assignmentBuildingModal #address').val(user.address);
			$('#assignmentBuildingModal #status').val(user.status);
			$('#assignmentBuildingModal #"name"').val(user.name);
			
		}
	});

	
}
// goi modal hien len
function openModalAsssignmentBuilding() {
	$('#assignmentBuildingModal').modal();
}
document.getElementById('removeUser').onclick = function(){
	swal({
		title: "Are you sure?",
		text: "You will not be able to recover this imaginary file!",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: '#DD6B55',
		confirmButtonText: 'Yes, delete it!',
		cancelButtonText: "No, cancel plx!",
		closeOnConfirm: false,
		closeOnCancel: false
	},
	function(isConfirm){
    if (isConfirm){
    	var data={};
		var ids = $('#example').find('tbody input[type=checkbox]:checked').map(function() {
		return $(this).val();
		}).get();
		 data['ids'] = ids;
		 deleteBook(data);
     
    } else {
      swal("Cancelled", "Your imaginary file is safe :)", "error");
    }
	});
};
function deleteBook(data) {
	$.ajax({
		type : "DELETE",
		url : "${ApiUrl}",
		data : JSON.stringify(data),
		contentType : "application/json",
		success : function(response) {
			window.location.href ="${listUserUrl}?message=success";
		},
		error : function(response) {
			window.location.href ="${listUserUrl}?message=error_system";
			
		}
	});
}
</script>
