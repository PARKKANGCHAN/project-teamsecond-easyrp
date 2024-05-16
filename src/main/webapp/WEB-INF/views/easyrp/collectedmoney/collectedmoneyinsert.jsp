<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<!-- 2024년 5월 11일 오전 1시 10분 박현우 -->
	<!-- 수금 등록 테이블 START -->
	<div id="main">
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>
		<div class="page-heading">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>수금 등록</h3>
						<p class="text-subtitle text-muted">수주서 대비 수금 등록 페이지</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">수금
									등록</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="row" id="table-hover-row">
					<div class="col-12">
						<div class="card mb-4">
							<div class="card-header py-3">
								<div class="d-flex" style="justify-content: space-between">
									<h5 class="m-0 col-6">수금 등록</h5>
									<div class="d-flex col-6 justify-content-end">
										<button type="button" class="btn btn-primary mx-2"
											id="loadOrderData" data-bs-toggle="modal"
											data-bs-target="#loadModal" onclick="setValueOrderData();"
											style="float: left; width: 24%">수주정보 가져오기</button>
									</div>
								</div>
							</div>
							<div class="card-body mb-3">
								<form action="collectedmoneyinsertfn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<tr>
												<td width="150">수주 번호</td>
												<td><input type="text" id="orderCod" name="orderCod"
													class="form-control inputNumber" placeholder="수주 번호를 입력해주세요." required /></td>
											</tr>
											<tr>
												<td width="150">수주 금액</td>
												<td><input type="text" id="colsum" name="colsum"
													class="form-control inputNumber"
													placeholder="수주 금액을 입력해주세요."
													required /></td>
											</tr>
											<tr>
												<td width="150">선수금</td>
												<td><input type="text" id="unrev" class="form-control inputNumber"
													name="unrev" class="form-control inputNumber"
													placeholder="현재 입고된 기준의 재고수량을 입력해주세요."
													required /></td>
											</tr>
											<tr>
												<td width="150">잔 액</td>
												<td><input type="text" id="balance" name="balance"
													class="form-control"
													placeholder="(수주 금액 - 선수금)으로 계산해 자동 입력됩니다." readonly
													required /></td>
											</tr>
										</table>
									</div>
									<div style="text-align: center">
										<button type="button" onclick="parseIntSubmit();"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											수금 등록</button>
										<a href="collectedmoney" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												등록 취소</button>
										</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 수금 등록 테이블 END -->

	<!-- 공통 Modal START  -->
	<div class="modal fade" id="loadModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="loadModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 여기에 Modal JSP가 삽입됩니다. -->
			</div>
		</div>
	</div>
	<!-- 공통 Modal END  -->

	<script type="text/javascript">
		/* 잔액 기입 Event START  */
		$(document).ready(function() {
			$('#colsum , #unrev').on('input', function() {
				let orderTotalPrice = $('#colsum').val();
				let downpayment = $('#unrev').val();
				let balance = parseInt(orderTotalPrice) - parseInt(downpayment);
				$('#balance').val(balance);
			});
		});
		/* 잔액 기입 Event END  */

		/* 수주정보 모달 불러오기 START */
		function setValueOrderData() {
			$('.modal-content').load('setvalueorderdata');
		}
		/* 수주정보 모달 불러오기 END */

		function parseIntSubmit() {

		}
	</script>
</body>
</html>
