<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<div class="container">
<div class="block-header">

<h2>거래처관리</h2>
<hr>

<div class="card">
    <div class="card-header">
    
		<div role="tabpanel">
			<ul class="tab-nav" role="tablist" tabindex="1" style="overflow: hidden; outline: none;">
			      <li class="active"><a href="#clientList" aria-controls="clientList" role="tab" data-toggle="tab" aria-expanded="true">거래처 목록</a></li>
			      <li class=""><a href="#clientUpload" aria-controls="clientUpload" role="tab" data-toggle="tab" aria-expanded="false">거래처 정보 수정</a></li>
			      <li class=""><a href="#clientinsert" aria-controls="clientinsert" role="tab" data-toggle="tab" aria-expanded="false">거래처 등록</a></li>
			</ul>
		</div>
		
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="clientList">
				
				<div class="row">
					<div class="row">
						<div class="col-25">
							<label for="clt_name" class="label-pre">거래처명</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="거래처명으로 검색가능합니다" name="searchCltName" id="searchCltName">
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-25">
							<label for="clt_phone" class="label-pre">업체지역</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<div class="select">
									<select class="form-control" name="cearchCltLocation" id="cearchCltLocation">
										<option value="">모두보기</option>
										<option value="서울시">서울시</option>
										<option value="경기도">경기도</option>
										<option value="강원도">강원도</option>
										<option value="경산도">경산도</option>
										<option value="전라도">전라도</option>
										<option value="충청도">충청도</option>
										<option value="인천시">인천시</option>
										<option value="대구시">대구시</option>
										<option value="대전시">대전시</option>
										<option value="광주시">광주시</option>
										<option value="울산시">울산시</option>
										<option value="부산시">부산시</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="table-responsive">
					<table id="data-table-basic" class="table table-striped" aria-busy="false">
					    <thead>
					        <tr>
					            <th data-column-id="num" data-type="numeric">거래처번호</th>
					            <th data-column-id="name">업체명</th>
					            <th data-column-id="phone">업체연락처</th>
					            <th data-column-id="admin">담당관리자</th>
					            <th data-column-id="address">업체지역</th>
					        </tr>
					    </thead>
					    
					    <tbody>
					    
					    	<c:choose>
								<c:when test="${empty(clientList)}">
									<tr align="center">
										<td colspan="5">검색된 거래처 정보가 없습니다.</td>				
									</tr>
								</c:when>
								
								<c:otherwise>
							    	<c:forEach var="client" items="${clientList}">
							    		<tr>
							    			<td>${client.cltNo}</td>
							    			<td>${client.cltName}</td>
							    			<td>${client.cltPhone}</td>
							    			<td>${client.cltAdmin}</td>
							    			<td>${client.cltLocation}</td>
							    		</tr>
							    	</c:forEach>
							    </c:otherwise>
							</c:choose>
					    </tbody>
					</table>
				</div>
			</div>
			
			
			<div role="tabpanel" class="tab-pane" id="clientUpload">
			
				<div class="table-responsive">
					<table id="data-table-command" class="table table-striped table-vmiddle" aria-busy="false">
					    <thead>
					        <tr>
					            <th data-column-id="num" data-type="numeric">거래처번호</th>
					            <th data-column-id="name">업체명</th>
					            <th data-column-id="phone">업체연락처</th>
					            <th data-column-id="admin">담당관리자</th>
					            <th data-column-id="address">업체지역</th>
					            <th data-column-id="commands" data-formatter="commands" data-sortable="false">수정</th>
					        </tr>
					    </thead>
					    
					    <tbody>
					    
					    	<c:choose>
								<c:when test="${empty(clientList)}">
									<tr align="center">
										<td colspan="6">검색된 거래처 정보가 없습니다.</td>				
									</tr>
								</c:when>
								
								<c:otherwise>
							    	<c:forEach var="client" items="${clientList}">
							    		<tr>
							    			<td>${client.cltNo}</td>
							    			<td>${client.cltName}</td>
							    			<td>${client.cltPhone}</td>
							    			<td>${client.cltAdmin}</td>
							    			<td>${client.cltLocation}</td>
							    			<td>
								    			<button type="button" 
								    				class="btn btn-icon command-edit" 
								    				data-row-id="1000" 
								    				name="cltNo" 
								    				value="${client.cltNo}" 
								    				onclick="location.href='${pageContext.request.contextPath}/placeorder/cltUpdate?cltNo=${client.cltNo}';">
								    				<span class="md md-edit"></span>
								    			</button>
								    		</td>
							    		</tr>
							    	</c:forEach>
							    </c:otherwise>
							</c:choose>
					    </tbody>
					</table>
				</div>
			</div>
			
			
			<div role="tabpanel" class="tab-pane" id="clientinsert">
				
				<div class="container1">
					<form action="client" method="post">
					<div class="row">
						<div class="col-25">
							<label for="clt_name" class="label-pre">거래처명</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="거래처명을 입력해주세요" name="cltName">
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-25">
							<label for="clt_phone" class="label-pre">업체연락처</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="업체연락처을 입력해주세요" name="cltPhone">
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-25">
							<label for="clt_admin" class="label-pre">담당관리자</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" placeholder="담당관리자을 입력해주세요" name="cltAdmin">
							</div>
						</div>
					</div>
				
					<div class="row">
					
						<div class="col-25">
							<label for="clt_phone" class="label-pre">업체지역</label>
						</div>
	
						<div class="col-75">
							<div class="fg-line form-group">
								<div class="select">
									<select class="form-control" name="cltLocation">
										<option value="서울시">서울시</option>
										<option value="경기도">경기도</option>
										<option value="강원도">강원도</option>
										<option value="경산도">경산도</option>
										<option value="전라도">전라도</option>
										<option value="충청도">충청도</option>
										<option value="인천시">인천시</option>
										<option value="대구시">대구시</option>
										<option value="대전시">대전시</option>
										<option value="광주시">광주시</option>
										<option value="울산시">울산시</option>
										<option value="부산시">부산시</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				
					<button type="submit" class="btn btn-primary waves-effect waves-button waves-float" style="float : right">등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>


<script type="text/javascript">
	
	$(document).ready(function(){
		
		// 템플릿 기능 활성화
		$("#data-table-basic").bootgrid();
		$("#data-table-command").bootgrid({
			formatters: {
                "commands": function(column, row) {
                	return "<button type=\"button\" class=\"btn btn-icon command-edit\" data-row-id=\"" + row.num + "\" onclick=\"location.href='${pageContext.request.contextPath}/placeorder/cltUpdate?cltNo=" + row.num + "';\"><span class=\"md md-edit\"></span></button>";
                }
            }
		});
		
		
		// 검색기능 구현중
		$("#cearchCltLocation").change(function() {
			
			// 서치 값 전달
			var cearchCltLocation = $("#cearchCltLocation").val();
			
			// ajxa 사용 비동기식 구현 예정
			$.ajax ({
				type : "GET",
				url : "/client_json",
				data : {"clt_location":cearchCltLocation},
				dataType : "json",
				success : function(json) {
					
				},
				error : function(xhr) {
					alert("응답오류 = " + xhr.status);
				}
			});
		});
	});
	
	
	
</script>
