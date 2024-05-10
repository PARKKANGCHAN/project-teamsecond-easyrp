<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <!-- 공통 사용 테이블 START -->
      <div id="main">
         <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i> </a>
         </header>
         <div class="page-heading">
            <div class="page-title">
               <div class="row">
                  <div class="col-12 col-md-6 order-md-1 order-last">
                     <h3>견적 등록</h3>
                     <p class="text-subtitle text-muted">견적 등록</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">공통 테이블</li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
            <section class="section">
               <div class="row" id="table-hover-row">
                  <div class="col-12">
                     <div class="card mb-4">
                        <div class="card-header py-3">
                           <div class="d-flex" style="justify-content: space-between">
                              <h5 class="m-0">견적 기본 정보</h5>
                              <button
                                 type="button"
                                 class="btn btn-primary"
                                 id="loadDatas"
                                 data-bs-toggle="modal"
                                 data-bs-target="#dataModal"
                                 style="float: left; width: 10%"
                              >
                                 데이터 가져오기
                              </button>
                           </div>
                        </div>
                        <div class="card-body mb-3">
                           <form action="salesplaninsertFn" method="post">
                              <div class="mb-4">
                                 <table class="table table-bordered">
                                    <!-- 글제목 INPUT INPUT -->

                                    <!-- 내용 INPUT -->
                                 <!-- 모달로 입력 테스트 -->
                                    <tr>
                                       <td width="150">거래처명</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="clientName"
                                             name="clientName"
                                             data-target="#clientName"
                                             class="form-control"
                                             style="width: 80%; float: left"
                                             placeholder="모달을 이용해서 입력하는 테스트"
                                             required
                                          />
                                          <button
                                             type="button"
                                             class="btn btn-primary"
                                             id="loadValues"
                                             data-bs-toggle="modal"
                                             data-bs-target="#kvModal"
                                             style="margin-left: 2rem; width: 10%"
                                          >
                                             검색
                                          </button>
                                       </td>
                                    </tr>

                                    <!-- 글쓴이 INPUT (로그인 시 자동으로 값 입력 readonly) -->
                                    <tr>
                                       <td width="150">담당사원</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="author"
                                             name="author"
                                             class="form-control"
                                             value="${empName }"
                                             placeholder="로그인을 하면 자동으로 입력됩니다."
                                             readonly
                                             required
                                          />
                                       </td>
                                    </tr>

                                 </table>
                              </div>

              <div>
				<div>
					<h5>견적 상세 정보</h5>
				</div>
				<div>
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
                                <button type="button" class="btn btn-primary" id="addColumnButton" onClick="addcolumn()">제품 추가</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			               <!-- 공통등록 Button START -->
                              <div style="text-align: center">
                                 <button type="submit" class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
                                    공통등록
                                 </button>
								<a href="salesplanmanagement">
                                  <button type="button" class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
                                       등록취소
                                  </button>
                                 </a>
                              </div>
                              <!-- 공통등록 Button END -->
                             
                           </form>
                           <!-- 공통등록 END -->
                        </div>
                     </div>
                     <!-- 공통등록 FORM END -->
                  </div>
               </div>
            </section>
         </div>
      </div>
      <!-- 공통 사용 테이블 END -->
      <!-- Value Modal START  -->
      <div class="modal fade" id="kvModal" tabindex="-1" aria-labelledby="kvModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="kvModalLabel">코드-값 선택</h5>
                  <input
                     type="text"
                     id="searchInput"
                     class="form-control"
                     placeholder="코드 또는 값을 입력해주세요."
                     style="margin-left: 10px; width: auto; flex-grow: 1"
                  />
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">#</th>
                           <th scope="col">Code</th>
                           <th scope="col">Value</th>
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
      <!-- Data Modal START  -->
      <div class="modal fade" id="dataModal" tabindex="-1" aria-labelledby="dataModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="dataModalLabel">데이터 선택</h5>
                  <input
                     type="text"
                     id="searchDataInput"
                     class="form-control"
                     placeholder="검색할 데이터를 입력해주세요."
                     style="margin-left: 10px; width: auto; flex-grow: 1"
                  />
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">제목</th>
                           <th scope="col">저자</th>
                        </tr>
                     </thead>
                     <tbody id="modalDataTableBody">
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
      <!-- Data Modal END  -->
      
      
      
      
   </body>
   
<script type="text/javascript">
   
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
		
		
		
	} 
	
	// 제품 목록 모달
    function searchModalOpen() {
        $.ajax({
           url: 'productnamelist',
           method: 'GET',
           success: function (data) {
              let rows = '';
              data.forEach(function (item, index) {
//				console.log(item);
                    rows += `
                       <tr onclick="setValue(item.cod ,item.prodName)" class="searchValue" data-cod="item.cod" data-value="item.prodName" style='cursor: pointer'> 
                       <td>(index + 1)</td> 
                       <td>item.cod</td> 
                       <td>item.prodName</td>
                       </tr>`;
						
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

         /* valueModal START */
         function setValue(cod, value) {
            $('#clientName').val(value);
            $('#kvModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadValues').on('click', function () {
               $.ajax({
                  url: 'api/get-client',
                  method: 'GET',
                  success: function (data) {
                	  
                     let rows = '';
                     data.forEach(function (item, index) {
                    	 
                    	 console.log(item);
                    	 
                        if (item.clientCod && item.clientName) {
                           rows +=
                              '<tr onclick="setValue(\'' +
                              item.clientCod +
                              "', '" +
                              item.clientName +
                              '\')" ' +
                              'class="searchValue" data-cod="' +
                              item.clientCod +
                              '" data-value="' +
                              item.clientName +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              (index + 1) +
                              '</td>' +
                              '<td>' +
                              item.clientCod +
                              '</td>' +
                              '<td>' +
                              item.clientName +
                              '</td>' +
                              '</tr>';
                        }
                     });
                     $('#modalTableBody').html(rows);
                     $('#kvModal').modal('show');
                  },
               });
            });

            $('#searchInput').on('keyup', function () {
               var searchInputVlaue = $(this).val().toLowerCase()
               $('.searchValue').each(function () {
                  var clientCod = $(this).data('cod').toLowerCase()
                  var clientName = $(this).data('value').toLowerCase()
                  $(this).toggle(clientCod.includes(searchInputVlaue) || clientName.includes(searchInputVlaue));
               });
            });
         });
         /* valueModal END */

         /* DataModal START */
         function setData(title, content, author) {
            $('#title').val(title);
            $('#content').val(content);
            $('#dataModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadDatas').on('click', function () {
               $.ajax({
                  url: 'api/get-data',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.title && item.content) {
                           rows +=
                              '<tr onclick="setData(\'' +
                              item.title +
                              "', '" +
                              item.content +
                              '\')" ' +
                              'class="searchData" data-title="' +
                              item.title +
                              '" data-author="' +
                              item.author +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              item.title +
                              '</td>' +
                              '<td>' +
                              item.author +
                              '</td>' +
                              '</tr>';
                        }
                     });
                     $('#modalDataTableBody').html(rows);
                     $('#dataModal').modal('show');
                  },
               });
            });
            
            $('#searchDataInput').on('keyup', function () {
               let searchInputData = $(this).val();
               $('.searchData').each(function () {
                  let title = $(this).data('title');
                  let author = $(this).data('author');
                  $(this).toggle(title.includes(searchInputData) || author.includes(searchInputData));
               });
            });
         });
         /* DataModal END */
        
      </script>
   
</html>
