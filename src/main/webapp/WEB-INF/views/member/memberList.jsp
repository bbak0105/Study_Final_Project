<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  

<div class="container">
<div class="block-header">
	<h2>회원 목록</h2>

	<ul class="actions">
		<li><a href=""> <i class="md md-trending-up"></i>
		</a></li>
		<li><a href=""> <i class="md md-done-all"></i>
		</a></li>
		<li class="dropdown"><a href="" data-toggle="dropdown"> <i
				class="md md-more-vert"></i>
		</a>

			<ul class="dropdown-menu dropdown-menu-right">
				<li><a href="">Refresh</a></li>
				<li><a href="">Manage Widgets</a></li>
				<li><a href="">Widgets Settings</a></li>
			</ul></li>
	</ul>
</div>

<div class="card">
	<div class="card-header">
		<h2>고객 관리 리스트</h2>
	</div>
				<!-- 상세검색 -->
		<form action="member_search" method="GET">
							<div class="container" style="margin-left: 16%;">
								<div class="row">
									<div class="col-25" style="text-align: center;">
										<label for="memNo" class="label-pre">고객번호</label>
									</div>

									<div class="col-25">

										<div class="fg-line form-group">
											<input type="text" class="form-control input-sm" id="deliNo"
												name="memNo" id="memNo" placeholder="고객번호를 입력해주세요..">

										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-25" style="text-align: center;">
										<label for="memId" class="label-pre">고객아이디</label>
									</div>

									<div class="col-25">

										<div class="fg-line form-group">
											<input type="text" class="form-control input-sm" id="memId"
												name="memId"
												placeholder="고객 아이디를 입력해주세요..">

										</div>
									</div>
								</div>
										<div class="row">
									<div class="col-25" style="text-align: center;">
										<label for="memDeliNo" class="label-pre">고객 배송번호</label>
									</div>

									<div class="col-25">

										<div class="fg-line form-group">
											<input type="text" class="form-control input-sm" id="memDeliNo"
												name="memDeliNo"
												placeholder="배송번호를 입력해주세요..">

										</div>
									</div>
								</div>
										<div class="row">
									<div class="col-25" style="text-align: center;">
										<label for="memName" class="label-pre">고객 이름</label>
									</div>

									<div class="col-25">

										<div class="fg-line form-group">
											<input type="text" class="form-control input-sm" id="memName"
												name="memName"
												placeholder="이름을 입력해주세요..">

										</div>
									</div>
								</div>
									<div class="row">
									<div class="col-25" style="text-align: center;">
										<label for="deliStatus" class="label-pre">배송상태</label>
									</div>

									<div class="col-25">
										<div class="form-group">
											<div class="fg-line">
												<div class="select">
													<select class="form-control" name="delivery.deliStatus" id="deliStatus">
														<option value="0">배송중</option>
														<option value="1">배송완료</option>
												
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>

								

					
								
		
				

							</div>

							<button id="searchBtn" type="submit"
								class="btn btn-primary waves-effect waves-button waves-float"
								style="float: right; margin-left: 10px; margin-right: 32%">검색</button>

							<!-- profile끝 -->
							<!-- </form> -->
							<button id="resetBtn"
								class="btn btn-primary waves-effect waves-button waves-float"
								style="float: right;">초기화</button>
						
							<br>
							<br>
							<br>
							<hr>
							<br>
							<!-- 상세검색 끝 -->
	</form>
	<div class="table-responsive">
		<table id="data-table-command"
			class="table table-striped table-vmiddle">
			<thead>
				<tr>
					<th data-column-id="a">고객 번호</th>
					<th data-column-id="b">고객 아이디</th>
					<th data-column-id="c">고객 배송번호</th>
					<th data-column-id="d">고객 이름</th>
					<th data-column-id="e">고객 연락처</th>
					<th data-column-id="f">고객 우편번호</th>
					<th data-column-id="g">고객 주소</th>
					<th data-column-id="h">배송 상태</th>
			
				<!--	<th data-column-id="commands" data-formatter="commands"
						data-sortable="false">수정</th>-->
						
						


				</tr>
			</thead>
			
			
			<tbody>
			
			
			
			
			<!-- 데이터 출력 -->
					<c:forEach var="member" items="${memberList }">
					
						<tr>
							<td class="text-left">${member.memNo }</td>
							<td class="text-left">${member.memId }</td>
							<td class="text-left">${member.memDeliNo }</td>
							<td class="text-left">${member.memName }</td>
							<td class="text-left">${member.memPhone }</td>
							<td class="text-left">${member.memAddrno }</td>
							<td class="text-left">${member.memAddr }</td>
							<c:if test="${member.delivery.deliStatus==1 }">
												<td class="status1">생산중</td>
											</c:if>
											<c:if test="${member.delivery.deliStatus==2 }">
												<td class="status1">배송중</td>
											</c:if>
											<c:if test="${member.delivery.deliStatus==3}">
												<td class="status1">출하완료</td>
											</c:if>
						
							<!-- 수정버튼 -->
							<!-- <td class="text-left">
								<button type="button" class="btn btn-icon command-edit" data-row-id="10253">
									<span class="md md-edit"></span>
								</button>
								<button type="button" class="btn btn-icon command-delete" data-row-id="10253">
									<span class="md md-delete"></span>
								</button>
							</td>-->
							
						</tr>
						
					</c:forEach>
			</tbody>		

		</table>
	</div>
</div>
</div>

<!-- Javascript Libraries -->
<!-- Javascript Libraries -->
          <script src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script>
         <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
      
         <script src="${pageContext.request.contextPath }/vendors/nicescroll/jquery.nicescroll.min.js"></script>
         <script src="${pageContext.request.contextPath }/vendors/bootgrid/jquery.bootgrid.min.js"></script>
         <script src="${pageContext.request.contextPath }/vendors/waves/waves.min.js"></script>
         <script src="${pageContext.request.contextPath }/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
         <script src="${pageContext.request.contextPath }/vendors/sweet-alert/sweet-alert.min.js"></script>




<script type="text/javascript">
	//초기화 버튼 누르면
	$("#resetBtn").click(function () {
		$("#memNo").val("");
		$("#memId").val("");
		$("#memDeliNo").val("");
		$("#memName").val("");
	});
</script>

<!-- Data Table -->
<script type="text/javascript">
            $(document).ready(function(){
               $("#data-table-command").bootgrid();
         
            });
        </script>