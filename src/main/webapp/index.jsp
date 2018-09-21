<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="/WEB-INF/views/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/WEB-INF/views/jquery.form.js"></script>

    <script type="text/javascript">
        function ajaxTest(){
            var params = {
                userId : "12"//userId 应与User类中属性名一致 12为传回去的查询值，可以通过输入框获取值传入
            };
            $.ajax({
                data:"name="+$("#name").val(),
                type:"POST",
                dataType: 'text',
                url:"${pageContext.request.contextPath}/home/index",
                error:function(data){
                    alert("出错了！！:"+data.msg);
                },
                success:function(data){
                    alert("success:"+data.msg);
                    $("#result").html(data.msg) ;
                }
            });
        }
    </script>
</head>
<body>
<input type="text" name="name" id="name"/>
<input type="submit" value="登录" onclick="ajaxTest();"/>
<div id="result"></div>
</body>

</html>
