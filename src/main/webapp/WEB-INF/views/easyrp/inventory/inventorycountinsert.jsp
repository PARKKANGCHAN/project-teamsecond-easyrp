<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                     <h3>재고 실사 등록</h3>
                     <p class="text-subtitle text-muted">재고 실사 등록</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">재고 실사 등록</li>
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
                              <h5 class="m-0">재고 실사 등록</h5>
                           </div>
                        </div>

                        
                        <div class="card-body mb-3">
                           <form action="inventorycountinsertfn" method="post">
                              <div class="mb-4">
                              <button type="button" class="btn btn-primary" id="loadProdInv" data-bs-toggle="modal" data-bs-target="#productInventoryModal" style="float: left; width: 10%">재고목록 가져오기</button>
                               <table class="table table-hover mb-0">
                              <!-- 재고 목록 모달 -->
							<tr>
							</tr>
										<thead>
											<tr>
												<th>품번</th>
												<th>품명</th>
												<th>전산재고</th>
												<th>실사재고</th>
												<th>차이수량</th>
												<th>처리구분</th>
												<th>조정수량</th>
												<th>비고</th>
											</tr>
										</thead>
										<tbody id="inventoryCountInsertBody">
											<!-- 모달에서 선택한 데이터 Ajax로 html속성 삽입 -->
										</tbody>
									</table>
                              </div>
                              <!-- 공통등록 Button START -->
                              <div style="text-align: center">
                                 <button type="submit" class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">등록</button>
                                 <a href="inventorymovement" class="me-2">
                                    <button type="button"class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">등록취소</button>
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
      <!-- Product&InventoryModal START  -->
      <div class="modal fade" id="productInventoryModal" tabindex="-1" aria-labelledby="productInventoryModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="productInventoryModalLabel">재고목록</h5>
                  <input
                     type="text"
                     id="searchDataInput"
                     class="form-control"
                     placeholder="재고코드 또는 품명을 입력해주세요."
                     style="margin-left: 10px; width: auto; flex-grow: 1"
                  />
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">품번</th>
                           <th scope="col">품명</th>
                        </tr>
                     </thead>
                     <tbody id="productInventoryModalTableBody">
                        <!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
                     </tbody>
                  </table>
               </div>
               <div class="modal-footer">
              	  <button type="button" id="countBtn" class="btn btn-primary" data-bs-dismiss="modal">적용</button>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
               </div>
            </div>
         </div>
      </div>
      <!-- Product&InventoryModal END  -->
     
      <script type="text/javascript">
         /*Product&InventoryModalTable START */
        
        function setData(cod, name, computingQty, procclass) {
    	          $('.cod').text(cod);
    	          $('.name').text(name);
    	          $('.computingQty').text(computingQty);
    	          $('.procclass').text(procclass);
    	          /*$('#prodInvAdjQty').text(adjQty);*/
    	          $('#productInventoryModal').modal('hide');
    	          $('.modal-backdrop').remove();
    	 }
         
         $(document).ready(function () {
        	$('#countBtn').on('click', function(){
        		checkedlist();
        	});

        		function checkedlist(){
        		    	
        			const selectedValues=[]; //체크된 값들 저장할 배열
        			$('input[name="checkedValue"]:checked').each(function(){
        				selectedValues.push($(this).val()); //배열에 값 추가
        			});
        			

        		$.ajax({
        			url: 'api/get-count',
        			method: 'GET',
        			data: {
        				itemList: selectedValues
        			},
        			contentType: "application/json",
        			success: function (data){
        				console.log('AJAX요청이 보내졌습니다.');
        				console.log(data);
        				let rows='';
        				data.forEach(function (item){
        					if(item.cod){
        						let diffQty = item.computingQty-item.countQty;
        						 rows += 
        							 `<tr class="searchData" data-cod="\${item.cod}" data-name="\${item.name}" style= "cursor: pointer">
        						 			<td class="cod">${item.cod}</td>
        						 			<td class="name">${item.name}</td>
        						 			<td class="computingQty">${item.computingQty}</td>
        						 			<td class="countQty"><input type="text" class="form-control" placeholder="실사재고량을 입력해주세요." required/></td>
        						 			<td class="diffQty">${diffQty}</td>
        						 			<td class="procclass">${item.procclass}</td>
        						 			<td class="adjQty">${item.adjQty}</td>
        						 			<td class="note"><input type="text" class="form-control" placeholder="비고를 입력해주세요."/></td>
										</tr>`
        					}
        				});
        		                     $('#inventoryCountInsertBody').html(rows);
        		                     $('#productInventoryModal').modal('hide');
        					},
        		error: function(xhr, status, error) {
        			console.error('AJAX 요청을 보낼 수 없습니다:', error);
        		}
        			});
        		};
        	
        	  $(document).on('click', '#countBtn', function() {
        	        // 선택된 행의 데이터 추출
        	        var selectedRow = $('.searchData.selected');
        	        var cod = selectedRow.data('cod');
        	        var name = selectedRow.data('name');
        	        var computingQty = selectedRow.find('td:eq(2)').text(); // 전산재고
        	        var procclass = selectedRow.find('td:eq(5)').text(); // 처리구분
        	        var diffQty = selectedRow.find('td:eq(4)').text(); // diffQty 추출
        	        //var adjQty = selectedRow.find('td:eq(6)').text(); // 조정수량
        	        
        	        // 데이터 설정 함수 호출
        	        setData(cod, name, computingQty, procclass);
        	    });
        	  
        	    $(document).on('click', '.searchData', function() {
        	        $('.searchData').removeClass('selected');
        	        $(this).addClass('selected');
        	    });
        	});
         
         $(document).ready(function () {
            $('#loadProdInv').on('click', function () {
               $.ajax({
                  url: 'api/get-prodinv',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.cod) {
                           rows +=
                        	  '<tr>'+
                              '<td>' +
                              '<input type="checkbox" name="checkedValue" value="'+
                              item.cod+
                              '"'+
                              'id='+
                              item.cod+
                              '>'+
                              '</td>' +
                              '<td>' +
                              item.cod +
                              '</td>' +
                              '<td>' +
                              item.name +
                              '</td>' +
                              '</tr>';
                        }
                     });
                     $('#productInventoryModalTableBody').html(rows);  
                     $('#productInventoryModal').modal('show');
                  },
               });
            });
            
            $('#searchDataInput').on('keyup', function () {
               let searchInputData = $(this).val();
               $('.searchData').each(function () {
                  let cod = $(this).data('cod');
                  let name = $(this).data('name');
                  $(this).toggle(cod.includes(searchInputData) || name.includes(searchInputData));
               });
            });
         });
         /* Product&InventoryModalTable END */
         

      </script>
   </body>
</html>
