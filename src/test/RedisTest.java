package test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import tools.RedisUtil;

public class RedisTest {
 
	@Test
	public void method1(){
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
		RedisUtil redisUtil=(RedisUtil) context.getBean("redisUtil");
		redisUtil.add("JUAN", "asd");
		System.out.println(redisUtil.get("JUAN"));
		redisUtil.del("JUAN");
		System.out.println(redisUtil.get("JUAN"));
	}
}
