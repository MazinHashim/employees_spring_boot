package com.employee.repository;


import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.employee.model.Address;

@RepositoryRestResource(collectionResourceRel="address",path="address")
public interface AddressRepository extends PagingAndSortingRepository<Address, Long>{

}
