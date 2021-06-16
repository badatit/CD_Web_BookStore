<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>Dashio - Bootstrap Admin Template</title>

<!-- font awsome  -->
<link href="<c:url value='/template/admin/css/all.min.css'/>"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
	href="<c:url value='/template/admin/lib/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<!--external css-->

<link
	href="<c:url value='/template/admin/lib/font-awesome/css/font-awesome.css'/>"
	rel="stylesheet" />

<link
	href="<c:url value='/template/admin/lib/fancybox/jquery.fancybox.css'/>"
	rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="<c:url value='/template/admin/css/style.css'/>"
	rel="stylesheet">
<link href="<c:url value='/template/admin/css/style-responsive.css'/>"
	rel="stylesheet">
<script src="<c:url value='/template/admin/lib/jquery/jquery.min.js'/> "></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<c:url value='/template/admin/dist/jquery.validate.min.js'/> "></script>

<!-- data table -->

<link
	href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/responsive/2.2.7/css/responsive.bootstrap4.min.css"
	rel="stylesheet">
<!--<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">-->

<link rel='stylesheet'
	href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
<script
	src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script>
<style data-styled data-styled-version="4.4.1"></style>

<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js'></script>

</head>



<body>
	<%@ include file="/common/admin/header.jsp"%>

	<section id="container">
		<%@ include file="/common/admin/menu.jsp"%>
		<!--sidebar end-->
		<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<dec:body />
		<!-- /MAIN CONTENT -->
		<!--main content end-->
		<!--footer start-->
		<footer class="site-footer">
			<div class="text-center">
				<p>
					&copy; <strong>D&H</strong>. All Rights Reserved
				</p>
				<div class="credits">
					My template <a href="https://templatemag.com/">TemplateMag</a>
				</div>
				<a href="gallery.html#" class="go-top"> <i
					class="fa fa-angle-up"></i>
				</a>
			</div>
		</footer>
		<!--footer end-->
	</section>
	<!-- js placed at the end of the document so the pages load faster -->
	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>



	<script
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.7/js/responsive.bootstrap4.min.js"></script>
	<script
		src="<c:url value='/template/admin/lib/fancybox/jquery.fancybox.js' />"></script>
	<script
		src="<c:url value='/template/admin/lib/bootstrap/js/bootstrap.min.js'/>"></script>
	<script class="include" type="text/javascript"
		src="<c:url value='/template/admin/lib/jquery.dcjqaccordion.2.7.js'/>"></script>
	<script
		src="<c:url value='/template/admin/lib/jquery.scrollTo.min.js'/>"></script>
	<script src="<c:url value='/template/admin/lib/jquery.nicescroll.js'/>"
		type="text/javascript"></script>
	<script src="<c:url value='/template/admin/lib/common-scripts.js'/>"></script>
	<!--script for this page-->
	<script type="text/javascript">
		$(function() {
			//    fancybox
			jQuery(".fancybox").fancybox();
		});
	</script>

</body>
</html>