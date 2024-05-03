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
						<h3>수주 적용</h3>
						<p class="text-subtitle text-muted">수주 목록</p>
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
			<form action="mpscompleted" id="mpsForm">
			<section class="section">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table" id="table1">
								<thead>
									<tr>
										<th>📝</th>
										<th>계획일</th>
										<th>주문번호</th>
										<th>순번</th>
										<th>주문일자</th>
										<th>고객</th>
										<th>품번</th>
										<th>품명</th>
										<th>단위</th>
										<th>주문수량</th>
										<th>출하예정일</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty orderdetail }">
										<c:forEach items="${orderdetail }" var="orderdetail">
											<tr>
												<td><input type="checkbox"></td>
												<td><input type="date"></input></td>
												<td>${orderdetail.cod }</td>
												<td>${orderdetail.num }</td>
												<td>${orderdetail.orderDate }</td>
												<td>${orderdetail.clientName }</td>
												<td>${orderdetail.productCod }</td>
												<td>${orderdetail.prodname }</td>
												<td>${orderdetail.unitName }</td>
												<td>${orderdetail.qty }</td>
												<td>${orderdetail.deliveryDate }</td>
												<td>${orderdetail.note }</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty orderdetail }">
										<tr>
											<td colspan="12">수주 내역이 없습니다.</td>
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
				<button onclick="location.href='mpsmanagement'">이전으로</button>
				<button onclick="mpsFormSubmit()">주계획 작성</button>
			</div>
				<input type="hidden" id="productCod" name="productCod" value="">
				<input type="hidden" id="productCod" name="productCod" value="">
			</form>
		</div>
	</div>
</body>
<script>
function mpsFormSubmit(){
	document.getElementById('mpsForm').submit();
}
</script>
</html>
