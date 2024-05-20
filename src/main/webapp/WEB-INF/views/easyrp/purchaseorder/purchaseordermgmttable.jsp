<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<style type="text/css">
	.editBox {
		width: 100px;
	}
</style>
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
							<a href="/easyrp/commontable">발주관리</a>
						</h3>
						<p class="text-subtitle text-muted">발주를 조회.등록.수정.삭제 할수있는 페이지</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">발주관리</li>
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
											<form id="searchForm" name="searchForm" action="purchaseordermgmttable" method="post">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">발주번호</td>
															<td><input type="text" id="searchCod"
																name="searchCod" class="form-control"
																value="${vo.searchCod}" placeholder="발주번호" /></td>

															<td width="100">발주기간</td>
															<td colspan="2"><input type="date"
																id="searchFromPoDate" name="searchFromPoDate"
																value="${vo.searchFromPoDate}" class="form-control"
																style="width: 47%; float: left" /> <span><i
																	class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="searchToPoDate" name="searchToPoDate"
																value="${vo.searchToPoDate}" class="form-control"
																style="width: 47%; float: right" /></td>
																
															<td width="100">거래처</td>
															<td colspan="2"><input type="text" id="searchClientCod"
																name="searchClientCod" class="form-control"
																value="${vo.searchClientCod}" placeholder="거래처번호" />
																<input type="text" id="searchClientName"
																name="searchClientName" class="form-control"
																value="${vo.searchClientName}" placeholder="거래처명" />
																<button type="button" class="btn btn-primary loadValues"
																	data-input-id1="searchClientCod" data-input-id2="searchClientName" data-key="client" data-bs-toggle="modal"
																	data-bs-target="#searchModal">저장 값 가져오기</button>
															</td>
														</tr>
														<tr>
															<td width="100">발주담당자</td>
															<td><input type="text" id="searchEmpCodPo"
																name="searchEmpCodPo" class="form-control"
																value="${vo.searchEmpCodPo}" placeholder="사원번호" />
																<input type="text" id="searchEmpNamePo"
																name="searchEmpNamePo" class="form-control"
																value="${vo.searchEmpNamePo}" placeholder="사원명" />
																<button type="button" class="btn btn-primary loadValues"
																	data-input-id1="searchEmpCodPo" data-input-id2="searchEmpNamePo" data-key="emp" data-bs-toggle="modal"
																	data-bs-target="#searchModal">저장 값 가져오기</button>
															</td>
															<td width="100">입고담당자</td>
															<td><input type="text" id="searchEmpCodIbound"
																name="searchEmpCodIbound" class="form-control"
																value="${vo.searchEmpCodIbound}" placeholder="사원번호" />
																<input type="text" id="searchEmpNameIbound"
																name="searchEmpNameIbound" class="form-control"
																value="${vo.searchEmpNameIbound}" placeholder="사원명" />
																<button type="button" class="btn btn-primary loadValues"
																	data-input-id1="searchEmpCodIbound" data-input-id2="searchEmpNameIbound" data-key="emp" data-bs-toggle="modal"
																	data-bs-target="#searchModal">저장 값 가져오기</button>
															</td>
															<td width="100">상태</td>
															<td>
																<select name="searchStateCod">
																	<option value="">전체</option>
																	<option value="200" <c:if test="${vo.searchStateCod eq 200}">selected</c:if>>발주</option>
																	<option value="201" <c:if test="${vo.searchStateCod eq 201}"> selected </c:if>>입고의뢰</option>
																	<option value="202" <c:if test="${vo.searchStateCod eq 202}"> selected </c:if>>입고검사</option>
																	<option value="203" <c:if test="${vo.searchStateCod eq 203}"> selected </c:if>>입고처리</option>
																	<option value="204" <c:if test="${vo.searchStateCod eq 204}"> selected </c:if>>매입마감</option>
																</select>
															</td>
															
															<td width="100">납기기간</td>
															<td colspan="2"><input type="date"
																id="searchFromDday" name="searchFromDday"
																value="${vo.searchFromDday}" class="form-control"
																style="width: 47%; float: left" /> <span><i
																	class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="searchToDday" name="searchToDday"
																value="${vo.searchToDday}" class="form-control"
																style="width: 47%; float: right" /></td>
															
															<td width="100">입고기간</td>
															<td colspan="2"><input type="date"
																id="searchFromIboundDate" name="searchFromIboundDate"
																value="${vo.searchFromIboundDate}" class="form-control"
																style="width: 47%; float: left" /> <span><i
																	class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="searchToIboundDate" name="searchToIboundDate"
																value="${vo.searchToIboundDate}" class="form-control"
																style="width: 47%; float: right" /></td>
															
															<td width="100">마감기간</td>
															<td colspan="2"><input type="date"
																id="searchFromClosingDate" name="searchFromClosingDate"
																value="${vo.searchFromClosingDate}" class="form-control"
																style="width: 47%; float: left" /> <span><i
																	class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="searchToClosingDate" name="searchToClosingDate"
																value="${vo.searchToClosingDate}" class="form-control"
																style="width: 47%; float: right" /></td>
														</tr>
													</table>
												</div>
												<div style="text-align: end; margin-right: 0.5rem">
													<button type="button" class="btn btn-primary" onclick="paging('1')">검색</button>
												</div>
												<input type="hidden" id="page" name="page" value="1" />
											</form>
										</div>
									</div>
									<!-- 검색 FORM END -->
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th>발주번호</th>
												<th>발주일자</th>
												<th>거래처</th>
												<th colspan="2" style="text-align: center;">발주등록자</th>
												<th colspan="2" style="text-align: center;">발주담당자</th>
												<th colspan="2" style="text-align: center;">입고담당자</th>
												<th>과세구분</th>
												<th>출력회수</th>
												<th>상태</th>
												<th>납기일</th>
												<th>입고일</th>
												<th>매입마감일</th>
												<th>비고</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${poMgmtList }" var="p">
												<tr id="${p.cod }" class="poMgmtList">
													<td class="text-bold-500">${p.cod }</td>
													<td>${p.po_date }</td>
													<td>${p.clientName }</td>
													<td class="text-bold-500">${p.employee_cod_writer }</td>
													<td>${p.empNameWriter }</td>
													<td class="text-bold-500">${p.employee_cod_po }</td>
													<td>${p.empNamePo }</td>
													<td class="text-bold-500">${p.employee_cod_ibound }</td>
													<td>${p.empNameIbound }</td>
													<td class="text-bold-500">${p.taxDivName }</td>
													<td>${p.printcnt }</td>
													<td>${p.state_cod }</td>
													<td>${p.dday }</td>
													<td>${p.iboundDate }</td>
													<td>${p.closing_date }</td>
													<td class="text-bold-500">${p.note }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li>
																	<button type="button" class="dropdown-item detailModalBtn"
																		data-bs-toggle="modal" data-bs-target="#detailModal"
																		onclick="selectCod('${p.cod }')">상세보기</button>
																</li>
																<li><a class="dropdown-item"
																	href="employeeupdate?cod=${p.cod}">입고처리</a></li>
																<li>
																	<button type="button" class="dropdown-item"
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
								<a href="purchaseordermgmtinsert" style="color: white">발주등록</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
