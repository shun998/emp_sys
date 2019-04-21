<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>人事管理系统 >> 登录</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<script type="text/javascript" src="./js/login.js"></script>
<LINK href="./css/public.css" type=text/css rel=stylesheet>
<LINK href="./css/login.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY onLoad="checkColor()">
	<DIV id=div1>
		<TABLE id=login height="100%" cellSpacing=0 cellPadding=0 width=800
			align=center>
			<TBODY>
				<tr>
					<td><img title="人事管理系统"
						style="filter: alpha(opacity = 80);" src="./image/login_title.png" />
					</td>
				</tr>
				<TR id=main>
					<TD>
						<form name="loginForm"
							action="<%=request.getContextPath()%>/login?method=login" method="post" onSubmit="return login()">
							<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
								<TBODY>
									<TR>
										<TD colSpan=4>&nbsp;</TD>
									</TR>
									<TR height=30>
										<TD width=380>&nbsp;</TD>
										<TD>&nbsp;</TD>
										<TD width="200px">&nbsp;</TD>
										<TD>&nbsp;</TD>
									</TR>
									<TR height=40>
										<TD rowSpan=4>&nbsp;</TD>
										<TD>用户名：</TD>
										<TD><INPUT class="textbox" id="txtUserName" name="txtUserName"
											onBlur="checkLogin('usr')" style="width:200px;"></TD>
										<TD width=120 align="left">&nbsp;<img name="usrImg"
											style="visibility: hidden;" src="#" />
										</TD>
									</TR>
									<TR height=40>
										<TD>密 码：</TD>
										<TD><INPUT class="textbox" id="txtUserPassword" type="password"
											name="txtUserPassword" onBlur="checkLogin('pwd')" style="width:200px;">
										</TD>
										<TD width=120 align="left">&nbsp;<img name="pwdImg"
											style="visibility: hidden;" src="#" />
										</TD>
									</TR>
									<TR height=40>
										<TD>验证码：</TD>
										<TD vAlign=center colSpan=2><INPUT id="txtSN" size="4"
											name="txtSN"> &nbsp; <IMG name="img" src="<%=request.getContextPath()%>/sessionImg" border=0> <A
											id=LinkButton1 href="#" onClick="changeImg();">不清楚，换一张</A></TD>
									</TR>
									<TR height=40>
										<TD colspan="2" align=right>
											<%
												if (request.getParameter("result") != null) {
													if (request.getParameter("result").equals("img")) {
											%> <span style="color: red;">您输入的验证码错误，请重新输入！</span> <%
 	} else if (request.getParameter("result").equals("pwd")) {
 %> <span style="color: red;">您输入的帐号或密码错误，请重新输入！</span> <%
 	} else if (request.getParameter("result").equals("on")) {
 %> <span style="color: red;">当前用户已经登录，请重新输入！</span> <%
 	}
 	}
 %> <INPUT id=btnLogin type="image" value=" 登 录 " name=btnLogin
											src="./image/login_button_blue.jpg"></TD>
										<TD width=120>&nbsp;</TD>
									</TR>
									<TR height=110>
										<TD colSpan=4>&nbsp;</TD>
									</TR>
								</TBODY>
							</TABLE>
						</form>
					</TD>
				</TR>
				<TR id=root height=104>
					<TD>&nbsp;</TD>
				</TR>
			</TBODY>
		</TABLE>
	</DIV>
	<DIV id=div2 style="DISPLAY: none"></DIV>
	</CONTENTTEMPLATE>
</BODY>
</HTML>