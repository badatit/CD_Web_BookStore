<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="uploadUrl" value="/api/home" />
<c:url var="listBookUrl" value="/admin/book/list" />
<c:url var="ApiUrl" value="/api/book" />
<section id="main-content">
	<section class="wrapper">
		<h3 style="font-weight: bolder;">
			<c:if test="${book.id != null }">
				<i class="fa fa-angle-right"></i> Chỉnh sửa sản phẩm
	</c:if>

			<c:if test="${book.id == null }">
				<i class="fa fa-angle-right"></i> Thêm mới sản phẩm
	</c:if>

		</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel" style="height: 1220px;">
					<div class=" form">
						<form class="cmxform form-horizontal style-form" id="formEdit">
							<div class="form-group ">
								<label for="name" class="control-label col-lg-2">Tên Sản
									Phẩm</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="name" name="name"
										value="${book.name}" />
								</div>
							</div>
							<div class="form-group ">
								<label for="price" class="control-label col-lg-2"> Giá</label>
								<div class="col-lg-10">
									<input class="form-control" type="number" id="price"
										name="price" min=0 value="${book.price }" />
								</div>
							</div>
							<div class="form-group ">
								<label for="issuingCompany" class="control-label col-lg-2">Công
									Ty Sản Xuất </label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="issuingCompany"
										name="issuingCompany" value="${book.issuingCompany}" />
								</div>
							</div>
							<div class="form-group ">
								<label for="size" class="control-label col-lg-2">Size</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="size" name="size"
										value="${book.size}" />
								</div>
							</div>
							<div class="form-group ">
								<label for="coverType" class="control-label col-lg-2">Loại
									Bìa</label>
								<div class="col-lg-10">
									<select id=coverType class="form-control" name="coverType">
										<option selected value="">Choose...</option>
										<c:forEach var="item" items="${coverTypes}">
											<option value="${item.value}"
												${item.value == book.coverType  ? 'selected' : '' }>${item.value}</option>
										</c:forEach>
										<lable>${book.coverType}</lable>

									</select>
								</div>
							</div>
							<div class="form-group ">
								<label for="numberOfPages" class="control-label col-lg-2">Số
									Trang</label>
								<div class="col-lg-10">
									<input class="form-control" type="number" min=0
										id="numberOfPages" name="numberOfPages"
										value="${book.numberOfPages}" />
								</div>
							</div>
							<div class="form-group ">
								<label for="sku" class="control-label col-lg-2">SKU</label>
								<div class="col-lg-10">
									<input class="form-control" type="number" id="sku" name="sku"
										value="${book.sku}" />
								</div>
							</div>
							<div class="form-group ">
								<label for="quantity" class="control-label col-lg-2">SKU</label>
								<div class="col-lg-10">
									<input class="form-control" type="number" id="quantity" name="quantity"
										value="${book.quantity}" />
								</div>
							</div>
							<div class="form-group ">
								<label for="productDescription" class="control-label col-lg-2">Mô
									Tả Sản Phẩm</label>
								<div class="col-lg-10">
									<textarea class="form-control" id="productDescription"
										name="productDescription">${book.productDescription}</textarea>
								</div>
							</div>
							<div class="form-group ">
								<div>
									<label for="img1" class="control-label col-lg-2">Chọn
										Ảnh 1 </label>

									<div class="col-lg-4">
										<input type="file" name="img1" id="img1"> 
										<img alt="" id="showimg1" style="height: 140px; width: 105px; margin-top: 10px" src="${book.img1}">
									</div>
								</div>
								<div>
									<label for="img1" class="control-label col-lg-2">Chọn
										Ảnh 2 </label>

									<div class="col-lg-4">
										<input type="file" name="img2" id="img2"> <img alt="" id="showimg2"
											style="height: 140px; width: 105px; margin-top: 10px" src="${book.img2}">
									</div>
								</div>
							</div> 
							<div class="form-group ">
								<div>
									<label for="img1" class="control-label col-lg-2">Chọn
										Ảnh 3 </label>

									<div class="col-lg-4">
										<input type="file" name="img1" id="img3"> <img alt="" id="showimg3"
											style="height: 140px; width: 105px; margin-top: 10px" src="${book.img3}">
									</div>
								</div>
								<div>
									<label for="img1" class="control-label col-lg-2">Chọn
										Ảnh 4 </label>

									<div class="col-lg-4">
										<input type="file" name="img1" id="img4"> <img alt="" id="showimg4"
											style="height: 140px; width: 105px; margin-top: 10px" src="${book.img4}">
									</div>
								</div>
							</div>
							<div class="form-group col-md-12">
								<div class="form-group col-md-3">
									<label for="inputState">Chọn trạng thái</label> <select
										id="status" class="form-control" name="status">
										<option value="">Choose...</option>
										<c:forEach var="item" items="${status}">
											<option value="${item.value }"
												${item.value == book.status  ? 'selected' : '' }>${item.key }</option>
										</c:forEach>

									</select>
								</div>
								<c:if test="${book.id != null}">
									<input type="hidden" name="id" value="${book.id}">
								</c:if>
								<div class="form-group col-md-3" style="margin-left: 75px;">
									<label for="categoryId">Chọn Loại Sách</label> <select
										id="categoryId" class="form-control" name="categoryId">
										<option selected value="">Choose...</option>
										<c:forEach var="item" items="${categoryId}">
											<option value="${item.id }"
												${item.id == book.categoryId  ? 'selected' : '' }>${item.name }</option>
										</c:forEach>

									</select>
								</div>
								<div class="form-group col-md-3" style="margin-left: 75px;">
									<label for="inputState">Chọn Năm Sản Xuất</label> <select
										id="productionDay" class="form-control" name="productionDay">
										<option selected value="">Choose...</option>
										<c:forEach var="item" items="${years}">
											<option value="${item}"
												${item == book.productionDay  ? 'selected' : '' }>${item}</option>
										</c:forEach>

									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10" style="margin-left: 39%;">
									<button class="btn btn-theme editBook" type="submit"
										id="editBook">Save</button>
									<c:if test="${book.id > 0}">
										<button class="btn btn-theme04">
											<a href="${listBookUrl}" style="color: white">Quay Lại</a>
										</button>
									</c:if>
									<c:if test="${book.id == null}">
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
	$(document).ready(function() {

	})
	var data = {};
	$("#formEdit").validate({
		rules : {
			name : {
				required : true,
			},
			price : {
				required : true,
			},
			issuingCompany : {
				required : true,
			},
			coverType : {
				required : true,
			},
			size : {
				required : true,
			},
			numberOfPages : {
				required : true,
			},
			sku : {
				required : true,
			},
			productDescription : {
				required : true,
			},
			
			categoryId : {
				required : true,
			},
			status : {
				required : true,
			},
			productionDay : {
				required : true,
			}
		},
		messages : {
			name : {
				required : "Vui lòng không để trống",
			},
			price : {
				required : "Vui lòng không để trống"
			},
			issuingCompany : {
				required : "Vui lòng không để trống"
			},
			coverType : {
				required : "Vui lòng không để trống"
			},
			size : {
				required : "Vui lòng không để trống"
			},
			numberOfPages : {
				required : "Vui lòng không để trống"
			},
			sku : {
				required : "Vui lòng không để trống"
			},
			productDescription : {
				required : "Vui lòng không để trống"
			},
			
			categoryId : {
				required : "Vui lòng không để trống"
			},
			status : {
				required : "Vui lòng không để trống"
			},
			productionDay : {
				required : "Vui lòng không để trống"
			},

		},
		submitHandler : function(form) {
			$(".editBook").load("submit", function(e) {
				var formData = $('#formEdit').serializeArray();
				$.each(formData, function(index, v) {
					data["" + v.name + ""] = v.value;
				});
				if (data["id"] != null) {
					editBook(data);
				} else {
					addingBook(data);
				}
			});
		}
	});

	$("#img1").change(function() {
		var files = $(this)[0].files[0];
		if (files != undefined) {
			var reader = new FileReader();
			reader.onload = function(e) {
				data["base64_1"] = e.target.result;
				data["img1"] = files.name;
				$('#showimg1').attr('src', data["base64_1"]);
			};
			reader.readAsDataURL(files);
		}
	});
	$("#img2").change(function() {
		var files = $(this)[0].files[0];
		if (files != undefined) {
			var reader = new FileReader();
			reader.onload = function(e) {
				data["base64_2"] = e.target.result;
				data["img2"] = files.name;
				$('#showimg2').attr('src', data["base64_2"]);
			};
			reader.readAsDataURL(files);
		}
	});
	$("#img3").change(function() {
		var files = $(this)[0].files[0];
		if (files != undefined) {
			var reader = new FileReader();
			reader.onload = function(e) {
				data["base64_3"] = e.target.result;
				data["img3"] = files.name;
				$('#showimg3').attr('src', data["base64_3"]);
			};
			reader.readAsDataURL(files);
		}
	});
	$("#img4").change(function() {
		var files = $(this)[0].files[0];
		if (files != undefined) {
			var reader = new FileReader();
			reader.onload = function(e) {
				data["base64_4"] = e.target.result;
				data["img4"] = files.name;
				$('#showimg4').attr('src', data["base64_4"]);
				
			};
			reader.readAsDataURL(files);
		}
	});
	function addingBook(data) {
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
	function editBook(data) {
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
</script>