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
						<h3>주계획 관리 및 목록</h3>
						<p class="text-subtitle text-muted">주계획 관리(등록,삭제,수정) 목록</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">주계획
									관리</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>

			<!-- Basic Tables start -->
			<section class="section">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table" id="table1">
								<thead>
									<tr>
										<th>📝</th>
										<th>계획일</th>
										<th>품번</th>
										<th>품명</th>
										<th>규격</th>
										<th>단위</th>
										<th>출하예정일</th>
										<th>납기일</th>
										<th>계획수량</th>
										<th>고객</th>
										<th>비고</th>
										<th>수정/삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty mps }">
										<c:forEach items="${mps }" var="mps">
											<tr>
												<td><input type="checkbox" /></td>
												<td>${mps.orderDate }</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty mps }">
										<tr>
											<td colspan="12">주계획 내역이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
			<!-- Basic Tables end -->
			<div>
				<button onclick="location.href='mpsorderlist'">주계획등록(주문)</button>
				<button>주계획등록(계획)</button>
			</div>
		</div>
	</div>
</body>
<script>
	
</script>
</html>
