package com.example;

import com.opensymphony.xwork2.ActionSupport;

public class index extends ActionSupport {

	public String execute() {
		return "index";
	}

	public String greet() {
		return "SUCCESS";
	}
}