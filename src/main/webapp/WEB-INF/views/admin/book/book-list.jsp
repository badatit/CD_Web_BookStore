<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="ApiUrl" value="/api/book" />
<c:url var="listBookUrl" value="/admin/book/list" />
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3 style="text-decoration: underline; font-weight: bolder;">
			<i class="fa fa-angle-right"></i> Loại Sách
		</h3>
		<hr>

		<table id="example"
			class="table table-striped table-bordered dt-responsive nowrap"
			style="width: 100%; font-size: 1.5rem;">
			<thead>
				<tr
					style="font-weight: bold; color: #156964; background-color: #abceee">
					<th></th>
					<th>Tên Sản Phẩm</th>
					<th>Giá</th>
					<th>Ảnh</th>
					<th>Status</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${books}">
					<tr style="text-align: center;">
						<td> <input type="checkbox" id="checkbox_${item.id}"value="${item.id}"> </td>
						<td style="text-align: left;"> ${item.name} </td>
						<td> ${item.price} đ</td>
						<td>
							<img src="${item.img1}" alt="Italian Trulli"
							style="width: 80px; height: 60px">
						</td>
						<td> ${item.status} </td>
						<td>
							<a title="Thêm tòa nhà" style="padding: 2px 6px" class="btn btn-white btn-info btn-bold"
								data-toggle="tooltip" href="<c:url value='/admin/book/edit/${item.id}'/>"> 
								<i class="fas fa-pen" style="color: black" aria-hidden="true"
									id="button">
								</i>
							</a>
							<button style="padding: 2px 6px" class="btn btn-xs btn-info"
								data-toggle="tooltip" id="submit_modal"
								title="Chi Tiết Sản Phẩm" onclick="productDetails(${item.id})">
								<i class="fas fa-eye" style="color: black;" aria-hidden="true" id="button">
								</i>
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
						<button class="btn btn-theme" id="removeBook"
							onclick="warningBeforeDelete()" style="background-color: #ed5565"
							type="submit">
							<i class="fas fa-trash-alt"></i>
						</button>
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
				<h4 class="modal-title">Chi Tiết Sản Phẩm</h4>
			</div>
			<div class="group">
				<div class="content has-table">
					<table>
						<tbody>
							<tr>
								<td
									style="width: 220px;; color: rgb(79, 79, 79); font-size: 16px; font-weight: 500; background: rgb(239, 239, 239); padding: 10px 15px;">
									Tên Sản Phẩm</td>
								<td style="flex: 1 1 0%; border-right: 0px;"><input
									style="background: white; width: 700px; border-top-style: hidden; border-right-style: hidden; border-left-style: hidden; border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color: black;"
									type="text" id="name" name="name" disabled="disabled" /></td>
							</tr>
							<tr>
								<td
									style="width: 220px;; color: rgb(79, 79, 79); font-size: 16px; font-weight: 500; background: rgb(239, 239, 239); padding: 10px 15px;">
									Công Ty Phát Hành</td>
								<td style="flex: 1 1 0%; border-right: 0px;"><input
									style="background: #FAFAFA; width: 700px; border-top-style: hidden; border-right-style: hidden; border-left-style: hidden; border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color: black;"
									type="text" id="issuingCompany" name="issuingCompany"
									disabled="disabled" /></td>
							</tr>

							<tr>
								<td
									style="width: 220px;; color: rgb(79, 79, 79); font-size: 16px; font-weight: 500; background: rgb(239, 239, 239); padding: 10px 15px;">
									Loại Bìa</td>
								<td style="flex: 1 1 0%; border-right: 0px;"><input
									style="background: #FAFAFA; width: 700px; border-top-style: hidden; border-right-style: hidden; border-left-style: hidden; border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color: black;"
									type="text" id="coverType" name="coverType" disabled="disabled" /></td>
							</tr>
							<tr>
								<td
									style="width: 220px;; color: rgb(79, 79, 79); font-size: 16px; font-weight: 500; background: rgb(239, 239, 239); padding: 10px 15px;">
									Giá Sản Phẩm</td>
								<td style="flex: 1 1 0%; border-right: 0px;"><input
									style="background: white; width: 700px; border-top-style: hidden; border-right-style: hidden; border-left-style: hidden; border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color: black;"
									type="text" id="price" name="price" disabled="disabled" /></td>
							</tr>
							<tr>
								<td
									style="width: 220px;; color: rgb(79, 79, 79); font-size: 16px; font-weight: 500; background: rgb(239, 239, 239); padding: 10px 15px;">
									SKU</td>
								<td style="flex: 1 1 0%; border-right: 0px;"><input
									style="background: #FAFAFA; width: 700px; border-top-style: hidden; border-right-style: hidden; border-left-style: hidden; border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color: black;"
									type="text" id="sku" name="sku" disabled="disabled" /></td>
							</tr>

							<tr>
								<td
									style="width: 220px;; color: rgb(79, 79, 79); font-size: 16px; font-weight: 500; background: rgb(239, 239, 239); padding: 10px 15px;">
									Mô Tả Sản Phẩm</td>
								<td style="flex: 1 1 0%; border-right: 0px;">
								<textarea
										style="background: white; width: 700px; border-top-style: hidden; border-right-style: hidden; border-left-style: hidden; border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color: black;"
										type="text" id="productDescription" name="productDescription"
										disabled="disabled"></textarea></td>
							</tr>

							<tr>
								<td
									style="width: 220px;; color: rgb(79, 79, 79); font-size: 16px; font-weight: 500; background: rgb(239, 239, 239); padding: 10px 15px;">
									Thể Loại</td>
								<td style="flex: 1 1 0%; border-right: 0px;"><input
									style="background: #FAFAFA; width: 700px; border-top-style: hidden; border-right-style: hidden; border-left-style: hidden; border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color: black;"
									type="text" id="categoryName" name="categoryName"
									disabled="disabled" /></td>
							</tr>
							<tr>
								<td
									style="width: 220px;; color: rgb(79, 79, 79); font-size: 16px; font-weight: 500; background: rgb(239, 239, 239); padding: 10px 15px;">
									Status</td>
								<td style="flex: 1 1 0%; border-right: 0px;"><input
									style="background: white; width: 700px; border-top-style: hidden; border-right-style: hidden; border-left-style: hidden; border-bottom-style: hidden; font-size: 16px; padding: 10px 15px; color: black;"
									type="text" id="status" name="status" disabled="disabled" /></td>
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
	function productDetails(bookId) {
		openModalAsssignmentBuilding();
		var id = bookId;
		$.ajax({
			type : 'GET',
			url : '/bookstore/api/book/find/' + id,
			contentType : "application/json",
			success : function(book) {
				$('#assignmentBuildingModal #id').val(book.id);
				$('#assignmentBuildingModal #name').val(book.name);
				$('#assignmentBuildingModal #price').val(book.price);
				$('#assignmentBuildingModal #issuingCompany').val(
						book.issuingCompany);
				$('#assignmentBuildingModal #img1').val(book.img1);
				$('#assignmentBuildingModal #img2').val(book.img2);
				$('#assignmentBuildingModal #img3').val(book.img3);
				$('#assignmentBuildingModal #img4').val(book.img4);
				$('#assignmentBuildingModal #coverType').val(book.coverType);
				$('#assignmentBuildingModal #productionDay').val(
						book.productionDay);
				$('#assignmentBuildingModal #sku').val(book.sku);
				$('#assignmentBuildingModal #status').val(book.status);
				$('#assignmentBuildingModal #categoryName').val(
						book.categoryName);
				$('#assignmentBuildingModal #productDescription').val(
						book.productDescription);

			}
		});

	}
	// goi modal hien len
	function openModalAsssignmentBuilding() {
		$('#assignmentBuildingModal').modal();
	}
	document.getElementById('removeBook').onclick = function() {
		swal({
			title : "Bạn có chắc chắn?",
			text : "Bạn sẽ xóa sản phẩm này khỏi dữ liệu!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : '#DD6B55',
			confirmButtonText : 'Vâng, Hãy Xóa!',
			cancelButtonText : "Không, Đừng Xóa!",
			closeOnConfirm : false,
			closeOnCancel : false
		}, function(isConfirm) {
			if (isConfirm) {
				var data = {};
				var ids = $('#example').find(
						'tbody input[type=checkbox]:checked').map(function() {
					return $(this).val();
				}).get();
				data['ids'] = ids;
				deleteBook(data);

			} else {
				swal("Chưa Thực Hiện Xóa", "Dữ liệu vẫn an toàn", "error");
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
				window.location.href = "${listBookUrl}?message=success";
			},
			error : function(response) {
				window.location.href = "${listBookUrl}?message=error_system";

			}
		});
	}
</script>