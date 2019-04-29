package agile;

import java.util.Date;

import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.order.entity.Customer;
import com.order.entity.DishCollection;
import com.order.service.CustomerService;

public class Test {
	ApplicationContext ioc;
	
	@Before
	public void init() {
		ioc = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
	}
	
	@org.junit.Test
	public void test() {
		DishCollection collection = ioc.getBean(DishCollection.class);
//		System.out.println(collection);
//		
//		EmployeeService employeeService = ioc.getBean(EmployeeService.class);
//		
//		System.out.println(employeeService.selectByPrimaryKey(1));
//		
//		Employee employee = new Employee();
//		
//		employee.setAccount("1759840027");
//		employee.setPwd("123456");
//		employee.setCreateTime(new Date());
//		employee.setPhone("17803878845");
//		employee.setName("��ΰ");
//		employee.setStatus(0);
//		
////		System.out.println(employeeService.insertSelective(employee));
////		System.out.println(employee);
//		System.out.println(employeeService.login("1759840027", "123456"));
		
		Customer customer = new Customer();
		customer.setCreateTime(new Date());
		customer.setPhone("17803878845");
		customer.setPwd("123456");
		customer.setStatus(0);
		
		CustomerService customerService = ioc.getBean(CustomerService.class);
//		System.out.println(customerService.insertSelective(customer));
//		System.out.println(customer);
		
		System.out.println(customerService.login("17803878845", "123456"));
		
	}

}
