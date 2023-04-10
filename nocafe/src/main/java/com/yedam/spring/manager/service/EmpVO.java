package com.yedam.spring.manager.service;

import lombok.Data;

@Data
public class EmpVO {
	private String empCode;
	private String empId;
	private String empPw;
	private String empName;
	private String empPhone;
	private String empEmail;
	private String empHDate;
	private String empLDate;
	private String empAuth;
	
	private String detailName;
}
