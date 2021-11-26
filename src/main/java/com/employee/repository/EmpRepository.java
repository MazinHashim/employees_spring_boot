package com.employee.repository;

import java.util.List;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.employee.model.Address;
import com.employee.model.Employees;

@RepositoryRestResource(collectionResourceRel="employees",path="employees")
public interface EmpRepository extends PagingAndSortingRepository<Employees , Long> {

	public List<Employees> findByAddId(Address addId);

}
