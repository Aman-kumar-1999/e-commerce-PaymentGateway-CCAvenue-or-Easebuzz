package com.eqipped.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class Payment {
	
	@RequestMapping(value = "/initiatepayment", method = RequestMethod.GET)
	public String initiatepayment() {
		return "initiatepayment";
	}
	
	@RequestMapping(value = "/initiate_payment_invoke" , method = RequestMethod.POST)
	public String initiate_payment_invoke() {
		return "initiate_payment_invoke";
	}
	

	@RequestMapping(value = "/response" , method = RequestMethod.POST)
	public String response() {
		return "response";
	}
	
	@RequestMapping(value = "/transactions" , method = RequestMethod.GET)
	public String transactions() {
		return "transactions";
	}
	
	@RequestMapping(value = "/transactions_return" , method = RequestMethod.POST)
	public String transactions_return() {
		return "transactions_return";
		
	}
	
	@RequestMapping(value = "/transactionDate" , method = RequestMethod.GET)
	public String transactionDate() {
		return "transactionDate";
	}
	
	@RequestMapping(value = "/transaction_date_return" , method = RequestMethod.POST)
	public String transaction_date_return() {
		return "transaction_date_return";
		
	}
	
	@RequestMapping(value = "refund" , method = RequestMethod.GET)
	public String refund() {
		return "refund";
	}
	
	@RequestMapping(value = "/refund_return" , method = RequestMethod.POST)
	public String refund_return() {
		return "refund_return";
		
	}
	
	@RequestMapping(value = "/payout" , method = RequestMethod.GET)
	public String payout() {
		return "payout";
	}
	
	@RequestMapping(value = "/payout_return" , method = RequestMethod.POST)
	public String payout_return() {
		return "payout_return";
		
	}
	
	


}
