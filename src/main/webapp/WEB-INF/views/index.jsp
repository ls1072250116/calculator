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
        var arr=new Array();//存储input_text所有变量
        var int=new Array();//存储input_text当前变量
        var this_value="";//存储当前input_button变量
        $(document).ready(function(){
            $("input.cal").click(function(){
                this_value=this.value;
                //判断当前button是否为运算符
                if(this.value=="÷" || this.value=="×" || this.value=="-" ||  this.value=="+" || this.value=="=" ){
                    //保证运算符不是第一个输入
                    if (int.join("")!="" || arr.join("")!=""){
                        if (int.join("")!="") {arr.push(int.join(""));}
                        //当第二次使用运算符，需要将上一次的参数进行运算处理，使用ajax实时交互
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
                        }
                        else {
                            //判断是否改变运算符
                            if (arr[arr.length-1]=="÷" || arr[arr.length-1]=="×" || arr[arr.length-1]=="-" ||  arr[arr.length-1]=="+" ) {
                                arr[arr.length-1]=this_value;
                                console.log("change"+this_value);
                            }
                            else {
                                arr.push(this_value);
                                console.log("push"+this_value);
                            }
                        }
                    }
                    int.length = 0;
                }
                //判断当前button是否为退格，
                else if (this_value=="退格") {
                    int.splice(int.length-1,1);
                    document.getElementById('resultIpt').value=int.join("");
                }
                //判断当前button是否为清屏
                else if (this_value=="清屏") {
                    if (arr.length==2 && int.join("")==""){
                        arr.length=0;
                    }
                    int.length=0;
                    document.getElementById('resultIpt').value=int.join("");
                }
                //判断当前button是否为+/-
                else if(this.value=="+/-"){
                    if (int[0]=="-"){
                        int[0]="";
                    }else{
                        int[0]="-"
                    }
                    document.getElementById('resultIpt').value=int.join("");
                }
                //判断当前button是否为.
                else if(this.value=="." && int.join("")!=""){
                    int.push(this_value);
                }
                //判断当前button是否为数字
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
                    <td><input type="button" value="*****" ></td>
                    <td><input type="button" value="*****" ></td>
                    <td><input type="button" id="simpleDel" value="退格" class="cal"></td>
                    <td><input type="button" id="simpleClearAllBtn" value="清屏" class="cal"></td>
                </tr>
                <tr>
                    <td><input type="button" value="*****" ></td>
                    <td><input type="button" value="*****" ></td>
                    <td><input type="button" value="清存" onclick="clearAll();"></td>
                    <td><input type="button" id="simpleDivi" value="÷" class="cal"></td>
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
                    <td><input type="button" id="simple1" value="1" class="cal"></td>
                    <td><input type="button" id="simple2" value="2" class="cal"></td>
                    <td><input type="button" id="simple3" value="3" class="cal"></td>
                    <td><input type="button" id="simpleAdd" value="+" class="cal"></td>
                </tr>
                <tr>
                    <td><input type="button" id="simple0" value="0" class="cal"></td>
                    <td><input type="button" id="simpleDot" value="." class="cal"></td>
                    <td><input type="button" value="+/-"class="cal"></td>
                    <td><input type="button" id="simpleEqual" value="=" class="cal"></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>
