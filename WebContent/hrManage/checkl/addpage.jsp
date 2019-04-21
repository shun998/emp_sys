<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<HTML>
<HEAD>
<TITLE>Untitled Page</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>
{
FONT-SIZE:12 px


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
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(../images/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">考勤管理
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
							<TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1
								style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
								rules=all border=1>
								<TBODY>

								<%
										List list = (List)request.getAttribute("checkl");
										String select = (String)request.getAttribute("select");
										String key = (String)request.getAttribute("key");
										String url = request.getContextPath()+"/hrManage/checkl.do?method=addpage";
										if(list.size()==0)
											{ url = request.getContextPath()+"/hrManage/checkl.do?method=add";}
										
										%>
									<tr>
									<Td style="WIDTH: 50px;border: 0" scope=col ></Td>
									<td style="border: 0"></td>
									<td style="border: 0"></td>
									<td style="border: 0"></td>
									<td style="border: 0" colspan="2" align="right" >
									
									<form action="<%=request.getContextPath() %>/hrManage/checkl.do?method=save" method="post" ">
									<div align="right">
											<input type="button" class="btn_grey" value="生成本天考勤" onclick="window.location.href='<%=url%>'" />
											<input type="submit" class="btn_grey" value="保存考勤状态"  />
											</div>
									
									</td>
									</tr>
									<TR>
										<TH class=gridViewHeader style="WIDTH: 50px" scope=col></TH>
										<TH class=gridViewHeader scope=col>员工姓名</TH>
										<TH class=gridViewHeader scope=col>员工部门</TH>
										<TH class=gridViewHeader scope=col>日期</TH>
										<TH class=gridViewHeader scope=col>考勤状态</TH>
										<TH class=gridviewHeader scope=col>备注</TH>
									</TR>
									<%
										for(int i=0;i<list.size();i++){
										Map map = (Map)list.get(i); 
									%>
									<input type="hidden" name="checkl_id" value="<%=map.get("checkl_id") %>" />
									<TR>
										<TD class=gridViewItem style="WIDTH: 50px">
											<IMG 
            src="<%=request.getContextPath()%>/images/employee/bg_users.gif"></TD>
										<TD class=gridViewItem><%=map.get("employee_name")%></TD>
										<TD class=gridViewItem><%=map.get("depart_name") %></TD>

										<TD class=gridViewItem><%=map.get("checkl_date") %></TD>
										<TD class=gridViewItem><select name="checkl_state">
												<option value="">---</option>
												<option value="迟到"<%=map.get("checkl_state").equals("迟到")?"selected":"" %>>迟到</option>
												<option value="请假"<%=map.get("checkl_state").equals("请假")?"selected":"" %>>请假</option>
												<option value="早退"<%=map.get("checkl_state").equals("早退")?"selected":"" %>>早退</option>
												<option value="正常"<%=map.get("checkl_state").equals("正常")?"selected":"" %>>正常</option>
										</select></TD>
										<TD class=gridViewItem><input type="text" name="checkl_remark" value="<%=map.get("checkl_remark") %>"></TD>
									</TR>
									<%} %>
									</form>
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
//<![CDATA[
Sys.Application.initialize();
//]]>
</SCRIPT>
</BODY>
</HTML>
