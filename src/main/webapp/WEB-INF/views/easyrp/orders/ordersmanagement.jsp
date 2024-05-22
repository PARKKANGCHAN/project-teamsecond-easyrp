<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<!-- (2024년 4월 30일 추가 박현우) -->
	<!-- 공통 사용 테이블 START -->
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
						<h3><a href="/easyrp/ordersmanagement">수주 테이블</a></h3>
						<p class="text-subtitle text-muted">수주 목록</p>
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
											</div>
											<form id="searchForm" action="ordersmanagement" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">수주 번호</td>
															<td><input type="text" id="searchCod"
																name="cod" class="form-control"
																value="${cod}"
																placeholder="수주 번호를 입력해주세요." /></td>
															<td width="100">고객 번호</td>
															<td><input type="text" id="searchClientCod"
																name="clientCod" class="form-control"
																value="${clientCod}"
																placeholder="고객 번호를 입력해주세요." /></td>
															<td width="100">담당자 번호</td>
															<td><input type="text" id="searchEmployeeCod"
																name="employeeCod" class="form-control"
																value="${employeeCod}"
																placeholder="담당자 번호를 입력해주세요." /></td>
															
														</tr>
														<tr>
															<td width="100">등록 일자</td>
															<td colspan="1">
																<input type="date" id="preSearchDate" name="preSearchDate" value="${preSearchDate}" class="form-control" style="width: 47%; float: left" />
																	<span>
																		<i class="fa-solid fa-arrow-right" style="margin-top: 10px"></i>
																	</span> 
																<input type="date" id="postSearchDate" name="postSearchDate" value="${postSearchDate}" class="form-control" style="width: 47%; float: right" />
															</td>
																
															<td width="100">납기 일자</td>
															<td colspan="1">
																<input type="date" id="ddaypreSearchDate" name="ddaypreSearchDate" value="${ddaypreSearchDate}" class="form-control" style="width: 47%; float: left" />
																	<span>
																		<i class="fa-solid fa-arrow-right" style="margin-top: 10px"></i>
																	</span> 
																<input type="date" id="ddaypostSearchDate" name="ddaypostSearchDate" value="${ddaypostSearchDate}" class="form-control" style="width: 47%; float: right" />
															</td>
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
												<th width="5%">수주번호</th>
												<th width="6%">등록일자</th>
												<th width="6%">납기일</th>
												<th width="5%">고객번호</th>
											 	<th width="5%">담당자번호</th>
												<th width="8%">금액</th>
												<th width="5%">부가세</th>
												<th width="8%">총 액</th>
												<th width="5%"></th>
												<th width="8%"></th>
												<th width="7.5%">설 정</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${orders }" var="orders" >
												<tr>
													<td class="text-bold-500">
    													<a href="#" id="loadDetail" data-bs-toggle="modal" data-bs-target="#detailModal" onclick="orderDetail('${orders.cod}')">${orders.cod}</a>
													</td>
													<td><fmt:formatDate value="${orders.orderDate}" pattern="yyyy-MM-dd" /></td>
													<td><fmt:formatDate value="${orders.dday}" pattern="yyyy-MM-dd" /></td>
													<td>${orders.clientCod }</td>
													<td class="text-bold-500">${orders.employeeCod }</td>
													<td><fmt:formatNumber value="${orders.subtotal}" pattern="###,###"></fmt:formatNumber></td>
													<td>10%</td>
													<td><fmt:formatNumber value="${orders.total}" pattern="###,###"></fmt:formatNumber></td>
													<td id="warehouseIcon" style="color : red">
														<c:if test="${orders.instockyn == 'Y'}">
															입고!!
														</c:if>
													</td>
													<td>
													<c:if test="${orders.outboundState == 'Y' and orders.isSpecification == 'N'}">
														<a href="orderspecification?orderCod=${orders.cod}"><button type="button" class="btn btn-primary">거래명세서 발급</button></a>
													</c:if>
													<c:if test="${orders.outboundState == 'Y' and orders.isSpecification == 'Y'}">
														<button type="button" class="btn btn-primary"><a href="orderspecification?orderCod=${orders.cod}">거래명세서 재발급</a></button>
													</c:if>
													</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="ordersdeleteFn?cod=${orders.cod}">삭제</a></li>
																<li><a class="dropdown-item" href="#" id="loadDetail" data-bs-toggle="modal" data-bs-target="#detailModal" onclick="orderDetail('${orders.cod}')">
																	상세 보기
																	</a>
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
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#RegisterModal">
								등록
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
<!-- 	공통 사용 테이블 END -->
	
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
				<div class="modal-body overflow-y-auto" style="height: 60vh">
					<table class="table">
						<tr>
							<th scope="col">수주 번호</th>
							<td id="orderCod"></td>
							<th scope="col">거래처 명</th>
							<td id="clientName"></td>
							<th scope="col">수주 날짜</th>
							<td id="orderDate"></td>
							<th scope="col">납기일</th>
							<td id="dday"></td>
							<td></td>
						</tr>
						<tr>
							<th scope="col">수주 담당 부서</th>
							<td id="orderDept"></td>
							<th scope="col">수주 담당 사원코드</th>
							<td id="orderEmpCod"></td>
							<th scope="col">수주 담당자 명</th>
							<td id="orderEmpName"></td>
							<td></td>
						</tr>
						</table>
						<table class="table">
						<tr id="detailList">
							<th colspan="1">상품 코드</th>
							<th colspan="1" style="width: 160px;">상품 명</th>
							<th colspan="1">가용재고량</th>
							<th colspan="1">수주 수량</th>
							<th colspan="1">남은 수주 수량</th>
							<th colspan="1">단 가</th>
							<th colspan="1">공급가액</th>
							<th colspan="1">부가세</th>
							<th colspan="1">금 액</th>
							<th colspan="1">출고 상태</th>
							<th colspan="1">출고</th>

						<tr>
							<th colspan="1">총 합</th>
							<td colspan="1"></td>
							<td colspan="1"></td>
							<td colspan="1"></td>
							<td colspan="1"></td>
							<td colspan="1"></td>
							<td colspan="1" id="totalprice"></td>
							<td colspan="1" id="totalvax"></td>
							<td colspan="1" id="totalsum"></td>
						</tr>
