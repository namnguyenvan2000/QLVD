
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>On-Flix</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>

 <style>
        body {
         	 background-image: url(img/services_bg.jpg);
            color: #fff; /* Text color */
            font-family: 'Arial', sans-serif; /* Font family */
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #61dafb; /* Header text color */
        }

        .container-fluid {
            padding: 20px;
        }

        .tm-text-primary {
            color: #61dafb; /* Primary text color */
        }

        .btn-primary {
            background-color: #61dafb; /* Primary button color */
            border-color: #61dafb; /* Button border color */
            color: #fff; /* Button text color */
        }

        .btn-primary:hover {
            background-color: #2180c4; /* Hover state color */
            border-color: #2180c4; /* Hover state border color */
        }

        .tm-video-item {
            position: relative;
            overflow: hidden;
        }

        .tm-video-item img {
            width: 100%;
            height: auto;
        }

        .tm-video-item figcaption {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            background: rgba(0, 0, 0, 0.7);
            transition: opacity 0.3s;
        }

        .tm-video-item:hover figcaption {
            opacity: 1;
        }

        .tm-video-item h2 {
            font-size: 2em;
            color: #fff;
        }

        .tm-text-gray {
            color: #ccc; 
        }

        .tm-paging-link {
            color: #fff; 
            text-decoration: none;
            padding: 5px 10px;
            margin: 0 5px;
            border: 1px solid #61dafb; /* Paging link border color */
            border-radius: 3px;
        }

        .tm-paging-link.active {
            background-color: #61dafb; /* Active paging link background color */
            color: #fff;
        }
    </style>

</head>
<body>
	<%@ include file="/Common/Header.jsp"%>
	<div class="container-fluid tm-container-content tm-mt-60">
		<div class="row mb-4">
			<h2 class="col-6 tm-text-primary text-center">List Videos</h2>
			<div class="col-6 d-flex justify-content-end align-items-center">
				<button class="btn btn-primary tm-btn-prev mb-2 disabled">
					Page ${currentPage} of ${maxPage}
				</button>
			</div>
		</div>
		<div class="row tm-mb-90 tm-gallery">
			<c:forEach items="${videos}" var="video">
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<h5 style="white-space:no-wrap;color:white; overflow:hidden;">${video.title}</h5>
					<figure class="effect-ming tm-video-item">
						<img src="<c:url value='${video.poster}'/>" alt="Image" class="img-fluid">
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2><i class="fa-solid fa-circle-play"></i></h2>
<!-- 							/* tao ra http value sau /asm-java */ -->
							<a href="<c:url value='/video?action=watch&id=${video.href}'/>"></a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">${video.views} - Views</span> 
						<span>${video.shares} - Shares</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- row -->
		<div class="row tm-mb-90">
			<div
				class="col-12 d-flex justify-content-between align-items-center tm-paging-col">
				<c:if test="${currentPage == 1 }">
				<a href="javascript:void(0);" class="btn btn-primary tm-btn-prev mb-2 disabled">Previous</a>
				</c:if>
				<c:if test="${currentPage > 1 }">
					<a href="index?page=${currentPage - 1}" class="btn btn-primary tm-btn-prev mb-2 ">Previous</a>
				</c:if>
				<div class="tm-paging d-flex">
					<c:forEach varStatus="i" begin ="1" end="${maxPage}"> 
					<a href="index?page=${i.index}" 
					class="active tm-paging-link ${currentPage == i.index ? 'active' : ''}">${i.index}</a>
					</c:forEach>
				</div>
				<c:if test="${currentPage == maxPage }">
				<a href="javascript:void(0);" class="btn btn-primary tm-btn-prev mb-2 disabled">Next</a>
				</c:if>
				<c:if test="${currentPage < maxPage }">
					<a href="index?page=${currentPage + 1}" class="btn btn-primary tm-btn-prev mb-2 ">Next</a>
				</c:if>
					
			</div>
		</div>
	</div>
	<!-- container-fluid, tm-container-content -->

	<%@ include file="/Common/Footer.jsp"%>
</body>
</html>