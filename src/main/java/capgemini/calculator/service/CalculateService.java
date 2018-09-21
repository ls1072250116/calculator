package capgemini.calculator.service;

public class CalculateService {
    public String Calculate(Float f1,String str,Float f2){
        float result=0f;
        String s="";
        switch (str){
            case "÷":
                result=f1/f2;
                break;
            case "×":
                result=f1*f2;
                break;
            case "-":
                result=f1-f2;
                break;
            case "+":
                result=f1+f2;
                break;
            default:
                result=f1+f2;
                break;
        }
        if (result%1==0.0){
            int i=(int) result;
            s=""+i;
        }else {
            s=""+result;
        }
        return s;
    }

}
