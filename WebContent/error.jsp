<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
	<head>
		<title>错误提示</title>
	</head>
	
	<body background="<%=request.getContextPath() %>/image/bg_login.png">
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
			<tr>
				<td align="center">
					<table width="481" height="242" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center" background="<%=request.getContextPath() %>/image/error.gif">
								&nbsp;&nbsp;<span style="color: white">错误提示信息:<br /></span>
								<span style="color: red"><%=request.getAttribute("error") %></span> <br> <br> <input name="Submit"
								type="submit" class="btn_grey" value="返回"
								onClick="history.back(-1)">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<center></center>
	</body>
</html>

