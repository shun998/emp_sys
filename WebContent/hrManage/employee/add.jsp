<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hrManage.employee.EmployeeService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Untitled Page</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>
{
FONT-SIZE
:
 
12
px
`


}
.gridView {
	BORDER-RIGHT: #bad6ec 1px;
	BORDER-TOP: #bad6ec 1px;
	BORDER-LEFT: #bad6ec 1px;
	COLOR: #566984;
	BORDER-BOTTOM: #bad6ec 1px;
	FONT-FAMILY: Courier New
}

.gridViewHeader {
	BORDER-RIGHT: #bad6ec 1px solid;
	BORDER-TOP: #bad6ec 1px solid;
	BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg_th.gif );
	BORDER-LEFT: #bad6ec 1px solid;
	LINE-HEIGHT: 27px;
	BORDER-BOTTOM: #bad6ec 1px solid
}

.gridViewItem {
	BORDER-RIGHT: #bad6ec 1px solid;
	BORDER-TOP: #bad6ec 1px solid;
	BORDER-LEFT: #bad6ec 1px solid;
	LINE-HEIGHT: 32px;
	BORDER-BOTTOM: #bad6ec 1px solid;
	TEXT-ALIGN: center
}

.cmdField {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg_rectbtn.png
		);
	OVERFLOW: hidden;
	BORDER-LEFT: 0px;
	WIDTH: 67px;
	COLOR: #364c6d;
	LINE-HEIGHT: 27px;
	BORDER-BOTTOM: 0px;
	BACKGROUND-REPEAT: repeat-x;
	HEIGHT: 27px;
	BACKGROUND-COLOR: transparent;
	TEXT-DECORATION: none
}

.buttonBlue {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg_button_blue.gif
		);
	BORDER-LEFT: 0px;
	WIDTH: 78px;
	COLOR: white;
	BORDER-BOTTOM: 0px;
	BACKGROUND-REPEAT: no-repeat;
	HEIGHT: 21px
}
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY
	style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg.gif); BACKGROUND-REPEAT: repeat-x">
	<SCRIPT type=text/javascript>
//<![CDATA[
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

//]]>
</SCRIPT>
	<script type="text/javascript">
function checkFrom(form) {

			return false;
		}
		<script type="text/javascript">
		function checkFrom(form) {
			var f = form;
			if (f.employee_id.value == "") {

				f.employee_id.focus();
				document.getElementById("text").style.visibility = "visible";
				return false;
			}
			if (f.employee_name.value == "") {

				f.employee_name.focus();
				document.getElementById("text2").style.visibility = "visible";
				return false;
			}
			if (f.employee_sex.value == "") {

				f.employee_sex.focus();
				document.getElementById("text3").style.visibility = "visible";
				return false;
			}
			if (f.employee_brith.value == "") {

				f.employee_brith.focus();
				document.getElementById("text4").style.visibility = "visible";
				return false;
			}
			if (f.employee_date.value == "") {

				f.employee_date.focus();
				document.getElementById("text5").style.visibility = "visible";
				return false;
			}
			if (f.position_id.value == "") {

				f.position_id.focus();
				document.getElementById("text6").style.visibility = "visible";
				return false;
			}
			if (f.depart_id.value == "") {

				f.depart_id.focus();
				document.getElementById("text7").style.visibility = "visible";
				return false;
			}
			if (f.employee_state.value == "") {

				f.employee_state.focus();
				document.getElementById("text8").style.visibility = "visible";
				return false;
			}
			if (f.employee_state_time.value == "") {

				f.employee_state_time.focus();
				document.getElementById("text9").style.visibility = "visible";
				return false;
			}
			if (f.employee_tel.value == "") {

				f.employee_tel.focus();
				document.getElementById("text10").style.visibility = "visible";
				return false;
			}
			if (f.employee_address.value == "") {

				f.employee_address.focus();
				document.getElementById("text11").style.visibility = "visible";
				return false;
			}
			if (f.employee_remark.value == "") {

				f.employee_remark.focus();
				document.getElementById("text12").style.visibility = "visible";
				return false;
			}

		}
		function show() {

			if (document.addForm.depart_name.value != "") {
				document.getElementById("text").style.visibility = "hidden";
			} else {
				document.getElementById("text").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text2").style.visibility = "hidden";
			} else {
				document.getElementById("text2").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text3").style.visibility = "hidden";
			} else {
				document.getElementById("text3").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text4").style.visibility = "hidden";
			} else {
				document.getElementById("text4").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text5").style.visibility = "hidden";
			} else {
				document.getElementById("text5").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text6").style.visibility = "hidden";
			} else {
				document.getElementById("text6").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text7").style.visibility = "hidden";
			} else {
				document.getElementById("text7").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text8").style.visibility = "hidden";
			} else {
				document.getElementById("text8").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text9").style.visibility = "hidden";
			} else {
				document.getElementById("text9").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text11").style.visibility = "hidden";
			} else {
				document.getElementById("text11").style.visibility = "visible";
			}
			if (document.addForm.depart_remark.value != "") {
				document.getElementById("text12").style.visibility = "hidden";
			} else {
				document.getElementById("text12").style.visibility = "visible";
			}
		}
		
		
	</script>
	<SCRIPT
		src="<%=request.getContextPath()%>/images/employee/WebResource.axd"
		type=text/javascript></SCRIPT>
	<SCRIPT
		src="<%=request.getContextPath()%>/images/employee/ScriptResource.axd"
		type=text/javascript></SCRIPT>
	<SCRIPT
		src="<%=request.getContextPath()%>/images/employee/ScriptResource(1).axd"
		type=text/javascript></SCRIPT>
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
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">员工信息添加</SPAN><SPAN
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
								action="<%=request.getContextPath()%>/hrManage/employee.do?method=add"
								onSubmit="checkFrom(addForm)">
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
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">											</TD>
											<TD class=gridViewItem>姓名:</TD>
										  <TD class=gridViewItem><div align="left">
										    <blockquote>
										      <blockquote>
										        <blockquote>
										          <p>
										            <input type="text"
												name="employee_name" /> 
										            <span id="text2"
												style="color: red; visibility: hidden">*姓名不能为空</span>									          </p>
									            </blockquote>
										      </blockquote>
										    </blockquote>
										  </div></TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">											</TD>
											<TD class=gridViewItem>性别:</TD>
										  <TD class=gridViewItem>
										    
									        <div align="left">
									          <blockquote>
									            <blockquote>
									              <blockquote>
									                <p>
									                  <input type="text"
												name="employee_sex" /> 
								                      <span id="text3"
												style="color: red; visibility: hidden">*性别不能为空</span> </p>
								                  </blockquote>
									            </blockquote>
									          </blockquote>
									        </div></TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">											</TD>
											<TD class=gridViewItem>出生日期:</TD>
										  <TD class=gridViewItem>
										    
									        <div align="left">
									          <blockquote>
									            <blockquote>
									              <blockquote>
									                <p>
									                  <input type="text"
												name="employee_brith" /> 
								                      <span id="text4"
												style="color: red; visibility: hidden">*出生日期不能为空</span> </p>
								                  </blockquote>
									            </blockquote>
									          </blockquote>
									        </div></TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">											</TD>
											<TD class=gridViewItem>入职日期:</TD>
										  <TD class=gridViewItem>
										    
									        <div align="left">
									          <blockquote>
									            <blockquote>
									              <blockquote>
									                <p>
									                  <input type="text"
												name="employee_date" /> 
								                      <span id="text5"
												style="color: red; visibility: hidden">*入职日期不能为空</span> </p>
								                  </blockquote>
									            </blockquote>
									          </blockquote>
									        </div></TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">											</TD>
											<TD class=gridViewItem>部门及职务:</TD>
											<TD class=gridViewItem>
												<!--                   <input type="text" name="position_id"/> -->
												 <div align="left">
									          <blockquote>
									            <blockquote>
									              <blockquote>
												<select name="position_id">
													<option value="%">选择部门及职务</option>
													<%
														

														
														List list = (List)request.getAttribute("list");
														for (int i = 0; i < list.size(); i++) {
															Map map = (Map) list.get(i);
															
													%>
													<option value="<%=map.get("depart_id") %>.<%=map.get("position_id") %>"><%=map.get("depart_name")%>·<%=map.get("position_name")%></option>
													<%
														}
													%>
													<span id="text6" style="color: red; visibility: hidden">*职务不能为空</span>
													   </blockquote>
									            </blockquote>
									          </blockquote>
									        </div>
											</TD>
										</TR>
										
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>状态:</TD>
											<TD class=gridViewItem> 
											 <div align="left">
									          <blockquote>
									            <blockquote>
									              <blockquote><select name="employee_state">
													<option value="%" maxlength="30">选择状态</option>

													<option value="在职">在职</option>
													<option value="退休">退休</option>
													<option value="离职">离职</option>
													<option value="停职">停职</option>
													<option value="停薪留职">停薪留职</option>
													<option value="实习">实习</option>
													<span id="text8" style="color: red; visibility: hidden">*状态不能为空</span>	
														   </blockquote>
									            </blockquote>
									          </blockquote>
									        </div>
											</TD>
										</TR>
										
										
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>联系电话:</TD>
											<TD class=gridViewItem>
											<div align="left">
									          <blockquote>
									            <blockquote>
									              <blockquote>
											<input type="text"
												name="employee_tel" /> <span id="text10"
												style="color: red; visibility: hidden">*联系电话不能为空</span>
														   </blockquote>
									            </blockquote>
									          </blockquote>
									        </div>
											</TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>家庭住址:</TD>
											<TD class=gridViewItem>
											<div align="left">
									          <blockquote>
									            <blockquote>
									              <blockquote>
												  <input type="text"
												name="employee_address" /> <span id="text11"
												style="color: red; visibility: hidden">*家庭住址不能为空</span>		   </blockquote>
									            </blockquote>
									          </blockquote>
									        </div>
											</TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem>备注:</TD>
											<TD class=gridViewItem> <div align="left">
									          <blockquote>
									            <blockquote>
									              <blockquote><input type="text"
												name="employee_remark" /> <span id="text12"
												style="color: red; visibility: hidden">*备注不能为空</span>		   </blockquote>
									            </blockquote>
									          </blockquote>
									        </div>
											</TD>
										</TR>


										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
											</TD>
											<TD class=gridViewItem><input type="submit" value="提交" />
											</TD>
											<TD class=gridViewItem><input type="button" value="返回"
												onClick="window.location.href='<%=request.getContextPath()%>/hrManage/employee.do?method=query'" />
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
