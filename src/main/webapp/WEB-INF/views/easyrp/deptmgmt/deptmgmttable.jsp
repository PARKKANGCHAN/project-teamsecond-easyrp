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
	<!-- (2024년 5월 3일 추가 박현우) -->
	<!-- 사원 관리 테이블 START -->
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
							<a href="/easyrp/commontable">부서 관리</a>
						</h3>
						<p class="text-subtitle text-muted">부서 관리를 할 수 있는 현황판</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">부서
									관리</li>
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
											<form id="searchForm" action="departmentmgmt" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">부서번호</td>
															<td><input type="text" id="searchCod"
																name="searchCod" class="form-control"
																value="${searchVO.searchCod}"
																placeholder="부서 번호를 입력해주세요." /></td>
															<td width="100">부서이름</td>
															<td><input type="text" id="searchName"
																name="searchName" class="form-control"
																value="${searchVO.searchName}"
																placeholder="부서명을 입력해주세요." /></td>
															<td width="100">사업장</td>
															<td><input type="text" id="searchWrkName"
																name="searchWrkName" class="form-control"
																value="${searchVO.searchWrkName}"
																placeholder="사업장 명을 입력해주세요." /></td>
															<td width="100">지역</td>
															<td><input type="text" id="searchLocation"
																name="searchLocation" class="form-control"
																value="${searchVO.searchLocation}"
																placeholder="검색 지역을 입력해주세요." /></td>
														</tr>
													</table>
												</div>
												<input type="hidden" name="size" value="${pageSize}" />
												<div style="text-align: end; margin-right: 0.5rem">
													<button type="submit" class="btn btn-primary">검색</button>
													<button type="reset" class="btn btn-primary">초기화</button>
												</div>
											</form>
										</div>
									</div>
									<!-- 검색 FORM END -->
									<button id="loadDetail" data-bs-toggle="modal"
										data-bs-target="#detailModal">모달</button>
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th width="5%">부서 번호</th>
												<th width="20%">부서 명</th>
												<th width="60%">사업장</th>
												<th width="10%">지역</th>
												<th width="5%">기 능</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="departmentmgmt" items="${departmentmgmt }">
												<tr class="commonDetailTable">
													<td class="text-bold-500">${departmentmgmt.cod }</td>
													<td>${departmentmgmt.name }</td>
													<td class="text-bold-500">${departmentmgmt.wrkname }</td>
													<td>${departmentmgmt.location }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="commonupdate?postId=${commonTable.postId}">수정</a></li>
																<li><a class="dropdown-item"
																	href="commondeletefn?postId=${commonTable.postId}">삭제</a></li>
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
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&size=${pageSize}&searchNumber=${param.searchNumber}&searchTitle=${param.searchTitle}&searchContent=${param.searchContent}&searchAuthor=${param.searchAuthor}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&size=${pageSize}&searchNumber=${param.searchNumber}&searchTitle=${param.searchTitle}&searchContent=${param.searchContent}&searchAuthor=${param.searchAuthor}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&size=${pageSize}&searchNumber=${param.searchNumber}&searchTitle=${param.searchTitle}&searchContent=${param.searchContent}&searchAuthor=${param.searchAuthor}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="commoninsert" style="color: white">등록</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 공통 사용 테이블 END -->
	<!-- 상세페이지 모달 START -->
	<div class="modal fade" id="detailModal" tabindex="-1"
		aria-labelledby="detailModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">공통 상세 페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th scope="col">수주 번호</th>
							<td>0001</td>
							<th scope="col">거래처 명</th>
							<td>우주상사</td>
							<th scope="col">수주 날짜</th>
							<td>2024-05-03</td>
						</tr>
						<tr>
							<th scope="col">수주 담당 부서</th>
							<td>영업1팀</td>
							<th scope="col">수주 담당 사원코드</th>
							<td>emp001</td>
							<th scope="col">수주 담당자 명</th>
							<td>박현우</td>
						</tr>
						<tr>
							<th colspan="1">상품 코드</th>
							<th colspan="1">상품 명</th>
							<th colspan="1">수 량</th>
							<th colspan="1">단 가</th>
							<th colspan="1">공급가액</th>
							<th colspan="1">부가세</th>
						<tr>
							<td colspan="1">product_01</td>
							<td colspan="1">컴퓨터 100대</td>
							<td colspan="1">10개</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000,000</td>
							<td colspan="1">1,000,000</td>
						</tr>
						<tr>
							<td colspan="1">product_02</td>
							<td colspan="1">마우스 100개</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000</td>
						</tr>
						<tr>
							<td colspan="1">product_02</td>
							<td colspan="1">키보드 100개</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000</td>
						</tr>
						<tr>
							<td colspan="1">product_02</td>
							<td colspan="1">모니터 100대</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000</td>
							<td colspan="1">1,000,000</td>
						</tr>
						<tr>
							<th colspan="1">총 합</th>
							<td colspan="1"></td>
							<td colspan="1"></td>
							<td colspan="1"></td>
							<td colspan="1">5,000,000</td>
							<td colspan="1">5,000,000</td>
						</tr>
						<tr>
							<td colspan="6" style="border-bottom-width: 0px">
								<button type="button" class="btn btn-primary">전표 생성</button>
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-primary">이메일 보내기</button>
							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 상세페이지 모달 END  -->
</body>
</html>
