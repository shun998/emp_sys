<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>无标题页</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>
{
FONT-SIZE:12 px
}
#menuTree A {
	COLOR: #566984;
	TEXT-DECORATION: none
}
</STYLE>
<SCRIPT src="./js/TreeNode.js" type=text/javascript></SCRIPT>
<SCRIPT src="./js/Tree.js" type=text/javascript></SCRIPT>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY
	style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(./images/bg.gif); BACKGROUND-REPEAT: repeat-x">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
		<TBODY>
			<TR>
				<TD width=10 height=29><IMG src="./images/left/bg_left_tl.gif">
				</TD>
				<TD
					style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(./images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">Main
					Menu</TD>
				<TD width=10><IMG src="./images/left/bg_left_tr.gif"></TD>
			</TR>
			<TR>
				<TD style="BACKGROUND-IMAGE: url(./images/bg_left_ls.gif)"></TD>
				<TD id=menuTree
					style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white"
					vAlign=top></TD>
				<TD style="BACKGROUND-IMAGE: url(./images/bg_left_rs.gif)"></TD>
			</TR>
			<TR>
				<TD width=10><IMG src="./images/left/bg_left_bl.gif"></TD>
				<TD style="BACKGROUND-IMAGE: url(./images/bg_left_bc.gif)"></TD>
				<TD width=10><IMG src="./images/left/bg_left_br.gif"></TD>
			</TR>
		</TBODY>
	</TABLE>
	<SCRIPT type=text/javascript>
		var tree = null;
		var root = new TreeNode('系统菜单');
		var fun1 = new TreeNode('人事管理');
		var fun2 = new TreeNode('部门管理', '<%=request.getContextPath() %>/hrManage/depart.do?method=query', 'tree_node.gif',
				null, 'tree_node.gif', null);
		fun1.add(fun2);
		var fun3 = new TreeNode('职位管理', '<%=request.getContextPath() %>/hrManage/position.do?method=query', 'tree_node.gif',
				null, 'tree_node.gif', null);
		fun1.add(fun3);
		var fun4 = new TreeNode('员工管理', '<%=request.getContextPath() %>/hrManage/employee.do?method=query', 'tree_node.gif',
				null, 'tree_node.gif', null);
		fun1.add(fun4);
		root.add(fun1);
		var fun9 = new TreeNode('薪资管理');
		var fun10 = new TreeNode('薪资管理', '<%=request.getContextPath() %>/hrManage/pay.do?method=query', 'tree_node.gif',
				null, 'tree_node.gif', null);
		fun9.add(fun10);
		root.add(fun9);
		var fun16 = new TreeNode('管理员管理');
		var fun17 = new TreeNode('角色管理', '<%=request.getContextPath() %>/hrManage/manager.do?method=query', 'tree_node.gif', null,
				'tree_node.gif', null);
		fun16.add(fun17);
		root.add(fun16);
		var fun21 = new TreeNode('考勤管理');
		var fun22 = new TreeNode('签到签退', '<%=request.getContextPath() %>/hrManage/checkl.do?method=addpage', 'tree_node.gif',
				null, 'tree_node.gif', null);
		fun21.add(fun22);
		var fun23 = new TreeNode('考勤查询', '<%=request.getContextPath() %>/hrManage/checkl.do?method=query', 'tree_node.gif',
				null, 'tree_node.gif', null);
		fun21.add(fun23);
		root.add(fun21);
		tree = new Tree(root);
		tree.show('menuTree')
	</SCRIPT>
</BODY>
</HTML>