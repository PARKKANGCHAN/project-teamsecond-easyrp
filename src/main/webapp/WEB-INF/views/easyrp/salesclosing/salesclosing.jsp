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
	<!-- ( 2024년 5월 20일 오후 12시 45분 박현우 ) -->
	<!-- 매출 마감 테이블 START -->
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
							<a href="salesclosing">출고 완료 매출 마감 관리</a>
						</h3>
						<p class="text-subtitle text-muted">출고 완료 된 수주건에 대해 매출 마감 관리를
							할 수 있는 현황판</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">출고
									완료 매출 마감 관리</li>
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
											<form id="searchForm" action="collectedmoney" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr class="text-center">
															<td width="8%">마감 수주 번호</td>
															<td width="15%"><input type="text"
																id="searchOrderCod" name="searchOrderCod"
																class="form-control" value="${searchVO.searchOrderCod}"
																placeholder="수주번호를 입력해주세요." /></td>
															<td width="9%">매출 마감 유무</td>
															<td width="10%"><select class="form-control"
																id="searchSalesClosingState"
																name="searchSalesClosingState">
																	<option value="N"
																		${searchVO.searchSalesClosingState == 'N' ? 'selected' : ''}>선택</option>
																	<option value="Y"
																		${searchVO.searchSalesClosingState == 'Y' ? 'selected' : ''}>마감
																		완료</option>
																	<option value="N"
																		${searchVO.searchSalesClosingState == 'N' ? 'selected' : ''}>마감
																		미완료</option>
															</select></td>
															<td width="10%">매출 마감 완료 날짜</td>
															<td colspan="4"><input type="date"
																id="preSearchDate" name="preSearchDate"
																value="${searchVO.preSearchDate}" class="form-control"
																style="width: 47%; float: left" /> <span><i
																	class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="postSearchDate" name="postSearchDate"
																value="${searchVO.postSearchDate}" class="form-control"
																style="width: 47%; float: right" /></td>
														</tr>
													</table>
												</div>
												<div style="text-align: end; margin-right: 0.5rem">
													<button type="submit" class="btn btn-primary">검색</button>
													<button type="button" class="btn btn-primary"
														onclick="resetSearchForm()">초기화</button>
												</div>
											</form>
										</div>
									</div>
									<!-- 검색 FORM END -->


									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th width="1%">체크</th>
												<th width="5%">마감 수주 번호</th>
												<th width="10%">매출 마감 금액</th>
												<th width="10%">마감 완료 유무</th>
												<th width="10%">마감 완료 날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="salesClosing" items="${salesClosing}">
												<tr class="commonDetailTable">
													<td><input type="checkbox" class="form-check-input" /></td>
													<td class="text-bold-500">${salesClosing.orderCod}</td>
													<!-- 마감 수주 번호  -->
													<td><fmt:formatNumber value="${salesClosing.total }"
															pattern="#,###" />원</td>
													<!-- 매출 마감 금액  -->
													<td>${salesClosing[0].salesClosingState }</td>
													<!-- 매출 마감 완료 유무 -->
													<td>${salesClosing[0].salesClosingDate }</td>
													<!-- 초과일수 -->
												</tr>
											</c:forEach>
											<c:if test="${empty salesClosing}">
												<tr>
													<td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- 페이지네이션 START -->
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&searchOrderCod=${searchVO.searchOrderCod }&searchSalesClosingState=${searchVO.searchSalesClosingState}
								&preSearchDate=${searchVO.preSearchDate }&postSearchDate=${searchVO.postSearchDate }</c:if>">이전
									10 페이지</a>
							</li>
							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&searchOrderCod=${searchVO.searchOrderCod }}&searchSalesClosingState=${searchVO.searchSalesClosingState}
								&preSearchDate=${searchVO.preSearchDate }&postSearchDate=${searchVO.postSearchDate }">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&searchOrderCod=${searchVO.searchOrderCod }&searchSalesClosingState=${searchVO.searchSalesClosingState}
								&preSearchDate=${searchVO.preSearchDate }&postSearchDate=${searchVO.postSearchDate }</c:if>">다음
									10 페이지</a>
							</li>
						</ul>
					</nav>
					<!-- 페이지네이션 END -->


					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary" disabled>
								<a href="#" style="color: white" disabled>매출 마감 등록</a>
							</button>
							<button type="button" class="btn btn-danger" disabled>
								<a href="#" style="color: white">매출 마감 취소</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 자재 관리 테이블 END -->

	<!-- 공통 Modal START  -->
	<div class="modal fade" id="loadModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="loadModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 여기에 load된 jsp모달이 삽입됩니다.  -->
			</div>
		</div>
	</div>
	<!-- 공통 Modal END  -->


	<script type="text/javascript">
		/* 검색 form 초기화 START */
		function resetSearchForm() {
			$('#searchOrderCod').val('');
			$("#searchSalesClosingState").val("N").prop("selected", true);
			$('#preSearchDate').val('');
			$('#postSearchDate').val('');
		}
		/* 검색 form 초기화 END */

		/* 수금완료 처리 시에 confirm Action START  */
		function confirmCompleteAction() {
			return confirm("한번 수금완료 처리를 하면 되돌릴 수 없습니다. 정말 수금완료 처리를 하시겠습니까?");
		}
		/* 수금완료 처리 시에 confirm Action END  */

		/* 삭제 처리 시에 confirm Action START  */
		function confirmDeleteAction() {
			return confirm("한번 삭제 처리를 하면 되돌릴 수 없습니다. 정말 삭제 처리를 하시겠습니까?");
		}
		/* 삭제 처리 시에 confirm Action END  */
	</script>
</body>
</html>
