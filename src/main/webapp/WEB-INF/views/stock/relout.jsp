<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<div class="container">
<div class="block-header">

<h2>출고 확인</h2>
<hr>

<div class="card">
    <div class="card-header">
    
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="reloutist">
				<%-- 
				<div class="row">
					
					<div class="row">
						<div class="col-25">
							<label for="rel_name" class="label-pre">출고상품명</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="출고상품명으로 검색가능합니다">
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-25">
							<label for="rel_date" class="label-pre">출고일짜</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="출고일짜로 검색가능합니다">
							</div>
						</div>
					</div>
				</div>
				--%>
				<div class="table-responsive">
					<table id="data-table-basic" class="table table-striped" aria-busy="false">
					    <thead>
					        <tr>
					        <%--  data-type="numeric" --%>
					            <th data-column-id="id">출고번호</th>
					            <th data-column-id="sender1">출고일짜</th>
					            <th data-column-id="sender2">출고갯수</th>
					            <th data-column-id="sender3">출고단가</th>
					        </tr>
					    </thead>
					    
					    <tbody>
					    
					    	<c:choose>
								<c:when test="${empty(relList)}">
									<tr align="center">
										<td colspan="4">검색된 출고 정보가 없습니다.</td>				
									</tr>
								</c:when>
								
								<c:otherwise>
							    	<c:forEach var="rel" items="${relList}">
							    		<tr>
							    			<td>${rel.relNo}</td>
							    			<td>${rel.relDate}</td>
							    			<td>${rel.relCnt}</td>
							    			<td>${rel.relPrice}</td>
							    		</tr>
							    	</c:forEach>
							    </c:otherwise>
							</c:choose>
					    </tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>


<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#data-table-basic").bootgrid();
	});
	
</script>