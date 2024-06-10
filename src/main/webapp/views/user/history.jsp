<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My History - OnFlix</title>
<%@ include file="/Common/Head.jsp"%>
<%@ include file="/Common/fav.jsp"%>
<style>
 body {
 background-color: black;
 }
</style>
</head>
<body>
	<%@ include file="/Common/Header.jsp"%>

	<div class="container-fluid tm-container-content tm-mt-60">
		<div class="row mb-4">
			<h2 class="col-12 tm-text-primary">My History</h2>
			
		</div>
		<div class="row tm-mb-90 tm-gallery">
			<c:forEach items="${videos}" var="video">
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<h5 style="white-space:no-wrap; color:white; overflow:hidden;">${video.title}</h5>
					<figure class="effect-ming tm-video-item">
						<img src="<c:url value='${video.poster}'/>"
							alt="Image" class="img-fluid">
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2><i class="fa-solid fa-circle-play"></i></h2>
							<a href="<c:url value='/video?action=watch&id=${video.href}'/>">View more</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">${video.views} - Views</span> 
						<span>${video.shares} - Shares</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- container-fluid, tm-container-content -->

	<%@ include file="/Common/Footer.jsp"%>
</body>
</html>