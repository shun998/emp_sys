function checkColor() {
	if (document.loginForm.txtUserName.value == "") {
		document.loginForm.txtUserName.setAttribute("className", "changeColor_1");
	} else {
		document.loginForm.txtUserName.setAttribute("className", "changeColor_2");
	}
	if (document.loginForm.txtUserPassword.value == "") {
		document.loginForm.txtUserPassword.setAttribute("className", "changeColor_1");
	} else {
		document.loginForm.txtUserPassword.setAttribute("className", "changeColor_2");
	}
	if (document.loginForm.txtSN.value == "") {
		document.loginForm.txtSN.setAttribute("className", "changeColor_1");
	} else {
		document.loginForm.txtSN.setAttribute("className", "changeColor_2");
	}
	setTimeout("checkColor()", 3000);
}

function checkLogin(choice) {
	
	if (choice == "user") {
		if (document.loginForm.txtUserName.value == "") {
			document.usrImg.src = "./image/wrong.gif";
			document.usrImg.style.visibility = "visible";
		} else {
			document.usrImg.src = "./image/right.gif";
			document.usrImg.style.visibility = "visible";
		}
	}
	if (choice == "pwd") {
		if (document.loginForm.txtUserPassword.value == "") {
			document.pwdImg.src = "./image/wrong.gif";
			document.pwdImg.style.visibility = "visible";
		} else {
			document.pwdImg.src = "./image/right.gif";
			document.pwdImg.style.visibility = "visible";
		}
	}
}

function changeImg() {
	
	window.location.href = "login.jsp";
}

function login() {
	
	if(document.loginForm.txtUserName.value == "" || document.loginForm.txtUserPassword.value == "" || document.loginForm.txtSN.value == "") {
		return false;
	} else {
		return true;
	}
}