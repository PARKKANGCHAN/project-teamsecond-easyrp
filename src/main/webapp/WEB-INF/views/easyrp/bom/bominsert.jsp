<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<!-- 2024년 5월 17일 오후 1시 35분 박현우 -->
	<!-- BOM 등록 페이지 START -->
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
						<h3>BOM 등록</h3>
						<p class="text-subtitle text-muted">BOM 등록을 위한 페이지</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">BOM
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
									<h5 class="m-0 col-6">BOM 등록</h5>
									<div class="d-flex col-6 justify-content-end">
										<button type="button" class="btn btn-primary mx-2"
											id="loadProductData" data-bs-toggle="modal"
											data-bs-target="#loadModal" onclick="setValueProductData();"
											style="float: left; width: 24%">BOM 미등록 정보</button>
									</div>
								</div>
							</div>
							<div class="card-body mb-3">
								<form action="bominsertfn" method="post">
									<table class="table">
										<tr>
											<th width="7%">제품 번호</th>
											<td width="20%"><input type="text" class="form-control hyunwoo-input-disabled" id="prodCod" name="prodCod" readonly /></td>
											<th width="7%">제품 명</th>
											<td width="20%"><input type="text" class="form-control hyunwoo-input-disabled" id="productName" disabled /></td>
											<th width="7%">제품 그룹 명</th>
											<td width="20%"><input type="text" class="form-control hyunwoo-input-disabled" id="productGroupName" disabled /></td>
											<td></td>
										</tr>
									</table>
									<table class="table">
										<tr id="detailList">
											<th width="7%">원자재 코드</th>
											<th width="20%">원자재 명</th>
											<th width="7%">수 량</th>
											<th width="15%">단 가</th>
											<th width="15%">금 액</th>
											<th width="20%">삭제</th>
										<tr>
											<th colspan="1">총 합</th>
											<td colspan="1">-</td>
											<td colspan="1">-</td>
											<td colspan="1">-</td>
											<td colspan="2"><input type="text" class="form-control hyunwoo-input-disabled" id="stdprice" name="stdprice" value="여기에 자재금액 합계"readonly /></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="6" style="border-bottom-width: 0px">
												<button type="button" class="btn btn-primary"
													id="addtrButton" onClick="addtrBtn()">원자재 추가</button>
											</td>
										</tr>
									</table>
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											BOM 등록</button>
										<a href="productmgmt" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												등록취소</button>
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
	<!-- BOM 등록 페이지 END -->

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
		function setValueProductData() {
			$('.modal-content').load('setvalueproductdata');
		}

		function setValueInventoryModal() {
			$('.modal-content').load('setvalueinventorymodal');
		}
	</script>
</body>
</html>
