$(function() {
	alert("sdsdds");
	$.ajax({
		url:"/taota_goods/CategoryServlet",//要请求的servlet
		data:{method:"ajaxFindAll", loginname:value},//给服务器的参数
		type:"POST",
		dataType:"json",
		async:true,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		cache:false,
		success:function(result) {
			}
		}
	});
