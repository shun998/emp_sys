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

function CheckAll(elementsA, elementsB) {
	if(elementsA.length == null)
	{elementsA.checked = true;
	if (elementsB.checked == false)
	{
		elementsA.checked = false;
	}
	}
else{
	for ( var i = 0; i < elementsA.length; i++) {
		elementsA[i].checked = true;
	}
	if (elementsB.checked == false) {
		for ( var j = 0; j < elementsA.length; j++) {
			elementsA[j].checked = false;
		}
	}
}
}
//判断用户是否选择了要删除的记录，如果是，则提示“是否删除”；否则提示“请选择要删除的记录”
function checkdel(delid, formname) {
	var flag = false;
	if(delid.length == null)
		{flag=true;
		}
	else{
	for ( var i = 0; i <=delid.length; i++) {
		if (delid[i].checked) {
			flag = true;
			break;
		}
	}
	}
	if (!flag) {
		alert("请选择要删除的记录！");
		return false;
	} else {
		if (confirm("确定要删除吗？")) {
			formname.submit();
		}
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
		<TABLE height="90%" cellSpacing=0 cellPadding=0 width="100%" border=0>
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
	<form action="<%=request.getContextPath() %>/hrManage/checkl.do?method=query" method="post">
								<%
										List list = (List)request.getAttribute("list");
										String select = (String)request.getAttribute("select");
										String key = (String)request.getAttribute("key");
										%>
									<tr>
									<Td style="WIDTH: 50px;border: 0" scope=col ></Td>
										<td align="right" valign="middle" colspan=6 style="border: 0">&nbsp; 查询方式：
										 <select name="select">
												<option value="%">查询所有</option>
												<option value="employee_name"<%="employee_name".equals(select)?"selected":"" %>>姓名</option>
												<option value="depart_name"<%="depart_name".equals(select)?"selected":"" %>>部门</option>
												<option value="checkl_date"<%="checkl_date".equals(select)?"selected":"" %>>日期</option>
										</select> &nbsp;
										关键字： <input type="text" name="key" value="<%=key==null?"":key%>" />&nbsp;&nbsp;
											<input type="submit" class="btn_grey" value=" 查询 " /> 
											<input type="button" class="btn_grey" value="导出Excel" onclick="window.location.href='<%=request.getContextPath() %>/hrManage/checkl.do?method=excel'"/></td>
									</tr>
									</form>
									<form name="checkForm" action="<%=request.getContextPath() %>/hrManage/checkl.do?method=delete" method="post" style="margin: 0px">
									<TR>
										<TH class=gridViewHeader style="WIDTH: 50px" scope=col></TH>
										<TH class=gridViewHeader scope=col>员工姓名</TH>
										<TH class=gridViewHeader scope=col>员工部门</TH>
										<TH class=gridViewHeader scope=col>日期</TH>
										<TH class=gridViewHeader scope=col>考勤状态</TH>
										<TH class=gridviewHeader scope=col>备注</TH>
										<td class=gridviewHeader scope=col>选项</td>
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
										<TD class=gridViewItem><%=map.get("checkl_state") %></TD>
										<TD class=gridViewItem><%=map.get("checkl_remark") %></TD>
										<td class=gridViewItem align="center"><input type="checkbox" name="delIdArray" value="<%=map.get("checkl_id") %>" class="noborder"></td>
									</TR>
									<%} %>

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
		<table width="94%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="60%" height="24">&nbsp;</td>
											<td width="40%" align="right">
												<input name="checkbox" type="checkbox" class="noborder" onClick="CheckAll(checkForm.delIdArray,checkForm.checkbox)" />
												[全选/反选] 
												[<a style="color: red; cursor: hand;" onClick="checkdel(checkForm.delIdArray,checkForm)">删除</a>]
												<!--层ch用于放置隐藏的checkbox控件，因为当表单中只是一个checkbox控件时，应用javascript获得其length属性值为undefine-->		
												<div id="ch" style="display:none">
													<input name="delid" type="checkbox" class="noborder" value="0" />
												</div>
											</td>
										</tr>
									</table>
									</form>
	</DIV>
	<SCRIPT type=text/javascript>
//<![CDATA[
Sys.Application.initialize();
//]]>
</SCRIPT>
</BODY>
</HTML>
