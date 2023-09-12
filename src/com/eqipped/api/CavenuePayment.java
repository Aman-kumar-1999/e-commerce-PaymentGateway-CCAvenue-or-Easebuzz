package com.eqipped.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/data")
@CrossOrigin("*")
public class CavenuePayment {
	
	@RequestMapping(value = "/dataFrom", method = RequestMethod.GET)
	public String run() {
		return "dataFrom";
	}
	
	@RequestMapping(value = "/ccavRequestHandler" , method = RequestMethod.POST)
	public String ccavRequestHandler() {
		return "ccavRequestHandler";
	}
	
	@RequestMapping(value = "/ccavResponseHandler" , method = RequestMethod.POST)
	public String ccavResponseHandler() {
		return "ccavResponseHandler";
	}

}