<!-- 						<tr>
							<td colspan="6" style="border-bottom-width: 0px">
								<button type="button" class="btn btn-primary">전표 생성</button>
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-primary" onClick="estimateChange()">수주 수정</button>
                                <button type="button" class="btn btn-primary" id="addRowButton" onClick="addRow()">제품 추가</button>
							</td>
						</tr> -->
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
	
		<!-- 등록페이지 모달 START -->
	<div class="modal fade" id="RegisterModal" tabindex="-1"
		aria-labelledby="detailModalLabel" aria-hidden="true" data-bs-backdrop='static' data-bs-keyboard='false'>
		<div class="modal-dialog modal-xl" style="width: 1400px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">수주 등록 페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onClick="registerModalclose()"></button>
				</div>
				<div class="modal-body  overflow-y-auto" style="height: 60vh">
					<table class="table">
						<tr>
							<th scope="col" style='vertical-align : middle'>납기일</th>
							<td>
								<input type="date" class="form-control" name="ddayInput" id="ddayInput" style="width : 140px" required/>
							</td>
							<th scope="col" style='vertical-align : middle'>거래처 명</th>
							<td>
								<input type="text" readonly="readonly" class="form-control" name="registerClientName"  id="registerClientName" placeholder="거래처 선택" style="width: 140px;" onClick="clientModalOpen()" required />
							</td>
							<th scope="col" style='vertical-align : middle'>견적 불러오기</th>
							<td>
								<input type="text" readonly="readonly" class="form-control" name="registerEstimate" id="registerEstimate" placeholder="견적 불러오기" style="width: 140px;" onClick="estimateModalOpen()" />								
							</td>
							
						</tr>
						<tr>
							<th scope="col">수주 담당 부서</th>
							<td id="orderDept">${empDeptCode}</td>
							<th scope="col">수주 담당 사원코드</th>
							<td id="orderEmp1">${empCode }</td>
							<th scope="col">수주 담당자 명</th>
							<td id="orderEmpName">${empName }</td>
							<td></td>
						</tr>
						</table>
						<table class="table">
						<tr id="RegisterList">
							<th colspan="1">상품 코드</th>
							<th colspan="1" style="width: 160px;">상품 명</th>
							<th colspan="1" style="width: 120px;">수 량</th>
							<th colspan="1" style="width: 120px;">단 가</th>
							<th colspan="1">공급가액</th>
							<th colspan="1">부가세</th>
							<th colspan="1">금 액</th>
							<th colspan="1" style="width: 80px;"></th>
						</tr>
						<tbody id="OrderRegistermodalTableBody">

                        </tbody>
						<tr>
							<th colspan="1">총 합</th>
							<td colspan="1"></td>
							<td colspan="1"></td>
							<td colspan="1"></td>
							<td colspan="1" id="totalpriceRegister"></td>
							<td colspan="1" id="totalvaxRegister"></td>
							<td colspan="1" id="totalsumRegister"></td>
						</tr>
						<tr>
							<td colspan="6" style="border-bottom-width: 0px">
                                <button type="button" class="btn btn-primary" id="registeraddRowButton" onClick="registeraddRow()">제품 추가</button>
                                <button type="button" class="btn btn-primary" id="registerEstimate1" onClick="OrderRegister()">수주 등록</button>                                
							</td>
						</tr>
					</table>
				</div>
				
				     
				
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" onClick="registerModalclose()">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록페이지 모달 END  -->
	
	<!-- estimate Modal START  -->
	 <div class="modal fade" id="estimateModal" tabindex="-1" aria-labelledby="kvModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="kvModalLabel">코드-상품 선택</h5>
                  <input
                     type="text"
                     id="searchInput"
                     class="form-control"
                     placeholder="코드 또는 거래처명을 입력해주세요."
                     style="margin-left: 10px; width: auto; flex-grow: 1"
                  />
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body overflow-y-auto" style="height: 70vh">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">Index</th>
                           <th scope="col">Code</th>
                           <th scope="col">거래처명</th>
                           <th scope="col">견적날짜</th>
                           <th scope="col">담당자</th>
                        </tr>
                     </thead>
                     <tbody id="EstimatemodalTableBody">
