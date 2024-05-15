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
						<h3><a href="/easyrp/salesplanmanagement">견적 테이블</a></h3>
						<p class="text-subtitle text-muted">견적 목록</p>
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
											<form id="searchForm" action="commontable" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">글 번호</td>
															<td><input type="text" id="searchNumber"
																name="searchNumber" class="form-control"
																value="${searchNumber}"
																placeholder="글 번호를 입력해주세요." /></td>
															<td width="100">제 목</td>
															<td><input type="text" id="searchTitle"
																name="searchTitle" class="form-control"
																value="${searchTitle}"
																placeholder="제목을 입력해주세요." /></td>
															<td width="100">내 용</td>
															<td><input type="text" id="searchContent"
																name="searchContent" class="form-control"
																value="${searchContent}"
																placeholder="내용을 입력해주세요." /></td>
															<td width="100">작성자</td>
															<td><input type="text" id="searchAuthor"
																name="searchAuthor" class="form-control"
																value="${searchAuthor}"
																placeholder="작성자를 입력해주세요." /></td>
														</tr>
														<tr>
															<td width="100">검색 날짜</td>
															<td colspan="2"><input type="date"
																id="preSearchDate" name="preSearchDate"
																value="${preSearchDate}"
																class="form-control" style="width: 47%; float: left" />
																<span><i class="fa-solid fa-arrow-right"
																	style="margin-top: 10px"></i></span> <input type="date"
																id="postSearchDate" name="postSearchDate"
																value="${postSearchDate}"
																class="form-control" style="width: 47%; float: right" /></td>
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
												<th width="10%">견적번호</th>
												<th width="10%">등록일자</th>
												<th width="10%">고객번호</th>
												<th width="10%">담당자번호</th>
												<th width="15%">금액</th>
												<th width="15%">부가세</th>
												<th width="15%">총액</th>
												<th width="7.5%">수주여부</th>
												<th width="7.5%">설 정</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${estimate }" var="estimate" >
												<tr>
													<td class="text-bold-500">
    													<a href="#" id="loadDetail" data-bs-toggle="modal" data-bs-target="#detailModal" onclick="estimateDetail('${estimate.cod}')">${estimate.cod}</a>
													</td>
													<td>${estimate.estDate }</td>
													<td>${estimate.clientCod }</td>
													<td class="text-bold-500">${estimate.employeeCod }</td>
													<td>${estimate.price }</td>
													<td>10%</td>
													<td>${estimate.total }</td>
													<td>${estimate.orderyn }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="estimatedeleteFn?cod=${estimate.cod}">삭제</a></li>
																<li><a class="dropdown-item" href="#" id="loadDetail" data-bs-toggle="modal" data-bs-target="#detailModal" onclick="estimateDetail('${estimate.cod}')">
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
	<!-- 공통 사용 테이블 END -->
	
		<!-- 상세페이지 모달 START -->
	<div class="modal fade" id="detailModal" tabindex="-1"
		aria-labelledby="detailModalLabel" aria-hidden="true" data-bs-backdrop='static' data-bs-keyboard='false'>
		<div class="modal-dialog modal-xl" style="width: 1400px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">견적 상세 페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onClick="Modalclose()"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th scope="col">견적 번호</th>
							<td id="estimateCod"></td>
							<th scope="col">거래처 명</th>
							<td id="clientName"></td>
							<th scope="col">견적 날짜</th>
							<td id="estimateDate"></td>
							<td></td>
						</tr>
						<tr>
							<th scope="col">견적 담당 부서</th>
							<td id="estimateDept"></td>
							<th scope="col">견적 담당 사원코드</th>
							<td id="estimateEmp"></td>
							<th scope="col">견적 담당자 명</th>
							<td id="estimateEmpName"></td>
							<td></td>
						</tr>
						</table>
						<table class="table">
						<tr id="detailList">
							<th colspan="1">상품 코드</th>
							<th colspan="1" style="width: 160px;">상품 명</th>
							<th colspan="1">수 량</th>
							<th colspan="1">단 가</th>
							<th colspan="1">공급가액</th>
							<th colspan="1">부가세</th>
							<th colspan="1">금 액</th>
							<th colspan="1">수정 및 삭제</th>

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
								<button type="button" class="btn btn-primary">전표 생성</button>
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-primary">이메일 보내기</button>
								<button type="button" class="btn btn-primary" onClick="estimateChange()">견적 수정</button>
                                <button type="button" class="btn btn-primary" id="addColumnButton" onClick="addcolumn()">제품 추가</button>
							</td>
						</tr>
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
					<h5 class="modal-title" id="detailModalLabel">견적 등록 페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onClick="registerModalclose()"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th scope="col">견적 번호</th>
							<td id="estimateCod">테스트</td>
							<th scope="col">거래처 명</th>
							<td>
								<input type="text" readonly="readonly" class="form-control" name="registerClientName"  id="registerClientName" placeholder="거래처 선택" style="width: 140px;" onClick="clientModalOpen()">
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="col">견적 담당 부서</th>
							<td id="estimateDept">${empDeptCode}</td>
							<th scope="col">견적 담당 사원코드</th>
							<td id="estimateEmp">${empCode }</td>
							<th scope="col">견적 담당자 명</th>
							<td id="estimateEmpName">${empName }</td>
							<td></td>
						</tr>
						</table>
						<table class="table">
						<tr id="RegisterList">
							<th colspan="1">상품 코드</th>
							<th colspan="1" style="width: 160px;">상품 명</th>
							<th colspan="1">수 량</th>
							<th colspan="1">단 가</th>
							<th colspan="1">공급가액</th>
							<th colspan="1">부가세</th>
							<th colspan="1">금 액</th>
							<th colspan="1">수정 및 삭제</th>

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
								<button type="button" class="btn btn-primary" onClick="estimateChange()">견적 수정</button>
                                <button type="button" class="btn btn-primary" id="registerAddColumnButton" onClick="registerAddcolumn()">제품 추가</button>
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
               <div class="modal-body">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">Index</th>
                           <th scope="col">Code</th>
                           <th scope="col">거래처명</th>
                        </tr>
                     </thead>
                     <tbody id="ClientmodalTableBody">
                        <!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
                     </tbody>
                  </table>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
      <!-- clientName Modal END  -->
      
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
               <div class="modal-body">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">Index</th>
                           <th scope="col">Code</th>
                           <th scope="col">상품 명</th>
                        </tr>
                     </thead>
                     <tbody id="modalTableBody">
                        <!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
                     </tbody>
                  </table>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
      <!-- Value Modal END  -->




	
