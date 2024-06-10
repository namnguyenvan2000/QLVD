
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - On-Flix</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
<style>
 body {
 background-color: black;
 }
</style>
</head>
<body>
	<%@ include file="/Common/Header.jsp"%>
	<div class="container-fluid col-sm-12 tm-mt-60">
        <div class="row tm-mb-50">
            <div class="col-lg-12 col-12 mb-5">
              <center> <h2 class="tm-text-primary col-sm-12 col-12 mb-5">Login</h2></center> 
                <form id="contact-form" action="login" method="POST" class="tm-contact-form mx-auto">
                    <div class="form-group">
                        <input type="text" name="username" class="form-control rounded-0" placeholder="User name?" required />
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control rounded-0" placeholder="Password?" required />
                    </div>
                      <div class="form-group">
                     	
                     <center><button type="submit" class="btn btn-primary">Login</button></center>
                    <h5 id="errorBtn"></h5>
                    </div>
                </form>                
            </div>
	<%@ include file="/Common/Footer.jsp"%>
</body>
</html>