<!--                         여기에 Ajax로 만든 html 속성이 들어감  -->
                     </tbody>
                  </table>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
<!--       estimate Modal END  -->

	<!-- clientName Modal START  -->
	 <div class="modal fade" id="clientNameModal" tabindex="-1" aria-labelledby="kvModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="kvModalLabel">코드-상품 선택</h5>
                  <input
                     type="text"
                     id="searchInput"
                     class="form-control"
                     placeholder="코드 또는 거래처명을 입력해주세요."
                     style="margin-left: 10px; width: auto; flex-grow: 1"
                  />
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body overflow-y-auto" style="height: 70vh">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">Index</th>
                           <th scope="col">Code</th>
                           <th scope="col">거래처명</th>
                        </tr>
                     </thead>
                     <tbody id="ClientmodalTableBody">
<!--                         여기에 Ajax로 만든 html 속성이 들어감  -->
                     </tbody>
                  </table>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
<!--       clientName Modal END  -->
      
	<!-- Value Modal START  -->
	 <div class="modal fade" id="kvModal" tabindex="-1" aria-labelledby="kvModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="kvModalLabel">코드-상품 선택</h5>
                  <input
                     type="text"
                     id="searchInput"
                     class="form-control"
                     placeholder="코드 또는 상품명을 입력해주세요."
                     style="margin-left: 10px; width: auto; flex-grow: 1"
                  />
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body overflow-y-auto" style="height: 70vh">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">Index</th>
                           <th scope="col">Code</th>
                           <th scope="col">상품 명</th>
                        </tr>
                     </thead>
                     <tbody id="modalTableBody">
<!--                         여기에 Ajax로 만든 html 속성이 들어감  -->
                     </tbody>
                  </table>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
