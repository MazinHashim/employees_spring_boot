<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html lang="en">

	<jsp:include page="header.jsp"/>

<body>
	
	<jsp:include page="navbar.jsp"/>
  
    <div class="undersection">
        <div class="container-fluid">
            <div class="row">
                <div style="padding-left: 0;padding-right: 0;" class="col-md-2"><%-- style="background-color: darkcyan;" --%>
                    
					<jsp:include page="sidebar.jsp"/>

                </div>
                <div class="contents col-md-10 col-sm-12">
	                <c:choose>
						<c:when test="${ mode == 'EMPLOYEES' }">
						<div style="margin:25px 100px;">
							<c:if test="${ show }">
								<form action="/search" method="post">
								  <div class="form-group col-md-6">
									<div class="input-group">
									  <input required="required" placeholder="Enter Address Id" type="text" class="form-control" value="${ employee.id }" id="id" name="addId">
									  <span class="input-group-btn">
									  	<input class="btn btn-primary" type="submit" value="Search" />
									  </span>
									</div>
								  </div>
								</form>
								<br/>
								<br/>
								<br/>
							</c:if>
							
							<div class="panel panel-info">
								<div class="panel-heading">
									Employees Table
								</div>
								
								<table class="table table-striped">
								    <thead>
								      <tr>
								        <th>Emp ID</th>
								        <th>Employee Name</th>
								        <th>Jop</th>
								        <th>Phone</th>
								        <th>Address Id</th>
								        <th>Edit</th>
								        <th>Delete</th>
								      </tr>
								    </thead>
								    <tbody>
								      <c:choose>
								      	<c:when test="${ employees.size() > 0 }">
									      <c:forEach var="employee" items="${ employees }">
										      <tr>
										      	<td>${ employee.id }</td>
										      	<td>${ employee.name }</td>
										      	<td>${ employee.jop }</td>
										      	<td>${ employee.phone }</td>
										      	<td>${ employee.addId.addressId }</td>
										      	<td><a href="updateEmployee?id=${ employee.id }"><span class="glyphicon glyphicon-pencil"></span></a></td>
										      	<td><a href="deleteEmployee?id=${ employee.id }"><span class="glyphicon glyphicon-trash"></span></a></td>
										      </tr>	      
									      </c:forEach>							      	
								      	</c:when>
								      	<c:otherwise>
								      		<tr align="center">
								      			<td colspan="7">No Employees Available</td>
								      		</tr>
								      	</c:otherwise>
								      </c:choose>
								    </tbody>
							  </table>	
							</div>
						</div>
						<c:if test="${ employees.size() > 0 && not show }" >
							<div class="panel-footer" style="margin:0 100px;">
								<span>Showing ${ number+1 } to ${ size } of ${ totalElements }</span>
								<ul class="pagination pull-right" style="margin:-7px">
									<c:forEach begin="0" end="${ totalPages-1 }" var="page">
										<li>
											<a href="employees?page=${ page }&size=5">${ page+1 }</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						</c:when>
						<c:when test="${ mode == 'EMP_FORM' || mode == 'EMP_EDIT_FORM'}">
							<div style="padding:25px 100px;">
								 <form action="ModifyEmp" method="post">
								  <div class="form-group col-md-6">
								    <label for="id">Employee Id</label>
								    <input required="required" type="text" class="form-control" value="${ employee.id }" id="id" name="id">
								  </div>
								  <div class="form-group col-md-6">
								    <label for="name">Name</label>
								    <input required="required" type="text" class="form-control" value="${ employee.name }" id="name" name="name">
								  </div>
								  <div class="form-group col-md-6">
								    <label for="jop">Jop</label>
								    <input required="required" type="text" class="form-control" value="${ employee.jop }" id="jop" name="jop">
								  </div>
								  <div class="form-group col-md-6">
								    <label for="phone">Phone</label>
								    <input required="required" type="text" class="form-control" value="${ employee.phone }" id="phone" name="phone">
								  </div>
								  <div class="form-group col-md-6">
								  	<br/>
								    <select required="required" class="form-control" id="address" name="addId">
								   		<c:forEach var="address" items="${ addresses }">
								    		<option value="${ address.addressId }">${ address.addressId } - ${ address.city } - ${ address.country }</option>
								    	</c:forEach>
								    	<c:if test="${ mode == 'EMP_EDIT_FORM' }">
								    		<option selected="selected" value="${ employee.addId.addressId }">${ employee.addId.addressId } - ${ employee.addId.city } - ${ employee.addId.country }</option>
								    	</c:if>
								    </select>
								  </div>
								  <div class="form-group col-md-4 col-md-offset-1">
								  	<br/>
								  	<input type="submit" class="form-control btn btn-primary" value="Add Employee" />
								  </div>
								</form>
							</div>
						</c:when>
					</c:choose>
                </div>
        	</div>
   		</div>
   	</div>
</body>

<!-- Mirrored from www.w3schools.com/bootstrap/tryit.asp?filename=trybs_case_navbar&stacked=h by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 12 Mar 2015 13:49:54 GMT -->
</html>
