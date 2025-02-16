<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#sidebar .profile-menu>a {
	display: block;
	height: 180px;
	margin-bottom: 5px;
	width: 100%;
	background-image: url("img/profile-menu22.png");
	background-size: 100%;
}
</style>
</head>
<div class="sidebar-inner">
	<div class="si-inner">
		<div class="profile-menu">
			<a href="">
				<div class="profile-pic">

					<!-- 로고 넣을 예정 -->
					<!--<img src="img/profile-pics/1.jpg" alt="">-->
				</div>

				<div class="profile-info">
					Blooming <i class="md md-arrow-drop-down"></i>
				</div>
			</a>

			<ul class="main-menu">
				<!--  
				<li><a href="${pageContext.request.contextPath }/login"><i
						class="md md-settings-input-antenna"></i> 로그인</a></li>
				-->
				<li><a href="${pageContext.request.contextPath}/logout"><i
						class="md md-history"></i> 로그아웃</a></li>

			</ul>
		</div>

		<ul class="main-menu">
			<li class="active"><a
				href="${pageContext.request.contextPath }/"><i
					class="md md-home"></i> 메인</a></li>

			<li><a href="${pageContext.request.contextPath }/memberList">
					<i class="md md-format-underline"></i> 고객관리
			</a></li>

			<li class="sub-menu"><a href=""><i class="md md-now-widgets"></i>
					인사관리</a>

				<ul>
					<!-- class="active"쓰면 hover아니고 검정으로 살아있음 -->
					<li><a href="${pageContext.request.contextPath }/goWork">출/퇴근
							관리</a></li>
					<li><a href="${pageContext.request.contextPath }/attitudeList">근태관리
					</a></li>
					<li><a
						href="${pageContext.request.contextPath }/salarydetailList">급여목록
					</a></li>
					<li><a 
						href="${pageContext.request.contextPath }/insertSalaryList">급여관리
					</a></li>
					<li><a
						href="${pageContext.request.contextPath }/insertEmployee">인사카드작성</a></li>
					<li><a href="${pageContext.request.contextPath }/employeeList">사원목록
					</a></li>

				</ul></li>

			<li class="sub-menu"><a href=""><i class="md md-view-list"></i>
					매출관리</a>
				<ul>
					<li><a href="${pageContext.request.contextPath }/daySales">기간매출</a></li>
					<li><a href="${pageContext.request.contextPath }/weekSales">주간매출</a></li>
					<li><a href="${pageContext.request.contextPath }/monthSales">당월매출</a></li>
				</ul></li>

			<li class="sub-menu"><a href=""><i class="md md-view-list"></i>
					생산관리</a>
				<ul>
					<li><a href="${pageContext.request.contextPath }/production">생산현황</a></li>
				</ul></li>

			<li class="sub-menu"><a href=""><i
					class="md md-my-library-books"></i> 상품관리</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/receipt">입고</a></li>
					<li><a href="${pageContext.request.contextPath}/relout">출고</a></li>
					<li><a href="${pageContext.request.contextPath}/stock">재고</a></li>
					<!-- <li><a href="#">상품관리</a></li> -->
				</ul></li>

			<li class="sub-menu"><a href=""><i class="md md-swap-calls"></i>거래관리</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/placeorder">발주관리</a></li>
					<li><a href="${pageContext.request.contextPath}/client">거래처관리(목록)</a></li>
				</ul></li>

			<li class="sub-menu"><a href=""><i class="md md-trending-up"></i>운영관리</a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath }/transportationList">운송업체</a></li>
					<li><a href="${pageContext.request.contextPath }/productList">상품관리</a></li>
					<li><a href="${pageContext.request.contextPath }/deliveryList">배송관리</a></li>
					<li><a href="${pageContext.request.contextPath }/orderList">주문관리</a></li>
				</ul></li>

			<li class="sub-menu"><a href=""><i class="md md-trending-up"></i>전자결재</a>
				<ul>

					<li><a
						href="${pageContext.request.contextPath }/insertAuthorization">휴가결재</a></li>
					<li><a
						href="${pageContext.request.contextPath }/authorization_po">발주결재</a></li>
					<li><a href="${pageContext.request.contextPath }/authorList">결재
							요청 내역</a></li>
					<li><a href="${pageContext.request.contextPath }/approvalList">결재
							승인 내역</a></li>
				</ul> <br> <br> <br>
	</div>
</div>



<ul>
	<!-- class="active"쓰면 hover아니고 검정으로 살아있음 -->
	<li><a href="${pageContext.request.contextPath }/salaryDetail">급여관리</a></li>
	<li><a href="${pageContext.request.contextPath }/insertEmployee">사원정보입력</a></li>
	<li><a href="${pageContext.request.contextPath }/attitudeList">근태관리
			리스트</a></li>
	<li><a href="${pageContext.request.contextPath }/employeeList">사원
			리스트</a></li>
	<li><a href="${pageContext.request.contextPath }/salaryList">급여
			관리 리스트</a></li>
	<li><a href="${pageContext.request.contextPath }/salarydetailList">급여
			상세 리스트</a></li>
</ul>

<li class="sub-menu"><a href=""><i class="md md-view-list"></i>
		생산관리</a>
	<ul>
		<li><a href="tables.html">생산현황</a></li>
	</ul></li>

<li class="sub-menu"><a href=""><i
		class="md md-my-library-books"></i> 상품관리</a>
	<ul>
		<li><a href="#">입고</a></li>
		<li><a href="#">출고</a></li>
		<li><a href="#">재고</a></li>
		<!-- <li><a href="#">상품관리</a></li> -->
	</ul></li>

<li class="sub-menu"><a href=""><i class="md md-swap-calls"></i>거래관리</a>
	<ul>
		<li><a href="${pageContext.request.contextPath}/placeorder">발주관리</a></li>
		<li><a href="${pageContext.request.contextPath}/client">거래처관리(목록)</a></li>
	</ul></li>

<li class="sub-menu"><a href=""><i class="md md-trending-up"></i>운영관리</a>
	<ul>
		<li><a
			href="${pageContext.request.contextPath }/transportationList">운송업체</a></li>
		<li><a href="${pageContext.request.contextPath }/productList">상품관리</a></li>
		<li><a href="${pageContext.request.contextPath }/deliveryList">배송관리</a></li>
		<li><a href="${pageContext.request.contextPath }/orderList">주문관리</a></li>
	</ul></li>

<li class="sub-menu"><a href=""><i class="md md-trending-up"></i>전자결제</a>
	<ul>
		<li><a href="${pageContext.request.contextPath }/insertVacation">휴가신청</a></li>
	</ul></li>
</ul>