<!--       Value Modal END  -->




	
</body>


   <script type="text/javascript">
	
   // 수주 등록 모달 관련 함수 시작
		

 	
 	
		// 수주 등록 모달에서 '제품 추가'버튼 함수
    	function registeraddRow() {
    		console.log("registeraddRow");
    		var uniqueId = generateUniqueId();
    		
			var newRow = $('<tr class="RegisterGeneratedRow">');
			
			newRow.append($('<td>').attr({
				'id': 'productCod',
			}).text("--"));
			
			newRow.append($('<td>').append($('<input>').attr({
			    'type': 'text',
			    'readonly': 'readonly',
			    'class': 'form-control RegisterProductName',
			    'name': 'RegisterProductName' + uniqueId, 
 			    'id': 'RegisterProductName' + uniqueId, 
			    'placeholder': '상품 선택',
 			}).css('width', '140px').on('click', function() {
	 		    $('#kvModal').modal('show'); // 자식 모달 열기
	 		    console.log('견적 등록 모달에서 제품 목록 모달');
	 		    RegisterProductSearchModalOpen(uniqueId);
			})
			));
			
			newRow.append($('<td>').append($('<input>').attr({
			    'type': 'number',
			    'class': 'form-control RegisterProductQty',
			    'name': 'RegisterProductQty' + uniqueId, 
			    'id': 'RegisterProductQty' + uniqueId, 
			    'placeholder': '수량 입력', 
			}).css('width', '120px')));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			
	        var cancelButton = $('<button>').text('취소').addClass('btn btn-primary');
	        var buttonGroup = $('<div>').append(cancelButton);
	        	        	       	   
	        
		    newRow.append($('<td>').attr({
		    	'id': 'buttonrow'
		    }).append(buttonGroup));
		     		    		    
		    
		    
		    cancelButton.on('click', function() {
		    	
 		    	$(this).closest('tr').remove(); // 새로 추가된 행 삭제
		    	$('#registeraddRowButton').prop('disabled', false);
		    });
		    
			
			$('#RegisterList').after(newRow);
    		
    	}
    	// 수주 등록 모달에서 '제품 추가'버튼 함수 끝
		


		// 수주 처음 등록하는 모달 끄기
		function registerModalclose() {
			$('.RegisterGeneratedRow').remove();
			$('#registeraddRowButton').prop('disabled', false);
		}
		

		
		// 고객리스트에서 input에 set하는 함수
        function setClientValue(clientCod, clientName) {
        	console.log("setClientValue 실행");
        	console.log(clientName);
           $('#registerClientName').val(clientName);
            $('#clientNameModal').modal('hide');
            $('.modal-backdrop').remove();
        }
		
		
        
        // 수주 처음 등록시 완제품 목록을 보여주는 모달에서 선택
        function setRegisterProductValue(uniqueId, cod, productName) {
        	var inputId = '#RegisterProductName' + uniqueId; 
        	var isDuplicate = false;
        	
        	// 클래스가 RegisterProductName인 요소를 모두 확인합니다.
        	$('.RegisterProductName').each(function() {
        		if($(this).val() === productName) {
        			isDuplicate = true; 
        			return false; // 중복값이 발견되면 each 루프를 중단합니다.
        		}
        	});
        	
        	if(!isDuplicate) { //
        		$(inputId).val(productName);
	        	$('#kvModal').modal('hide');
	            $('.modal-backdrop').remove();
        	} else {
        		alert('이미 같은 제품이 존재합니다.');
        	}
        }
        
        // 견적 목록 모달에서 견적 선택해서 수주 목록이 생기게
        function setEstimateValue(estCod, clientName) {
        	
        	$('#registerClientName').val(clientName); 
        	$('#registerEstimate').val(estCod);
        	
           	$.ajax({
           		url: 'estimateDetailList',
           		method: 'GET',
           		data: { cod: estCod },
           		dataType : 'JSON',
           		success: function(response) {
           			
        			$('#estimateModal').modal('hide');
        			$('.modal-backdrop').remove();
        			
        			var estimateDetailList = response.estimateDetailList;
        			
        			let rows = '';
        			
        			var totalPrice = 0;
        			var vax = 0;
        			var total = 0;
        			
        			estimateDetailList.forEach(function (item, index) {
        				rows += `
        					<tr class="RegisterGeneratedRow">
	        					<td name="productCod\${index}" id="RegisterProductCod\${index}">\${item.productCod}</td>
	        					<td><input type="text" readonly class="form-control RegisterProductName" name="prodname\${index}" id="RegisterProductName\${index}" value="\${item.prodName}"></td>
	        					<td><input type="number" readonly class="form-control RegisterProductQty" name="qty\${index}" id="RegisterProductQty\${index}" value="\${item.qty}"></td>
	        					<td name="unitprice\${index}" id="RegisterUnitprice\${index}">\${(item.unitprice).toLocaleString()}</td>
	        					<td id="subtotal">\${(item.unitprice * item.qty).toLocaleString()}</td>
	        					<td id="vax">\${(item.unitprice * item.qty * 0.1).toLocaleString()}</td>
	        					<td id="total">\${(item.unitprice * item.qty * 1.1).toLocaleString()}</td>
	        					<td>--</td>
        					</tr>
        				`;
        				$('#OrderRegistermodalTableBody').html(rows);
        				
        		        totalPrice += item.unitprice * item.qty; 
        		        vax += item.unitprice * item.qty * 0.1;
        		        total += item.unitprice * item.qty * 1.1;
        				
        			})       			
        			
        		        $('#totalpriceRegister').text(totalPrice.toLocaleString()); 
        		        $('#totalvaxRegister').text(vax.toLocaleString()); 
        		        $('#totalsumRegister').text(total.toLocaleString()); 
           		},
           		error: function(xhr, statud, error) {
           			console.error('실패');
           		}
           	});         	           	           
        	 
        }
        
        // 견적 목록을 보여주는 모달 오픈
        function estimateModalOpen() {
        	console.log("견적 목록 모달");  
        	$('#estimateModal').modal('show');
        	$.ajax({
        		url: 'estimatelist',
        		method: 'GET',
        		success: function (data) {
        			console.log(data);
        			let rows = '';
        			data.forEach(function (item, index) {
        				rows += `
        					<tr onclick="setEstimateValue('\${item.cod}', '\${item.clientName}')" class="searchValue" data-cod="'\${item.cod}'" data-value="'\${item.clientName}'" data-value1="'\${item.estDate}'" data-value2="'\${item.empName}'" style="cursor : pointer">
        					<td>\${(index + 1)}</td>
        					<td>\${item.cod}</td>
        					<td>\${item.clientName}</td>
        					<td>\${item.estDate}</td>
        					<td>\${item.empName}</td>
        				`;
        			});
    				$('#EstimatemodalTableBody').html(rows);
                    $('#RegisterModal').modal('show');
        		},
        		error: function (xhr, statud, error) {
        			console.error('실패');
        		}
        	});
        }
        

        
        // 거래처 목록을 보여주는 모달 오픈
        function clientModalOpen() {
        	console.log("거래처 모달");
        	$('#clientNameModal').modal('show');
        	$.ajax({
        		url: 'clientnamelist',
        		method: 'GET',
        		success: function (data) {
        			let rows = '';
        			data.forEach(function (item, index) {
        				rows += `
        					<tr onclick="setClientValue('\${item.clientCod}', '\${item.clientName}')" class="searchValue" data-cod="'\${item.clientCod}'" data-value="'\${item.clientName}'" style="cursor : pointer">
        					<td>\${(index + 1)}</td>
        					<td>\${item.clientCod}</td>
        					<td>\${item.clientName}</td>
        					</tr>
        				`;
        			});
        				$('#ClientmodalTableBody').html(rows);
                        $('#RegisterModal').modal('show');
        		},
                error: function (xhr, status, error) {
                    console.error("실패")
                }
        	});
        }
			
        // 견적 등록 모달에서 완제품 목록 모달을 띄울 때 제품리스트를 가져오는 함수입니다.
		function RegisterProductSearchModalOpen(uniqueId) {
			$.ajax({
                url: 'productnamelist',
                method: 'GET',
                success: function (data) {
                   let rows = '';
                   data.forEach(function (item, index) {
                   	
                         rows += `
                         	<tr onclick="setRegisterProductValue('\${uniqueId}' ,'\${item.cod}', '\${item.prodName}')" class="searchValue" data-cod="\${item.cod}" data-value="\${item.prodName}" style='cursor: pointer'>
                            	<td>\${(index + 1)}</td> 
                            	<td>\${item.cod}</td>
                            	<td>\${item.prodName}</td>
                            </tr>
                            `;

                   });
                   $('#modalTableBody').html(rows);
                    $('#kvModal').modal('show');
                },
                error: function (xhr, status, error) {
                    console.error("실패")
                }
             });
		}		
		


            // 제품 리스트 모달에서 검색용
           $('#searchInput').on('keyup', function () {
              var searchInputValue = $(this).val().toLowerCase();
              $('.searchValue').each(function () {
                 var cod = $(this).data('cod').toLowerCase();
                 var productName = $(this).data('value').toLowerCase();
                 $(this).toggle(cod.includes(searchInputValue) || productName.includes(searchInputValue));
              });
           });

        
		// 수주 등록 모달에서 '수주 등록' 버튼. 수주 내용을 새로 등록하는 함수
        function OrderRegister() {
        	
            var rows = $('.RegisterGeneratedRow');
            
            // 서버로 전송할 데이터를 저장할 배열을 생성합니다.
            var dataToSend = [];
			
            var clientName   = $('#registerClientName').val();
            var employeeCod = $('#orderEmp1').text();
            var dday = $('#ddayInput').val();
            var estimateCod = $('#registerEstimate').val();
            console.log("dday : " + dday);
            
            rows.each(function(index) {
            	
            	
//                 var uniqueId = $(this).find('input[name^="RegisterProductName"]').attr('name').replace('RegisterProductName', '');
            var productCod = $(this).find('td[id="RegisterProductCod' + index + '"]').text();
            var productName = $(this).find('.RegisterProductName').val();
        	var productQty = $(this).find('.RegisterProductQty').val();
        	console.log(productName);
                
                var rowData = {
                	estimateCod: estimateCod,
                	employeeCod: employeeCod,
                	prodname: productName,
                	clientName: clientName,
                    qty: productQty,
                    dday: dday
                };

                dataToSend.push(rowData);
            });

            $.ajax({
                url: 'orderinsertFn',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(dataToSend),
                success: function(response) {
                    console.log('성공적으로 전송되었습니다:', response);
                    alert('등록이 완료되었습니다');
                    window.location.href = '/easyrp/ordersmanagement';
                },
                error: function(xhr, status, error) {
                    console.error('전송 실패:', error);
                }
            });
        	
        	
        }
        
        function generateUniqueId() {
            // 현재 타임스탬프를 이용하여 고유한 ID 생성
            return Date.now();
        }
        
        
        

   
   // 수주 등록 모달 관련 함수 끝

   
   
   
   
   // 수주 상세 모달 관련 함수 시작
   
    // orderDetail(orderCod) 시작
	// 수주 상세 모달에서 목록을 불러오는 함수입니다. 여기서 금액계산을 하고, 수주 상세 목록의 수정, 삭제하는 함수도 정의하였습니다. 함수안에 함수가 정의되어 있어서 헷갈릴 수 있습니다.
    function orderDetail(orderCod) {
	   
    	$('.generatedRow').remove();
    	
    	// estimatedetail ajax 통신 시작
    	$.ajax({
    		url: 'orderdetail',
    		type: 'GET',
    		data: {cod : orderCod},
    		dataType: 'JSON',
    		success: function(response) {
    			
    			console.log("orderDetail 함수  실행 후 estimateCod 값 : "+ orderCod);
    			console.log("response hashmap : " + response)
    			
    		    var totalPrice = 0; // 총 가격 합계 초기값 설정
    		    var totalVat = 0; // 부가세 합계 초기값 설정
    		    var totalSum = 0; // 총합 합계 초기값 설정
    			
                var orderDetailList = response.orderDetailList;
                var orderSelect = response.orderSelect;
                
                var clientName = orderSelect.clientName;
                
                
                var orderDate = orderSelect.orderDate;
                var dday = orderSelect.dday;
                var deptName = orderSelect.deptName;
                var employeeCod = orderSelect.employeeCod;
                var empName = orderSelect.empName;
    		    
                // 수주 상세 모달 상단에 넣은 값입니다.
    			$('#orderCod').text(orderCod);
    			$('#clientName').text(clientName);
     			$('#orderDate').text(orderDate);
     			$('#dday').text(dday);
    			$('#orderDept').text(deptName);
    			$('#orderEmpCod').text(employeeCod);
    			$('#orderEmpName').text(empName);
    			
				
    			// orderDetialList.forEach 상세 리스트의 각 요소에 적용하는 함수 시작
    			// 수주 상세 모달에서 각 상세 목록들에 들어가는 요소들 입니다.
    			orderDetailList.forEach(function(item) {
    				
    				var newRow = $('<tr class="generatedRow">');
    				
    				newRow.append($('<td>').text(item.productCod));
    				newRow.append($('<td>').text(item.prodname)); 
    				
    				if(item.availableQty <= 0){
    					var availableQty = 0;
    				} else {
    					var availableQty = item.availableQty;
    				}
    				newRow.append($('<td>').text(availableQty)); 	
    				
    				newRow.append($('<td>').append($('<input>').attr({
    					'id': 'qty_' + item.num,
    				    'type': 'number',
    				    'readonly': 'readonly',
    				    'class': 'form-control',
    				}).css('width', '120px').val(item.qty)));

    				newRow.append($('<td>').text(item.curRemainQty)); 	
    				
    				newRow.append($('<td>').text(item.productPrice.toLocaleString()));
    				
    				
    				// 계산을 앞단에서 했는데 db에서 트리거를 사용해서 먼저 계산한 다음 뿌려줘도 될 것 같습니다.
    		        // 각 항목의 총 가격 계산 및 표시
    		        var totalPriceItem = item.productPrice * item.qty;
    		        newRow.append($('<td>').text(totalPriceItem.toLocaleString())); // 숫자를 형식화하여 표시
    		        totalPrice += totalPriceItem; // 총 가격 합계 누적
    		        
    		        // 각 항목의 부가세 계산 및 표시
    		        var vat = Math.floor(totalPriceItem * 0.1);
    		        newRow.append($('<td>').text(vat.toLocaleString())); 
    		        totalVat += vat; // 부가세 합계 누적
    		        
    		        // 각 항목의 총합 계산 및 표시
    		        var totalItem = totalPriceItem + vat;
    		        newRow.append($('<td>').text(totalItem.toLocaleString())); 
    		        totalSum += totalItem; // 총합 합계 누적
    		        
    		        switch(item.deliverState){
    		        	case 100:
	    					newRow.append($('<td>').attr({'class' : 'deliverState'}).text("출고의뢰중"));
	    					break;
	    		        case 101:
	    					newRow.append($('<td>').attr({'class' : 'deliverState'}).text("일부 출고"));
	    		        	break;
	    		        case 102:
	    					newRow.append($('<td>').attr({'class' : 'deliverState'}).text("출고 완료"));
	    		        	break;
	    		        case 103:
	    					newRow.append($('<td>').attr({'class' : 'deliverState'}).text("미출고"));
	    		        	break;
	    		        case 104:
	    					newRow.append($('<td>').attr({'class' : 'deliverState'}).text("재고 없음"));
	    					break;
	    		        case 105:
	    		        	newRow.append($('<td>').attr({'class' : 'deliverState'}).text("입고 완료"));
	    		        	break;
	    		        default:
	    					newRow.append($('<td>').attr({'class' : 'deliverState'}).text("--"));
	    		        	
    		        }
    		        
    		        var deliveryButton = $('<button>').text('출고').addClass('btn btn-primary');
    		        var buttonGroup = $('<div>').append(deliveryButton);
    		        
    			    if(item.deliverState == 101 || item.deliverState == 102 || item.deliverState == 104) {
    			    	deliveryButton.prop('disabled', true);
    			    }
    			    newRow.append($('<td>').append(buttonGroup));
    			    
    			    

    				$('#detailList').after(newRow);
    				
        		    $('#totalprice').text(totalPrice.toLocaleString());
        		    $('#totalvax').text(totalVat.toLocaleString());
        		    $('#totalsum').text(totalSum.toLocaleString());
        				
        			// 견적 상세 모달에서 새로운 상품을 추가할 때 '제품추가'버튼을 누르는데 새로운 상품을 추가하지 않고 그냥 모달을 끄고난 뒤에 다시 모달을 열면 'generatedRow'가 추가된 채로 열려서 모달이 닫힐 때 생성한 요소를 삭제시킵니다.
        			$('#detailModal').on('hidden.bs.modal', function () {
        				    // 모달이 닫힐 때 생성된 tr 요소 제거
        				    $('.generatedRow').remove();
        				
        			});	
    				
    				deliveryButton.on('click', function() {
    					console.log("출고 버튼 클릭");
    					console.log(item.qty);
     					deliveryButton.prop('disabled', true);
    					
    					$.ajax({
    						url: 'deliveryFn',
    						type: 'POST',
    						data: {
    							cod: item.cod,
    							productCod: item.productCod,
    							qty: item.qty
    						},
    						dataType: 'text',
    						success: function(response){
    							
    							console.log('서버응답 response : ' + response);

    				                console.log('deliveryFn 성공');
    				                alert('출고 버튼 실행!');
    				                orderDetail(orderCod);
	     
    						},
    						error: function(xhr, status, error) {
    							console.error('실패');
    						}
    					});
    					
    				})
    			});
    			// orderDetialList.forEach 상세 리스트의 각 요소에 적용하는 함수 끝
    		},
    		error: function(xhr, status, error) {
    			console.error('실패');
    		}
    	});
    	// orderdetail ajax 통신 끝
    	
    	
    	
    }
 	// orderDetail(orderCod) 끝

