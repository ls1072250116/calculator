package capgemini.calculator.service;

public class CalculateService {
    public String Calculate(Float f1,String operator,Float f2){
        //初始化变量
        float result_f=0f;
        String result_s="";
        //判断operator进行计算
        switch (operator){
            case "÷":
                result_f=f1/f2;
                break;
            case "×":
                result_f=f1*f2;
                break;
            case "-":
                result_f=f1-f2;
                break;
            case "+":
                result_f=f1+f2;
                break;
            default:
                result_f=f2;
                break;
        }
        //判断结果是否为整型
        if (result_f%1==0.0){
            int i=(int) result_f;
            result_s=""+i;
        }else {
            result_s=""+result_f;
        }
        //返回结果
        return result_s;
    }

}
