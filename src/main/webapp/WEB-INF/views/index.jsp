<%--
  Created by IntelliJ IDEA.
  User: shuali
  Date: 9/13/2018
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>计算器</title>
    <style>

        td{
            text-align:center;
            border: 10px dimgrey solid;
        }
        .calculator_table td{
            height: 30px;

        }
        td input{
            border:1px #3B3D45 solid;
            width:100%;
            height: 100%;
            background: #376DB8;
            color: snow;
        }
    </style>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="/WEB-INF/views/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/WEB-INF/views/jquery.form.js"></script>
    <script type="text/javascript">
        var arr=new Array();
        var int=new Array();
        var this_value="";
        $(document).ready(function(){
            $("input.cal").click(function(){
                this_value=this.value;

                if(this.value=="÷" || this.value=="×" || this.value=="-" ||  this.value=="+" || this.value=="=" ){

                    if (int.join("")!=""){
                        arr.push(int.join(""));

                        if (arr.length>2){
                            var params = {
                                string1 : arr[0],
                                operator:arr[1],
                                string2:arr[2]
                            };
                            $.ajax({
                                data:params,
                                type:"POST",
                                dataType: 'JSON',
                                url:"${pageContext.request.contextPath}/home/index",
                                error:function(data){
                                    alert("出错了！！:"+data.msg);
                                },
                                success:function(data){
                                    arr.length=0;
                                    if (this_value!="=") {
                                        arr.push(data.msg);
                                        arr.push(this_value);
                                    }
                                    document.getElementById('resultIpt').value=data.msg;
                                }
                            });
                        }else {
                            arr.push(this.value);
                        }
                    }
                    int.length = 0;
                }
                else if (this_value=="退格") {
                    int.splice(int.length-1,1);
                    document.getElementById('resultIpt').value=int.join("");
                }
                else if(this.value=="+/-"){
                    if (int[0]=="-"){
                        int[0]="";
                    }else{
                        int[0]="-"
                    }
                    document.getElementById('resultIpt').value=int.join("");
                }

                else if(this.value=="." && int.join("")!=""){
                    int.push(this_value);
                }

                else {
                    int[0]="";
                    int.push(this.value);
                    document.getElementById('resultIpt').value=int.join("");
                }

            });
        });
        function clearAll() {
            arr.length=0;
            int.length=0;
            document.getElementById('resultIpt').value=0;
        }
    </script>
</head>
<body>
    <div id="calculator_base_container" >
        <form id="formsub" action="${pageContext.request.contextPath}/home/calculator" method="post">
            <table id="base_table_top" align="center"  style="width: 400px" cellpadding="0">
                <tbody>
                <tr>
                    <td  colspan="3" style="height:60px;align-content: center">
                        <input type="text" id="resultIpt"class="displayCss" style="text-align: right;background: #ffffff;color: #3B3D45" value="0" size="30">
                    </td>
                </tr>
                </tbody>
            </table>
            <table id="base_table_main" class="calculator_table"  style="width: 400px;height: 400px" align="center" cellspacing="0">
                <tbody>
                <tr>
                    <td><input type="button" value="存chu" onclick="calculator_memory(this,0);"></td>
                    <td><input type="button" value="取存" onclick="calculator_memory(this,1);"></td>
                    <td><input type="button" id="simpleDel" value="退格" onclick="calculator_input(this);" class="cal"></td>
                    <td><input type="button" id="simpleClearAllBtn" value="清屏" onclick="clearAll();"></td>
                </tr>
                <tr>
                    <td><input type="button" value="累存" onclick="calculator_memory(this,-1);"></td>
                    <td><input type="button" value="积存" onclick="calculator_memory(this,-2);"></td>
                    <td><input type="button" value="清存" onclick="calculator_memory(this,2);"></td>
                    <td><input type="button" id="simpleDivi" value="÷" onclick="calculator_input(this);" class="cal"></td>
                </tr>
                <tr>
                    <td><input type="button" id="simple7" value="7" class="cal"></td>
                    <td><input type="button" id="simple8" value="8" class="cal"></td>
                    <td><input type="button" id="simple9" value="9" class="cal"></td>
                    <td><input type="button" id="simpleMulti" value="×" class="cal"></td>
                </tr>
                <tr>
                    <td><input type="button" id="simple4" value="4" class="cal"></td>
                    <td><input type="button" id="simple5" value="5" class="cal"></td>
                    <td><input type="button" id="simple6" value="6" class="cal"></td>
                    <td><input type="button" id="simpleSubtr" value="-" class="cal"></td>
                </tr>
                <tr>
                    <td><input type="button" id="simple1" value="1" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simple2" value="2" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simple3" value="3" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simpleAdd" value="+" onclick="calculator_input(this);"class="cal"></td>
                </tr>
                <tr>
                    <td><input type="button" id="simple0" value="0" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simpleDot" value="." onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" value="+/-" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simpleEqual" value="=" onclick="calculator_input(this);" class="cal"></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>
