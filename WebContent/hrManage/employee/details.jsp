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
.STYLE1 {color: white}
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
function checkFrom(form){
	
	return false;
}
</script>
<SCRIPT src="<%=request.getContextPath()%>/images/employee/WebResource.axd" type=text/javascript></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/images/employee/ScriptResource.axd" 
type=text/javascript></SCRIPT>
<SCRIPT 
src="<%=request.getContextPath()%>/images/employee/ScriptResource(1).axd" 
type=text/javascript></SCRIPT>
<DIV>
  <TABLE height="100%" cellSpacing=1 cellPadding=1 width="100%" border=0>
    <TBODY>
      <TR 
  style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/bg_header.gif); BACKGROUND-REPEAT: repeat-x" 
  height=47>
        <TD width=10><SPAN 
      style="FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN></TD>
        <TD>
        <SPAN
						style="FLOAT: left; BACKGROUND-IMAGE: url(../images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
						<span style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(../images/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0 px: ">员工详细信息查询</span><SPAN
						style="FLOAT: left; BACKGROUND-IMAGE: url(../images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN></TD>
						
        <TD 
    style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_rc.gif)" 
    width=10></TD>
      </TR>
      <TR>
        <TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/main_ls.gif)">&nbsp;</TD>
        <TD 
    style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white" 
    vAlign=top align=middle>
          <DIV>
          
          <form name="addForm" method="post"  action="<%=request.getContextPath()%>/hrManage/depart.do?method=query" onSubmit="checkFrom(addForm)">
        <table width="803" height="399" border="1" cellpadding="1" >
        
        <%  
						 Map map = (Map)request.getAttribute("map");
				%>	
                
  <tr>
    <td width="112" rowspan="2"><div align="center"><img src="<%=request.getContextPath()%>/photo/test.jpg" width="112" height="126"></div></td>
    <td width="82" height="62"><div align="center">姓名：</div></td>
    <td width="220"><div align="center"><%=map.get("employee_name") %></div></td>
    <td width="86"><div align="center">联系电话：</div></td>
    <td width="269"><div align="center"><%=map.get("employee_tel") %></div></td>
  </tr>
  <tr>
    <td height="64"><div align="center">性别：</div></td>
    <td><div align="center"><%=map.get("employee_sex") %></div></td>
    <td><div align="center">出生日期：</div></td>
    <td><div align="center"><%=map.get("employee_brith") %></div></td>
  </tr>
  <tr>
    <td height="58"><div align="center">入职时间：</div></td>
    <td colspan="2"><div align="center"><%=map.get("employee_date") %></div></td>
    <td><div align="center">籍贯：</div></td>
    <td><div align="center"><%=map.get("employee_address") %></div></td>
  </tr>
  <tr>
    <td height="63"><div align="center">部门:</div></td>
    <td colspan="2"><div align="center"><%=map.get("depart_name") %></div></td>
    <td><div align="center">职位：</div></td>
    <td><div align="center"><%=map.get("position_name") %></div></td>
  </tr>
  <tr>
    
    <td><div align="center">状态：</div></td>
    <td colspan="4"><div align="center"><%=map.get("employee_state") %></div></td>
  </tr>
  <tr>
    <td height="65"><div align="center">状态时间：</div></td>
    <td colspan="2"><div align="center"><%=map.get("employee_state_time")%></div></td>
    <td><div align="center">备注：</div></td>
    <td><div align="center"><%=map.get("employee_remark") %></div></td>
  </tr>
  
</table>
         
<SCRIPT type=text/javascript>
//<![CDATA[
Sys.Application.initialize();
//]]>
</SCRIPT>
</BODY>
</HTML>
