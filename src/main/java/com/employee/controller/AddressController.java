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
import com.employee.repository.AddressRepository;

@Controller
public class AddressController {
	
	private AddressRepository addressRepo;
	
	@Autowired
	public AddressController(AddressRepository addressRepo) {
		this.addressRepo = addressRepo;
	}
	
	@RequestMapping("/addresses")
	public String home(HttpServletRequest req,Pageable pageable) {
		Page<Address> pages = addressRepo.findAll(pageable);
		req.setAttribute("number", pages.getNumber());
		req.setAttribute("totalPages", pages.getTotalPages());
		req.setAttribute("totalElements", pages.getTotalElements());
		req.setAttribute("size", pages.getSize());
		req.setAttribute("addresses", pages.getContent());
		req.setAttribute("mode", "ADDRESSES");
		return "addressview";
	}
	@RequestMapping("/newAddress")
	public String newAddr(HttpServletRequest req) {
		req.setAttribute("address",new Address());
		req.setAttribute("mode", "ADDR_FORM");
		return "addressview";
	}
	@PostMapping("/ModifyAddr")
	public void add(@ModelAttribute Address addr, HttpServletResponse res) throws IOException {
		addressRepo.save(addr);
		res.sendRedirect("/addresses?page=0&size=5");
	}
	@RequestMapping("/updateAddress")
	public String updateEmp(HttpServletRequest req,@RequestParam long id) {
		req.setAttribute("address", addressRepo.findOne(id));
		req.setAttribute("mode", "ADDR_EDIT_FORM");
		return "addressview";
	}
	@RequestMapping("/deleteAddress")
	public void delete(@RequestParam long id, HttpServletResponse res) throws IOException {
		addressRepo.delete(id);
		res.sendRedirect("/addresses?page=0&size=5");
	}
}
