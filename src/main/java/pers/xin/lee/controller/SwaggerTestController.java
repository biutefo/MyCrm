package pers.xin.lee.controller;

import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import com.wordnik.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


//resources mapping="/swagger/**"
//不能以swagger开头  因为SpringMvc 配置了静态资源映射，会把/swagger请求映射到静态文件下找对应的静态资源
@RestController("swaggertest")//swaggertest路径无效?????
@Api(value = "swaggertest", description = "A Controller that shows how to use")
public class SwaggerTestController {

    @GetMapping("/hello")
    @ApiOperation(value = "说你好",httpMethod = "GET")
    public String sayHello(
            @ApiParam(required = false, name = "name", value = "姓名")
            @RequestParam(value = "name",defaultValue = "xin") String name) {
        return "Hello," + name + " !";
    }
}
