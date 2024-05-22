<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
												<th>생산</th>
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
																<li><a class="dropdown-item" href="#"
																	id="loadDetail" data-bs-toggle="modal"
																	data-bs-target="#detailModal"
																	onclick="estimateDetail('${invoiceTable.cod}')"> 상세 보기
																</a></li>
																<li><a class="dropdown-item"
																	href="invoicedeletefn?cod=${invoiceTable.cod}">삭제</a></li>
															</ul>
														</div>
													</td>
													<td>
														<c:if test="${invoiceTable.invClass eq '생산'}">
															<button type="button" class="btn btn-primary">미생산</button>
														</c:if>
													</td>
												</tr>
											</c:forEach>
											<c:if test="${empty invoiceTable }">
												<tr>
													<td colspan="8" align="center">청구 내역이 없습니다.</td>
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
	
	<!-- 상세페이지 모달 START -->
	<div class="modal fade" id="detailModal" tabindex="-1"
		aria-labelledby="detailModalLabel" aria-hidden="true"
		data-bs-backdrop='static' data-bs-keyboard='false'>
		<div class="modal-dialog modal-xl" style="width: 1400px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">청구 상세 페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onClick="Modalclose()"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th scope="col">청구 번호</th>
							<td id="estimateCod"></td>
							<th scope="col">거래처 명</th>
							<td id="clientName"></td>
							<th scope="col">청구 날짜</th>
							<td id="estimateDate"></td>
							<td></td>
						</tr>
						<tr>
							<th scope="col">청구자 명</th>
							<td id="estimateDept"></td>
							<th scope="col">비고</th>
							<td id="estimateEmp" colspan="2"></td>
							<td></td>
						</tr>
					</table>
					<table class="table">
						<tr id="detailList">
							<th colspan="1">순번</th>
							<th colspan="1">품번</th>
							<th colspan="1">품명</th>
							<th colspan="1">규격</th>
							<th colspan="1">요청일</th>
							<th colspan="1">재고단위</th>
							<th colspan="1">재고단위수량</th>
							<th colspan="1">관리단위</th>
							<th colspan="1">관리단위수량</th>
							<th colspan="1">거래처</th>
							<th colspan="1">수정</th>
						<tr>
							<td colspan="6" style="border-bottom-width: 0px">
								<button type="button" class="btn btn-primary"
									onClick="estimateChange()">수량 수정</button>
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
	
	<!-- 셀렉트박스 고정 자바스크립트 -->
    <script type="text/javascript">
    	window.onload = function(){
    		document.getElementById('searchPlan').value = '${searchPlan}';
    	}
    </script>
    
    <script>
 // 견적 상세 모달 관련 함수 시작
    
    // estimateDetail(estimateCod) 시작
	// 견적 상세 모달에서 목록을 불러오는 함수입니다. 여기서 금액계산을 하고, 견적 상세 목록의 수정, 삭제하는 함수도 정의하였습니다. 함수안에 함수가 정의되어 있어서 헷갈릴 수 있습니다.
    function estimateDetail(estimateCod) {
    	
    	// estimatedetail ajax 통신 시작
    	$.ajax({
    		url: 'estimatedetail',
    		type: 'GET',
    		data: {cod : estimateCod},
    		dataType: 'JSON',
    		success: function(response) {
    			
    		    var totalPrice = 0; // 총 가격 합계 초기값 설정
    		    var totalVat = 0; // 부가세 합계 초기값 설정
    		    var totalSum = 0; // 총합 합계 초기값 설정
    			
                var estimateDetailList = response.estimateDetailList;
                var estimateSelect = response.estimateSelect;
                
                var clientName = estimateSelect.clientName;
                var estDate = estimateSelect.estDate;
                var deptName = estimateSelect.deptName;
                var employeeCod = estimateSelect.employeeCod;
                var empName = estimateSelect.empName;
    		    
                // 견적 상세 모달 상단에 넣은 값입니다.
    			$('#estimateCod').text(estimateCod);
    			$('#clientName').text(clientName);
     			$('#estimateDate').text(estDate);
    			$('#estimateDept').text(deptName);
    			$('#estimateEmp').text(employeeCod);
    			$('#estimateEmpName').text(empName);
				
    			// estimateDetialList.forEach 상세 리스트의 각 요소에 적용하는 함수 시작
    			// 견적 상세 모달에서 각 상세 목록들에 들어가는 요소들 입니다.
    			estimateDetailList.forEach(function(item) {
    				
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
    				
    				
    				// 계산을 앞단에서 했는데 db에서 트리거를 사용해서 먼저 계산한 다음 뿌려줘도 될 것 같습니다.
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
    				
    		        // 각 견적 상세 목록에 수정과 삭제 버튼을 달아주었고 onclick 함수를 바로 정의했습니다.
    		        var editButton = $('<button>').text('수정').addClass('btn btn-primary').css('margin-right', '2px');
    		        var deleteButton = $('<button>').text('삭제').addClass('btn btn-primary');
    		        var buttonGroup = $('<div>').append(editButton).append(deleteButton);
    		        
    			    newRow.append($('<td>').append(buttonGroup));
    			    
    				$('#detailList').after(newRow);
    				
    				editButton.on('click', function() {
    				    var productCod = item.productCod;
     				    var estimateCod = item.cod;
    				    var num = item.num;
    				    var qty = $('#qty_' + item.num).val();
    				    
    				    
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
    				    var estimateCod = item.cod;
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
    			// estimateDetialList.forEach 상세 리스트의 각 요소에 적용하는 함수 끝
    			
    		    $('#totalprice').text(totalPrice.toLocaleString());
    		    $('#totalvax').text(totalVat.toLocaleString());
    		    $('#totalsum').text(totalSum.toLocaleString());
    				
    			// 견적 상세 모달에서 새로운 상품을 추가할 때 '제품추가'버튼을 누르는데 새로운 상품을 추가하지 않고 그냥 모달을 끄고난 뒤에 다시 모달을 열면 'generatedRow'가 추가된 채로 열려서 모달이 닫힐 때 생성한 요소를 삭제시킵니다.
    			$('#detailModal').on('hidden.bs.modal', function () {
    				    // 모달이 닫힐 때 생성된 tr 요소 제거
    				    $('.generatedRow').remove();
    				
    			});	
    			
    		},
    		error: function(xhr, status, error) {
    			console.error('실패');
    		}
    	});
    	// estimatedetail ajax 통신 끝
    	
    	// 제품 추가 버튼 활성화
		$('#addRowButton').prop('disabled', false);
    	
    }
 	// estimateDetail(estimateCod) 끝

    		// readonly 없애는 함수
		function estimateChange() {
			$('input').removeAttr('readonly');
		}


		// 견적 상세 모달에서 '제품 추가' 버튼
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
		// 견적 상세 모달에서 '제품 추가' 버튼 함수 끝

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
	    			
	    			estimateDetail(estimateCodValue);
	    			
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

        // 견적 상세모달에서 제품리스트 input 에 set 하는 함수
        function setValue(cod, productName) {
            $('#productName').val(productName);
            $('#kvModal').modal('hide');
            $('.modal-backdrop').remove();
         }

		// 견적 상세 모달 끄기
		function Modalclose() {
			$('#addRowButton').prop('disabled', false);
		}
   
   // 견적 상세 모달 관련 함수 끝

    </script>
</body>
</html>

