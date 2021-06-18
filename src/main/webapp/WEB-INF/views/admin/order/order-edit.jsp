<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIUrl" value="/api/managementorder" />
<c:url var="listOrderURL" value="/admin/order/list" />
<section id="main-content">
	<section class="wrapper">
		<h3 style="font-weight: bolder;">
				<i class="fa fa-angle-right"></i> Chỉnh Sửa Trạng Thái Đơn Hàng
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
										name="fullName" value="${order.name}" disabled="disabled" />
								</div>
							</div>

							<div class="form-group ">
								<label for="total" class="control-label col-lg-2">Tổng Tiền</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="total"
										name="total" value="${order.total}" disabled="disabled" />
								</div>
							</div>

							<div class="form-group ">
								<label for="amount" class="control-label col-lg-2">Số Lượng</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="amount"
										name="amount" value="${order.amount}" disabled="disabled" />
								</div>
								
							</div>
							<div class="form-group col-md-6">
								<label for="status">Chọn trạng thái</label> <select id="status"
									class="status" name="status"
									style="margin-left: 87px; width: 150px; height: 36px; border-radius: 5px;">
									<c:forEach var="item" items="${status}">
										<option value="${item.value}"
											${item.value == order.status  ? 'selected' : '' }>${item.key }</option>
									</c:forEach>
								</select>
							</div>
							<input type="hidden" class="form-control" id="id" name="id" value = "${order.id}">
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10" style="margin-left: 39%;">
									<button class="btn btn-theme " type="submit" id="editOrder">Save</button>
										<button class="btn btn-theme04">
											<a href="${listOrderURL}" style="color: white">Quay Lại</a>
										</button>
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
		status:{
			required : true,
		},
	},
	messages : {
		status:{
			required : "Vui lòng không để trống",
		},
	},
	submitHandler : function(form) {
		$("#editOrder").load("submit", function(e) {
			var data = {};
			var formData = $('#formEdit').serializeArray();
			$.each(formData, function(index, v) {
				data["" + v.name + ""] = v.value;
			});
			updateStatusOrder(data);
		});
	}
});

	function updateStatusOrder(data) {
		$.ajax({
			type : "PUT",
			url : "${APIUrl}",
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
