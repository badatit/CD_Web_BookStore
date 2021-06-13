<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="deleteCategoryURL" value="/api/category" />
<c:url var="listCategoryURL" value="/admin/category/list" />
<section id="main-content">
	<section class="wrapper site-min-height">
	<h3 style="text-decoration: underline;font-weight: bolder;">
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
					<th>Tên Loại Sách</th>
					<th>Trạng Thái</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${categorys}">
					<tr>
						<td><input type="checkbox" id="checkbox_${item.id}"
							value="${item.id}"></td>
						<td>${item.name}</td>
						<td>${item.status}</td>
						<td style="text-align: center;"><c:url value=""
								var="editCategory"></c:url> <a title="Thêm loại sản phẩm"
							style="padding: 2px 6px" class="btn btn-white btn-info btn-bold"
							data-toggle="tooltip"
							href="/bookstore/admin/category/edit/${item.id}"> <i
								class="fas fa-pen" style="color: black;" aria-hidden="true" id="button"></i>
						</a>
							<%-- <button class="btn btn-xs btn-info" data-toggle="tooltip"
								id="submit_modal" title="Chi Tiết Sản Phẩm"
								style="padding: 2px 6px" onclick="productDetails(${item.id})">
								<i class="fa fa-book" aria-hidden="true" id="button"></i>
							</button> --%>
							</td>
					</tr>
				</c:forEach>

			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td style="text-align: center;">
						<button class="btn btn-theme" id="removeCategory"
							onclick="warningBeforeDelete()" style="background-color: #ed5565;padding: 2px 6px"
							type="submit"><i class="fas fa-trash-alt"></i></button>
					</td>
				</tr>

			</tfoot>

		</table>

		<!-- /row -->
	</section>
	<!-- /wrapper -->
</section>

<script>
document.getElementById('removeCategory').onclick = function(){
	swal({
		title: "Bạn Có Chắc?",
		text: "Tất cả các dữ liệu liên quan đến sản phẩm cũng đều bị xóa!",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: '#DD6B55',
		confirmButtonText: 'Vâng, Hãy Xóa!',
		cancelButtonText: "Không, Đừng Xóa!",
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
		 deleteCategory(data);
     
    } else {
      swal("Cancelled", "Your imaginary file is safe :)", "error");
    }
	});
};
function deleteCategory(data) {
	$.ajax({
		type : "DELETE",
		url : "${deleteCategoryURL}",
		data : JSON.stringify(data),
		contentType : "application/json",
		success : function(response) {
			window.location.href ="${listCategoryURL}?message=success";
		},
		error : function(response) {
			window.location.href ="${listCategoryURL}?message=error_system";
			
		}
	});
}
</script>
