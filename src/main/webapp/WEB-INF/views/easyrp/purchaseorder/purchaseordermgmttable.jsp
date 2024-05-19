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
									<button type="button" style="display: none" class="btn btn-primary editBox" onClick="estimateChange()">직접입력</button>
									<button type="button" style="display: none" class="btn btn-primary editBox" onClick="estimateChange()">청구적용</button>
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
		
		//수정을 취소하는 함수
		function poChangeDel() {
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
	            		 let row = '<tr id="'+ item.purchaseorder_cod + item.num +'">'
 		            	 row += '<td>' + (item.invoice_cod == null ? '' : item.invoice_cod) + '</td>'; 
 		            	 row += '<td>' + (item.invoicedetail_num == null ? '' : item.invoicedetail_num) + '</td>'; 
 		            	 row += '<td>' + (item.product_cod == null ? item.inventory_cod : item.product_cod) + '</td>'; 
 		            	 row += '<td>' + (item.prodname == null ? item.invname : item.prodname) + '</td>'; 
 		            	 row += '<td>' + item.mgmt_qty + '</td>'; 
 		            	 row += '<td>' + item.unit_mgmt_name + '</td>'; 
 		            	 row += '<td>' + item.inv_qty + '</td>'; 
 		            	 row += '<td>' + item.unit_inv_name + '</td>'; 
 		            	 row += '<td>' + item.unitprice + '</td>'; 
 		            	 row += '<td>' + item.suppprice + '</td>'; 
 		            	 row += '<td>' + item.vax + '</td>'; 
 		            	 row += '<td>' + item.total + '</td>'; 
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
 	    function amountChange(key) {
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

 	    /* 상세페이지 Modal END */

	</script>
</body>
</html>

