package co.second.easyrp.employee.service;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 사원 관리를 이용 하기위한 VO class
// (2024년 4월 29일 오전 11시 16분 박현우)
@Getter
@Setter
@ToString
public class EmployeeVO {
	private String empCod;
	private String empName;
	private String empPassword;
	private String deptName;
	private String empPosition;
	private Timestamp empRegdate;
	private String empEmail;
	private String empTel;
	private int empAge;
	private String empGender;
}
