<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APICartUrl" value="/api/carts" />
<c:url var="LoginUrl" value="/login" />
<c:url var="APIBookFavorite" value="/api/bookfavorite" />
<c:url var="ProductDetailsURL" value="/web/product/" />
<c:url var="Pricture"
	value='/template/web/assets/images/products/cart/product-1.jpg' />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<main class="main">
		<input type="hidden" value="${userId}" name="userId" id="userId">
		<div class="intro-section pt-lg-2">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-6">
						<div class="banner banner-big banner-overlay">
							<a href="<c:url value='/web/blog'/>"> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/banners/banner-1.jpg'/>"
								alt="Banner">
							</a>

							<div class="banner-content">
								<h4 class="banner-subtitle text-white">
									<a href="<c:url value='/web/blog'/>">Hướng Dẫn Đến Thế Giới Của Bạn</a>
								</h4>
								<!-- End .banner-subtitle -->
								<h2 class="banner-title text-white">
									<a href="<c:url value='/web/blog'/>">Phải Đọc<br>Sách Hướng<br> Dẫn Du Lịch
									</a>
								</h2>
								<!-- End .banner-title -->
								<a href="<c:url value='/web/blog'/>" class="btn btn-outline-white-3 banner-link">Xem Thêm<i class="icon-long-arrow-right"></i>
								</a>
							</div>
							<!-- End .banner-content -->
						</div>
						<!-- End .banner -->
					</div>
					<!-- End .col-lg-6 -->

					<div class="col-sm-6 col-lg-3">
						<div class="banner banner-overlay">
							<a href="<c:url value='/web/product?page=1&limit=9&categoryId=3'/>"> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/banners/banner-2.jpg'/>"
								alt="Banner">
							</a>

							<div class="banner-content banner-content-stretch">
								<h4 class="banner-subtitle text-white">
									<a>Tin Mới</a>
								</h4>
								<!-- End .banner-subtitle -->
								<h3 class="banner-title text-white">
									<a href="<c:url value='/web/product?page=1&limit=9&categoryId=3'/>">Khám Phá  <br>Những<br> Cuốn Sách <br>Tiểu Thuyết  <br>Hay Nhất<br>Của Chúng Tôi
									</a>
								</h3>
								<!-- End .banner-title -->
								<a href="<c:url value='/web/product?page=1&limit=9&categoryId=3'/>" class="btn btn-outline-white-3 banner-link">Khám Phá Ngay
								<i class="icon-long-arrow-right"></i>
								</a>
							</div>
							<!-- End .banner-content -->
						</div>
						<!-- End .banner -->
					</div>
					<!-- End .col-lg-3 -->

					<div class="col-sm-6 col-lg-3">
						<div class="banner banner-small banner-overlay">
							<a href="<c:url value='/web/product?page=1&limit=9&categoryId=1'/>"> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/banners/banner-3.jpg'/>"
								alt="Banner">
							</a>

							<div class="banner-content">
								<h4 class="banner-subtitle text-white d-lg-none d-xl-block">
									<a>Mới</a>
								</h4>
								<!-- End .banner-subtitle -->
								<h3 class="banner-title text-white">
									<a href="<c:url value='/web/product?page=1&limit=9&categoryId=1'/>">Sách Tư Duy<br><span>Đang Chờ bạn</span></a>
								</h3>
								<!-- End .banner-title -->
								<a href="<c:url value='/web/product?page=1&limit=9&categoryId=1'/>" class="btn btn-outline-white-3 banner-link">Mua Ngay
									<i class="icon-long-arrow-right"></i>
								</a>
							</div>
							<!-- End .banner-content -->
						</div>
						<!-- End .banner -->

						<div class="banner banner-small banner-overlay">
							<a href="<c:url value='/web/product?page=1&limit=9&categoryId=6'/>"> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/banners/banner-4.jpg'/>"
								alt="Banner">
							</a>

							<div class="banner-content">
								<h4 class="banner-subtitle text-white d-lg-none d-xl-block">
									<a href="<c:url value='/web/product?page=1&limit=9&categoryId=6'/>">Mới Cập Nhập</a>
								</h4>
								<!-- End .banner-subtitle -->
								<h3 class="banner-title text-white">
									<a href="<c:url value='/web/product?page=1&limit=9&categoryId=6'/>">Làm Việc <br>& Kỹ Năng
									</a>
								</h3>
								<!-- End .banner-title -->
								<a href="<c:url value='/web/product?page=1&limit=9&categoryId=6'/>" class="btn btn-outline-white-3 banner-link">Mua Ngay<i class="icon-long-arrow-right"></i>
								</a>
							</div>
							<!-- End .banner-content -->
						</div>
						<!-- End .banner -->
					</div>
					<!-- End .col-lg-3 -->
				</div>
				<!-- End .row -->
			</div>
			<!-- End .container -->

			<div class="icon-boxes-container bg-transparent">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-lg-3">
							<div class="icon-box icon-box-side">
								<span class="icon-box-icon"> <i class="icon-truck"></i>
								</span>
								<div class="icon-box-content">
									<h3 class="icon-box-title">Thanh Toán & Vận Chuyển</h3>
									<!-- End .icon-box-title -->
									<p>Giao hàng miễn phí cho các đơn đặt hàng trên 200.000 đ</p>
								</div>
								<!-- End .icon-box-content -->
							</div>
							<!-- End .icon-box -->
						</div>
						<!-- End .col-sm-6 col-lg-3 -->

						<div class="col-sm-6 col-lg-3">
							<div class="icon-box icon-box-side">
								<span class="icon-box-icon"> <i class="icon-rotate-left"></i>
								</span>

								<div class="icon-box-content">
									<h3 class="icon-box-title">Hoàn Tiền Lại</h3>
									<!-- End .icon-box-title -->
									<p>Đảm bảo hoàn tiền miễn phí 100%</p>
								</div>
								<!-- End .icon-box-content -->
							</div>
							<!-- End .icon-box -->
						</div>
						<!-- End .col-sm-6 col-lg-3 -->

						<div class="col-sm-6 col-lg-3">
							<div class="icon-box icon-box-side">
								<span class="icon-box-icon"> <i class="icon-life-ring"></i>
								</span>

								<div class="icon-box-content">
									<h3 class="icon-box-title">Hỗ trợ</h3>
									<!-- End .icon-box-title -->
									<p>Luôn phản hồi trực tuyến 24/7</p>
								</div>
								<!-- End .icon-box-content -->
							</div>
							<!-- End .icon-box -->
						</div>
						<!-- End .col-sm-6 col-lg-3 -->

						<div class="col-sm-6 col-lg-3">
							<div class="icon-box icon-box-side">
								<span class="icon-box-icon"> <i class="icon-envelope"></i>
								</span>

								<div class="icon-box-content">
									<h3 class="icon-box-title">Tham gia bản tin của chúng tôi</h3>
									<!-- End .icon-box-title -->
									<p>Giảm giá 10% bằng cách đăng ký nhận bản tin của chúng tôi</p>
								</div>
								<!-- End .icon-box-content -->
							</div>
							<!-- End .icon-box -->
						</div>
						<!-- End .col-sm-6 col-lg-3 -->
					</div>
					<!-- End .row -->
				</div>
				<!-- End .container -->
			</div>
			<!-- End .icon-boxes-container -->
		</div>
		<!-- End .intro-section -->

		<div class="bestseller-products bg-light pt-5 pb-5 mb-5">
			<div class="block">
				<div class="block-wrapper ">
					<div class="container">
						<div class="heading heading-flex">
							<div class="heading-left">
								<h2 class="title">Sales Products</h2>
								<!-- End .title -->
							</div>
							<!-- End .heading-left -->

							<div class="heading-right">
								<a href="<c:url value='/web/product?page=1&limit=9'/>" class="title-link">View more
									Products <i class="icon-long-arrow-right"></i>
								</a>
							</div>
							<!-- End .heading-right -->
						</div>
						<!-- End .header-flex -->

						<div class="owl-carousel carousel-equal-height owl-simple"
							data-toggle="owl"
							data-owl-options='{
                                    "nav": false, 
                                    "dots": true,
                                    "margin": 20,
                                    "loop": false,
                                    "responsive": {
                                        "0": {
                                            "items":2
                                        },
                                        "480": {
                                            "items":2
                                        },
                                        "768": {
                                            "items":3
                                        },
                                        "992": {
                                            "items":4
                                        },
                                        "1440": {
                                            "items":5
                                        }
                                    }
                                }'>
							<c:forEach var="item" items="${listBookASC}">
								<div class="product">
									<span class="product-label label-sale">Sale</span>

									<figure class="product-media" style="box-shadow: none">
										<a href="<c:url value='/web/product/${item.id}' />"> <img
									src="${item.img1}" alt="Product image" class="product-image">
										</a>
									</figure>
									<!-- End .product-media -->

									<div class="product-body">
										<div class="product-cat">
											by <a href="<c:url value='/web/product/${item.id}' />"
												id="issuingCompany">${item.issuingCompany}</a>
										</div>
										<!-- End .product-cat -->
										<h3 class="product-title">
											<a href="<c:url value='/web/product/${item.id}' />">${item.name}</a>
										</h3>
										<!-- End .product-title -->
										<div class="product-price">
											<span class="new-price"> <fmt:formatNumber
													type="number" groupingUsed="true" value="${item.price}" />

												<span> VND</span></span>

										</div>
										<!-- End .product-price -->

										<div class="product-footer">
											<div class="ratings-container">
												<div class="ratings">
													<div class="ratings-val" style="width: 80%;"></div>
													<!-- End .ratings-val -->
												</div>
												<!-- End .ratings -->
												<span class="ratings-text">( 10 Reviews )</span>
											</div>
											<!-- End .rating-container -->
											<div class="product-action">
												<a class="btn-product btn-cart"
													onclick="addCart(${item.id})"> <span>Thêm vào
														giỏ hàng</span>
												</a>
												 <c:if test="${item.favorite == null}">
													<a onclick="addFavourite(${item.id})"
														class="btn-product btn-wishlist favorite_${item.id}">
														<span class="messageFavorite_${item.id}">Thêm yêu
															thích</span>
													</a>
												</c:if>
												<c:if test="${item.favorite != null}">
													<a style="color: red;" onclick="addFavourite(${item.id})"
														class="btn-product btn-wishlist favorite_${item.id}">
														<span style="color: red;" class="messageFavorite_${item.id}">Đã yêu
															thích</span>
													</a>
												</c:if>
											</div>
											<!-- End .product-action -->
										</div>
										<!-- End .product-footer -->
									</div>
									<!-- End .product-body -->

								</div>
								<!-- End .product -->
							</c:forEach>

						</div>
						<!-- End .owl-carousel -->
					</div>
					<!-- End .container -->
				</div>
				<!-- End .block-wrapper -->
			</div>
			<!-- End .block -->
		</div>
		<!-- End .bg-light pt-4 pb-4 -->

		<div class="container">
			<div class="heading heading-flex">
				<div class="heading-left">
					<h2 class="title">New Releases</h2>
					<!-- End .title -->
				</div>
				<!-- End .heading-left -->

				<div class="heading-right">
					<a href="<c:url value='/web/product?page=1&limit=9'/>" class="title-link">View more Products <i
						class="icon-long-arrow-right"></i></a>
				</div>
				<!-- End .heading-right -->
			</div>
			<!-- End .header-flex -->

			<div class="row">
				<div class="col-xl-4">
					<div class="owl-carousel carousel-equal-height owl-simple"
						data-toggle="owl"
						data-owl-options='{
                                "nav": false, 
                                "dots": true,
                                "margin": 10
                            }'>
				

						<div class="product-big">
							<img
								src="<c:url value='/template/web/assets/images/demos/demo-20/products/product-big-2-bg.jpg'/>"
								alt="Banner">

							<div class="product-wrap">
								<figure class="product-media">
									<a > <img
										src="<c:url value='/template/web/assets/images/demos/demo-20/products/product-12.jpg'/>"
										class="product-image">
									</a>
								</figure>
								<!-- End .product-media -->

								<div class="product-body">
									<div class="product-cat">
										by <a >Nicola Yoon </a>
									</div>
									<!-- End .product-cat -->
									<h3 class="product-title">
										<a >The Sun Is Also a Star.</a>
									</h3>
									<!-- End .product-title -->
									<div class="product-price"></div>
									<!-- End .product-price -->

									
									<!-- End .product-action -->
								</div>
								<!-- End .product-body -->
							</div>
							<!-- End .product-wrap -->
						</div>
						<!-- End .product-big -->
					</div>
					<!-- End .owl-carousel -->

					<div class="mb-3 d-xl-none"></div>
					<!-- End .mb-3 d-none -->
				</div>
				<!-- End .col-lg-4 -->

				<div class="col-xl-8">
					<div class="block-wrapper ">
						<div class="owl-carousel carousel-equal-height owl-simple"
							data-toggle="owl"
							data-owl-options='{
                                    "nav": false, 
                                    "dots": true,
                                    "margin": 20,
                                    "loop": false,
                                    "responsive": {
                                        "0": {
                                            "items":2
                                        },
                                        "480": {
                                            "items":2
                                        },
                                        "768": {
                                            "items":3
                                        },
                                        "992": {
                                            "items":4
                                        },
                                        "1200": {
                                            "items":3
                                        },
                                        "1440": {
                                            "items":4
                                        }
                                    }
                                }'>
							<c:forEach var="item" items="${listBookDESC}">
								<div class="product">
									<figure class="product-media" style="box-shadow: none">
										<a href="<c:url value='/web/product/${item.id}' />"> <img
											src="<c:url value='${item.img1 }'/>"
											alt="Product image" class="product-image">
										</a>
									</figure>
									<!-- End .product-media -->

									<div class="product-body">
										<div class="product-cat">
											by <a href="<c:url value='/web/product/${item.id}' />"
												id="issuingCompany">${item.issuingCompany}</a>
										</div>
										<!-- End .product-cat -->
										<h3 class="product-title">
											<a href="<c:url value='/web/product/${item.id}' />">${item.name}</a>
										</h3>
										<!-- End .product-title -->
										<div class="product-price">
											<fmt:formatNumber type="number" groupingUsed="true"
												value="${item.price}" />
											<span> VND</span>
										</div>
										<!-- End .product-price -->

										<div class="product-footer">
											<div class="ratings-container">
												<div class="ratings">
													<div class="ratings-val" style="width: 80%;"></div>
													<!-- End .ratings-val -->
												</div>
												<!-- End .ratings -->
												<span class="ratings-text">( 5 Reviews )</span>
											</div>
											<!-- End .rating-container -->
											<div class="product-action">
												<a class="btn-product btn-cart"
													onclick="addCart(${item.id})"> <span>Thêm vào
														giỏ hàng</span>
												</a>
											 <c:if test="${item.favorite == null}">
													<a onclick="addFavourite(${item.id})"
														class="btn-product btn-wishlist favorite_${item.id}">
														<span class="messageFavorite_${item.id}">Thêm yêu
															thích</span>
													</a>
												</c:if>
												<c:if test="${item.favorite != null}">
													<a style="color: red;" onclick="addFavourite(${item.id})"
														class="btn-product btn-wishlist favorite_${item.id}">
														<span style="color: red;" class="messageFavorite_${item.id}">Đã yêu
															thích</span>
													</a>
												</c:if>
											</div>
											<!-- End .product-action -->
										</div>
										<!-- End .product-footer -->
									</div>
									<!-- End .product-body -->
								</div>
								<!-- End .product -->
							</c:forEach>
						</div>
						<!-- End .owl-carousel -->
					</div>
					<!-- End .block-wrapper -->
				</div>
				<!-- End .col-lg-8 -->
			</div>
			<!-- End .row -->
		</div>
		<!-- End .container -->

		<div class="mb-5"></div>
		<!-- End .mb-3 -->

		<div class="banner-group mb-2">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 col-lg-4">
						<div class="banner banner-overlay">
							<a> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/banners/banner-6.jpg'/>"
								alt="Banner">
							</a>

							<div class="banner-content">
								<h4 class="banner-subtitle text-white">
									<a >Một sự lựa chọn hoàn hảo cho con bạn</a>
								</h4>
								<!-- End .banner-subtitle -->
								<h3 class="banner-title text-white">
									<a >Kiến Thức<br>Bách Khoa
									</a>
								</h3>
								<!-- End .banner-title -->
								<a href="<c:url value='/web/product?page=1&limit=9&categoryId=5'/>" class="btn btn-outline-white-3 banner-link">Khám Phá Ngay<i class="icon-long-arrow-right"></i>
								</a>
							</div>
							<!-- End .banner-content -->
						</div>
						<!-- End .banner -->
					</div>
					<!-- End .col-lg-4 -->

					<div class="col-md-6 col-lg-4">
						<div class="banner banner-overlay">
							<a > <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/banners/banner-7.jpg'/>"
								alt="Banner">
							</a>

							<div class="banner-content">
								<h4 class="banner-subtitle text-white">
									<a >Tuần lễ nâng cao nhận thức về kỹ năng sống</a>
								</h4>
								<!-- End .banner-subtitle -->
								<h3 class="banner-title text-white">
									<a >Kỹ Năng Sống
									</a>
								</h3>
								<!-- End .banner-title -->
								<a href="<c:url value='/web/product?page=1&limit=9&categoryId=2'/>" class="btn btn-outline-white-3 banner-link">Khám Phá Ngay
									<i class="icon-long-arrow-right"></i>
								</a>
							</div>
							<!-- End .banner-content -->
						</div>
						<!-- End .banner -->
					</div>
					<!-- End .col-lg-4 -->

					<div class="col-md-6 col-lg-4">
						<div class="banner banner-overlay">
							<a href="#"> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/banners/banner-8.jpg'/>"
								alt="Banner">
							</a>

							<div class="banner-content">
								<h4 class="banner-subtitle text-white">
									<a >Thời gian dành cho những cuốn sách hay</a>
								</h4>
								<!-- End .banner-subtitle -->
								<h3 class="banner-title text-white">
									<a> Những cuốn sách tốt nhất
									</a>
								</h3>
								<!-- End .banner-title -->
								<a href="<c:url value='/web/blog'/>" class="btn btn-outline-white-3 banner-link">Đọc Ngay<i class="icon-long-arrow-right"></i>
								</a>
							</div>
							<!-- End .banner-content -->
						</div>
						<!-- End .banner -->
					</div>
					<!-- End .col-lg-4 -->
				</div>
				<!-- End .row -->
			</div>
			<!-- End .container -->
		</div>
		<!-- End .banner-group -->

		<div class="block">
			<div class="block-wrapper ">
				<div class="container">
					<div class="heading heading-flex">
						<div class="heading-left">
							<h2 class="title">Picks From Our Experts</h2>
							<!-- End .title -->
						</div>
						<!-- End .heading-left -->

						<div class="heading-right">
							<a href="<c:url value='/web/product?page=1&limit=9'/>" class="title-link">View more Products
								<i class="icon-long-arrow-right"></i>
							</a>
						</div>
						<!-- End .heading-right -->
					</div>
					<!-- End .header-flex -->

					<div class="owl-carousel carousel-equal-height owl-simple"
						data-toggle="owl"
						data-owl-options='{
                                "nav": false, 
                                "dots": true,
                                "margin": 20,
                                "loop": false,
                                "responsive": {
                                    "0": {
                                        "items":2
                                    },
                                    "480": {
                                        "items":2
                                    },
                                    "768": {
                                        "items":3
                                    },
                                    "992": {
                                        "items":4
                                    },
                                    "1200": {
                                        "items":5
                                    },
                                    "1440": {
                                        "items":6
                                    }
                                }
                            }'>
                            
                        <c:forEach var="item" items="${listBookHighPrice}">
								<div class="product">
									<figure class="product-media" style="box-shadow: none">
										<a href="<c:url value='/web/product/${item.id}' />"> <img
											src="<c:url value='${item.img1 }'/>"
											alt="Product image" class="product-image">
										</a>
									</figure>
									<!-- End .product-media -->

									<div class="product-body">
										<div class="product-cat">
											by <a href="<c:url value='/web/product/${item.id}' />"
												id="issuingCompany">${item.issuingCompany}</a>
										</div>
										<!-- End .product-cat -->
										<h3 class="product-title">
											<a href="<c:url value='/web/product/${item.id}' />">${item.name}</a>
										</h3>
										<!-- End .product-title -->
										<div class="product-price">
											<fmt:formatNumber type="number" groupingUsed="true"
												value="${item.price}" />
											<span> VND</span>
										</div>
										<!-- End .product-price -->

										<div class="product-footer">
											<div class="ratings-container">
												<div class="ratings">
													<div class="ratings-val" style="width: 80%;"></div>
													<!-- End .ratings-val -->
												</div>
												<!-- End .ratings -->
												<span class="ratings-text">( 5 Reviews )</span>
											</div>
											<!-- End .rating-container -->
											<div class="product-action">
												<a class="btn-product btn-cart"
													onclick="addCart(${item.id})"> <span>Thêm vào
														giỏ hàng</span>
												</a>
											 <c:if test="${item.favorite == null}">
													<a onclick="addFavourite(${item.id})"
														class="btn-product btn-wishlist favorite_${item.id}">
														<span class="messageFavorite_${item.id}">Thêm yêu
															thích</span>
													</a>
												</c:if>
												<c:if test="${item.favorite != null}">
													<a style="color: red;" onclick="addFavourite(${item.id})"
														class="btn-product btn-wishlist favorite_${item.id}">
														<span style="color: red;" class="messageFavorite_${item.id}">Đã yêu
															thích</span>
													</a>
												</c:if>
											</div>
											<!-- End .product-action -->
										</div>
										<!-- End .product-footer -->
									</div>
									<!-- End .product-body -->
								</div>
								<!-- End .product -->
							</c:forEach>
					</div>
					<!-- End .owl-carousel -->
				</div>
				<!-- End .container -->
			</div>
			<!-- End .block-wrapper -->
		</div>
		<!-- End .block -->

		<div class="mb-5"></div>
		<!-- End .mb-5 -->

		<div class="blog-posts bg-light pt-4 pb-4">
			<div class="container">
				<h2 class="title">From Our Blog</h2>
				<!-- End .title-lg text-center -->

				<div class="owl-carousel owl-simple" data-toggle="owl"
					data-owl-options='{
                            "nav": false, 
                            "dots": true,
                            "items": 3,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":1
                                },
                                "600": {
                                    "items":2
                                },
                                "992": {
                                    "items":3
                                },
                                "1200": {
                                    "items":4
                                }
                            }
                        }'>
					<article class="entry">
						<figure class="entry-media">
							<a href="<c:url value='/web/blog'/>"> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/blog/post-1.jpg'/>"
								alt="image desc">
							</a>
						</figure>
						<!-- End .entry-media -->

						<div class="entry-body">
							<div class="entry-meta">
								<a href="#">11-02-2021</a>, 0 Bình Luận
							</div>
							<!-- End .entry-meta -->

							
							<!-- End .entry-title -->

							<div class="entry-content">
								<p> Những gì sách dạy chúng ta cũng giống như lửa. Chúng ta lấy nó từ nhà hàng xóm, thắp nó trong nhà ta, đem nó truyền cho người khác và nó trở thành tài sản của tất cả mọi người. </p>
								
							</div>
							<!-- End .entry-content -->
						</div>
						<!-- End .entry-body -->
					</article>
					<!-- End .entry -->

					<article class="entry">
						<figure class="entry-media">
							<a href="<c:url value='/web/blog'/>"> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/blog/post-2.jpg'/>"
								alt="image desc">
							</a>
						</figure>
						<!-- End .entry-media -->

						<div class="entry-body">
							<div class="entry-meta">
								<a href="#">11-12-2020</a>, 0 Bình Luận
							</div>
							<!-- End .entry-meta -->

							<!-- End .entry-title -->

							<div class="entry-content">
								<p>Cuốn sách tốt nhất cho bạn là cuốn sách nói nhiều nhất với bạn vào lúc bạn đọc nó. Tôi không nói tới cuốn sách cho bạn nhiều bài học nhất mà là cuốn sách nuôi dưỡng tâm hồn bạn. Và điều đó phụ thuộc vào tuổi tác, trải nghiệm, nhu cầu về tâm lý và tinh thần.</p>
								
							</div>
							<!-- End .entry-content -->
						</div>
						<!-- End .entry-body -->
					</article>
					<!-- End .entry -->

					<article class="entry">
						<figure class="entry-media">
							<a href="<c:url value='/web/blog'/>"> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/blog/post-3.jpg'/>"
								alt="image desc">
							</a>
						</figure>
						<!-- End .entry-media -->

						<div class="entry-body">
							<div class="entry-meta">
								<a href="#">19-12-2019</a>, 2 Bình Luận
							</div>
							<!-- End .entry-meta -->

							
							<!-- End .entry-title -->

							<div class="entry-content">
								<p>Đằng sau sự thành công của một người đàn ông, là hình dáng của một người phụ nữ. Còn đằng sau sự thành công của bất kì ai là ít nhất một cuốn sách, hay cả một giá sách.</p>
								
							</div>
							<!-- End .entry-content -->
						</div>
						<!-- End .entry-body -->
					</article>
					<!-- End .entry -->

					<article class="entry">
						<figure class="entry-media">
							<a href="<c:url value='/web/blog'/>"> <img
								src="<c:url value='/template/web/assets/images/demos/demo-20/blog/post-4.jpg'/>"
								alt="image desc">
							</a>
						</figure>
						<!-- End .entry-media -->

						<div class="entry-body">
							<div class="entry-meta">
								<a href="#">02-02-2021</a>, 2 Bình Luận
							</div>
							<!-- End .entry-meta -->

							<!-- End .entry-title -->

							<div class="entry-content">
								<p>Sách là nguồn của cải quý báu của thế giới và là di sản xứng đáng của các thế hệ và các quốc gia.</p>
							</div>
							<!-- End .entry-content -->
						</div>
						<!-- End .entry-body -->
					</article>
					<!-- End .entry -->
				</div>
				<!-- End .owl-carousel -->
			</div>
			<!-- End .container -->
		</div>
		<!-- End .blog-posts -->

		<div class="cta-newsletter text-center pt-6 pb-7">
			<div class="container">
				<span class="cta-icon"><i class="icon-envelope"></i></span>
				<h3 class="title">Subscribe for Our Newsletter</h3>
				<!-- End .title -->
				<p class="title-desc">Learn about new offers and get more deals
					by joining our newsletter</p>
				<!-- End .title-desc -->

				<form action="#">
					<div class="input-group">
						<input type="email" class="form-control"
							placeholder="Enter your Email Address" aria-label="Email Adress"
							aria-describedby="newsletter-btn" required>
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit" id="newsletter-btn">
								<span>SUBSCRIBE</span><i class="icon-long-arrow-right"></i>
							</button>
						</div>
						<!-- .End .input-group-append -->
					</div>
					<!-- .End .input-group -->
				</form>
			</div>
			<!-- End .container -->
		</div>
		<!-- End .cta-newsletter -->
	</main>
	<!-- End .main -->

	<script>
	
	function addCart(id) {
		var userId= $('#userId').val();
		if (userId == null || userId =='') {
			window.location.href = "${LoginUrl}";
		}else{
		$("#cartMini").html('');
		var data = {};
		data['bookId'] = id;
		   $.ajax({
         type: "POST",
		 url: "${APICartUrl}",
         data: JSON.stringify(data),
         dataType: "json",
         contentType: "application/json",
         success: function (response) {  
         	swal("Thành công", "Sản phẩm đã được lưa", "success");
         	$('#sizeCart').html(response.sizeCart);
         	
         	// call subtotal
         	getSubTotal();
         	// call mini cart
         	getCart();
         }, 
         
         error: function (response) {
        	 swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
         }
      });
		}
}
 function getSubTotal() {
			$.ajax({
				type : "GET",
				url : "${APICartUrl}/subTotal",
				contentType : "application/json",
				success : function(response) {
					 $('.cart-total-price').text(response);
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
	 
	 function sumPrice() {
		 $('.cart-total-price').text('');
  			$.ajax({
  				type : "POST",
  				url : "${APIGetSumCartUrl}",
  				 dataType: "json",
  				contentType : "application/json",
  				success : function(response) {
  					swal("Thành công", "Sản phẩm đã được xóa", "success");
  		         	 $('.cart-total-price').text(response);
  				},
  				error : function(response) {
  					swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
  					
  				}
  			});
  		}
	 function addFavourite(id){
		 var userId= $('#userId').val();
			if (userId == null || userId =='') {
				alert("Vui lòng đăng nhập");
			}else{
		 var data ={};
		 data['bookId'] =id;
		   $.ajax({
		         type: "POST",
				 url: "${APIBookFavorite}",
		         data: JSON.stringify(data),
		         contentType: "application/json",
		         success: function (response) { 
		        	 $('.wishlist-count').text(response.count);
		        	 var classWish = ".favorite_"+id;
		        	 var messageWish =".messageFavorite_"+id;
		        	 if (response.message == "success_save") {
		         	 	$(classWish).css("color","red");
		         	 	$(messageWish).text("Đã yêu thích");
		         	 	$(messageWish).css("color","red");
					}else{
						 $(classWish).css("color","black");
						 $(messageWish).text("Thêm yêu thích");
			         	 	$(messageWish).css("color","black");
					}
		         }, 
		         
		         error: function (response) {
		        	 swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
		         }
		      });
			}
	 }
	
	</script>


</body>
</html>