<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Untitled Page</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>

{
	FONT-SIZE: 12px`
}
.gridView {
	BORDER-RIGHT: #bad6ec 1px; BORDER-TOP: #bad6ec 1px; BORDER-LEFT: #bad6ec 1px; COLOR: #566984; BORDER-BOTTOM: #bad6ec 1px; FONT-FAMILY: Courier New
}
.gridViewHeader {
	BORDER-RIGHT: #bad6ec 1px solid; BORDER-TOP: #bad6ec 1px solid; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg_th.gif); BORDER-LEFT: #bad6ec 1px solid; LINE-HEIGHT: 27px; BORDER-BOTTOM: #bad6ec 1px solid
}
.gridViewItem {
	BORDER-RIGHT: #bad6ec 1px solid; BORDER-TOP: #bad6ec 1px solid; BORDER-LEFT: #bad6ec 1px solid; LINE-HEIGHT: 32px; BORDER-BOTTOM: #bad6ec 1px solid; TEXT-ALIGN: center
}
.cmdField {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg_rectbtn.png); OVERFLOW: hidden; BORDER-LEFT: 0px; WIDTH: 67px; COLOR: #364c6d; LINE-HEIGHT: 27px; BORDER-BOTTOM: 0px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 27px; BACKGROUND-COLOR: transparent; TEXT-DECORATION: none
}
.buttonBlue {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg_button_blue.gif); BORDER-LEFT: 0px; WIDTH: 78px; COLOR: white; BORDER-BOTTOM: 0px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px
}
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY 
style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg.gif); BACKGROUND-REPEAT: repeat-x">
<SCRIPT type=text/javascript>

var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}

</SCRIPT>
	<script type="text/javascript">
function checkFrom(form) {
	
	var f = form;
	var pay_basic=document.addForm.pay_basic.value;
	var pay_perf=document.addForm.pay_perf.value;
	var pay_reapu=document.addForm.pay_reapu.value;
	var isBasicEmpty = 1;
	var isPerfEmpty = 1;
	var isReapuEmpty = 1;
	
	if(f.employee_id.value=="%"){
    f.employee_id.focus();
	 document.getElementById("texts").style.visibility = "visible";
		
 	return false;
 }
	for(var i = 0; i < pay_basic.length; i ++) {
		if(pay_basic.charAt(i) != " ") {
			isBasicEmpty = 0;
		}else{
			document.getElementById("text").style.visibility = "visible";
		}
	}
	for(var i = 0; i < pay_perf.length; i ++) {
		if(pay_perf.charAt(i) != " ") {
			isPerfEmpty = 0;
		}else{
			document.getElementById("text1").style.visibility = "visible";
		}
	}
	for(var i = 0; i < pay_reapu.length; i ++) {
		if(pay_reapu.charAt(i) != " ") {
			isReapuEmpty = 0;
		}else{
			document.getElementById("text2").style.visibility = "visible";
		}
	}

	if(isBasicEmpty == 0 & isPerfEmpty == 0&isReapuEmpty == 0) {
		return true;
	} else {
		return false;
	}
	if(pay_sub.substr(0,2)!="10"||isNaN(pay_sub))
	{

	}
       
		}
function show(){
	if(document.addForm.employee_id.value!="%"){
		document.getElementById("texts").style.visibility = "hidden";
	}else{
		document.getElementById("texts").style.visibility = "visible";
	}
	if(document.addForm.pay_basic.value!=""){
		document.getElementById("text").style.visibility = "hidden";
	}else{
		document.getElementById("text").style.visibility = "visible";
	}
	if(document.addForm.pay_perf.value!=""){
		document.getElementById("text1").style.visibility = "hidden";
	}else{
		document.getElementById("text1").style.visibility = "visible";
	}
	if(document.addForm.pay_reapu.value!=""){
		document.getElementById("text2").style.visibility = "hidden";
	}else{
		document.getElementById("text2").style.visibility = "visible";
	}
// 	if(document.addForm.pay_remark.value!=""){
// 		document.getElementById("text3").style.visibility = "hidden";
// 	}else{
// 		document.getElementById("text3").style.visibility = "visible";
// 	}
	
}
function calcu(){
	var pay_basic= document.getElementById("basic").value;
	var pay_perf= document.getElementById("perf").value;
	var pay_reapu=document.getElementById("reapu").value;
	if(pay_reapu==0){
		document.addForm.pay_sub.value
		=parseFloat(pay_basic)+parseFloat(pay_perf);
	}else {
		document.addForm.pay_sub.value
	=parseFloat(pay_basic)+parseFloat(pay_perf)+parseFloat(pay_reapu);}
	document.getElementById("sub").value=pay_sub;
// 	alert(document.getElementById("sub").value);
}
		</SCRIPT>
	<DIV>
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR
					style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
					height=47>
					<TD width=10><SPAN
						style="FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
					</TD>
					<TD><SPAN
						style="FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN><SPAN
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">添加员工
					</SPAN><SPAN
						style="FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
					</TD>
					<TD
						style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_rc.gif)"
						width=10></TD>
				</TR>
				<TR>
					<TD
						style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_ls.gif)">&nbsp;</TD>
					<TD
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white"
						vAlign=top align=middle>
						<DIV>
							<form name="addForm" method="post"
								action="<%=request.getContextPath()%>/hrManage/pay.do?method=add"
								onsubmit="return checkFrom(addForm)">
								<TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1
									style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
									rules=all border=1>
									<TBODY>
										<TR>
											<TH class=gridViewHeader style="WIDTH: 50px" scope=col>&nbsp;</TH>
											<TH class=gridViewHeader scope=col></TH>
											<TH class=gridViewHeader scope=col></TH>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>人员姓名：</TD>
											<TD class=gridViewItem >
											<select name="employee_id" id="select" style="width:160 ">
													<option value="%">---请选择---</option>
													<%
														List employeelist = (List) request.getAttribute("employeelist");
														for (int i = 0; i < employeelist.size(); i++) {
															Map map = (Map) employeelist.get(i);
													%>
													<option value="<%=map.get("employee_id")%>"><%=map.get("employee_name")%></option>

													<%
														}
													%>



											</select>
											<span id="texts" style="color:red;visibility:hidden">*员工姓名不能为空</span>
											</TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>基本工资：</TD>
											<TD class=gridViewItem><input type="text"
												id="basic" name="pay_basic" size="20" onchange="calcu()" onblur="show()" />
												<span id="text" style="color:red;visibility:hidden">*基本工资不能为空</span>
											</TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>绩效工资：</TD>
											<TD class=gridViewItem><input type="text"
												id="perf" name="pay_perf" size="20" onchange="calcu()" onblur="show()" >
												<span id="text1" style="color:red;visibility:hidden">*绩效工资不能为空</span>
												</TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>奖罚：</TD>
											<TD class=gridViewItem><input type="text"
												id="reapu" name="pay_reapu" size="20" onchange="calcu()" >
											<span id="text2" style="color:red;visibility:hidden">*薪金奖罚不能为空</span>
											</TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>总计:</TD>
											<TD class=gridViewItem><input type="text" name="pay_sub"
												id="sub" size="20" value="" >
												<span id="textsub" style="color:red;visibility:hidden">*薪金总计不能为空</span>
											</TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>备注：</TD>
											<TD class=gridViewItem><input type="text"
												name="pay_remark" size="20" onblur="show()">
												<span id="text3" style="color:red;visibility:hidden">*薪金备注不能为空</span>
											</TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem><input type="submit" value="提交" />
											</TD>
											<TD class=gridViewItem><input type="button" value="返回"
												onclick="window.location.href='<%=request.getContextPath()%>/hrManage/pay.do?method=query'" />
											</TD>
										</TR>

									</TBODY>
								</TABLE>
							</form>
						</DIV> <SCRIPT type=text/javascript>
							//         
							Sys.Application.initialize();
							//
						</SCRIPT>
</BODY>
</HTML>
