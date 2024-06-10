<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OverView - Video</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/fontawesome-free/css/all.min.css' />">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css' />">
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css' />">
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css' />">
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/jqvmap/jqvmap.min.css' />">
<link rel="stylesheet" href="<c:url value='/Template/Admin/dist/css/adminlte.min.css'/>">
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css'/>">
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/daterangepicker/daterangepicker.css'/>">
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/summernote/summernote-bs4.min.css' />">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake"
				src="<c:url value='/Template/Admin/dist/img/logo.png'/>"
				alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
		<!-- Right navbar links -->
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
			<a href="<c:url value='/admin'/>" class="brand-link"> <img
				src="<c:url value='/Template/User/img/logo.png'/>"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="font-weight-light">OnFlix!!!!</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img
							src="<c:url value='/Template/Admin/dist/img/user2-160x160.jpg'/>"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">${sessionScope.currentUser.username}</a>
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
						<li class="nav-item menu-open"><a
						href="<c:url value='/admin'/>" class="nav-link"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>Home</p>
						</a></li>
						<a href="#" class="nav-link active"> <i
							class="nav-icon fas fa-tachometer-alt"></i>
							<p>
								Video <i class="right fas fa-angle-left"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item active"><a
								href="<c:url value='/admin/video?action=view'/>"
								class="nav-link active"> <i class="far fa-circle nav-icon"></i>
									<p>Over View</p>
							</a></li>
							<li class="nav-item"><a
								href="<c:url value='/admin/video?action=add'/>" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Edit</p>
							</a></li>
						</ul>
					</ul>
				</nav>
			</div>

			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item menu-open"><a
						href="admin" class="nav-link"> <i
							class="nav-icon fas fa-tachometer-alt"></i>
							<p>Home</p>
					</a></li>
					<li class="nav-item menu-open"><a
						href="admin/video?action=view" class="nav-link active"> <i
							class="nav-icon fas fa-tachometer-alt"></i>
							<p>
								Video <i class="right fas fa-angle-left"> </i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a
								href="<c:url value='admin/video?action=view'/>"
								class="nav-link active"> <i class="far fa-circle nav-icon"></i>
									<p>Over View</p>
							</a></li>
							<li class="nav-item"><a
								href="<c:url value='admin/video?action=add'/>" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Edit</p>
							</a></li>
						</ul></li>
				</ul>
			</nav>
	</div>
	</aside>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<section class="content">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">List Video</h3>
				</div>
				<div class="card-body">
					<table id="example1" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Title</th>
								<th>Description</th>
								<th>Link</th>
								<th>Poster</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${videos}" var="item">
								<tr>
									<td>${item.title}</td>
									<td>${item.description}</td>
									<td><a
										href="<c:url value='/video?action=watch&id=${item.href}'/>">${item.href}</a></td>
									<td>
										<img src="${item.poster}" width="200px" height="200px" />
									</td>
									<td>
										<a href="<c:url value='/admin/video?action=edit&href=${item.href}' />" type="button" class="btn btn-success">Edit</a>
										<button type="button" onclick="deleteVideo('${item.href}')" class="btn btn-danger">Delete</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>

	<footer class="main-footer">
	</footer>

	<aside class="control-sidebar control-sidebar-dark">
	</aside>
	</div>
	<script src="<c:url value='/Template/Admin/plugins/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/jquery-ui/jquery-ui.min.js'/>"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<script
	src="<c:url value='/Template/Admin/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/chart.js/Chart.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/sparklines/sparkline.js'/>"></script>
    <script src="<c:url value='/Template/Admin/plugins/jqvmap/jquery.vmap.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/jqvmap/maps/jquery.vmap.usa.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/jquery-knob/jquery.knob.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/moment/moment.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/daterangepicker/daterangepicker.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/summernote/summernote-bs4.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/dist/js/adminlte.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/datatables/jquery.dataTables.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/datatables-responsive/js/dataTables.responsive.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/dataTables.buttons.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/jszip/jszip.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/pdfmake/pdfmake.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/pdfmake/vfs_fonts.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.html5.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.print.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.colVis.min.js'/>"></script> 
	<script src="<c:url value='/Template/Admin/dist/js/adminlte.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/dist/js/demo.js'/>"></script>
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
		
	</script>
	<script>
	function deleteVideo(href) {
		$.ajax({
			url: '/Asm-Java4/admin/video?action=delete&href=' + href
		}).then(function(data) {
			window.location.href = "http://localhost:8080/Asm-Java4/admin/video?action=view";
		}).fail(function(error) {
			alert("Failed!!! Please try again!!!")
		});
	};
	</script>
</body>
</html>
