//获取验证码
function getCaptcha() {
	$("img").attr("src",
			"http://localhost:8080/crm/system/captcha.jpg?ran=" + Math.random());
}