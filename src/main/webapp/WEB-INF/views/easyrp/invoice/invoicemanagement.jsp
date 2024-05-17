<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
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
						<h3>
							<a href="/easyrp/commontable">청구관리</a>
						</h3>
						<p class="text-subtitle text-muted">청구 조회, 등록, 수정, 삭제</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">청구관리</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="row" id="table-hover-row">
					<div class="col-12">
						<div class="card">
							<div class="card-content">
								<div class="table-responsive">
									<!-- 검색 FORM START -->
									<div class="card">
										<div class="card-body mb-3" style="padding: 0.5rem">
											<div class="col-12 col-md-6 order-md-1 order-last">
												<h3>검색</h3>
											</div>
											<form id="searchForm" action="mrpmanagement" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">계획구분</td>
															<td><select id="searchPlan" name="searchPlan" class="form-select">
																<option value="수주">수주정보 기반</option>
																<option value="계획">생산계획 기반</option>
															</select></td>
															<td width="100">품 번</td>
															<td><input type="text" id="searchProdCod"
																name="searchProdCod" class="form-control"
																value="${searchProdCod}" placeholder="품번을 입력해주세요." /></td>
															<td width="100">품 명</td>
															<td><input type="text" id="searchProdName"
																name="searchProdName" class="form-control"
																value="${searchProdName}" placeholder="품명을 입력해주세요." /></td>
														</tr>
														<tr>
															<td width="100">검색 날짜</td>
															<td colspan="2"><input type="date"
																id="preSearchDate" name="preSearchDate"
																value="${preSearchDate}" class="form-control"
																style="width: 47%; float: left" /> <span><i
																	class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="postSearchDate" name="postSearchDate"
																value="${postSearchDate}" class="form-control"
																style="width: 47%; float: right" /></td>
														</tr>
													</table>
												</div>
												<input type="hidden" name="offset" value="${offset}" /> <input
													type="hidden" name="size" value="${pageSize}" />
												<div style="text-align: end; margin-right: 0.5rem">
													<button type="submit" class="btn btn-primary">검색</button>
													 <button type="button" class="btn btn-primary"   onclick="resetSearchForm()">초기화</button>
												</div>
											</form>
										</div>
									</div>
									<!-- 검색 FORM END -->
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th>청구번호</th>
												<th>청구일자</th>
												<th>청구구분</th>
												<th>청구자번호</th>
												<th>청구자</th>
												<th>비고</th>
												<th>기능</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${invoiceTable }" var="invoiceTable">
												<tr>
													<td>${invoiceTable.cod }</td>
													<td>${invoiceTable.invDate }</td>
													<td>${invoiceTable.invClass }</td>
													<td>${invoiceTable.employeeCod }</td>
													<td>${invoiceTable.employeeName }</td>
													<td>${invoiceTable.note }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="invoiceupdate?cod=${invoiceTable.cod}">수정</a></li>
																<li><a class="dropdown-item"
																	href="invoicedeletefn?cod=${invoiceTable.cod}">삭제</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											<c:if test="${empty invoiceTable }">
												<tr>
													<td colspan="10" align="center">청구 내역이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>					
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<!-- Previous 10 Pages -->
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								
								<a class="page-link" href="<c:if test='${startPage > 1}'>
									?page=${i}
									<c:out value="${request }"/>
									</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li class="page-item <c:if test='${i == page}'>active</c:if>">									
									<button class="page-link" type="button" onclick="paging('${i}')">${i }</button>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>
									?page=${i}
									<c:out value="${request }"/>
								</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="invoiceinsert" style="color: white">청구등록</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 공통 사용 테이블 END -->
	<!-- 퇴사등록 Modal -->
	<div class="modal fade" id="quitRegisModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-dismiss="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="quitRegisModalLabel">퇴사등록</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<span>퇴사일</span> <input id="quitDate" type="date" />
					</div>
					<div>
						<span>퇴사사유</span> <input id="quitReason" type="text" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onClick="quitRegis()">등록</button>
				</div>
			</div>
		</div>
	</div>
	<!--퇴사등록 Modal end -->
	<!--삭제 Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="border-bottom: 0">
				</div>
				<div class="modal-body">삭제하시겠습니까?</div>
				<div class="modal-footer" style="border-top: 0">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="deleteEmp()">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 삭제 Modal end -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		let cod = "";
		const selectCod = (value) => {
			cod = value;
		}
	
		const quitRegis = () => {
			const quitDate = $("#quitDate").val();
			const quitReason = $("#quitReason").val();
			if(quitDate == "") {
				alert("퇴사일을 입력해주세요");
				return;
			}
			
			$.ajax({
				url: "quitregis",
				data: {
					cod: cod,
					quitdate: quitDate,
					quitReason: quitReason
				},
				method: "POST",
				success: function(res) {
					if(res > 0) {
						$("#quitRegisModal").modal('hide');
					} else {
						alert("예상치못한 에러가 발생했습니다");
					}
				},
				error: function(error) {
					console.log(error);
					alert("예상치못한 에러가 발생했습니다");
				}
			});
		}
		
		const deleteEmp = () => {
			$.ajax({
				url: "deleteEmp",
				data: {
					cod: cod,
					deleteyn: 'Y'
				},
				method: "POST",
				success: function(res) {
					if(res > 0) {
						$("#"+cod).remove();
						if($(".empList").length == 0 && $(".active > a").text() != 1) {
							document.getElementById($(".active > a").text()-1).click();
						}
						$("#deleteModal").modal('hide');
					} else {
						alert("예상치못한 에러가 발생했습니다");
					}
				},
				error: function(error) {
					console.log(error);
					alert("예상치못한 에러가 발생했습니다");
				}
			});
		}
		
		function paging(page) {		    
			let form = document.getElementById("searchForm");			
			document.getElementById("page").value = page;			
			form.submit();
		}
	</script>
	
	<!-- 셀렉트박스 고정 자바스크립트 -->
    <script type="text/javascript">
    	window.onload = function(){
    		document.getElementById('searchPlan').value = '${searchPlan}';
    	}
    </script>
</body>
</html>

