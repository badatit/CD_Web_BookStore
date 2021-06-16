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
				<div class="border-head" >
					<h3>CHI TIẾT SỐ LƯỢNG</h3>
				</div>
				<!--custom chart end-->
				<div class="row mt" style="margin-top: 0px;">
					 <div class="col-md-4 col-sm-4 mb">
						<!-- REVENUE PANEL -->
						<div class="instagram-panel pn" >
						  <!-- INSTAGRAM PANEL -->
		                <div class="instagram-panel pn" style="height: 305px !important;">
		                  <i class="fa fa-instagram fa-4x"></i>
		                  <p>@Sách<br/> Inactive & Active
		                  </p>
		                  <p><i class="fa fa-comment"></i> ${amountOfStatusInactive } | <i class="fa fa-heart"></i> ${amountOfStatusActive }</p>
		                </div>
						</div>
					</div>
					 <div class="col-md-4 mb">
                <!-- WHITE PANEL - TOP USER -->
		             <div class="white-panel pn" style="height: 300px !important;"> 
		                 <div class="white-header" style="margin-bottom: 0px;">
		                    <h5>Thống kê sách Theo Thể Loại</h5>
		                  </div>
		                  <canvas id="cateogry" style="width: 230px !important;height: 210px !important;"></canvas>
		                  
		                </div> 
		              </div>
					<!-- /col-md-4 -->
					<div class="col-md-4 col-sm-4 mb">
						<!-- REVENUE PANEL -->
						<div class="instagram-panel pn" >
						  <!-- INSTAGRAM PANEL -->
		                <div class="instagram-panel pn" style="height: 305px !important;">
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
						<div class="weather pn" style="height: 305px !important;">
							<i class="fa fa-cloud fa-4x"></i>
							<h2>Sách	</h2>
						</div>
					</div>
					<!-- /col-md-4-->
					<!-- DIRECT MESSAGE PANEL -->
					<div class="col-md-8 mb">
						<div class="message-p pn" style="height: 305px !important;">
							<div class="message-header" style="margin-bottom: 0px;">
								<h5>Thống kê sách theo công ty sản xuất</h5>
							</div>
							 <canvas id="issuingcompany" ></canvas>
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
						/* var doughnutData = [ {
							value : 70,
							color : "#4ECDC4"
						}, {
							value : 30,
							color : "#fdfdfd"
						} ];
						var myDoughnut = new Chart(document.getElementById(
								"newchart").getContext("2d"))
								.Doughnut(doughnutData); */
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

<script>
 function grab() {
    /* Promise to make sure data loads */
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "http://localhost:8080/bookstore/api/admin/statisticalBook",
            method: "GET",
            dataType: 'JSON',
            success: function(data) {
                resolve(data)
            },
            error: function(error) {
                reject(error);
            }
        })
    })
}

$(document).ready(function() {
    grab().then((data) => {
        console.log('Recieved our data', data);
        let regions = [];
        let value = [];
        var barColors = [
        	  "#b91d47",
        	  "#00aba9",
        	  "#2b5797",
        	  "#e8c3b9",
        	  "#1e7145"
        	];
        try {
            data.forEach((item) => {
                regions.push(item[0])
                value.push(item[1])
            });

            let chartdata = {
                labels: [...regions],
                datasets: [{
                    label: 'Thể Loại',
                    data: [...value],
                    backgroundColor:barColors ,
                    
                      borderWidth: 1
                   
                }],
                options: {
                    scales: {
                        yAxes: [{
                        	
                            ticks: {
                                beginAtZero:true,
                                min: 0
                            }
                        }]
                    },
                }
                
            };

            let ctx = $("#cateogry");

            let barGraph = new Chart(ctx, {
                type: 'pie',
                data: chartdata
            });

        } catch (error) {
            console.log('Error parsing JSON data', error)
        }

    }).catch((error) => {
        console.log(error);
    })
});

</script> 

<script>
 function grab1() {
    /* Promise to make sure data loads */
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "http://localhost:8080/bookstore/api/admin/statisticalBookByIssuingcompany",
            method: "GET",
            dataType: 'JSON',
            success: function(data) {
                resolve(data)
            },
            error: function(error) {
                reject(error);
            }
        })
    })
}

$(document).ready(function() {
    grab1().then((data) => {
        console.log('Recieved our data', data);
        let regions = [];
        let value = [];
        var barColors = ["red", "green","blue","orange","brown"];
        try {
            data.forEach((item) => {
                regions.push(item[0])
                value.push(item[1])
            });

            let chartdata = {
                labels: [...regions],
                datasets: [{
                    label: 'Số Lượng',
                    data: [...value],
                    backgroundColor: barColors,
                   
                      borderWidth: 1
                   
                }],
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true,
                                min: 0
                            }
                        }]
                    },
                }
                
            };

            let ctx = $("#issuingcompany");

            let barGraph = new Chart(ctx, {
                type: 'bar',
                data: chartdata
            });

        } catch (error) {
            console.log('Error parsing JSON data', error)
        }

    }).catch((error) => {
        console.log(error);
    })
});

</script>