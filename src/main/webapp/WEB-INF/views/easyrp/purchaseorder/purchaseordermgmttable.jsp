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
															<td width="100">마감구분</td>
															<td>
																<select name="searchClosing">
																	<option value="">전체</option>
																	<option value="Y">마감</option>
																	<option value="N">미마감</option>
																</select>
															</td>
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
												<th>마감구분</th>
												<th>마감일자</th>
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
													<td class="text-bold-500">${p.closing }</td>
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
																	<button type="button" class="dropdown-item"
																		data-bs-toggle="modal" data-bs-target="#quitRegisModal"
																		onclick="selectCod('${p.cod }')">퇴사등록</button>
																</li>
																<li><a class="dropdown-item"
																	href="employeeupdate?cod=${p.cod}">수정</a></li>
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
	<!-- 공통 사용 테이블 END -->
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
		const selectCod = (value) => {
			cod = value;
		}
		 /* 거래처.사원찾기 Modal START */
	    function setValue(cod,name,inputId1,inputId2) {
	       $('#'+ inputId1).val(cod);
	       $('#'+ inputId2).val(name);
	       $('#searchModal').modal('hide');
	       $('.modal-backdrop').remove();
	    }

	    function searchModal() {
	       $('.loadValues').on('click', function (e) {
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
	</script>
</body>
</html>

