package com.employee.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.model.Address;
import com.employee.model.Employees;
import com.employee.repository.AddressRepository;
import com.employee.repository.EmpRepository;

@Controller
public class EmployeeController {
	
	private EmpRepository empRepo;
	private AddressRepository addressRepo;
	
	@Autowired
	public EmployeeController(EmpRepository empRepo, AddressRepository addressRepo) {
		this.addressRepo = addressRepo;
		this.empRepo = empRepo;
	}
	
	@RequestMapping("/employees")
	public String home(HttpServletRequest req,Pageable pageable) {
		Page<Employees> pages = empRepo.findAll(pageable);
		req.setAttribute("number", pages.getNumber());
		req.setAttribute("totalPages", pages.getTotalPages());
		req.setAttribute("totalElements", pages.getTotalElements());
		req.setAttribute("size", pages.getSize());
		req.setAttribute("employees", pages.getContent());
		req.setAttribute("mode", "EMPLOYEES");
		req.setAttribute("show", false);
		return "empview";
	}
	@RequestMapping("/newEmployee")
	public String newEmp(HttpServletRequest req) {
		req.setAttribute("employee",new Employees());
		req.setAttribute("addresses", addressRepo.findAll());
		req.setAttribute("mode", "EMP_FORM");
		return "empview";
	}
	@PostMapping("/ModifyEmp")
	public void add(@ModelAttribute Employees emp, HttpServletResponse res) throws IOException {
		empRepo.save(emp);
		res.sendRedirect("/employees?page=0&size=5");
	}
	@RequestMapping("/updateEmployee")
	public String updateEmp(HttpServletRequest req,@RequestParam long id) {
		req.setAttribute("employee", empRepo.findOne(id));
		req.setAttribute("addresses", addressRepo.findAll());
		req.setAttribute("mode", "EMP_EDIT_FORM");
		return "empview";
	}
	@RequestMapping("/deleteEmployee")
	public void delete(@RequestParam long id, HttpServletResponse res) throws IOException {
		empRepo.delete(id);
		res.sendRedirect("/employees?page=0&size=5");
	}
	@RequestMapping("/specailAdd")
	public String specailAdd(HttpServletRequest req) {
		req.setAttribute("mode", "EMPLOYEES");
		req.setAttribute("show", true);
		return "empview";
	}
	@RequestMapping("/search")
	public String search(@RequestParam Address addId, HttpServletRequest req) {
		req.setAttribute("employees", empRepo.findByAddId(addId));
		req.setAttribute("mode", "EMPLOYEES");
		req.setAttribute("show", true);
		return "empview";
	}
}
