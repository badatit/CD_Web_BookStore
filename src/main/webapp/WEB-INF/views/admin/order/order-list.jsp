<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="listOrderDetailUrl" value="/api/managementorder/findall" />
<c:url var="OrderUrl" value="/api/managementorder/findone" />
 <c:url var="picture" value='/template/web/assets/images/products/cart/product-1.jpg'/>
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
					<th>Tên Khách Hàng</th>
					<th>Tổng Tiền</th>
					<th>Số Lượng</th>
					<th>Trạng Thái</th>
					<th></th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${oders}">
					<tr>
						<td><input type="checkbox" id="checkbox_${item.id}"
							value="${item.id}"></td>
						<td>${item.name}</td>
						<td>${item.total}</td>
						<td>${item.amount}</td>
						<td>${item.status}</td>
						<td style="text-align: center;">
							<a title="Thêm tòa nhà"
							style="padding: 2px 6px" class="btn btn-white btn-info btn-bold"
							data-toggle="tooltip" href="<c:url value='/admin/order/edit/${item.id}'/>">
								<i class="fas fa-pen" style="color: black" aria-hidden="true" id="button"></i>
						</a>
						
							<button style="padding: 2px 6px" class="btn btn-xs btn-info"
								data-toggle="tooltip" id="submit_modal"
								title="Chi Tiết Đơn Hàng" onclick="orderDetails(${item.id})">
								<i class="fas fa-eye" style="color: black;" aria-hidden="true" id="button"></i>
							</button>
							</td>
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
				<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
			</div>
		</div>
	</div>
</div>

<!-- modal status -->



<script>

/* Hiển thị chi tiết đơn hàng  */
function orderDetails(orderId){
	openModalAsssignmentBuilding();
	findOneOrder(orderId);
	findAllOrderDetail(orderId)
	
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
							'<div class="product" style="padding: 0px;">'+
							'<figure class="product-media">'+
							'<a href="#"> <img src="${picture}" alt="Product image"></a>'+
							'</figure>'+
							'</div>'+
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
