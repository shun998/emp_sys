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
	function checkFr(){
		var depart_name=document.addForm.depart_name.value;
		
		if(depart_name==""){
			document.getElementById("departNameFont").style.visibility = "visible";
			
		}else{
			document.getElementById("departNameFont").style.visibility = "hidden";
			
		}
		
			
		}
	function checkFrom(){ 
		var position_name=document.addForm.position_name.value;
		var isEmpty = 1;
		
		for(var i = 0; i < position_name.length; i ++) {
			if(position_name.charAt(i) != " ") {
				isEmpty = 0;
			}
		}
		if(isEmpty == 0) {
			return true;
		} else {
			return false;
		}
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
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">职位添加
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
								action="<%=request.getContextPath()%>/hrManage/position.do?method=insert"
								onsubmit="return checkFrom()">
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
											<TD class=gridViewItem>部门名称：</TD>
											<TD class=gridViewItem >
											
										      <div align="center">
											      <select name="depart_id" style="width:200px;">
											        <%
	List list = (List)request.getAttribute("list");
		for(int i = 0; i < list.size(); i ++) {
			Map map = (Map)list.get(i);
%>
											        <option value="<%=map.get("depart_id") %>"><%=map.get("depart_name") %></option>
											        <%
		}
							%>
										        </select>
								                  <font id="departNameFont" size="-1" color="#FF0000" style="visibility: hidden;">*部门名称为空</font></div></TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">											</TD>
											<TD class=gridViewItem>职位名称：</TD>
											<TD class=gridViewItem> <div align="center">
											   <input type="text" name="position_name" style="width:200px;" onBlur="checkFr()"/>
											  <font id="departNameFont" size="-1" color="#FF0000" style="visibility: hidden;">*职位名称为空 </font>
										    </div></TD>
										</TR>
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">											</TD>
											<TD class=gridViewItem>备注：</TD>
											<TD class=gridViewItem><input type="text" name="position_remark" style="width:200px;" onBlur="checkFr()"/>
										    <font id="departNameFont" size="-1" color="#FF0000" style="visibility: hidden;">*职位名称为空</font> </TD>
										</TR>
										
										<TR>
											<TD class=gridViewItem style="WIDTH: 50px"><IMG
												src="<%=request.getContextPath()%>/images/employee/bg_users.gif">											</TD>
											<TD class=gridViewItem><input type="submit" value="提交" />											</TD>
											<TD class=gridViewItem><input type="button" value="返回"
												onclick="window.location.href='<%=request.getContextPath()%>/hrManage/position.do?method=query'" />											</TD>
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
