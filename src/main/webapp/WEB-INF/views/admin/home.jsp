<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div style="color: white">
				<div class="fl w-50 tc stat-card" style="width: 45%; float: left;">
					<div class="card-box tilebox-one"
						style="background-color: #f18383; padding: 1.25rem; -webkit-box-shadow: 0 0 35px 0 rgb(73 80 87/ 15%); box-shadow: 0 0 35px 0 rgb(73 80 87/ 15%); margin-bottom: 24px; border-radius: 0.5rem; margin: 1rem;">
						<h6 class="black-40 ttu tl">Tổng sản phẩm sách</h6>
						<h3 class="black tl" data-plugin="counterup">${amountOfBooks}
							quyển sách</h3>
						<span class="icon"><img
							style="width: 70px; margin-left: 400px; position: absolute; top: 110px;"
							src="https://cdn3.iconfinder.com/data/icons/realistic-icons/512/text.png"></span>
					</div>
				</div>
				<div class="fl w-50 tc stat-card" style="width: 45%; float: right;">
					<div class="card-box tilebox-one"
						style="background-color: #4ecd75; padding: 1.25rem; -webkit-box-shadow: 0 0 35px 0 rgb(73 80 87/ 15%); box-shadow: 0 0 35px 0 rgb(73 80 87/ 15%); margin-bottom: 24px; border-radius: 0.5rem; margin: 1rem;">
						<h6 class="black-40 ttu tl">Tổng loại sản phẩm sách</h6>
						<h3 class="black tl" data-plugin="counterup">${amountOfCategorys }
							loại sách</h3>
						<span class="icon"><img
							style="width: 70px; margin-left: 400px; position: absolute; top: 110px;"
							src="https://icons.iconarchive.com/icons/sora-meliae/matrilineare/512/Categories-applications-office-icon.png"></span>

					</div>
				</div>
				<div class="fl w-50 tc stat-card" style="width: 45%; float: left;">
					<div class="card-box tilebox-one"
						style="background-color: #4ec7cd; padding: 1.25rem; -webkit-box-shadow: 0 0 35px 0 rgb(73 80 87/ 15%); box-shadow: 0 0 35px 0 rgb(73 80 87/ 15%); margin-bottom: 24px; border-radius: 0.5rem; margin: 1rem;">
						<h6 class="black-40 ttu tl">Tổng số lượng người dùng</h6>
						<h3 class="black tl" data-plugin="counterup">${amountOfUsers}
							người dùng</h3>
						<span class="icon"><img
							style="width: 70px; margin-left: 400px; position: absolute; top: 230px;"
							src="../template/admin/image/user-removebg-preview.png"></span>

					</div>
				</div>
				<div class="fl w-50 tc stat-card" style="width: 45%; float: right;">
					<div class="card-box tilebox-one"
						style="background-color: #ccda5b; padding: 1.25rem; -webkit-box-shadow: 0 0 35px 0 rgb(73 80 87/ 15%); box-shadow: 0 0 35px 0 rgb(73 80 87/ 15%); margin-bottom: 24px; border-radius: 0.5rem; margin: 1rem;">
						<h6 class="black-40 ttu tl">Tổng số lượng đơn hàng</h6>
						<h3 class="black tl" data-plugin="counterup">100 đơn hàng</h3>
						<span class="icon"><img
							style="width: 70px; margin-left: 400px; position: absolute; top: 230px;"
							src="https://images-eu.ssl-images-amazon.com/images/I/4157jSarsYL.png"></span>

					</div>
				</div>
			</div>
			<div class="col-lg-9 main-chart">
				<!--CUSTOM CHART START -->
				<div class="border-head">
					<h3>CHI TIẾT SỐ LƯỢNG</h3>
				</div>
				<!--custom chart end-->
				<div class="row mt">
					 <div class="col-md-4 mb">
		                <!-- INSTAGRAM PANEL -->
		                <div class="instagram-panel pn">
		                  <i class="fa fa-instagram fa-4x"></i>
		                  <p>@Sách<br/> Inactive & Active
		                  </p>
		                  <p><i class="fa fa-comment"></i> ${amountOfStatusInactive } | <i class="fa fa-heart"></i> ${amountOfStatusActive }</p>
		                </div>
		              </div>
					 <div class="col-md-4 mb">
                <!-- WHITE PANEL - TOP USER -->
		                <div class="white-panel pn">
		                  <div class="white-header">
		                    <h5>Inactive & Active USER</h5>
		                  </div>
		                  <p><img src="../template/admin/image/userstatus.png" class="img-circle" width="50"></p>
		                  <p><b>Do ba Dat</b></p>
		                  <div class="row">
		                    <div class="col-md-6">
		                      <p class="small mt">Active</p>
		                      <p>2012</p>
		                    </div>
		                    <div class="col-md-6">
		                      <p class="small mt">Inactive</p>
		                      <p>47,60</p>
		                    </div>
		                  </div>
		                </div>
		              </div>
					<!-- /col-md-4 -->
					<div class="col-md-4 col-sm-4 mb">
						<!-- REVENUE PANEL -->
						<div class="green-panel pn">
						  <!-- INSTAGRAM PANEL -->
		                <div class="instagram-panel pn">
		                  <i class="fa fa-instagram fa-4x"></i>
		                  <p>@Sách<br/> Inactive & Active
		                  </p>
		                  <p><i class="fa fa-comment"></i> ${amountOfStatusInactive } | <i class="fa fa-heart"></i> ${amountOfStatusActive }</p>
		                </div>
						</div>
					</div>
					<!-- /col-md-4 -->
				</div>
				<!-- /row -->
				<div class="row">
					<!-- WEATHER PANEL -->
					<div class="col-md-4 mb">
						<div class="weather pn">
							<i class="fa fa-cloud fa-4x"></i>
							<h2>Sách	</h2>
						</div>
					</div>
					<!-- /col-md-4-->
					<!-- DIRECT MESSAGE PANEL -->
					<div class="col-md-8 mb">
						<div class="message-p pn">
							<div class="message-header">
								<h5>DIRECT MESSAGE</h5>
							</div>
							<div class="row">
								<div class="col-md-3 centered hidden-sm hidden-xs">
									<img src="img/ui-danro.jpg" class="img-circle" width="65">
								</div>
								<div class="col-md-9">
									<p>
										<name>Dan Rogers</name>
										sent you a message.
									</p>
									<p class="small">3 hours ago</p>
									<p class="message">Lorem Ipsum is simply dummy text of the
										printing and typesetting industry. Lorem Ipsum has been the
										industry's standard dummy text ever since the 1500s.</p>
									<form class="form-inline" role="form">
										<div class="form-group">
											<input type="text" class="form-control" id="exampleInputText"
												placeholder="Reply Dan">
										</div>
										<button type="submit" class="btn btn-default">Send</button>
									</form>
								</div>
							</div>
						</div>
						<!-- /Message Panel-->
					</div>
					<!-- /col-md-8  -->
				</div>
			</div>
			<div class="col-lg-3 ds" style="background: url('https://mymodernmet.com/wp/wp-content/uploads/archive/5O5nWFlD-hGyjubHOkhn_1082065814.jpeg');">
				<!--COMPLETED ACTIONS DONUTS CHART-->
				<div class="donut-main">
					<h4>COMPLETED ACTIONS & PROGRESS</h4>
					<canvas id="newchart" height="130" width="130"></canvas>
					<script>
						var doughnutData = [ {
							value : 70,
							color : "#4ECDC4"
						}, {
							value : 30,
							color : "#fdfdfd"
						} ];
						var myDoughnut = new Chart(document.getElementById(
								"newchart").getContext("2d"))
								.Doughnut(doughnutData);
					</script>
				</div>
				<!--NEW EARNING STATS -->
				<div class="panel terques-chart">
					<div class="panel-body">
						<div class="chart">
							<div class="centered">
								<span>TODAY EARNINGS</span> <strong>$ 890,00 | 15%</strong>
							</div>
							<br>
							<div class="sparkline" data-type="line" data-resize="true"
								data-height="75" data-width="90%" data-line-width="1"
								data-line-color="#fff" data-spot-color="#fff" data-fill-color=""
								data-highlight-line-color="#fff" data-spot-radius="4"
								data-data="[200,135,667,333,526,996,564,123,890,564,455]"></div>
						</div>
					</div>
				</div>
				<!--new earning end-->
				<!-- RECENT ACTIVITIES SECTION -->
				<h4 class="centered mt">RECENT ACTIVITY</h4>
				<!-- First Activity -->
				<div class="desc">
					<div class="thumb">
						<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
					</div>
					<div class="details">
						<p>
							<muted>Just Now</muted>
							<br /> <a href="#">Paul Rudd</a> purchased an item.<br />
						</p>
					</div>
				</div>
				<!-- Second Activity -->
				<div class="desc">
					<div class="thumb">
						<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
					</div>
					<div class="details">
						<p>
							<muted>2 Minutes Ago</muted>
							<br /> <a href="#">James Brown</a> subscribed to your
							newsletter.<br />
						</p>
					</div>
				</div>
				<!-- Third Activity -->
				<div class="desc">
					<div class="thumb">
						<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
					</div>
					<div class="details">
						<p>
							<muted>3 Hours Ago</muted>
							<br /> <a href="#">Diana Kennedy</a> purchased a year
							subscription.<br />
						</p>
					</div>
				</div>
				<!-- Fourth Activity -->
				<div class="desc">
					<div class="thumb">
						<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
					</div>
					<div class="details">
						<p>
							<muted>7 Hours Ago</muted>
							<br /> <a href="#">Brando Page</a> purchased a year
							subscription.<br />
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /row -->
	</section>
</section>