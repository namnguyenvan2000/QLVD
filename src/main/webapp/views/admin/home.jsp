<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Stats</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/fontawesome-free/css/all.min.css' />">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css' />">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css' />">

<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css' />">

<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/jqvmap/jqvmap.min.css' />">

<link rel="stylesheet"
	href="<c:url value='/Template/Admin/dist/css/adminlte.min.css'/>">

<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css'/>">

<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/daterangepicker/daterangepicker.css'/>">

<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/summernote/summernote-bs4.min.css' />">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake"
				src="<c:url value='/Template/Admin/dist/img/logo.png'/>" height="60"
				width="60">
		</div>

		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-controlsidebar-slide="true"
					href="#" role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="admin" class="brand-link"> <img
				src="<c:url value='/Template/User/img/logo.png'/>"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="font-weight-light">OnFlix!!!!</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="info">
						<a href="#" class="d-block">Name:
							${sessionScope.currentUser.username}</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item menu-open "><a href="admin"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>Home</p>
						</a></li>
						<li class="nav-item"><a href="admin/video?action=view"
							class="nav-link"> <i class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									Video <i class="right fas fa-angle-left"> </i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="admin/video?action=view"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Over View</p>
								</a></li>
								<li class="nav-item"><a href="admin/video?action=add"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Edit</p>
								</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-12">
							<h1 class="m-0">Statistical</h1>
						</div>
					</div>
					<!-- /.row -->
				</div>
			</div>
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Favourites Statistical</h3>
					</div>
					<div class="card-body">
						<table id="example1" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Title</th>
									<th>Link</th>
									<th>Total Like</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${videos}" var="item">
									<tr>
										<td>${item.title}</td>
										<td><a
											href="<c:url value='/video?action=watch&id=${item.href}'/>">${item.href}</a></td>
										<td>${item.totalLike}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Table 2 -->
				<br>
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Favourites Info</h3>
					</div>
					<div class="card-body">
						<div>
							<div class="form-group">
								<label>List Videos</label> 
								<select id="selectVideo">
									<option selected disabled>Choose the Videos</option>
									<c:forEach items="${videos}" var="item">
										<option class="form-control" value="${item.href}">${item.title}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<table id="example2" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>Username</th>
									<th>Email</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>

		<footer class="main-footer">
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="<c:url value='/Template/Admin/plugins/jquery/jquery.min.js'/>"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="<c:url value='/Template/Admin/plugins/jquery-ui/jquery-ui.min.js'/>"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="<c:url value='/Template/Admin/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<!-- ChartJS -->
	<script
		src="<c:url value='/Template/Admin/plugins/chart.js/Chart.min.js'/>"></script>
	<!-- Sparkline -->
	<script
		src="<c:url value='/Template/Admin/plugins/sparklines/sparkline.js'/>"></script>
	<!-- JQVMap -->
	<script
		src="<c:url value='/Template/Admin/plugins/jqvmap/jquery.vmap.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/jqvmap/maps/jquery.vmap.usa.js'/>"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="<c:url value='/Template/Admin/plugins/jquery-knob/jquery.knob.min.js'/>"></script>
	<!-- daterangepicker -->
	<script
		src="<c:url value='/Template/Admin/"plugins/moment/moment.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/"plugins/daterangepicker/daterangepicker.js'/>"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="<c:url value='/Template/Admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js'/>"></script>
	<!-- Summernote -->
	<script
		src="<c:url value='/Template/Admin/plugins/summernote/summernote-bs4.min.js'/>"></script>
	<!-- overlayScrollbars -->
	<script
		src="<c:url value='/Template/Admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js'/>"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/Template/Admin/dist/js/adminlte.js'/>"></script>
	<!-- AdminLTE for demo purposes -->
	<%-- 	<script src="<c:url value='/Template/Admin/dist/js/demo.js'/>"></script> --%>
	<!-- 	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	-->
	<!-- 	<script -->
	<%-- 		src="<c:url value='/Template/Admin/dist/js/pages/dashboard.js'/>"></script> --%>
	<!-- DataTables  & Plugins -->
	<script
		src="<c:url value='/Template/Admin/plugins/datatables/jquery.dataTables.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-responsive/js/dataTables.responsive.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/dataTables.buttons.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/jszip/jszip.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/pdfmake/pdfmake.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/pdfmake/vfs_fonts.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.html5.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.print.min.js'/>"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.colVis.min.js'/>"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/Template/Admin/dist/js/adminlte.min.js'/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/Template/Admin/dist/js/demo.js'/>"></script>
	<!-- Page specific script -->
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
		$('#selectVideo').change(function() {
			var videoHref = $(this).val();
			$.ajax({
				url : 'admin/favorites?href=' + videoHref, // link URL
				type : 'GET',
				contentType : 'application/json' // chon kieu tra ve

			}).done(function(data) {
				$('#example2').DataTable({
					"destroy" : true, // reset lai data khi thay doi field select
					"paging" : true,
					"lengthChange" : false,
					"searching" : false,
					"ordering" : true,
					"info" : true,
					"autoWidth" : false,
					"responsive" : true,
					"aaData" : data,
					"columns" : [
					//Lay data tuong ung voi Field in User.Enity
					//Dinh nghia ra cac column 
					{
						"data" : "id"
					}, {
						"data" : "username"
					}, {
						"data" : "email"
					}

					]
				});
			}).fail(function(error) {
				$('#example2').dataTable().fnClearTable();

			})
		})
	</script>
</body>
</html>
