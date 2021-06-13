<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
    <c:url var="APICartUrl" value="/api/carts" />
	<c:url var="LoginUrl" value="/login" />
	<c:url var="searchIssuingCompany" value="/web/api/search/catalog" />
	<c:url var="ProductDetail" value="/web/product/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        <div class="page-content">
         <input type="hidden" value="${userId}" name="userId" id="userId">
        <form action="<c:url value='/web/search'/>" id="formSubmit" method="get">
        	<input type="hidden" value="${searchName}" id="name" name="name" /> 
			<input type="hidden" value="${categoryNameSearch}" id="categoryName" name="categoryName" /> 
			<input type="hidden" value="${currentPageSearch}" id="pageSearch" name="pageSearch"  /> 
			<input type="hidden" value="9" id="limitSearch" name="limitSearch" /> 
		
			
			<div class="container">
                	<div class="row">
                		<div class="col-lg-9">
                			<div class="toolbox">
                				<div class="toolbox-left">
                					
                				</div><!-- End .toolbox-left -->

                				<div class="toolbox-right">
                					<div class="toolbox-sort">
                						
                					</div><!-- End .toolbox-sort -->
                				</div><!-- End .toolbox-right -->
                			</div><!-- End .toolbox -->

                            <div class="products mb-3">
                                <div class="row justify-content-center" id="productBody">
                            	<h3 class="message" >${message}</h3>
                                	<c:forEach var="item" items="${listsSearch}">
                                    <div class="col-6 col-md-4 col-lg-4" >
                                        <div class="product product-7 text-center">
                                            <figure class="product-media">
                                                <span class="product-label label-new">New</span>
                                                <a href="<c:url value='/web/product/${item.id}' />">
                                                  <img src="<c:url value='/template/web/assets/images/products/product-4.jpg'/>" alt="Product image" class="product-image">
                                                    
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist btn-expandable"><span>add to wishlist</span></a>
                                                    <a href="popup/quickView.html" class="btn-product-icon btn-quickview" title="Quick view"><span>Quick view</span></a>
                                                    <a href="#" class="btn-product-icon btn-compare" title="Compare"><span>Compare</span></a>
                                                </div><!-- End .product-action-vertical -->

                                                <div class="product-action">
                                                    <a  class="btn-product btn-cart" onclick="addCart(${item.id})"><span>add to cart</span></a>
                                                </div><!-- End .product-action -->
                                            </figure><!-- End .product-media -->

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="<c:url value='/web/product/${item.id}' />">${item.issuingCompany}</a>
                                                </div><!-- End .product-cat -->
                                                <h3 class="product-title"><a href="<c:url value='/web/product/${item.id}' />">${item.name}</a></h3><!-- End .product-title -->
                                                <div class="product-price">
                                                    ${item.price}<span style="margin-left: 7px;"> VND</span>
                                                </div><!-- End .product-price -->
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 20%;"></div><!-- End .ratings-val -->
                                                    </div><!-- End .ratings -->
                                                    <span class="ratings-text">( 2 Reviews )</span>
                                                </div><!-- End .rating-container -->

                                                <div class="product-nav product-nav-thumbs">
                                                    <a href="#" class="active">
                                                     <img src="<c:url value='/template/web/assets/images/products/product-4-thumb.jpg'/>" alt="product desc">
                                                    </a>
                                                    <a href="#">
                                                          <img src="<c:url value='/template/web/assets/images/products/product-4-thumb.jpg'/>" alt="product desc">
                                                    </a>

                                                    <a href="#">
                                                         <img src="<c:url value='/template/web/assets/images/products/product-4-thumb.jpg'/>" alt="product desc">
                                                    </a>
                                                </div><!-- End .product-nav -->
                                            </div><!-- End .product-body -->
                                        </div><!-- End .product -->
                                    </div><!-- End .col-sm-6 col-lg-4 -->
                                    </c:forEach>
                                </div><!-- End .row -->
                            </div><!-- End .products -->

                			<nav aria-label="Page navigation" style="margin-left: 240px;">
       						 <ul class="pagination" id="pagination">
       						 <%-- <c:forEach var="i" begin="1" end="${totalPages}">
									<c:url var="paging" value="/web/product">
										<c:param name="name" value="${param.name}" />
										<c:param name="categoryName" value="${param.categoryName}" />
										<c:param name="limit" value="10" />
										<c:param name="page" value="${i}" />
									</c:url>
									<c:if test="${ i == currentPage}">
										<li class="page-item active"><a class="page-link"
											href="${paging}">${i}</a></li>
									</c:if>
									<c:if test="${i != currentPage}">
										<li class="page-item"><a class="page-link"
											href="${paging}">${i}</a></li>
									</c:if>
								</c:forEach>
								<li class="page-item-total">of ${totalPages}</li> --%>
       						 
       						 </ul>
   						 	</nav>
                		</div><!-- End .col-lg-9 -->
                		<aside class="col-lg-3 order-lg-first">
                			<div class="sidebar sidebar-shop">
                				<div class="widget widget-clean">
                					
                				</div><!-- End .widget widget-clean -->

                				<%-- <div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-1" role="button" aria-expanded="true" aria-controls="widget-1">
									        Danh Mục Sản Phẩm
									    </a>
									</h3><!-- End .widget-title -->

									<div class="collapse show" id="widget-1">
										<div class="widget-body">
											<div class="filter-items filter-items-count">
												<c:forEach var="item" items="${categorys}">
                                            <li class="item-lead" style="margin-left: 25px;"><a href="<c:url value='/web/category/${item.id}'/>" style="color: black;font-size: 19px;">${item.name}</a></li>
                                             </c:forEach>
											</div><!-- End .filter-items -->
										</div><!-- End .widget-body -->
									</div><!-- End .collapse -->
        						</div><!-- End .widget --> --%>

        							<div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-4" role="button" aria-expanded="true" aria-controls="widget-4">
									        Loại Bìa
									    </a>
									</h3><!-- End .widget-title -->

									<div class="collapse show" id="widget-4">
										<div class="widget-body">
											<div class="filter-items">
											
												<div class="filter-item">
												<c:forEach var="item" items="${coverTypes}">
													<div >
														<input  type="checkbox"  name="coverType" id="coverType" value="${item}" ${fn:contains(issu, item ) ? 'checked' : ''} />
														<label  for="coverTypes" >${item}</label>
													</div><!-- End .custom-checkbox -->
												</c:forEach>
												</div><!-- End .filter-item -->
											</div><!-- End .filter-items -->
										</div><!-- End .widget-body -->
									</div><!-- End .collapse -->
        						</div><!-- End .widget -->

        						<div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-4" role="button" aria-expanded="true" aria-controls="widget-4">
									        Nhà Xuất Bản
									    </a>
									</h3><!-- End .widget-title -->

									<div class="collapse show" id="widget-4">
										<div class="widget-body">
											<div class="filter-items">
											
												<div class="filter-item">
												<c:forEach var="item" items="${issuingCompanys}">
													<div >
														<input type="checkbox"  name="issuingCompany" id="issuingCompany" value="${item}">
														<label  for="issuingCompany" >${item}</label>
													</div><!-- End .custom-checkbox -->
												</c:forEach>
												</div><!-- End .filter-item -->
											</div><!-- End .filter-items -->
										</div><!-- End .widget-body -->
									</div><!-- End .collapse -->
        						</div><!-- End .widget -->
        						
        						<div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-4" role="button" aria-expanded="true" aria-controls="widget-4">
									        Giá
									    </a>
									</h3><!-- End .widget-title -->

									<div class="collapse show" id="widget-4">
										<div class="widget-body">
											<div class="filter-items">
											
												<div class="filter-item">
													<div >
														<input type="checkbox"  name="price" id="price_1" value="Dưới 80.000">
														<label  for="price_1" ></label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->
												
													<div class="filter-item">
													<div >
														<input type="checkbox"  name="issuingCompany" id="price_2" value="Từ 80.000 đến 150.000">
														<label  for="price_2" ></label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->
												
													<div class="filter-item">
													<div >
														<input type="checkbox"  name="issuingCompany" id="price_3" value="Từ 150.000 đến 220.000">
														<label  for="price_3" ></label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->
												
													<div class="filter-item">
													<div >
														<input type="checkbox"  name="issuingCompany" id="price_4" value="Trên 220.000">
														<label  for="price_4" ></label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->
											</div><!-- End .filter-items -->
										</div><!-- End .widget-body -->
									</div><!-- End .collapse -->
        						</div><!-- End .widget -->

                			</div><!-- End .sidebar sidebar-shop -->
                		</aside><!-- End .col-lg-3 -->
                	</div><!-- End .row -->
                </div><!-- End .container -->
                </form>
            </div><!-- End .page-content -->


