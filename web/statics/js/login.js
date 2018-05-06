$(function(){
	var path = $("#path").val();
	var usernameExists=null;//用户名重复时提示信息
	$("#username").blur(function(){
		var username = $(this).val();
		$.ajax({
			url:path+"/user/existUsername?username="+username,
			dataType:"json",
			type:"get",
			success:function(data){
				/*alert(data.result);*/
				if(data.result=="exist"){
					usernameExists="exist";
				}
			},
			error:function(){
				alert("error");
			}
		});
	});
	
	$("#register").click(function(){
		/*用户名验证*/
		var username = document.getElementById("username");
		//alert(usernameExists);
		if(usernameExists=="exist"){
			username.setCustomValidity("用户名不可以重复");
		}else if(username.validity.valueMissing){
			username.setCustomValidity("用户名不可以为空");
		}else if(username.validity.patternMismatch){
			username.setCustomValidity("请输入正确格式的用户名");
		}else{
			username.setCustomValidity("");
		}
		
		/*邮箱验证*/
		var email = document.getElementById("email");
		if(email.validity.valueMissing){
			email.setCustomValidity("邮箱不可以为空");
		}else if(email.validity.patternMismatch){
			email.setCustomValidity("请输入正确格式的邮箱");
		}else{
			email.setCustomValidity("");
		}
		
		/*密码验证*/
		var userpassword = document.getElementById("userpassword");
		if(userpassword.validity.valueMissing){
			userpassword.setCustomValidity("密码不可以为空");
		}else if(userpassword.validity.patternMismatch){
			userpassword.setCustomValidity("请输入正确格式的密码");
		}else{
			userpassword.setCustomValidity("");
		}
		/*确认密码验证*/
		var userpassword2 = document.getElementById("userpassword2");
		if(userpassword2.validity.valueMissing){
			userpassword2.setCustomValidity("密码不可以为空");
		}else if(userpassword2.validity.patternMismatch){
			userpassword2.setCustomValidity("请输入正确格式的密码");
		}else{
			userpassword2.setCustomValidity("");
		}
		var pwd1=$("#userpassword").val();
		var pwd2=$("#userpassword2").val();
		if(pwd1!=pwd2){
			userpassword2.setCustomValidity("两次密码不一致，请重新输入");
		}
		
		/*手机号验证*/
		var phone = document.getElementById("phone");
		if(phone.validity.valueMissing){
			phone.setCustomValidity("手机号不可以为空");
		}else if(phone.validity.patternMismatch){
			phone.setCustomValidity("请输入正确格式的手机号");
		}else{
			phone.setCustomValidity("");
		}
	});
});