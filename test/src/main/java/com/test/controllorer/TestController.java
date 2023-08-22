package com.test.controllorer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/test/*")
public class TestController {

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		
		return "map";
	}
}
