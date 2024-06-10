
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password - On-Flix</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
</head>
<body>
	<%@ include file="/Common/Header.jsp"%>
	<div class="container-fluid col-sm-12 tm-mt-60">
		<div class="row tm-mb-50">
			<div class="col-lg-12 col-12 mb-5">
				<center>
					<h2 class="tm-text-primary col-sm-12 col-12 mb-5">Forgot
						Password</h2>
				</center>

				<div class="form-group">
					<input type="email" id="email" name="email"
						class="form-control rounded-0" placeholder="Enter email?" required />
				</div>
				<div class="form-group">
					<center><button type="submit" id="sendBtn" class="btn btn-primary">Send Request</button></center>
				</div>
				<center><h5 style="color: red" id="messageReturn"></h5></center>

			</div>
			<%@ include file="/Common/Footer.jsp"%>
</body>
<script>
	$('#sendBtn').click(function () {
		$('#messageReturn').text('');
		var email = $('#email').val();
		var formData ={'email' : email};
		$.ajax({
			url: 'forgotPass',
			type: 'POST',
			data: formData
		}).then(function(data) {
			$('#messageReturn').text('Password has been changed!!, Please check your email!!');
			setTimeout(() => {
				window.location.href = "http://localhost:8080/Asm-Java4/index";
			}, 5000);
		}).fail(function(error) {
			$('#messageReturn').text('ERROR!, Please check your information!!')
		});
	});
</script>
</html>