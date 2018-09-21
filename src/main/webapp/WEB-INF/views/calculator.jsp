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
    <script type="text/javascript">
        var arr=new Array();
        var int=new Array();

        function calculator_input(val) {

            if(val.value=="÷" || val.value=="×" || val.value=="-" ||  val.value=="+" || val.value=="="){

                if (int.join("")!=""){
                    if (int[0]=="-"){
                        arr.push("(");
                        arr.push(int.join(""));
                        arr.push(")");
                    } else {
                        arr.push(int.join(""));
                    }

                    if(arr[arr.length-1]=="÷" || arr[arr.length-1]=="×" || arr[arr.length-1]=="-" ||  arr[arr.length-1]=="+" || arr[arr.length-1]=="="){
                        arr[arr.length-1]=val.value;
                    }else {
                        arr.push(val.value);
                    }

                    document.getElementById('strarr').value=arr.join("");
                }
                int.length = 0;
            }

            else if(val.value=="+/-"){
                if (int[0]=="-"){
                    int[0]="";
                }else{
                    int[0]="-"
                }
                document.getElementById('resultIpt').value=int.join("");
            }
            else if(val.value=="="){
                arr.push(int.join(""));
                document.getElementById('strarr').value=arr.join("");
            }
            else{
                int[0]="";
                int.push(val.value);
                document.getElementById('resultIpt').value=int.join("");
            }


        }
        function calculator_memory(param, number) { }
        function clearAll() {
            document.getElementById('resultIpt').value="";
            document.getElementById('strarr').value="";
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
                        <%
                            String result = (String)request.getAttribute("strarr");
                        %>
                        <input type="text" id="resultIpt"class="displayCss" style="text-align: right;background: #ffffff;color: #3B3D45" value="<%=result%>" size="30">
                        <input type="text" id="strarr" name="strarr" />
                    </td>
                </tr>
                </tbody>
            </table>
            <table id="base_table_main" class="calculator_table"  style="width: 400px;height: 400px" align="center" cellspacing="0">
                <tbody>
                <tr>
                    <td><input type="button" value="存chu" onclick="calculator_memory(this,0);"></td>
                    <td><input type="button" value="取存" onclick="calculator_memory(this,1);"></td>
                    <td><input type="button" id="simpleDel" value="退格" onclick="calculator_input(this);"></td>
                    <td><input type="button" id="simpleClearAllBtn" value="清屏" onclick="clearAll();"></td>
                </tr>
                <tr>
                    <td><input type="button" value="累存" onclick="calculator_memory(this,-1);"></td>
                    <td><input type="button" value="积存" onclick="calculator_memory(this,-2);"></td>
                    <td><input type="button" value="清存" onclick="calculator_memory(this,2);"></td>
                    <td><input type="button" id="simpleDivi" value="÷" onclick="calculator_input(this);" class="cal"></td>
                </tr>
                <tr>
                    <td><input type="button" id="simple7" value="7" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simple8" value="8" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simple9" value="9" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simpleMulti" value="×" onclick="calculator_input(this);"class="cal"></td>
                </tr>
                <tr>
                    <td><input type="button" id="simple4" value="4" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simple5" value="5" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simple6" value="6" onclick="calculator_input(this);"class="cal"></td>
                    <td><input type="button" id="simpleSubtr" value="-" onclick="calculator_input(this);"class="cal"></td>
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
                    <td><input type="submit" id="simpleEqual" value="=" onclick="calculator_input(this);"></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>
