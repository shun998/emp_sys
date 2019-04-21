<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
	BACKGROUND-IMAGE: url(../images/bg_th.gif);
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
	BACKGROUND-IMAGE: url(../images/bg_rectbtn.png);
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
	BACKGROUND-IMAGE: url(../images/bg_button_blue.gif);
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
	style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(../images/bg.gif); BACKGROUND-REPEAT: repeat-x">
	<SCRIPT type=text/javascript>
		//         
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
		//
	</SCRIPT>
	<SCRIPT src="../images/employee/WebResource.axd" type=text/javascript></SCRIPT>
	<SCRIPT src="../images/employee/ScriptResource.axd"
		type=text/javascript></SCRIPT>
	<SCRIPT src="../images/employee/ScriptResource(1).axd"
		type=text/javascript></SCRIPT>
	
	<DIV>
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR
					style="BACKGROUND-IMAGE: url(../images/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
					height=47>
					<TD width=10><SPAN
						style="FLOAT: left; BACKGROUND-IMAGE: url(../images/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
					</TD>
					<TD><SPAN
						style="FLOAT: left; BACKGROUND-IMAGE: url(../images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN><SPAN
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(../images/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">员工管理
					</SPAN><SPAN
						style="FLOAT: left; BACKGROUND-IMAGE: url(../images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
					</TD>
					<TD
						style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(../images/main_rc.gif)"
						width=10></TD>
				</TR>
				<TR>
					<TD style="BACKGROUND-IMAGE: url(../images/main_ls.gif)">&nbsp;</TD>
					<TD
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white"
						vAlign=top align=middle>
						<DIV>
							<TABLE width="1400px" border=1 cellSpacing=0 rules=all
								class=gridView id=ctl00_ContentPlaceHolder2_GridView1
								style="WIDTH: 100%; BORDER-COLLAPSE: collapse">
								<TBODY>
									<TR>
<!-- 										<TH width="51" align="center" valign="middle" -->
<!-- 											class=gridViewHeader scope=col><div align="center">员工id</div> -->
<!-- 										</TH> -->
										<TH width="100px" align="center" valign="middle"
											class=gridViewHeader scope=col><div align="center">姓名</div>
										</TH>
										<TH width="50px" align="center" valign="middle"
											class=gridViewHeader scope=col><div align="center">性别</div>
										</TH>
										<TH width="150px" align="center" valign="middle"
											class=gridViewHeader scope=col><div align="center">出生日期</div>
										</TH>
<!-- 										<TH width="106" align="center" valign="middle" -->
<!-- 											class=gridViewHeader scope=col><div align="center">入职时间</div> -->
<!-- 										</TH> -->
										<TH width="100px" align="center" valign="middle"
											class=gridViewHeader scope=col><div align="center">部门</div>
										</TH>
										<TH width="100px" align="center" valign="middle"
											class=gridViewHeader scope=col><div align="center">职位</div>
										</TH>


										<TH width="100px" align="center" valign="middle"
											class=gridViewHeader scope=col><div align="center">状态</div>
										</TH>
<!-- 										<TH width="79" align="center" valign="middle" -->
<!-- 											class=gridViewHeader scope=col><div align="center">状态时间</div> -->
<!-- 										</TH> -->
										<TH width="300px" align="center" valign="middle"
											class=gridViewHeader scope=col><div align="center">家庭地址</div>
										</TH>
										<TH width="150px" align="center" valign="middle"
											class=gridViewHeader scope=col><div align="center">联系方式</div>
										</TH>
										<TH width="150px" align="center" valign="middle"
											class=gridViewHeader scope=col><div align="center">详情</div>
										</TH>
										<TH width="50px" align="center" valign="middle"
											class=gridviewHeader scope=col><div align="center">更新</div>
										</TH>
										<TH width="50px" align="center" valign="middle"
											class=gridviewHeader scope=col><div align="center">删除</div>
										</TH>
									</TR>
									<%
										List list = (List) request.getAttribute("list");

										for (int i = 0; i < list.size(); i++) {
											Map map = (Map) list.get(i);
									%>
<!-- 									<TR> -->
<!-- 										<TD height="40" align="center" valign="middle" -->
<%-- 											class=gridViewItem><%=map.get("employee_id")%></TD> --%>
										<TD align="center" valign="middle" class=gridViewItem><%=map.get("employee_name")%></TD>
										<TD align="center" valign="middle" class=gridViewItem><%=map.get("employee_sex")%></TD>
										<TD align="center" valign="middle" class=gridViewItem><%=map.get("employee_brith")%></TD>
<%-- 										<TD align="center" valign="middle" class=gridViewItem><%=map.get("employee_date")%></TD> --%>
										<TD align="center" valign="middle" class=gridViewItem><%=map.get("depart_name")%></TD>
										<TD align="center" valign="middle" class=gridViewItem><%=map.get("position_name")%></TD>

										<TD align="center" valign="middle" class=gridViewItem><%=map.get("employee_state")%></TD>
<%-- 										<TD align="center" valign="middle" class=gridViewItem><%=map.get("employee_state_time")%></TD> --%>
										<TD align="center" valign="middle" class=gridViewItem><%=map.get("employee_address")%></TD>
										<TD align="center" valign="middle" class=gridViewItem><%=map.get("employee_tel")%></TD>
										<TD align="center" valign="middle" class=gridViewItem><a href="<%=request.getContextPath()%>/hrManage/employee.do?method=queryById&id=<%=map.get("employee_id")%>">查看</a></TD>
										<TD align="center" valign="middle" class=gridViewItem><A
											class=cmdField href="<%=request.getContextPath()%>/hrManage/employee.do?method=editpage&id=<%=map.get("employee_id")%>">编辑</A>
										</TD>
										<TD align="center" valign="middle" class=gridViewItem><A
											href="<%=request.getContextPath()%>/hrManage/employee.do?method=delete&id=<%=map.get("employee_id")%>">删除</A></TD>
									</TR>
									<%
										}
									%>
									<input type="button" value="添加员工信息" onclick="window.location.href='<%=request.getContextPath()%>/hrManage/employee.do?method=addpage'">
									<input type="button" value="转换为Excel" onclick="window.location.href='<%=request.getContextPath()%>/hrManage/employee.do?method=excel'">
								</TBODY>
							</TABLE>
						</DIV></TD>
					<TD style="BACKGROUND-IMAGE: url(../images/main_rs.gif)"></TD>
				</TR>
				<TR
					style="BACKGROUND-IMAGE: url(../images/main_fs.gif); BACKGROUND-REPEAT: repeat-x"
					height=10>
					<TD style="BACKGROUND-IMAGE: url(../images/main_lf.gif)"></TD>
					<TD style="BACKGROUND-IMAGE: url(../images/main_fs.gif)"></TD>
					<TD style="BACKGROUND-IMAGE: url(../images/main_rf.gif)"></TD>
				</TR>
			</TBODY>
		</TABLE>
	</DIV>
	
	<SCRIPT type=text/javascript>
		//         
		Sys.Application.initialize();
		//
	</SCRIPT>
</BODY>
</HTML>
