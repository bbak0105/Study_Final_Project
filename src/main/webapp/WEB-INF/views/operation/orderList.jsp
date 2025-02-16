<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>

<div class="container">
<div class="block-header">

<h2>주문관리</h2>
<br>

<!-- ----- -->
<div class="card">
	<div class="card-header">
	
	<!-- tab부분 -->
	<div role="tabpanel">
	<ul class="tab-nav" role="tablist" tabindex="1" style="overflow: hidden; outline: none;">
      <li class="active"><a href="#messages11" aria-controls="messages11" role="tab" data-toggle="tab" aria-expanded="true">주문목록</a></li>
      
	</ul>
	
	  <div class="tab-content">
	       <div role="tabpanel" class="tab-pane active" id="messages11">
	         	
	     <!-- 상세검색 -->
		<form method="POST">
				<div class="container" style="margin-left: 16%;">
					<div class="row">
						<div class="col-25" style="text-align: center;">
							<label for="orderNo" class="label-pre">주문번호</label>
						</div>

						<div class="col-25">

							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" name="orderNo" id="orderNo"
									placeholder="검색할 주문번호를 입력해주세요..">

							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-25" style="text-align: center;">
							<label for="member.memName" class="label-pre">주문자</label>
						</div>

						<div class="col-25">

							<div class="fg-line form-group">
								<input type="text" class="form-control input-sm" name="member.memName" id="memName"
									placeholder="주문자 이름을 입력해주세요..">

							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-25" style="text-align: center;">
							<label for="orderProduct" class="label-pre">상품명</label>
						</div>

						<div class="col-25">
							<div class="form-group">
								<div class="fg-line">
									<div class="select">
										<select class="form-control" name="orderProduct">
											<option value="">상품을 선택해 주세요..</option>
											<c:forEach var="product" items="${ productList}">
												<option value="${product.pdn.pdnProduct }">${product.pdn.pdnProduct}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-25" style="text-align: center;">
							<label for="orderDate" class="label-pre">주문날짜</label>
						</div>

						<div class="col-75">
							<!-- 달력으로 날짜 선택 -->
								<div class="col-sm-4">
                                    <div class="input-group form-group">
                                        
                                            <div class="dtp-container dropdown fg-line">
                                            <input type="date" name="orderDate"  id="orderDate">
                                        </div>
                                    </div>
                                </div>
							<!-- 날짜 선택 끝 -->
							
						</div>
					</div>

				</div>
					
				<button type="submit" class="btn btn-primary waves-effect waves-button waves-float"
						style="float: right; margin-left: 10px; margin-right: 32%">검색</button>

				<!-- profile끝 -->
				</form>
				<button id="allBtn"
				class="btn btn-primary waves-effect waves-button waves-float"
				style="float: right; margin-left: 10px;" onclick="location.href='${pageContext.request.contextPath}/orderList'">전체보기</button>
				
				<button id = "resetBtn" class="btn btn-primary waves-effect waves-button waves-float"
						style="float: right;">초기화</button>
				<!-- 상세검색 끝 -->
				<br><br><br>
				<hr>
				<br>
	         	
	         	<!-- 데이터테이블 시작 -->
				<div id="data-table-command-header"
					class="bootgrid-header container-fluid">
					<div class="row">
						<div class="col-sm-12 actionBar">
							<div class="search form-group">
								<div class="input-group">
									<span class="md icon input-group-addon glyphicon-search"></span> <input
										type="text" class="search-field form-control"
										placeholder="Search">
								</div>
							</div>
							<div class="actions btn-group">
								<div class="dropdown btn-group">
									<button class="btn btn-default dropdown-toggle" type="button"
										data-toggle="dropdown">
										<span class="dropdown-text">10</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" role="menu">
										<li class="active" aria-selected="true"><a href="#10"
											class="dropdown-item dropdown-item-button">10</a></li>
										<li aria-selected="false"><a href="#25"
											class="dropdown-item dropdown-item-button">25</a></li>
										<li aria-selected="false"><a href="#50"
											class="dropdown-item dropdown-item-button">50</a></li>
										<li aria-selected="false"><a href="#-1"
											class="dropdown-item dropdown-item-button">All</a></li>
									</ul>
								</div>
								<div class="dropdown btn-group">
									<button class="btn btn-default dropdown-toggle" type="button"
										data-toggle="dropdown">
										<span class="dropdown-text"><span
											class="md icon md-view-module"></span></span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right" role="menu">
										<li><div class="checkbox">
												<label class="dropdown-item"><input name="id"
													type="checkbox" value="1" class="dropdown-item-checkbox"
													checked="checked"><i class="input-helper"></i> ID</label>
											</div></li>
										<li><div class="checkbox">
												<label class="dropdown-item"><input name="sender"
													type="checkbox" value="1" class="dropdown-item-checkbox"
													checked="checked"><i class="input-helper"></i> Sender</label>
											</div></li>
										<li><div class="checkbox">
												<label class="dropdown-item"><input name="received"
													type="checkbox" value="1" class="dropdown-item-checkbox"
													checked="checked"><i class="input-helper"></i>
													Received</label>
											</div></li>
										<li><div class="checkbox">
												<label class="dropdown-item"><input name="commands"
													type="checkbox" value="1" class="dropdown-item-checkbox"
													checked="checked"><i class="input-helper"></i>
													Commands</label>
											</div></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<!-- 테이블 -->
				<table id="order-table"
					class="table table-striped table-vmiddle bootgrid-table"
					aria-busy="false">
					<thead>
						<tr>
							<th data-column-id="id" class="text-left"><a
								href="javascript:void(0);" class="column-header-anchor sortable"><span
									class="text">주문번호</span><span class="md icon "></span></a></th>

							<th data-column-id="id" class="text-left"><a
								href="javascript:void(0);" class="column-header-anchor sortable"><span
									class="text">주문자</span><span class="md icon "></span></a></th>

							
							<th data-column-id="id" class="text-left"><a
								href="javascript:void(0);" class="column-header-anchor sortable"><span
									class="text">주문 상품</span><span class="md icon "></span></a></th>

							<th data-column-id="id" class="text-left"><a
								href="javascript:void(0);" class="column-header-anchor sortable"><span
									class="text">주문 수량</span><span class="md icon "></span></a></th>

							<th data-column-id="id" class="text-left"><a
								href="javascript:void(0);" class="column-header-anchor sortable"><span
									class="text">주문 날짜</span><span class="md icon "></span></a></th>
									
							<th data-column-id="commands" class="text-left"><a
								href="javascript:void(0);" class="column-header-anchor "><span
									class="text">현재 상태</span><span class="md icon "></span></a></th>
						</tr>
					</thead>
					
					<tbody>
					<!-- 데이터 출력 -->
					<c:forEach var="order" items="${orderList }">
					<c:choose>
						<c:when test="${empty(orderList)}">
							<tr align="center">
								<td colspan="6">검색된 주문 정보가 없습니다.</td>				
							</tr>
						</c:when>
					
					<c:otherwise>
						<tr data-row-id="0">
							<td class="table_orderNo">${order.orderNo }</td>
							<td class="text-left">${order.member.memName }</td>
							<td class="text-left">${order.orderProduct }</td>
							<td class="text-left">${order.orderCnt }</td>
							<td class="text-left">${order.orderDate }</td>
							<c:if test="${order.orderStatus==0 }">
								<td>주문완료</td>
							</c:if>
							<c:if test="${order.orderStatus==1 }">
								<td>배송완료</td>
							</c:if>
							
						</tr>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					</tbody>
				</table>
				
				<div id="data-table-command-footer"
					class="bootgrid-footer container-fluid">
					<div class="row">
						<div class="col-sm-6">
							<ul class="pagination">
								<li class="first disabled" aria-disabled="true"><a
									href="#first" class="button"><i class="md md-more-horiz"></i></a></li>
								<li class="prev disabled" aria-disabled="true"><a href="#prev"
									class="button"><i class="md md-chevron-left"></i></a></li>
								<li class="page-1 active" aria-disabled="false"
									aria-selected="true"><a href="#1" class="button">1</a></li>
								<li class="page-2" aria-disabled="false" aria-selected="false"><a
									href="#2" class="button">2</a></li>
								<li class="next" aria-disabled="false"><a href="#next"
									class="button"><i class="md md-chevron-right"></i></a></li>
								<li class="last" aria-disabled="false"><a href="#last"
									class="button"><i class="md md-more-horiz"><i></i></i></a></li>
							</ul>
						</div>
						<div class="col-sm-6 infoBar">
							<div class="infos">Showing 1 to 10 of 20 entries</div>
						</div>
					</div>
				</div>
				<!-- 데이터테이블 끝 -->
	      </div>

	    </div>
	</div>
	<br>
	<br>
	<br>
	
	</div>
	</div>
	</div>
	
