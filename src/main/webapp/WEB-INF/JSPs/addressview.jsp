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
                <div class="contents col-md-10">
	                <c:choose>
						<c:when test="${ mode == 'ADDRESSES' }">
							<div class="panel panel-info" style="margin:25px 100px;">
								<div class="panel-heading">
								Address Table
								</div>
								<table class="table table-striped">
							    <thead>
							      <tr>
							        <th>Address ID</th>
							        <th>address Line</th>
							        <th>City</th>
							        <th>State</th>
							        <th>Country</th>
							        <th>Pincode</th>
							        <th>Edit</th>
							        <th>Delete</th>
							      </tr>
							    </thead>
							    <tbody>
							      <c:choose>
							      	<c:when test="${ addresses.size() > 0 }">
								      <c:forEach var="address" items="${ addresses }">
									    <tr>
									      	<td>${ address.addressId }</td>
									      	<td>${ address.addressLine1 }</td>
									      	<td>${ address.city }</td>
									      	<td>${ address.state }</td>
									      	<td>${ address.country }</td>
									      	<td>${ address.pincode }</td>
									      	<td><a href="updateAddress?id=${ address.addressId }"><span class="glyphicon glyphicon-pencil"></span></a></td>
									  		<td><a href="deleteAddress?id=${ address.addressId }"><span class="glyphicon glyphicon-trash"></span></a></td>
									    </tr>
								      </c:forEach>
							      	</c:when>
							      	<c:otherwise>
							      		<tr align="center">
							      			<td colspan="8">No Addresses Available</td>
							      		</tr>
							      	</c:otherwise>
							      </c:choose>
							    </tbody>
							  </table>	
							</div>
							<c:if test="${ addresses.size() > 0 }">
								<div class="panel-footer" style="margin:0 100px;">
									<span>Showing ${ number+1 } to ${ size } of ${ totalElements }</span>
									<ul class="pagination pull-right" style="margin:-7px">
										<c:forEach begin="0" end="${ totalPages-1 }" var="page">
											<li>
												<a href="addresses?page=${ page }&size=5">${ page+1 }</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</c:if>
						</c:when>
						<c:when test="${ mode == 'ADDR_FORM' || mode == 'ADDR_EDIT_FORM'}">
							<div style="padding:25px 100px;">
								 <form action="ModifyAddr" method="post">
								  <div class="form-group col-md-6">
								    <label for="id">Address Id</label>
								    <input required="required" type="text" class="form-control" value="${ address.addressId }" id="id" name="addressId">
								  </div>
								  <div class="form-group col-md-6">
								    <label for="line">address Line</label>
								    <input required="required" type="text" class="form-control" value="${ address.addressLine1 }" id="line" name="addressLine1">
								  </div>
								  <div class="form-group col-md-6">
								    <label for="city">City</label>
								    <input required="required" type="text" class="form-control" value="${ address.city }" id="city" name="city">
								  </div>
								  <div class="form-group col-md-6">
								    <label for="state">State</label>
								    <input required="required" type="text" class="form-control" value="${ address.state }" id="state" name="state">
								  </div>
								  <div class="form-group col-md-6">
								    <label for="country">Country</label>
								    <input required="required" type="text" class="form-control" value="${ address.country }" id="country" name="country">
								  </div>
								  <div class="form-group col-md-6">
								    <label for="pincode">Pincode</label>
								    <input required="required" type="text" class="form-control" value="${ address.pincode }" id="pincode" name="pincode">
								  </div>
								  <div class="form-group col-md-4 col-md-offset-1">
								  	<br/>
								  	<input type="submit" class="form-control btn btn-primary" value="Add Address" />
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
