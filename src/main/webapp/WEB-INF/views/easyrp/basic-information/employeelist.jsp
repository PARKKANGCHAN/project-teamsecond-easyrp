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
						<h3>
							<a href="/easyrp/commontable">공통 테이블</a>
						</h3>
						<p class="text-subtitle text-muted">공통 테이블 소개(부제목)</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">공통
									테이블</li>
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
												<a href="employeeregis">사원등록</a>
											</div>
											<form id="searchForm" action="employeelist" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">사원번호</td>
															<td><input type="text" id="searchCod"
																name="searchCod" class="form-control"
																value="${searchCod}" placeholder="사원번호 입력해주세요." /></td>
															<td width="100">사원명</td>
															<td><input type="text" id="searchName"
																name="searchName" class="form-control"
																value="${searchName}" placeholder="사원명을 입력해주세요." /></td>
															<td width="100">부서번호</td>
															<td><input type="text" id="searchDeptCod"
																name="searchDeptCod" class="form-control"
																value="${searchDeptCod}" placeholder="부서번호를 입력해주세요." /></td>
															<td width="100">부서명</td>
															<td><input type="text" id="searchDeptName"
																name="searchDeptName" class="form-control"
																value="${searchDeptName}" placeholder="부서명을 입력해주세요." /></td>
															<td width="100">직책</td>
															<td><input type="text" id="searchEmpPosition"
																name="searchEmpPosition" class="form-control"
																value="${searchEmpPosition}" placeholder="직책을 입력해주세요." /></td>
														</tr>
													</table>
												</div>
												<input type="hidden" name="offset" value="${offset}" /> <input
													type="hidden" name="size" value="${pageSize}" />
												<div style="text-align: end; margin-right: 0.5rem">
													<button type="submit" class="btn btn-primary">검색</button>
												</div>
											</form>
										</div>
									</div>
									<!-- 검색 FORM END -->
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th>사원코드</th>
												<th>사원명</th>
												<th>성별</th>
												<th>생년월일</th>
												<th>연락처</th>
												<th>이메일</th>
												<td>부서코드</td>
												<th>부서명</th>
												<th>직급</th>
												<th>사업장</th>
												<td>지역</td>
												<th>입사일</th>
												<th>퇴사일</th>
												<th>퇴사사유</th>
												<th>비밀번호</th>
												<th>기능</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${employeeList }" var="e">
												<tr id="${e.cod }" class="empList">
													<td class="text-bold-500">${e.cod }</td>
													<td>${e.name }</td>
													<td class="text-bold-500">${e.gender }</td>
													<td>${e.birthdate }</td>
													<td class="text-bold-500">${e.tel }</td>
													<td>${e.email }</td>
													<td class="text-bold-500">${e.dept_cod }</td>
													<td>${e.dept_name }</td>
													<td class="text-bold-500">${e.emp_position }</td>
													<td>${e.wrkname }</td>
													<td class="text-bold-500">${e.location }</td>
													<td>${e.regdate }</td>
													<td class="text-bold-500">${e.quitdate }</td>
													<td>${e.quit_reason }</td>
													<td class="text-bold-500">${e.password }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li>
																	<button type="button" class="btn btn-primary"
																		data-bs-toggle="modal" data-bs-target="#quitRegisModal"
																		onclick="selectCod('${e.cod }')">퇴사등록</button>
																</li>
																<li><a class="dropdown-item"
																	href="employeeupdate?cod=${e.cod}">수정</a></li>
																<li>
																	<button type="button" class="btn btn-primary"
																		data-bs-toggle="modal" data-bs-target="#deleteModal" onclick="selectCod('${e.cod }')">삭제</button>
																</li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- 페이지네이션 START -->
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<!-- Previous 10 Pages -->
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${startPage > 1}'>?page=${i}&size=${pageSize}&searchCod=${param.searchCod}&searchName=${param.searchName}&searchDeptCod=${param.searchDeptCod}&searchDeptName=${param.searchDeptName}&searchEmpPosition=${param.searchEmpPosition}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link" id="${i }"
									href="?page=${i}&size=${pageSize}&searchCod=${param.searchCod}&searchName=${param.searchName}&searchDeptCod=${param.searchDeptCod}&searchDeptName=${param.searchDeptName}&searchEmpPosition=${param.searchEmpPosition}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${i}&size=${pageSize}&searchCod=${param.searchCod}&searchName=${param.searchName}&searchDeptCod=${param.searchDeptCod}&searchDeptName=${param.searchDeptName}&searchEmpPosition=${param.searchEmpPosition}</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
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
	</script>
</body>
</html>