//     		 readonly 없애는 함수
// 		function estimateChange() {
// 			$('input').removeAttr('readonly');
// 		}


		// 수주 상세 모달에서 '제품 추가' 버튼
		function addRow() {
			
			var newRow = $('<tr class="generatedRow">');
			
			newRow.append($('<td>').attr({
				'id': 'productCod',
			}).text("--"));
			
			newRow.append($('<td>').append($('<input>').attr({
			    'type': 'text',
			    'readonly': 'readonly',
			    'class': 'form-control',
			    'name': 'productName', 
 			    'id': 'productName', 
			    'placeholder': '상품 선택',
 			}).css('width', '140px').on('click', function() {
	 		    $('#kvModal').modal('show'); // 자식 모달 열기
	 		    console.log('견적 상세 모달에서 제품 목록 모달');
	 		    searchModalOpen();
			})
			));
					
			
			newRow.append($('<td>').append($('<input>').attr({
			    'type': 'number',
			    'readonly': 'readonly',
			    'class': 'form-control',
			    'name': 'productQty', 
			    'id': 'productQty', 
			    'placeholder': '수량 입력', 
			}).css('width', '120px')));
			
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			
	        var checkButton = $('<button>').text('확인').attr({ 'type': 'button' }).addClass('btn btn-primary').css('margin-right', '2px');	        	       	   
	        var cancelButton = $('<button>').text('취소').addClass('btn btn-primary');
	        var buttonGroup = $('<div>').append(checkButton).append(cancelButton);
	        
		    newRow.append($('<td>').attr({
		    	'id': 'buttonrow'
		    }).append(buttonGroup));
		     		    		    
		    checkButton.on("click", function() {
		    	console.log("확인 버튼 누름");
		    	var estimateCodValue = $('#estimateCod').text();
		    	console.log("estimateCod : " + estimateCodValue);
		    	var productName = $('#productName').val();
		    	var productQty = $('#productQty').val();
		    	
		    	insertAjax(productName, productQty ,estimateCodValue);				
	    	});
		    
		    
		    cancelButton.on('click', function() {
		    	
 		    	$(this).closest('tr').remove(); // 새로 추가된 행 삭제
		    	$('#addRowButton').prop('disabled', false);
		    });
		    
			
			$('#detailList').after(newRow);
			
			$('#addRowButton').prop('disabled', true);
			
		}
		// 수주 상세 모달에서 '제품 추가' 버튼 함수 끝

		// 견적 상세 모달에서 새로운 제품을 insert할 때 사용하는 ajax 함수
		function insertAjax(productName, productQty, estimateCodValue) {

			$.ajax({
	    		url: 'estimatedetailinsert',
	    		type: 'GET',
	    		dataType: 'JSON',
	    		data: {
    				prodname: productName,
	    			qty: productQty,
	    			cod: estimateCodValue,
	    		},
	    		success: function(response){
	    			console.log('ajax 성공');
	    			alert('상품 항목이 추가되었습니다.');
	    			
		            // 성공 시 기존 데이터 삭제
		            $('.generatedRow').remove();
	    			
	    			orderDetail(estimateCodValue);
	    			
	    			$('#addRowButton').prop('disabled', false);
	    			
	    		},
	    		error: function(xhr, status, error){
	    			console.error('ajax 실패');
	    			alert('같은 제품이 이미 존재합니다.');
	    		}
		    });		    	
		}

		   // 견적 상세 모달에서 제품 목록 모달을 띄울 때 제품리스트를 가져오는 함수입니다.
           function searchModalOpen() {
            $.ajax({
               url: 'productnamelist',
               method: 'GET',
               success: function (data) {
                  let rows = '';
                  data.forEach(function (item, index) {
                      
//  					console.log(item);
                        rows += `
                           <tr onclick="setValue('\${item.cod}','\${item.prodName}')" class="searchValue" data-cod="\${item.cod}" data-value="\${item.prodName}" style="cursor: pointer"> 
	                           <td>\${(index + 1)}</td>
	                           <td>\${item.cod}</td>
	                           <td>\${item.prodName}</td>
                           </tr> 
                           `;
                  });
                  $('#modalTableBody').html(rows);
                   $('#kvModal').modal('show');
               },
               error: function (xhr, status, error) {
                   console.error("실패")
               }
            });
         }        

        // 견적 상세모달에서 제품리스트 input 에 set 하는 함수
        function setValue(cod, productName) {
            $('#productName').val(productName);
            $('#kvModal').modal('hide');
            $('.modal-backdrop').remove();
         }

		// 수주 상세 모달 끄기
		function Modalclose() {
			$('#addRowButton').prop('disabled', false);
		}
   
   // 수주 상세 모달 관련 함수 끝
   
   
   function resetSearchForm() {
            $('#searchCod').val('');
            $('#searchClientCod').val('');
            $('#searchEmployeeCod').val('');
            $('#preSearchDate').val('');
            $('#postSearchDate').val('');
            $('#ddaypreSearchDate').val('');
            $('#ddaypostSearchDate').val('');
        }
   
   
    </script>

</html>