</div>


<script type="text/javascript">

	
	//초기화 버튼 누르면
	$("#resetBtn").click(function () {
		$("#orderNo").val("");
		$("#orderDate").val("");
		$("#memName").val("");
	});
	
	/* $(".detailBtn").click(function() {
		//var orderNo = $(".table_orderNo").text();
		var orderNo = $(this).attr("id");
		//alert(orderNo);
		
		
		
		$.ajax({
			type:"GET",
			url:"order_detail/"+orderNo,
			//data:{"orderNo" : orderNo},
			dataType:"json",
			success: function(json) {
				var source=$("#template").html();
				var template=Handlebars.compile(source);
				$("#showDetail").html(template(json.orderDetail));
				$("#showDetail").show(300);
				
				var html="";
			},
			error: function(xhr) {
				
			}
		});
	}); */
</script>

 <%-- <script src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script>
         <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
      
         <script src="${pageContext.request.contextPath }/vendors/nicescroll/jquery.nicescroll.min.js"></script>
         <script src="${pageContext.request.contextPath }/vendors/bootgrid/jquery.bootgrid.min.js"></script>
         <script src="${pageContext.request.contextPath }/vendors/waves/waves.min.js"></script>
         <script src="${pageContext.request.contextPath }/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
         <script src="${pageContext.request.contextPath }/vendors/sweet-alert/sweet-alert.min.js"></script> --%>
<!-- <script type="text/javascript">
            $(document).ready(function(){
                //Command Buttons
                $("#order-table").bootgrid();
            });
</script> -->
	