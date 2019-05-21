package pers.xin.lee.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiImplicitParam;
import com.wordnik.swagger.annotations.ApiImplicitParams;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import pers.xin.lee.bean.BaseDict;
import pers.xin.lee.bean.Customer;
import pers.xin.lee.bean.User;
import pers.xin.lee.service.BaseDictService;
import pers.xin.lee.service.CustomerService;
import pers.xin.lee.util.Msg;

@Api(value = "/", description = "Customer接口")
@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private BaseDictService baseDictService;

    // 客户来源
    @Value("${customer.from.type}")
    private String FROM_TYPE;

    // 客户所属行业
    @Value("${customer.industry.type}")
    private String INDUSTRY_TYPE;

    // 客户级别
    @Value("${customer.level.type}")
    private String LEVEL_TYPE;

    /**
     * 输入地址/list/1  可以查询第一页数据
     * @param pagePath
     * @param pn
     * @param model
     * @return
     */
	/*@RequestMapping(value = "/{pagePath}/{pn}",method = RequestMethod.GET)
	public String toPage(@PathVariable("pagePath")String pagePath,@PathVariable("pn")Integer pn,Model model) {
		model.addAttribute("pn", pn);
		return pagePath;
	}*/

    /**
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping(value = "/{pn}", method = RequestMethod.GET)
    public String showCustomerListIndex(@PathVariable("pn") Integer pn, Model model) {
        return "forward:list/" + pn;
    }

    /**
     * @param pn
     * @param model
     * @return
     * @查询客户信息页面
     */
    @RequestMapping(value = "/list/{pn}", method = RequestMethod.GET)
    public String showCustomerList(@PathVariable("pn") Integer pn, Model model) {

        model.addAttribute("pn", pn);
        return "list";
    }

    /**
     * @param pn
     * @return
     * @查询客户信息
     */
    @ResponseBody
    @RequestMapping(value = "/customers", method = RequestMethod.GET)
    public Msg selectCustomers(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        // 所有客户来源
        List<BaseDict> fromType = baseDictService.selectBaseDictByTypeCode(FROM_TYPE);
        // 所有客户所属行业
        List<BaseDict> industryType = baseDictService.selectBaseDictByTypeCode(INDUSTRY_TYPE);
        // 所有客户级别
        List<BaseDict> levelType = baseDictService.selectBaseDictByTypeCode(LEVEL_TYPE);
        // 一页显示10条数据
        PageHelper.startPage(pn, 10);
        // 后面紧跟一句查询左右会变为分页查询-为sql语句后添加一个limit条件
        List<Customer> customerList = customerService.selectAll();
        // 一个页面显示5个页码
        PageInfo<Customer> pageInfo = new PageInfo<Customer>(customerList, 5);
        return Msg.createSuccessMsg().put("pageInfo", pageInfo).put("fromType", fromType)
                .put("industryType", industryType).put("levelType", levelType);
    }

    /**
     * @param id
     * @return
     * @根据id查询客户信息
     */
    @ApiOperation(value = "根据id获取客户信息", notes = "根据id获取客户信息", httpMethod = "GET", response = Msg.class)
    @ApiImplicitParams(
            @ApiImplicitParam("id")
    )
    @RequestMapping(value = "/customer/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectCustomerById(
            @PathVariable("id") Integer id) {
        Customer customer = customerService.selectCustomerById(id);
        return Msg.createSuccessMsg().put("cust", customer);
    }

    /**
     * 根据id更新用户数据
     * @param custId
     * @param customer
     * @param request
     * @return
     */
    @ResponseBody
    //custId为什么传递不进customer对象？
    @RequestMapping(value = "/customer/{custId}", method = RequestMethod.PUT)
    public Msg saveCustomer(@PathVariable("custId") Integer custId, Customer customer, HttpServletRequest request) {
        customer.setCustId(custId);
        customerService.updateEmp(customer);
        return Msg.createSuccessMsg();
    }

    /**
     * 新增用户数据
     * @param customer
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/customer", method = RequestMethod.POST)
    public Msg saveCustomer(@Valid Customer customer, HttpSession session) {

        // 获取Session中的当前用户信息
        User user = (User) session.getAttribute("USER_SESSION");
        // 将当前用户id存储在客户对象中
        customer.setCustCreateId(user.getUserId());
        // 创建Date对象
        Date date = new Date();
        // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
        Timestamp timeStamp = new Timestamp(date.getTime());
        customer.setCustCreatetime(timeStamp);
        // 执行Service层中的创建方法，返回的是受影响的行数
        System.out.println("------------------------");
        System.out.println(customer.toString());
        System.out.println("------------------------");
        int rows = customerService.createCustomer(customer);
        /*if (rows > 0) {
            return Msg.createSuccessMsg();
        }
        return Msg.createFailureMsg();*/
        return Msg.createSuccessMsg();
    }

    /**
     * 单个批量二合一
     * 批量删除：1-2-3      deleteCustomerList
     * 单个删除：1          deleteCustomer
     * @param custIds
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/customer/{custIds}",method=RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("custIds")String custIds){
        //批量删除
        if(custIds.contains("-")){
            List<Integer> delIdList = new ArrayList<>();
            String[] custIdArray = custIds.split("-");
            //组装id的集合
            for (String string : custIdArray) {
                delIdList.add(Integer.parseInt(string));
            }
            /*int affectedRows = */
            customerService.deleteCustomerList(delIdList);
            /*if(affectedRows==custIdArray.length){
                return Msg.createSuccessMsg();
            }*/
        }else{
            /*int affectedRows = */
            customerService.deleteCustomer(Integer.parseInt(custIds));
            /*if(affectedRows==1){
                return Msg.createSuccessMsg();
            }*/
        }
        return Msg.createSuccessMsg();
    }

    @RequestMapping(value = "/customer/conditionalQuery.action")
    public String list(String custName, String custSource,String custIndustry, String custLevel, Model model) { // 条件查询所有客户
        //String taskName1 = new String(taskName.getBytes("ISO8859-1"), "utf-8");
        try {
            //解决中文乱码
            custName = new String(custName.getBytes("ISO8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<Customer> customerList = customerService.findCustomerList(custName, custSource, custIndustry, custLevel);
        model.addAttribute("customerList", customerList); // 所有客户来源
        List<BaseDict> fromType =baseDictService.selectBaseDictByTypeCode(FROM_TYPE); // 所有客户所属行业
        List<BaseDict> industryType = baseDictService.selectBaseDictByTypeCode(INDUSTRY_TYPE); // 所有客户级别
        List<BaseDict> levelType = baseDictService.selectBaseDictByTypeCode(LEVEL_TYPE); // 添加参数
        model.addAttribute("fromType", fromType);
        model.addAttribute("industryType", industryType);
        model.addAttribute("levelType", levelType);
        model.addAttribute("custName", custName);
        model.addAttribute("custSource", custSource);
        model.addAttribute("custIndustry", custIndustry);
        model.addAttribute("custLevel", custLevel);
        return "result";
    }
}
