<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<div class="container">
	<!-- 넣어봄 -->
	<div class="block-header">
		<h2>기간 매출</h2>
	</div>

	<!-- mini chart -->
	<div class="mini-charts">
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="mini-charts-item bgm-cyan">
					<div class="clearfix">
						<div class="chart stats-bar"></div>
						<div class="count">
							<small>Best Item</small> 
								<c:forEach var="sales" items="${termBest}">
								<h2 >${sales.production.pdnProduct}</h2>
								</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-md-3">
				<div class="mini-charts-item bgm-lightgreen">
					<div class="clearfix">
						<div class="chart stats-bar-2"></div>
						<div class="count">
							<small>Worst Item</small> 
								<c:forEach var="sales" items="${termWorst}">
								<h2 >${sales.production.pdnProduct}</h2>
								</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-md-3">
				<div class="mini-charts-item bgm-orange">
					<div class="clearfix">
						<div class="chart stats-line"></div>
						<div class="count">
							<small>Total Sales</small>
								<c:forEach var="sales" items="${termTotal}">
								<h2 >
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${sales.entireSales}" />
								</h2>
								</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-md-3">
				<div class="mini-charts-item bgm-red">
					<div class="clearfix">
						<div class="chart stats-line-2"></div>
						<div class="count">
							<small>Average Sales</small>
							<c:forEach var="sales" items="${termAvg}">
								<h2 >
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${sales.avgSales}" />
								</h2>
								</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- minichart 끝 -->

	<div class="block-header">
		<h2>Data Table</h2>

		<!--  <ul class="actions">
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
					</ul>-->
	</div>

	<div class="card">
		<div class="card-header">
			<h2 style="margin-bottom: 2%;">
				지정 기간 검색 <small>검색하고자 하는 기간을 설정해주세요.</small>
			</h2>

			<!-- 캘린더 시작 -->
			<form action="month_dateList" method="get">
			<div class="row">
				<div class="col-sm-4">
					<div class="form-group fg-line">
						<div class="input-group form-group">
							<span class="input-group-addon"><i class="md md-event"></i></span>
							<div class="dtp-container dropdown fg-line">
								<input type='text' class="form-control date-picker"
									data-toggle="dropdown" name="startDate" id="startDate"
									placeholder="Click here...">
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="form-group fg-line">
						<div class="input-group form-group">
							<span class="input-group-addon"><i class="md md-event"></i></span>
							<div class="dtp-container dropdown fg-line">
								<input type='text' class="form-control date-picker"
									data-toggle="dropdown" name="endDate" id="endDate"
									placeholder="Click here...">
							</div>
						</div>
					</div>
				</div>
				<button type="submit" id="searchBtn" class="btn bgm-cyan waves-effect waves-button waves-float">submit</button>
			</div>
			<!-- 캘린더끝 -->
		</form>
		</div>
		
		
		<table id="data-table-command"
			class="table table-striped table-vmiddle">
			<thead>
				<tr>
					<th data-column-id="date" data-order="desc">날짜</th>
					<th data-column-id="product">품목</th>
					<th data-column-id="number" data-type="numeric">갯수</th>
					<th data-column-id="production" data-type="numeric">생산원가</th>
					<th data-column-id="sales" data-type="numeric">매출액</th>
					<th data-column-id="pure" data-type="numeric">순 매출액</th>
					<th data-column-id="commands" data-formatter="commands"
						data-sortable="false">비고</th>
				</tr>
			</thead>
			<tbody>
				<!-- 데이터 출력 -->
						<c:forEach var="sales" items="${termList}">
							<tr>
								<td class="text-left">${sales.relout.relDate} </td>
								<td class="text-left">${sales.production.pdnProduct}</td>
								<td class="text-left">${sales.product.pdCnt}</td>
								<td class="text-left">${sales.rawPrice}</td>
								<td class="text-left">${sales.totalSales}</td>
								<td class="text-left">${sales.pureSales}</td>
							</tr>
						</c:forEach>	
			</tbody>
		</table>
	</div>
</div>

<!-- Javascript Libraries -->
<script src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script>

<script
	src="${pageContext.request.contextPath }/vendors/nicescroll/jquery.nicescroll.min.js"></script>
<script
	src="${pageContext.request.contextPath }/vendors/bootgrid/jquery.bootgrid.min.js"></script>
<script
	src="${pageContext.request.contextPath }/vendors/waves/waves.min.js"></script>
<script
	src="${pageContext.request.contextPath }/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script
	src="${pageContext.request.contextPath }/vendors/sweet-alert/sweet-alert.min.js"></script>


<!-- Data Table -->
	<script type="text/javascript">
   
   $(document).ready(function(){
      
      // 템플릿 기능 활성화
      $("#data-table-basic").bootgrid();
      $("#data-table-command").bootgrid();
      
   });
	
   </script>