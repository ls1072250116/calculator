package capgemini.calculator.controller;

import capgemini.calculator.service.CalculateService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/home")
public class MainController {

    @RequestMapping("/index")
    public @ResponseBody Map<String,String> index(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("string1:"+Float.parseFloat(request.getParameter("string1")));
        System.out.println("operator:"+request.getParameter("operator"));
        System.out.println("string2:"+Float.parseFloat(request.getParameter("string2")));
        System.out.println();
        //获取前端参数，两个str，一个operator
        Map<String,String> map = new HashMap<>();
        Float f1=Float.parseFloat(request.getParameter("string1"));
        String operator=request.getParameter("operator");
        Float f2=Float.parseFloat(request.getParameter("string2"));
        //处理参数，返回结果
        CalculateService cs=new CalculateService();
        String result=cs.Calculate(f1,operator,f2);
        //返回结果
        map.put("msg",result);
        return map;
    }
}

