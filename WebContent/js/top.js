function checkClose() {
	
	if(confirm("确定要退出系统？")){
		$.ajax( {
			type:"POST", 
			contentType:"application/json", 
			url:"/login?method=close", 
			dataType:"json", 
			success:function() {
				window.close();
			}
		});
		window.close();
	}
}