<!-- 상세페이지 모달 START -->
	<div class="modal fade" id="detailModal" tabindex="-1"
		aria-labelledby="detailModalLabel" aria-hidden="true" data-bs-backdrop='static' data-bs-keyboard='false'>
		<div class="modal-dialog modal-xl" style="width: 1400px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">수주 상세 페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onClick="Modalclose()"></button>
				</div>
				<div class="modal-body">
					<table id="detailModalHead" class="table">
						<tr>
							<th scope="col">발주번호</th>
							<td>
								<span id="codPrint" class="printBox"></span>
								<input style="display: none" id="cod" class="editBox" readonly/>
							</td>
							<th scope="col">발주일자</th>
							<td>
								<span id="poDatePrint" class="printBox"></span>
								<input type="date" style="display: none" id="poDate" class="editBox"/>
							</td>
							<th scope="col">거래처 명</th>
							<td>
								<span style="display: none"></span>
								<span id="clientNamePrint" class="printBox"></span>
								<input id="clientCod" style="display: none" class="loadValues editBox"
									data-input-id1="clientCod" data-input-id2="clientName" data-key="client" data-bs-toggle="modal"
									data-bs-target="#searchModal" readonly/>
								<input style="display: none" id="clientName" class="loadValues editBox"
									data-input-id1="clientCod" data-input-id2="clientName" data-key="client" data-bs-toggle="modal"
									data-bs-target="#searchModal" readonly/>
							</td>
							<th scope="col">과세구분</th>
							<td>
								<span id="taxDivPrint" class="printBox"></span>
								<select id="taxDiv" class="editBox" style="display: none">
								</select>
							</td>
							<th scope="col">입고일자</th>
							<td>
								<span id="iboundDatePrint" class="printBox"></span>
								<input type="date" style="display: none" id="iboundDate" class="editBox"/>
							</td>
							<th scope="col">마감일자</th>
							<td>
								<span id="closingDatePrint" class="printBox"></span>
								<input type="date" style="display: none" id="closingDate" class="editBox"/>
							</td>
						</tr>
						<tr>
							<th scope="col">발주등록자</th>
							<td>
								<span id="employeeCodWriterPrint" class="printBox"></span>
								<span id="employeeNameWriterPrint" class="printBox"></span>
								<input  style="display: none" id="employeeCodWriter" class="loadValues editBox"
									data-input-id1="employeeCodWriter" data-input-id2="employeeNameWriter" data-key="emp" data-bs-toggle="modal"
									data-bs-target="#searchModal" readonly/>
								<input style="display: none" id="employeeNameWriter" class="loadValues editBox"
									data-input-id1="employeeCodWriter" data-input-id2="employeeNameWriter" data-key="emp" data-bs-toggle="modal"
									data-bs-target="#searchModal" readonly/>
							</td>
							<th scope="col">발주담당자</th>
							<td>
								<span id="employeeCodPoPrint" class="printBox"></span>
								<span id="employeeNamePoPrint" class="printBox"></span>
								<input  style="display: none" id="employeeCodPo" class="loadValues editBox"
									data-input-id1="employeeCodPo" data-input-id2="employeeNamePo" data-key="emp" data-bs-toggle="modal"
									data-bs-target="#searchModal" readonly/>
								<input style="display: none" id="employeeNamePo" class="loadValues editBox"
									data-input-id1="employeeCodPo" data-input-id2="employeeNamePo" data-key="emp" data-bs-toggle="modal"
									data-bs-target="#searchModal" readonly/>
							</td>
							<th scope="col">입고담당자</th>
							<td>
								<span id="employeeCodIboundPrint" class="printBox"></span>
								<span id="employeeNameIboundPrint" class="printBox"></span>
								<input style="display: none" id="employeeCodIbound" class="loadValues editBox"
									data-input-id1="employeeCodIbound" data-input-id2="employeeNameIbound" data-key="emp" data-bs-toggle="modal"
									data-bs-target="#searchModal" readonly/>
								<input style="display: none" id="employeeNameIbound" class="loadValues editBox"
									data-input-id1="employeeCodIbound" data-input-id2="employeeNameIbound" data-key="emp" data-bs-toggle="modal"
									data-bs-target="#searchModal" readonly/>
							</td>
							<th scope="col">납기일</th>
							<td>
								<span id="ddayPrint" class="printBox"></span>
								<input type="date" style="display: none" id="dday" class="editBox"/>
							</td>
							<th scope="col">상태</th>
							<td>
								<span id="stateNamePrint" class="printBox"></span>
								<select id="state" class="editBox" style="display: none">
								</select>
							</td>
							<th scope="col">비고</th>
							<td>
								<span id="notePrint" class="printBox"></span>
								<input style="display: none" id="note" class="editBox"/>
							</td>
						</tr>
						</table>
						<table class="table">
						<thead>
							<tr>
								<th colspan="1">청구번호</th>
								<th colspan="1">NO.</th>
								<th colspan="1">품번</th>
								<th colspan="1" style="width: 160px;">품명</th>
								<th colspan="1">관리단위수량</th>
								<th colspan="1">관리단위</th>
								<th colspan="1">재고단위수량</th>
								<th colspan="1">재고단위</th>
								<th colspan="1">단가</th>
								<th colspan="1">공급가</th>
								<th colspan="1">부가세</th>
								<th colspan="1">합계액</th>
								<th colspan="1">삭제</th>
							</tr>
						</thead>
						<tbody id="detailList">
							
						</tbody>
						<tfoot>
							<tr>
								<th colspan="1">총 합</th>
								<td colspan="1"></td>
								<td colspan="1"></td>
								<td colspan="1"></td>
								<td colspan="1" id="totalprice"></td>
								<td colspan="1" id="totalvax"></td>
								<td colspan="1" id="totalsum"></td>
							</tr>
							<tr>
								<td colspan="6" style="border-bottom-width: 0px">
									<button type="button" class="btn btn-primary printBox" onClick="poChangeBtn()">수정</button>
									<button type="button"
										  		  class="btn btn-primary editBox"
										  		  style="display: none"
										  		  id="prodInputModalBtn"
												  data-bs-toggle="modal"
												  data-bs-target="#prodInputModal">직접입력</button>
									<button type="button"
										  		  class="btn btn-primary editBox"
										  		  id="applyInvoice"
												  data-bs-toggle="modal"
												  data-bs-target="#applyInvoiceModal">청구적용</button>
									<button type="button" style="display: none" class="btn btn-primary editBox" onClick="estimateChange()">수정완료</button>
									<button type="button" style="display: none" class="btn btn-primary editBox" onClick="poChangeDel()">취소</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				
				     
				
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" onClick="Modalclose()">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 상세페이지 모달 END  -->
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
	<!-- 거래처.사원찾기 Modal START  -->
	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="kvModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="kvModalLabel">코드-값 선택</h5>
					<input type="text" id="searchInput" class="form-control"
						placeholder="코드 또는 값을 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr id="searchModalThead">
							</tr>
						</thead>
						<tbody id="searchModalTableBody">
							<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 거래처.사원찾기 Modal END  -->
	<!-- 청구적용 Modal START  -->
	<div class="modal fade" id="applyInvoiceModal" tabindex="-1"
		aria-labelledby="kvModalLabel" aria-hidden="true" >
		<div class="modal-dialog" style="width: 1020px; max-width: none">
			<div class="modal-content" style="width: 1020px">
				<div class="modal-header">
					<h5 class="modal-title" id="kvModalLabel">검색</h5>
					<input type="text" id="applyInvoiceInput" class="form-control"
						placeholder="승인일자.청구번호.품번.품명"
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" onClick="applyInvoiceSetValue()">등록</button>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table" style="width: 1000px">
						<thead>
							<tr>
								<th></th>
								<th>승인일자</th>
								<th>청구번호</th>
								<th>NO.</th>
								<th>품번</th>
								<th>품명</th>
								<th>관리단위수량</th>
								<th>관리단위</th>
								<th>재고단위수량</th>
								<th>재고단위</th>
								<th>단가</th>
								<th>부가세</th>
								<th>공급가</th>
								<th>합계액</th>
							</tr>
						</thead>
						<tbody id="applyInvoiceModalTableBody">
							<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 청구적용 Modal END  -->
	<!-- 직접입력 Modal -->
	<div class="modal fade" id="prodInputModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-dismiss="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="prodInputModalLabel">직접입력</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<button type="button"
							id="prodSearchModalBtn"
							class="btn btn-primary"
							data-input-cod="prodCod"
							data-input-name="prodName"
							data-input-mgmtunitamount="prodMgmtUnitAmount"
							data-input-mgmtunitname="prodMgmtUnitName"
							data-input-unitamount="prodUnitAmount"
							data-input-unitname="prodUnitName"
							data-input-unitprice="prodUnitprice"
							data-input-mgmtunitcod="mgmtUnitCod"
							data-input-unitcod="unitCod"
							data-bs-toggle="modal"
							>제품찾기</button>
						<button type="button"
							id="invSearchModalBtn"
							class="btn btn-primary"
							data-input-cod="prodCod"
							data-input-name="prodName"
							data-input-mgmtunitamount="prodMgmtUnitAmount"
							data-input-mgmtunitname="prodMgmtUnitName"
							data-input-unitamount="prodUnitAmount"
							data-input-unitname="prodUnitName"
							data-input-unitprice="prodUnitprice"
							data-input-mgmtunitcod="mgmtUnitCod"
							data-input-unitcod="unitCod"
							data-bs-toggle="modal"
							data-bs-target="#invSearchModal">자재찾기</button>
					</div>
					<div>
						<span>품번</span> <input id="prodCod" type="text" readonly />
					</div>
					<div>
						<span>품명</span> <input id="prodName" type="text" readonly />
					</div>
					<div>
						<span>관리단위 수량</span> <input id="prodMgmtUnitAmount" type="number" readonly="readonly"/><span id="prodMgmtUnitName"></span>
						<input id="mgmtUnitAmount" type="hidden" />
						<input id="mgmtUnitCod" type="hidden" />
						<button type="button" onclick="prodInputAmountChange('+')">+</button>
						<button type="button" onclick="prodInputAmountChange('-')">-</button>
					</div>
					<div>
						<span>재고단위 수량</span> <input id="prodUnitAmount" type="number" disabled /><span id="prodUnitName"></span>
						<input id="unitAmount" type="hidden" />
						<input id="unitCod" type="hidden" />
					</div>
					<div>
						<span>단가</span> <input id="prodUnitprice" type="number" readonly />
					</div>
					<div>
						<span>부가세</span> <input id="prodVax" type="number" readonly />
					</div>
					<div>
						<span>공급가</span> <input id="prodSupprice" type="number" readonly />
					</div>
					<div>
						<span>합계액</span> <input id="prodTotal" type="number" readonly />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onClick="addProd()">등록</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 직접입력 Modal end -->
	<!-- 제품찾기 Modal START  -->
	<div class="modal fade" id="prodSearchModal" tabindex="-1"
		aria-labelledby="kvModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="kvModalLabel">제품검색</h5>
					<input type="text" id="prodSearchInput" class="form-control"
						placeholder="제품번호.제품명.제품그룹"
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">제품번호</th>
								<th scope="col">제품명</th>
								<th scope="col">관리단위 기본수량</th>
								<th scope="col">재고단위 기본수량</th>
								<th scope="col">제품그룹</th>
								<th scope="col">단가</th>
							</tr>
						</thead>
						<tbody id="prodSearchModalTableBody">
							<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 제품찾기 Modal END  -->
	<!-- 자재찾기 Modal START  -->
	<div class="modal fade" id="invSearchModal" tabindex="-1"
		aria-labelledby="kvModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="kvModalLabel">자재검색</h5>
					<input type="text" id="invSearchInput" class="form-control"
						placeholder="자재번호.자재명.자재그룹"
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">자재번호</th>
								<th scope="col">자재명</th>
								<th scope="col">관리단위 기본수량</th>
								<th scope="col">재고단위 기본수량</th>
								<th scope="col">자재그룹</th>
								<th scope="col">단가</th>
							</tr>
						</thead>
						<tbody id="invSearchModalTableBody">
							<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 자재찾기 Modal END  -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		let cod = "";
		function selectCod(value) {
			cod = value;
		}
		 /* 거래처.사원찾기 Modal START */
	    function setValue(cod,name,inputId1,inputId2,bool) {
		   $('#'+ inputId1).val(cod);
	       $('#'+ inputId2).val(name);
	       $('#searchModal').modal('hide');
		   if(bool === 'true') {
			    $('#detailModal').modal('show');
		   } else {
	    		$('#detailModal').modal('hide');
 			    $('.modal-backdrop').remove();
		   }			
		 }

	    function searchModal() {
	       $('.loadValues').on('click', function (e) {
	    	   const isDetailPage = e.target.className.includes('editBox');
				if(isDetailPage === true) {
					$('#searchModal').off('hide.bs.modal');
					$('#searchModal').on('hide.bs.modal', function() {
	    		    $('#detailModal').modal('show');
			 	  	});
				} else {
					$('#searchModal').off('hide.bs.modal');
					$('#searchModal').on('hide.bs.modal', function() {
					});
		    		$('#detailModal').modal('hide');
				}
	    	   let url = '';
	    	   let thead = '';
	    	   switch($(e.target).data('key')) {
	    	   	case 'client':
	    	   		url = 'clientSearch';
	    	   		thead = '<th scope="col">거래처번호</th><th scope="col">거래처명</th>';
	    	   		break;
	    	   	case 'emp':
	    	   		url = 'empSearch';
	    	   		thead = '<th scope="col">사원번호</th><th scope="col">사원명</th>';
	    	   		break;
	    	   	default:
	    	   		break;
	    	   }
	    	   $.ajax({
	             url: url,
	             method: 'GET',
	             dataType:"json",
	             success: function (data) {
	                let rows = '';
	                data.forEach(function (item) {
	                      rows +=
	                         '<tr onclick="setValue(\'' +
	                         item.cod +
	                         "','" +
	                         item.name +
	                         "','" +
	                         $(e.target).data('input-id1') +
	                         "','" +
	                         $(e.target).data('input-id2') +
	                         "','" +
	                         isDetailPage +
	                         '\')" ' +
	                         'class="searchValue" data-cod="' +
	                         item.cod +
	                         '" data-name="' +
	                         item.name +
	                         '" style= "' +
	                         'cursor: pointer' +
	                         '">' +
	                         '<td>' +
	                         item.cod +
	                         '</td>' +
	                         '<td>' +
	                         item.name +
	                         '</td>' +
	                         '</tr>';
	                         
	                });
	                $('#searchModalThead').html(thead);
	                $('#searchModalTableBody').html(rows);
	                $('#searchModal').modal('show');
	             },
	          }); 
	       });

	       $('#searchInput').on('keyup', function () {
	          var searchInputVlaue = $(this).val().toLowerCase()
	          $('.searchValue').each(function () {
	             var cod = $(this).data('cod').toLowerCase()
	             var name = $(this).data('name').toLowerCase()
	             $(this).toggle(cod.includes(searchInputVlaue) 
	            		 		|| name.includes(searchInputVlaue))
	          });
	       });
	    };
	    
	    searchModal();
	    /* 거래처.사원찾기 Modal END */
	
	    function paging(page) {		    
			let form = document.getElementById("searchForm");			
			document.getElementById("page").value = page;			
			form.submit();
		}
	    
		/* 상세페이지 Modal START */
		let prodInputKey = 1;
		
		//수정을 취소하는 함수
		function poChangeDel() {
			prodInputKey = 1;
			$('.editBox').css('display', 'none');
			$('.printBox').css('display', '');
			detailModalPrint();	
		}

		//과세구분 데이터를 가져오는 함수
		function taxDivList(defaultValue) {
			$.ajax({
				url: 'taxDivList',
				method: 'POST',
				dataType: 'json',
				success: function(data) {
					let options = '';
					$(data).each((index,item) => {
						if(defaultValue === item.cod) {
							options += '<option value="' + item.cod + '" selected>' + item.name + '</option>';
						} else {
							options += '<option value="' + item.cod + '">' + item.name + '</option>';
						}
					});
					console.log(options);
					$('#taxDiv').html(options);
				}
			});
		}
		
		//수정
		function poChangeBtn() {
			$('.printBox').css('display', 'none');
			$('.editBox').css('display', '');
		}
		
		//발주상세데이터를 삭제하는 함수
		function poDetailDel(poCod, num) {
			$.ajax({
				url: 'delPoDetailFn',
				method: 'POST',
				data: {
					poCod: poCod,
					num: num
				},
				success: function(data) {
					if(data > 0) {
						$('#' + poCod + num).remove();
						alert('삭제가 완료되었습니다.');
					}
				},
				error: function(error) {
					console.log(error);
				}
			}) ;
		 } 
		 
		//상세페이지에 값을 뿌려주는 함수
		function detailModalPrint() {
			$('.editBox').css('display', 'none');
			$('.printBox').css('display', '');
			$.ajax({
	             url: 'ajaxSelectPo',
	             method: 'POST',
	             data: {key : cod},
	             dataType:"json",
	             success: function (data) {
	            	 console.log(data);
	            	 const poValues = [
	            		 data.cod,
	            		 data.po_date,
	            		 {
	            			 cod: data.client_cod,
	            		 	 name: data.clientName
	            		 },
	            		 {
		            		 cod: data.taxdivision_cod,
		            		 name: data.taxDivName,
	            		 },
	            		 data.ibound_date,
	            		 data.closing_date,
	            		 {
	            			 cod: data.employee_cod_writer,
	            		 	 name: data.empNameWriter
	            		 },
	            		 {
	            			 cod: data.employee_cod_po,
		            		 name: data.empNamePo,
	            		 },
	            		 {
		            		 cod: data.employee_cod_ibound,
		            		 name: data.empNameIbound,
	            		 },
	            		 data.dday,
	            		 {
		            		 cod: data.state_cod,
		            		 name: data.stateName,
	            		 },
	            		 data.note
	            		 ];
	            	 $('#detailModalHead').children('tbody').children('tr').children('td').each((index,item) => {
	            		 if($(item).children('input').length === 2) {
		            		 $(item).children('span:nth-child(1)').text(poValues[index].cod);
		            		 $(item).children('span:nth-child(2)').text(poValues[index].name);
		            		 $(item).children('input:nth-child(3)').val(poValues[index].cod);
		            		 $(item).children('input:nth-child(4)').val(poValues[index].name);
	            		 } else if($(item).children('#taxDiv').length === 1) {
		            		 $(item).children('span:nth-child(1)').text(poValues[index].name);
	            			 taxDivList(poValues[index].cod); 
	            		 } else if($(item).children('#state').length === 1) {
		            		 $(item).children('span:nth-child(1)').text(poValues[index].name);
	            			 let options = '';
	            			 options += '<option value="200"'+ (poValues[index].cod == '200' ? 'selected' : '') +'>발주</option>';
	            			 options += '<option value="201"'+ (poValues[index].cod == '201' ? 'selected' : '') +'>입고의뢰</option>';
	            			 options += '<option value="202"'+ (poValues[index].cod == '202' ? 'selected' : '') +'>입고검사</option>';
	            			 options += '<option value="203"'+ (poValues[index].cod == '203' ? 'selected' : '') +'>입고처리</option>';
	            			 options += '<option value="204"'+ (poValues[index].cod == '204' ? 'selected' : '') +'>매입마감</option>';
	            		 	 $('#state').html(options);
	            		 } else {
		            		 $(item).children('span').text(poValues[index]);
		            		 $(item).children('input').val(poValues[index]);
	            		 }
	            	 });
 	             }
	          }); 
			$.ajax({
	             url: 'ajaxPoDetailList',
	             method: 'POST',
	             data: {poCod : cod},
	             dataType:"json",
	             success: function (data) {
	            	 let rows = '';
	            	 $(data).each((index, item) => {
	            		 console.log(item);
	            		 let row = '<tr id="'+ item.purchaseorder_cod + item.num +'" data-prodmgmtunitamount="' + item.prod_mgmt_unit_amount + '" data-produnitamount="' + item.prod_unit_amount + '" data-invmgmtunitamount="' + item.inv_mgmt_unit_amount + '" data-invunitamount="' + item.inv_unit_amount + '">'
	            		 row += '<td>' + (item.invoice_cod == null ? '' : item.invoice_cod) + '</td>'; 
 		            	 row += '<td>' + (item.invoicedetail_num == null ? '' : item.invoicedetail_num) + '</td>'; 
 		            	 row += '<td>' + (item.product_cod == null ? item.inventory_cod : item.product_cod) + '</td>'; 
 		            	 row += '<td>' + (item.prodname == null ? item.invname : item.prodname) + '</td>'; 
 		            	 row += '<td><span>' + item.mgmt_qty + '</span><button type="button" style="display: none" class="editBox" onClick="amountChange(' + "'+'," + "'" + item.purchaseorder_cod + item.num + "'" + ')">+</button><button type="button" style="display: none" class="editBox" onClick="amountChange(' + "'-'," + "'" + item.purchaseorder_cod + item.num + "'" + ')">-</button></td>'; 
 		            	 row += '<td>' + item.unit_mgmt_name + '</td>'; 
 		            	 row += '<td><span>' + item.inv_qty + '</span></td>'; 
 		            	 row += '<td>' + item.unit_inv_name + '</td>'; 
 		            	 row += '<td><span>' + item.unitprice + '</span></td>'; 
 		            	 row += '<td><span>' + item.suppprice + '</span></td>'; 
 		            	 row += '<td><span>' + item.vax + '</span></td>'; 
 		            	 row += '<td><span>' + item.total + '</span></td>'; 
	            		 row += '<input type="hidden" name="'+ item.prod_mgmt_unit_cod +'" value="'+ item.prod_mgmt_unit_cod +'">';
	            		 row += '<input type="hidden" name="'+ item.prod_unit_cod +'" value="'+ item.prod_unit_cod +'">';
	            		 row += '<input type="hidden" name="'+ item.inv_mgmt_unit_cod +'" value="'+ item.inv_mgmt_unit_cod +'">';
	            		 row += '<input type="hidden" name="'+ item.inv_unit_cod +'" value="'+ item.inv_unit_cod +'">';
	            		 row += '<input type="hidden" name="'+ item.name +'" value="'+ item.value +'">';
 		            	 row += '<td><button type="button" class="btn-primary" onClick="poDetailDel(' + "'" + item.purchaseorder_cod + "', " + item.num + ')">삭제</button></td></tr>'
	            		 rows += row;
	            	 });
	            	 $('#detailList').html(rows);
 	             }
	          }); 
 
		 }
	    function detailModal() {
	       $('.detailModalBtn').on('click', function () {
	    	   detailModalPrint();
	       });
 		};
 	    detailModal();
 	    
 	    /* 수량을 변경하는 함수 */
 	    function amountChange(key, id) {
 	    	const mgmtQty = $('#' + id).children('td:nth-child(5)').children('span');
 	    	const invQty = $('#' + id).children('td:nth-child(7)').children('span');
 	    	let mgmtUnitAmount = '';
 	    	let unitAmount = '';
 	    	console.log(mgmtQty.children());
 	    	console.log($('#' + id).data('invmgmtunitamount') !== 'undefined');
 	    	if($('#' + id).data('invmgmtunitamount') !== 'undefined') {
 	 	    	mgmtUnitAmount = $('#' + id).data('invmgmtunitamount');
 	 	    	unitAmount = $('#' + id).data('invunitamount');
 	    	} else {
 	 	    	mgmtUnitAmount = $('#' + id).data('prodmgmtunitamount');
 	 	    	unitAmount = $('#' + id).data('produnitamount');
 	    	}
 	    	switch(key) {
 	    	case '+':
 	    		mgmtQty.text(Number(mgmtQty.text()) + Number(mgmtUnitAmount));
 	    		invQty.text(Number(invQty.text()) + Number(unitAmount));
 	    		poDetailTotalCal(mgmtUnitAmount, id);
 	 	    	console.log(mgmtQty.text() + '    ' + invQty.text() + '    ' + mgmtUnitAmount + '    ' + unitAmount);
 	    		break;
 	    	case '-':
 	    		if(Number(mgmtQty.text()) - mgmtUnitAmount !== 0) {
 	    			mgmtQty.text(Number(mgmtQty.text()) - Number(mgmtUnitAmount));
 	 	    		invQty.text(Number(invQty.text()) - Number(unitAmount));
 	 	    		poDetailTotalCal(mgmtUnitAmount, id);
 	    		}
 	    		break;
 			default:
 				break;
 	    	}
 	    }
 	    
 	   /* 발주상세 Modal에서 부가세.공급가.합계액을 계산해주는 함수 */
 	    function poDetailTotalCal(amount, id) {
 	    	const unitprice = Number($('#' + id).children('td:nth-child(9)').children('span').text());
 	    	const qty =  Number($('#' + id).children('td:nth-child(5)').children('span').text() / amount);
 	    	const supprice = unitprice * qty;
 	    	const vax = supprice/10;
 	    	const total = supprice + vax;
 	    	console.log(unitprice + '    ' + qty + '    ' + supprice + '    ' + vax + '    ' + total + '    ' );
 	    	$('#' + id).children('td:nth-child(10)').children('span').text((supprice));
 	    	$('#' + id).children('td:nth-child(11)').children('span').text((vax));
 	    	$('#' + id).children('td:nth-child(12)').children('span').text((total));
 	    }

 	//직접입력 Modal START
 	
 	$('#prodInputModal').on('hidden.bs.modal', function() {
    	if($('#prodSearchModal').css('display') === 'block' || $('#invSearchModal').css('display') === 'block') {
     		$('#detailModal').modal('hide');
    	} else {
     		$('#detailModal').modal('show');
    	}
 	});

 	/* 직접입력에서 수량을 변경하는 함수 */
    function prodInputAmountChange(key) {
    	const prodMgmtUnitAmount = $('#prodMgmtUnitAmount');
    	const prodUnitAmount = $('#prodUnitAmount');
    	const mgmtUnitAmount = Number($('#mgmtUnitAmount').val());
    	const unitAmount = Number($('#unitAmount').val());
    	switch(key) {
    	case '+':
    		prodMgmtUnitAmount.val(Number(prodMgmtUnitAmount.val()) + mgmtUnitAmount);
    		prodUnitAmount.val(Number(prodUnitAmount.val()) + unitAmount);
    		totalCal(mgmtUnitAmount);
    		break;
    	case '-':
    		if(prodMgmtUnitAmount.val() - mgmtUnitAmount !== 0) {
    			prodMgmtUnitAmount.val(Number(prodMgmtUnitAmount.val()) - mgmtUnitAmount);
        		prodUnitAmount.val(Number(prodUnitAmount.val()) - unitAmount);
        		totalCal(mgmtUnitAmount);
    		}
    		break;
		default:
			break;
    	}
    }
 	
 	/* 제품찾기 Modal START */
    $('#prodSearchModal').on('hide.bs.modal', function() {
    	 $('#prodInputModal').modal('show');
   	});
    
    function prodSearchSetValue(cod,name,mgmtUnitAmount,mgmtUnitName,unitAmount,unitName,unitprice,mgmtUnitCod,unitCod,...inputIds) {
   	   $('#prodSearchModal').modal('hide');
       const inputs = [cod,name,mgmtUnitAmount,mgmtUnitName,unitAmount,unitName,unitprice,mgmtUnitCod,unitCod];
       inputIds.forEach((item,index) => {
    	   if(item === 'prodMgmtUnitName' || item === 'prodUnitName') {
    	    	$('#'+ item).text(inputs[index]);   
    	   } else {
    	    	$('#'+ item).val(inputs[index]);   
    	   }
	   })
	   $('#mgmtUnitAmount').val(mgmtUnitAmount);
	   $('#unitAmount').val(unitAmount);
	   totalCal(mgmtUnitAmount);
       $('#prodInputModal').modal('show');
   	}

    function prodSearchModal() {
       $('#prodSearchModalBtn').on('click', function (e) {
    	   $.ajax({
             url: 'prodSearch',
             method: 'GET',
             dataType:"json",
             success: function (data) {
                let rows = '';
                data.forEach(function (item) {
                      rows +=
                         '<tr onclick="prodSearchSetValue(\'' +
                         item.cod +
                         "','" +
                         item.prodname +
                         "','" +
                         item.mgmt_unit_amount +
                         "','" +
                         item.mgmtUnitName +
                         "','" +
                         item.unit_amount +
                         "','" +
                         item.unitName +
                         "','" +
                         item.unitprice +
                         "','" +
                         item.mgmt_unit_cod +
                         "','" +
                         item.unit_cod +
                         "','" +
                         $(e.target).data('input-cod') +
                         "','" +
                         $(e.target).data('input-name') +
                         "','" +
                         $(e.target).data('input-mgmtunitamount') +
                         "','" +
                         $(e.target).data('input-mgmtunitname') +
                         "','" +
                         $(e.target).data('input-unitamount') +
                         "','" +
                         $(e.target).data('input-unitname') +
                         "','" +
                         $(e.target).data('input-unitprice') +
                         "','" +
                         $(e.target).data('input-mgmtunitcod') +
                         "','" +
                         $(e.target).data('input-unitcod') +
                         '\')" ' +
                         'class="searchValue" data-cod="' +
                         item.cod +
                         '" data-prodname="' +
                         item.prodname +
                         '" data-prodgroupName="' +
                         item.prodgroupName +
                         '" style= "' +
                         'cursor: pointer' +
                         '">' +
                         '<td>' +
                         item.cod +
                         '</td>' +
                         '<td>' +
                         item.prodname +
                         '</td>' +
                         '<td>' +
                         item.mgmt_unit_amount + item.mgmtUnitName +
                         '</td>' +
                         '<td>' +
                         item.unit_amount + item.unitName +
                         '</td>' +
                         '<td>' +
                         item.prodgroupName +
                         '</td>' +
                         '<td>' +
                         item.unitprice +
                         '</td>' +
                         '</tr>';
                         
                });
                $('#prodSearchModalTableBody').html(rows);
                $('#prodSearchModal').modal('show');
             },
          }); 
       });

       $('#prodSearchInput').on('keyup', function () {
           var searchInputVlaue = $(this).val().toLowerCase()
           $('.searchValue').each(function () {
              var cod = $(this).data('cod').toLowerCase()
              var prodname = $(this).data('prodname').toLowerCase()
              var prodgroupName = $(this).data('prodgroupName').toLowerCase()
              $(this).toggle(cod.includes(searchInputVlaue) 
             		 		|| prodname.includes(searchInputVlaue)
             		 		|| prodgroupName.includes(searchInputVlaue))
           });
        });
     };
    
    prodSearchModal();
    /* 제품찾기 Modal END */
    
    /* 자재찾기 Modal START */
    $('#invSearchModal').on('hide.bs.modal', function() {
   		 $('#prodInputModal').modal('show');
    });
    
    function invSearchSetValue(cod,name,mgmtUnitAmount,mgmtUnitName,unitAmount,unitName,unitprice,mgmtUnitCod,unitCod,...inputIds) {
       $('#prodMgmtUnitAmount').val(mgmtUnitAmount);
       $('#invSearchModal').modal('hide');
       const inputs = [cod,name,mgmtUnitAmount,mgmtUnitName,unitAmount,unitName,unitprice,mgmtUnitCod,unitCod];
       inputIds.forEach((item,index) => {
     	   if(item === 'prodMgmtUnitName' || item === 'prodUnitName') {
     	    	$('#'+ item).text(inputs[index]);   
     	   } else {
     	    	$('#'+ item).val(inputs[index]);   
     	   }
 	   });

       $('#mgmtUnitAmount').val(mgmtUnitAmount);
	   $('#unitAmount').val(unitAmount);
		totalCal(mgmtUnitAmount);
	   $('#prodInputModal').modal('show');
   		}

    function invSearchModal() {
       $('#invSearchModalBtn').on('click', function (e) {
    	   $.ajax({
             url: 'invSearch',
             method: 'GET',
             dataType:"json",
             success: function (data) {
                let rows = '';
                data.forEach(function (item) {
                      rows +=
                    	  '<tr onclick="invSearchSetValue(\'' +
                          item.cod +
                          "','" +
                          item.name +
                          "','" +
                          item.mgmt_unit_amount +
                          "','" +
                          item.mgmtUnitName +
                          "','" +
                          item.unit_amount +
                          "','" +
                          item.unitName +
                          "','" +
                          item.unitprice +
                          "','" +
                          item.mgmt_unit_cod +
                          "','" +
                          item.unit_cod +
                          "','" +
                          $(e.target).data('input-cod') +
                          "','" +
                          $(e.target).data('input-name') +
                          "','" +
                          $(e.target).data('input-mgmtunitamount') +
                          "','" +
                          $(e.target).data('input-mgmtunitname') +
                          "','" +
                          $(e.target).data('input-unitamount') +
                          "','" +
                          $(e.target).data('input-unitname') +
                          "','" +
                          $(e.target).data('input-unitprice') +
                          "','" +
                          $(e.target).data('input-mgmtunitcod') +
                          "','" +
                          $(e.target).data('input-unitcod') +

                          '\')" ' +
                          'class="searchValue" data-cod="' +
                          item.cod +
                          '" data-name="' +
                          item.name +
                          '" data-prodgroupName="' +
                          item.prodgroupName +
                          '" style= "' +
                          'cursor: pointer' +
                          '">' +
                          '<td>' +
                          item.cod +
                          '</td>' +
                          '<td>' +
                          item.name +
                          '</td>' +
                          '<td>' +
                          item.mgmt_unit_amount + item.mgmtUnitName +
                          '</td>' +
                          '<td>' +
                          item.unit_amount + item.unitName +
                          '</td>' +
                          '<td>' +
                          item.prodgroupName +
                          '</td>' +
                          '<td>' +
                          item.unitprice +
                          '</td>' +
                          '</tr>';
                         
                });
                $('#invSearchModalTableBody').html(rows);
                $('#invSearchModal').modal('show');
             },
          }); 
       });

       $('#invSearchInput').on('keyup', function () {
           var searchInputVlaue = $(this).val().toLowerCase()
           $('.searchValue').each(function () {
              var cod = $(this).data('cod').toLowerCase()
              var name = $(this).data('name').toLowerCase()
              var productgroupCod = $(this).data('productgroup-cod').toLowerCase()
              $(this).toggle(cod.includes(searchInputVlaue) 
             		 		|| name.includes(searchInputVlaue)
             		 		|| productgroupCod.includes(searchInputVlaue))
           });
        });
     };
    
    invSearchModal();
    /* 자재찾기 Modal END */
    
    
    /* 주문제품목록에 항목을 추가하는 함수 */
    function addProd() {
    	const cod = $('#prodCod').val();
    	const name = $('#prodName').val();
    	const mgmtUnitAmount = $('#mgmtUnitAmount').val();
    	const unitAmount = $('#unitAmount').val();
    	const mgmtQty = $('#prodMgmtUnitAmount').val();
    	const invQty = $('#prodUnitAmount').val();
    	const mgmtUnitCod = $('#mgmtUnitCod').val();
    	const unitCod = $('#unitCod').val();
    	const mgmtUnitName = $('#prodMgmtUnitName').text();
    	const unitName = $('#prodUnitName').text();
    	const unitprice = $('#prodUnitprice').val();
    	const vax = $('#prodVax').val();
    	const supprice = $('#prodSupprice').val();
    	const total = $('#prodTotal').val();
    	let amounts = '';
    	const values = [
    		{
    			name: 'productCod',
    			value: cod
    		},
    		{
        		name: '',
        		value: name
    		},
    		{
        		name: 'mgmtQty',
        		value: mgmtQty
    		},
    		{
        		name: '',
        		value: unitName
    		},
        	{
        		name: 'invQty',
        		value: invQty
    		},
    		{
        		name: '',
        		value: mgmtUnitName
    		},
        	{
        		name: 'unitprice',
        		value: unitprice
    		},
    		{
        		name: 'supprice',
        		value: supprice
    		},
    		{
        		name: 'vax',
        		value: vax
    		},
        	{
        		name: 'total',
        		value: total
    		},
    		{
        		name: 'unitMgmt',
        		value: mgmtUnitCod
    		},
    		{
        		name: 'unitInv',
        		value: unitCod
    		}
    	    ];
    	if(name.includes('inv') === true) {
    		amounts = 'data-prodmgmtunitamount="undefined" data-produnitamount="undefined" data-invmgmtunitamount="'+ mgmtUnitAmount +'" data-invunitamount="' + unitAmount + '"';
    	} else {
    		amounts = 'data-prodmgmtunitamount="' + mgmtUnitAmount + '" data-produnitamount="' + unitAmount + '" data-invmgmtunitamount="undefined" data-invunitamount="undefined"';
    	}
    	let rows = '<tr id="' + prodInputKey +'" class="prodList" ' + amounts + '><td></td><td></td>';
    	values.forEach((item,index) => {
    		if(item.name === 'unitMgmt' || item.name === 'unitInv') {
            	rows += '<input type="hidden" name="'+ item.name +'" value="'+ item.value +'">';
    		} else if(item.name === 'mgmtQty') {
            	rows += '<td><input type="hidden" name="'+ item.name +'" value="'+ item.value +'"><span>' + item.value + '</span><button type="button" class="editBox" onClick="amountChange(' + "'+'," + "'" + prodInputKey + "'" + ')">+</button><button type="button" class="editBox" onClick="amountChange(' + "'-'," + "'" + prodInputKey + "'" + ')">-</button></td>';
    		} else {
            	rows += '<td><input type="hidden" name="'+ item.name +'" value="'+ item.value +'"><span>' + item.value + '</span></td>';
    		}
    	})
    	prodInputKey++;
    	rows += '<td><button type="button" aria-label="Close" onClick="{delProd(event)}">삭제</button></td></tr>';
    	$('#detailList').append(rows);
    	$('#prodInputModal').modal('hide');
    	$('#detailModal').modal('show');
    }
    
    /* 주문제품목록에 있는 항목을 삭제하는 함수 */
    function delProd(e) {
    	e.target.parentElement.parentElement.remove();
    }
    
    
    /* 직접입력 Modal에서 부가세.공급가.합계액을 계산해주는 함수 */
    function totalCal(amount) {
    	const unitprice = Number($("#prodUnitprice").val());
    	const qty = Number($("#prodMgmtUnitAmount").val() / amount);
    	const supprice = unitprice * qty;
    	const vax = supprice/10;
    	const total = supprice + vax;
    	$('#prodVax').val(vax);
    	$('#prodSupprice').val(supprice);
    	$('#prodTotal').val(total);
    }
    
    
    //직접입력 Modal END
    
    
    
    
    
    /* 청구적용 Modal START */
    
    $('#applyInvoiceModal').on('hide.bs.modal', function() {
    	$('#detailModal').modal('show');
    });
    
    function rowChk(key) {
    	if($('#' + key).is(':checked') == true) {
    		$('#' + key).prop('checked', false);
    	} else {
    		$('#' + key).prop('checked', true);
    	}
    };
    
    function applyInvoiceSetValue() {
    	let keyList = [];
    	$('.applyInvoiceProd').each((index, value) => {
				keyList.push($(value).data('key'));
    	   });
    	let rows = '';
    	$('.applyInvoiceChkBox').each((index, item) => {
    		var invoiceCod = $(item).data('invoice-cod');
    		var invoicedetailNum = $(item).data('invoicedetail-num');
    		var productCod = $(item).data('product-cod');
            var prodname = $(item).data('prodname');
            var invQty = $(item).data('inv-qty');
            var unitCod = $(item).data('unit-cod');
            var unitName = $(item).data('unit-name');
            var invMgmtQty = $(item).data('inv-mgmt-qty');
            var mgmtUnitCod = $(item).data('mgmt-unit-cod');
            var mgmtUnitName = $(item).data('mgmt-unit-name');
            var unitprice = $(item).data('unitprice');
            var vax = $(item).data('vax');
            var supprice = $(item).data('supprice');
            var total = $(item).data('total');
            var key = $(item).data('key');
            const values = [
        		{
        			name: 'productCod',
        			value: productCod
        		},
            	{
        			name: 'invoiceCod',
        			value: invoiceCod
        		},
            	{
        			name: 'invoicedetailNum',
        			value: invoicedetailNum
        		},
        		{
            		name: '',
            		value: prodname
        		},
            	{
            		name: 'invQty',
            		value: invQty
        		},
        		{
            		name: 'unitInv',
            		value: unitCod
        		},
        		{
            		name: '',
            		value: unitName
        		},
        		{
            		name: 'mgmtQty',
            		value: invMgmtQty
        		},
        		{
            		name: 'unitMgmt',
            		value: mgmtUnitCod
        		},
        		{
            		name: '',
            		value: mgmtUnitName
        		},
            	{
            		name: 'unitprice',
            		value: unitprice
        		},
            	{
            		name: 'vax',
            		value: vax
        		},
            	{
            		name: 'supprice',
            		value: supprice
        		},
            	{
            		name: 'total',
            		value: total
        		}
        		];
        	if(prodname.includes('inv') === true) {
        		amounts = 'data-prodmgmtunitamount="undefined" data-produnitamount="undefined" data-invmgmtunitamount="'+ mgmtUnitAmount +'" data-invunitamount="' + unitAmount + '"';
        	} else {
        		amounts = 'data-prodmgmtunitamount="' + mgmtUnitAmount + '" data-produnitamount="' + unitAmount + '" data-invmgmtunitamount="undefined" data-invunitamount="undefined"';
        	}

    		if(item.checked === true && keyList.indexOf(key) !== -1) {
    			return true;
    		} 
    		else if(item.checked === false) {
    			$('tr[data-key="'+ key +'"]').remove();
    		}
    		else {
                let row = '<tr class="applyInvoiceProd prodList" data-key="'+ key +'">';
                values.forEach((data) => {
                	if(data.name === 'unitInv' || data.name === 'unitMgmt' || data.name === 'invoiceCod' || data.name === 'invoicedetailNum') {
        				row += '<input type="hidden" name="'+ data.name +'" value="'+ data.value +'"/>'	
        			} else {
                    	rows += '<td><input type="hidden" name="'+ data.name +'" value="'+ data.value +'"><span>' + data.value + '</span><button type="button" class="editBox" onClick="amountChange(' + "'+'," + "'" + prodInputKey + "'" + ')">+</button><button type="button" class="editBox" onClick="amountChange(' + "'-'," + "'" + prodInputKey + "'" + ')">-</button></td>';
        			}
                });
            	row += '<td><button type="button" aria-label="Close" onClick="{delProd(event)}">삭제</button></td></tr>';
                rows += row;    			
    		}
    	});
       $('#detailList').append(rows);    
       $('#applyInvoiceModal').modal('hide');
       $('.modal-backdrop').remove();
    }

    function applyInvoiceModal() {
       $('#applyInvoice').on('click', function () {
    	   $.ajax({
             url: 'applyInvoice',
             method: 'GET',
             dataType:"json",
             success: function (data) {
                let rows = '';
                data.forEach(function (item) {
                      rows +=
                         '<tr class="searchValue" data-inq-date="' +
                         item.inq_date +
                         '" data-invoice-cod="' +
                         item.invoice_cod +
                         '" data-invoicedetail-num="' +
                         item.invoicedetail_num +
                         '" data-product-cod="' +
                         item.product_cod +
                         '" data-prodname="' +
                         item.prodname +
                         '" onClick="rowChk('+ "'" + item.invoice_cod + item.num + "'" + ')">' +
                         '<td><input type="checkbox" class="applyInvoiceChkBox"' +
                         'id="' +
                         item.invoice_cod + item.num +
                         '" data-invoice-cod="' +
                         item.invoice_cod +
                         '" data-invoicedetail-num="' +
                         item.num +
                         '" data-product-cod="' +
                         item.product_cod +
                         '" data-prodname="' +
                         item.prodname +
                         '" data-inventory-cod="' +
                         item.product_cod +
                         '" data-prodname="' +
                         item.prodname +
                         '" data-unitprice="' +
                         item.unitprice +
                         '" data-vax="' +
                         item.vax +
                         '" data-supprice="' +
                         item.supprice +
                         '" data-total="' +
                         item.total +
                         '" data-inv-qty="' +
                         item.inv_qty +
                         '" data-unit-cod="' +
                         item.unit_cod +
                         '" data-unit-name="' +
                         item.unit_name +
                         '" data-inv-mgmt-qty="' +
                         item.inv_mgmt_qty +
                         '" data-mgmt-unit-cod="' +
                         item.mgmt_unit_cod +
                         '" data-mgmt-unit-name="' +
                         item.mgmt_unit_name +
                         '" data-key="' +
                         item.invoice_cod + item.num +
                         '" ' +
                         '/></td>' +
                         '<td>' +
                         item.inq_date +
                         '</td>' +
                         '<td>' +
                         item.invoice_cod +
                         '</td>' +
                         '<td>' +
                         item.num +
                         '</td>' +
                         '<td>' +
                         item.product_cod +
                         '</td>' +
                         '<td>' +
                         item.prodname +
                         '</td>' +
                         '<td>' +
                         item.inv_mgmt_qty +
                         '</td>' +
                         '<td>' +
                         item.mgmt_unit_name +
                         '</td>' +
                         '<td>' +
                         item.inv_qty +
                         '</td>' +
                         '<td>' +
                         item.unit_name +
                         '</td>' +
                         '<td>' +
                         item.unitprice +
                         '</td>' +
                         '<td>' +
                         item.vax +
                         '</td>' +
                         '<td>' +
                         item.supprice +
                         '</td>' +
                         '<td>' +
                         item.total +
                         '</td>' +
                         '</tr></label>';
                         
                });
                $('#applyInvoiceModalTableBody').html(rows);
                $('#applyInvoiceModal').modal('show');
             },
          }); 
       });

       $('#applyInvoiceInput').on('keyup', function () {
          var searchInputVlaue = $(this).val().toLowerCase()
          $('.searchValue').each(function (index,item) {
             const inqDate = $(item).data('inq-date').toLowerCase();
             const invoiceCod = $(this).data('invoice-cod').toLowerCase()
             const productCod = $(this).data('product-cod').toLowerCase()
             const prodname = $(this).data('prodname').toLowerCase()
             $(this).toggle(inqDate.includes(searchInputVlaue) 
            		 		|| invoiceCod.includes(searchInputVlaue)
            		 		|| productCod.includes(searchInputVlaue)
            		 		|| prodname.includes(searchInputVlaue))
          });
       });
    };
    
    applyInvoiceModal();
    /* 청구적용 Modal END */
 	   
 	    /* 상세페이지 Modal END */

	</script>
</body>
</html>

