<%@page import="com.hrManage.depart.DepartService"%>
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

<style type="text/css" title="currentStyle">
			@import "<%=request.getContextPath()%>/css/media/css/demos.css";
		</style>
		<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/css/media/js/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/css/media/js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#example').dataTable( {
					"sPaginationType": "full_numbers"
				} );
			} );
		</script>
</HEAD>
<BODY id="dt_example" class="example_alt_pagination"
	style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg.gif); BACKGROUND-REPEAT: repeat-x">

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
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">部门管理
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
							<div align="right">
							
								<a
									href="<%=request.getContextPath()%>/hrManage/depart.do?method=addpage">增加新部门</a>
							</div>
							<TABLE class="gridView display" id="example"
								style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
								rules=all border=1>
								<thead>
									<TR>
										<TH class=gridViewHeader style="WIDTH: 50px" scope=col>&nbsp;</TH>
										<TH class=gridViewHeader scope=col>部门名称</TH>
										<TH class=gridViewHeader scope=col>部门描述</TH>
										<TH class=gridViewHeader scope=col>部门人员数</TH>
										<TH class=gridviewHeader scope=col>更新</TH>
										<TH class=gridviewHeader scope=col>删除</TH>
									</TR>
									</thead>
									<TBODY>
									<%
										DepartService departService = new DepartService();
										List list = (List) request.getAttribute("list");
										for (int i = 0; i < list.size(); i++) {

											Map map = (Map) list.get(i);
									%>
									<TR class="gradeX">
										<TD class=gridViewItem style="WIDTH: 50px"><IMG
											src="<%=request.getContextPath()%>/images/employee/bg_users.gif">
										</TD>
										<TD class="gridViewItem center"><%=map.get("depart_name")%></TD>
										<TD class="gridViewItem center"><%=map.get("depart_remark")%></TD>
										<TD class="gridViewItem center"><%=departService.employeeNum((String) map
						.get("depart_id"))%></TD>
										<TD class="gridViewItem center"><A class=cmdField
											href="<%=request.getContextPath()%>/hrManage/depart.do?method=editpage&id=<%=map.get("depart_id")%>">编辑</A>
										</TD>
										<TD class="gridViewItem center"><A class=cmdField
											id=ctl00_ContentPlaceHolder2_GridView1_ctl02_LinkButton1
											onclick="return confirm('确定要删除吗？');"
											href="<%=request.getContextPath()%>/hrManage/depart.do?method=delete&id=<%=map.get("depart_id")%>">删除</A>
										</TD>
									</TR>
									<%
										}
									%>
								</TBODY>
							</TABLE>
						</DIV>
</BODY>
</HTML>