</body>


   <script type="text/javascript">


    function estimateDetail(estimateCod) {
    	
    	$.ajax({
    		url: 'estimatedetail',
    		type: 'GET',
    		data: {cod : estimateCod},
    		dataType: 'JSON',
    		success: function(response) {
    			
    		    var totalPrice = 0; // 총 가격 합계 초기값 설정
    		    var totalVat = 0; // 부가세 합계 초기값 설정
    		    var totalSum = 0; // 총합 합계 초기값 설정
    			
    			$('#estimateCod').text(response[0].cod);
    			$('#clientName').text(response[0].clientName);
    			$('#estimateDate').text(response[0].estDate);
    			$('#estimateDept').text(response[0].deptName);
    			$('#estimateEmp').text(response[0].employeeCod);
    			$('#estimateEmpName').text(response[0].empName);

    			
    			response.forEach(function(item) {
    				
    				var newRow = $('<tr class="generatedRow">');
    				
    				newRow.append($('<td>').text(item.productCod));
    				newRow.append($('<td>').text(item.prodName)); 				
    				newRow.append($('<td>').append($('<input>').attr({
    					'id': 'qty_' + item.num,
    				    'type': 'number',
    				    'readonly': 'readonly',
    				    'class': 'form-control',
    				}).css('width', '120px').val(item.qty)));

    				
    				newRow.append($('<td>').text(item.unitprice.toLocaleString()));
    				
    				
    		        // 각 항목의 총 가격 계산 및 표시
    		        var totalPriceItem = item.unitprice * item.qty;
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
    				
    		        var editButton = $('<button>').text('수정').addClass('btn btn-primary').css('margin-right', '2px');
    		        var deleteButton = $('<button>').text('삭제').addClass('btn btn-primary');
    		        var buttonGroup = $('<div>').append(editButton).append(deleteButton);
    		        
    			    newRow.append($('<td>').append(buttonGroup));
    			    
    				$('#detailList').after(newRow);
    				
    				editButton.on('click', function() {
    				    var productCod = item.productCod;
    				    var estimateCod = response[0].cod;
    				    var num = item.num;
    				    var qty = $('#qty_' + item.num).val();
    				    
    				    console.log(qty);
    				    
    				    $.ajax({
    				    	url: 'estimateupdate',
    				    	type: 'POST',
    				    	data: {
    				    		cod : estimateCod,
    				    		qty : qty,
    				    		num : num
    				    	},
    				    	dataType: 'JSON',
    				    	success: function(response){
    				    		console.log('성공');
    				    		alert('수정이 완료되었습니다.');
    				    		
    				            // 성공 시 기존 데이터 삭제
    				            $('.generatedRow').remove();
    				            
    				            // 수정 성공 시 해당 함수를 호출하여 전체적으로 다시 렌더링
    				            estimateDetail(estimateCod);
    				            
    				    	},
    				    	error: function(xhr, status, error) {
    							console.error('실패');
    							console.log(xhr,status);
    						}
    				    });
    				    
    				});

    				deleteButton.on('click', function() {
    					var productCod = item.productCod;
    				    var estimateCod = response[0].cod;
    				    var num = item.num;
    				    var qty = $('#qty_' + item.num).val();
    				    
    				    console.log(qty);
    				    
    				    $.ajax({
    				    	url: 'estimatedetaildelete',
    				    	type: 'POST',
    				    	data: {
    				    		productCod : productCod,
    				    		cod: estimateCod,
    				    	},
    				    	dataType: 'JSON',
    				    	success: function(response){
    				    		console.log('삭제 성공');
    				    		alert('삭제가 완료되었습니다.');
    				    		
    				            // 성공 시 기존 데이터 삭제
    				            $('.generatedRow').remove();
    				            
    				            // 삭제 성공 시 해당 함수를 호출하여 전체적으로 다시 렌더링
    				            estimateDetail(estimateCod);
    				            
    				    	},
    				    	error: function(xhr, status, error) {
    							console.error('실패');
    							console.log(xhr,status);
    						}
    				    });
    					
    				});
    				
    				
    			});
    			
    		    $('#totalprice').text(totalPrice.toLocaleString());
    		    $('#totalvax').text(totalVat.toLocaleString());
    		    $('#totalsum').text(totalSum.toLocaleString());
    				
    				
    			$('#detailModal').on('hidden.bs.modal', function () {
    				    // 모달이 닫힐 때 생성된 tr 요소 제거
    				    $('.generatedRow').remove();
    				
    			});	
    			
    		},
    		error: function(xhr, status, error) {
    			console.error('실패');
    		}
    	});
    	
    	// 제품 추가 버튼 활성화
		$('#addColumnButton').prop('disabled', false);
    	
    }
			
    	function registerAddcolumn() {
    		console.log("registerAddcolumn");
    		
			var newRow = $('<tr class="generatedRow">');
			
			var Counter = $('.generatedRow').length + 1;
			
			newRow.append($('<td>').attr({
				'id': 'productCod',
			}).text("--"));
			
			newRow.append($('<td>').append($('<input>').attr({
			    'type': 'text',
			    'readonly': 'readonly',
			    'class': 'form-control',
			    'name': 'RegisterProductName' + Counter, 
 			    'id': 'RegisterProductName' + Counter, 
			    'placeholder': '상품 선택',
 			}).css('width', '140px').on('click', function() {
	 		    $('#kvModal').modal('show'); // 자식 모달 열기
	 		    console.log('자식 모달 오픈');
	 		    searchModalOpen();
			})
			));
			
			newRow.append($('<td>').append($('<input>').attr({
			    'type': 'number',
			    'class': 'form-control',
			    'name': 'RegisterProductQty' + Counter, 
			    'id': 'RegisterProductQty' + Counter, 
			    'placeholder': '수량 입력', 
			}).css('width', '120px')));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			
	        var checkButton = $('<button>').text('등록').attr({ 'type': 'button' }).addClass('btn btn-primary').css('margin-right', '2px');	        	       	   
	        var cancelButton = $('<button>').text('취소').addClass('btn btn-primary');
	        var buttonGroup = $('<div>').append(checkButton).append(cancelButton);
	        
		    newRow.append($('<td>').attr({
		    	'id': 'buttonrow'
		    }).append(buttonGroup));
		     		    		    
		    checkButton.on("click", function() {
		    	console.log("등록 버튼 누름");
		    	
		    	var RegisterProductName = $('#RegisterProductName').val();
		    	var RegisterProductQty = $('#RegisterProductQty').val();
		    	var registerClientName = $('#registerClientName').val();
		    	
		    	registerAjax(RegisterProductName, RegisterProductQty, registerClientName);
		    					
		    	$('#registerAddColumnButton').prop('disabled', false);
	    	});
		    
		    
		    cancelButton.on('click', function() {
		    	
 		    	$(this).closest('tr').remove(); // 새로 추가된 행 삭제
		    	$('#registerAddColumnButton').prop('disabled', false);
		    });
		    
			
			$('#RegisterList').after(newRow);
			
			$('#registerAddColumnButton').prop('disabled', true);
    		
    	}
    	
    	function registerAjax(RegisterProductName, RegisterProductQty, registerClientName) {
    		console.log('RegisterAjax 실행');
    		
    		
    	}

		
		function estimateChange() {
			$('input').removeAttr('readonly');
		}
	
		function addcolumn() {
			
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
	 		    console.log('자식 모달 오픈');
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
		    	var productName = $('#productName').val();
		    	var productQty = $('#productQty').val();
		    	
		    	insertAjax(productName, productQty ,estimateCodValue);				
	    	});
		    
		    
		    cancelButton.on('click', function() {
		    	
 		    	$(this).closest('tr').remove(); // 새로 추가된 행 삭제
		    	$('#addColumnButton').prop('disabled', false);
		    });
		    
			
			$('#detailList').after(newRow);
			
			$('#addColumnButton').prop('disabled', true);
			
		}
		
		
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
	    			
	    			estimateDetail(estimateCodValue);
	    			
	    			$('#addColumnButton').prop('disabled', false);
	    			
	    		},
	    		error: function(xhr, status, error){
	    			console.error('ajax 실패');
	    			alert('같은 제품이 이미 존재합니다.');
	    		}
		    });		    	
		}
		
		function registerModalclose() {
			$('#registerAddColumnButton').prop('disabled', false);
		}
		
		function Modalclose() {
			$('#addColumnButton').prop('disabled', false);
		}
		
		
        function setClientValue(clientCod, clientName) {
        	console.log("setClientValue 실행");
        	console.log(clientName);
           $('#registerClientName').val(clientName);
            $('#clientNameModal').modal('hide');
            $('.modal-backdrop').remove();
        }
		
        /* valueModal START */
        function setValue(cod, productName) {
           $('#productName').val(productName);
            $('#kvModal').modal('hide');
            $('.modal-backdrop').remove();
        }
        
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
        					<tr onclick="setClientValue('\${item.clientCod}', '\${item.clientName}')" class="searchValue" data-cod="'\${item.clientCod}'" data-value="'\${item.clientName}'" sytle="cursor : pointer">
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

		
           function searchModalOpen() {
              $.ajax({
                 url: 'productnamelist',
                 method: 'GET',
                 success: function (data) {
                    let rows = '';
                    data.forEach(function (item, index) {
                    	
//  					console.log(item);
                          rows +=
                             '<tr onclick="setValue(\'' +
                             item.cod +
                             "', '" +
                             item.prodName +
                             '\')" ' +
                             'class="searchValue" data-cod="' +
                             item.cod +
                             '" data-value="' +
                             item.prodName +
                             '" style= "' +
                             'cursor: pointer' +
                             '">' +
                             '<td>' +
                             (index + 1) +
                             '</td>' +
                             '<td>' +
                             item.cod +
                             '</td>' +
                             '<td>' +
                             item.prodName +
                             '</td>' +
                             '</tr>';

                    });
                    $('#modalTableBody').html(rows);
                     $('#kvModal').modal('show');
                 },
                 error: function (xhr, status, error) {
                     console.error("실패")
                 }
              });
           }


           $('#searchInput').on('keyup', function () {
              var searchInputValue = $(this).val().toLowerCase();
              $('.searchValue').each(function () {
                 var cod = $(this).data('cod').toLowerCase();
                 var productName = $(this).data('value').toLowerCase();
                 $(this).toggle(cod.includes(searchInputValue) || productName.includes(searchInputValue));
              });
           });

        /* valueModal END */
		
// 		function estimateLisetInsert() {
//         	console.log('등록');
        	
        	
//         }
        
    </script>

</html>