<script>

$(document).ready(function() {
	  $("#UpdateButton").click(update);
	 
	});

	function update() {
		alert("Check box in Checked");
	}
	function addCart(data) {
		var userId= $('#userId').val();
		if (userId == null || userId =='') {
			window.location.href = "${LoginUrl}";
		}else{
		var id = data;
		   $.ajax({
         type: "POST",
		 url: "${APICartUrl}/"+id,
         data: JSON.stringify(data),
         dataType: "json",
         contentType: "application/json",
         success: function (response) {  
         	swal("Thành công", "Sản phẩm đã được lưa", "success");
         },
         error: function (response) {
        	 swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
         }
      });
		}
}
	
	$(document).ready(function() {
		  $("input:checkbox").click(function() { 
			  var data = {};
			  var issuingCompany = [];
			  
			  var formData = $('#formSubmit').serializeArray();
			  $.each(formData, function (index, v) {
				  if (v.name == 'issuingCompany' ) {
					  issuingCompany.push(v.value)
		            } else {
		                data["" + v.name + ""] = v.value;
		            }
		            
		        });
			  		data['issuingCompany'] = issuingCompany;
	            	if($('#issuingCompany').is(":checked")){
	            		 $('#productBody').html('');
	            		searchByIssu(data);
	            	}else {
	            		var issuingCompany = null;
	            		$('#productBody').html('');
	            		searchByIssu(data);
	            	}
	            	
	            	/* if($('#issuingCompany').is(":checked")){
	            		$('#productBody').html('');
	            		var issuingCompany = $('#issuingCompany').val();
	            		searchByIssu(issuingCompany);
	            	} */
	        }); 
	});
	            	 function searchByIssu(data) {
	            		 $.ajax({
		                     url : '${searchIssuingCompany}',
		                     type : 'POST',
		                     data : JSON.stringify(data),
		                     dataType: "json",
		                     contentType: "application/json",
		                     success : function(data){
		     					$.each(data, function (key, value) {
		     						$('#productBody').append('<div class="col-6 col-md-4 col-lg-4">'+
		     						'<div class="product product-7 text-center">'+
		     						'<figure class="product-media">'+
		     						'<span class="product-label label-new">New</span> '+
		     						'<a href="${ProductDetail}'+value.id+'"><img src="<c:url value='/template/web/assets/images/products/product-4.jpg'/>" alt="Product image" class="product-image"></a>'+
		     						
		     						' <div class="product-action-vertical">'+
		     						'<a href="#" class="btn-product-icon btn-wishlist btn-expandable"><span>add to wishlist</span></a>'+
		     						' <a href="popup/quickView.html" class="btn-product-icon btn-quickview" title="Quick view"><span>Quick view</span></a>'+
		     						'<a href="#" class="btn-product-icon btn-compare" title="Compare"><span>Compare</span></a>'+
		     						'</div>'+
		     						'<div class="product-action">'+
		     						'<a  class="btn-product btn-cart" onclick="addCart('+value.id+')"><span>add to cart</span></a>'+
		     						'</div>'+
		     						'</figure>'+
		     						
		     						' <div class="product-body">'+
		     						
		     						'  <div class="product-cat">'+
		     						' <a href="${ProductDetail}'+value.id+'">'+value.issuingCompany+'</a>'+
		     						'</div>'+
		     						'<h3 class="product-title"><a href="${ProductDetail}'+value.id+'">'+value.name+'</a></h3>'+
		     						'<div class="product-price">'+value.price+'<span style="margin-left: 7px;"> VND</span></div>'+
		     						
		     						' <div class="ratings-container">'+
		     						'  <div class="ratings">'+
		     						' <div class="ratings-val" style="width: 20%;"></div>'+
		     						'</div>'+
		     						' <span class="ratings-text">( 2 Reviews )</span>'+
		     						'</div>'+
		     						
		     						'</div>'+
		     						'</div>'+
		     						'</div>');
		                      	});
		     				},
		     				error : function(error){
		     					console.log(error)
		     					alert("Lỗi hệ thống");
		     				}
		                 });
	      	}
	</script>
	
	 <script>
    $(function () {
    	var totalPage = $('#totalPage').val();
    	var  currentPage = $('#pageSearch').val();
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 9,
            startPage : currentPage,
            onPageClick: function (event, page) { // 1 2 3
            	if (currentPage != page) {
            		$('#limitSearch').val(9);
					$('#pageSearch').val(page); // 1 bam 2 thì 1 se thanh 2
					$('#formSubmit').submit();
				}
            }
        });
    });
</script> 


</body>
</html>