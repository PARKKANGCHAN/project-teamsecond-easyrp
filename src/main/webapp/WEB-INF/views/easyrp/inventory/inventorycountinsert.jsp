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
                              <label for="warehouseBox">창고</label>
			                  	<select id="warehouseBox" class="form-select" style="width: 150px">
			                	  	<option value="">선택해주세요.</option>
			                  		 <c:forEach var="warehouseinv" items="${warehouseinv }">
			                  		 <option id="${warehouseinv.cod }" value="${warehouseinv.name}">${warehouseinv.name }</option>
			                  		 </c:forEach>
			                 	</select>
                               <table class="table table-hover mb-0">
                              <!-- 재고 목록 모달 -->
							<tr>
							</tr>
										<thead>
											<tr>
												<th></th>
												<th>품번</th>
												<th>품명</th>
												<th id="accountclass" onclick="accountList()">품목구분</th>
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
                                 <a href="inventorycount" class="me-2">
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
	                 	<div>
	                 		<label for="warehouseBox">창고</label>
		                  	<select id="warehouseBox" style="width: 100px">
		                	  	<option value="">선택해주세요.</option>
		                  		<!--  <ajax로 만든 html  속성> -->
		                 	</select>
                  			<input type="text" id="searchDataInput" class="form-control" placeholder="재고코드 또는 품명을 입력해주세요." style="margin-left: 10px; width: auto; flex-grow: 1"/>
                 		</div>
                 	
               <div>
              	  <button type="button" id="countBtn" class="btn btn-primary" data-bs-dismiss="modal">적용</button>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               </div>
               <div class="modal-body">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col"></th>
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
         
        function setCountDiff(countQtyInputId, computingQtyId){
        	let countQtyInputData = $('#'+countQtyInputId).val();
            if (countQtyInputData != null && countQtyInputData !== "") {
            	
             	let computingQty =$('#'+computingQtyId).text(); // 전산재고
            	console.log(computingQty);
            	let diffQty=computingQty-countQtyInputData; //차이수량
            	$('#' + countQtyInputId).closest('tr').find('.diffQty').text(diffQty);
            } else {
                // 입력된 값이 비어 있으면 차이수량을 0으로 설정
                $('#' + countQtyInputId).closest('tr').find('.diffQty').text(0);
               }
        }
        
        
 /*        $(document).ready(function () {
        	$('#countBtn').on('click', function(){
        		checkedlist();
        	});

        		function checkedlist(){
        		    	
        			const selectedValues = []; //체크된 값들 저장할 배열
        			$('input[name="checkedValue"]:checked').each(function(){
        				selectedValues.push($(this).val()); //배열에 값을 추가
        			});
        			
		console.log(selectedValues);
        		$.ajax({
        			url: 'api/get-count',
        			method: 'GET',
        			traditional: true,
        			data: {
        				itemList: selectedValues
        			},
        			contentType: "application/json",
        			success: function (data){
        				console.log('AJAX요청이 보내짐');
        				console.log(data);
        				let rows='';
        				$('#inventoryCountInsertBody').append(rows);
        				data.forEach(function (item){
        					if(item.cod){
        						let num = rows.length;
        						let diffQty = item.computingQty-item.countQty;
        						let procclass = '';
        						
        						if(item.procclass != null){
        							procclass = item.procclass;
        						}else{
        							procclass = '미처리';
        						}

        						 rows += 
        							 `<tr class="searchData" data-cod="\${item.cod}" data-name="\${item.name}" style= "cursor: pointer">
        						 			<td class="cod">\${item.cod}</td>
        						 			<td class="name">\${item.name}</td>
        						 			<td class="computingQty" id="\${item.cod}\${num}">\${item.computingQty}</td>
        						 			<td width=100 class="countQty">
        						 				<input type="number" onkeyup="setCountDiff(this.id, '\${item.cod}\${num}')" id="\${item.cod}" class="countqtyinput form-control" placeholder="실사재고량을 입력해주세요." required/>
        						 			</td>	
        						 			<td class="diffQty">\${diffQty}</td>
        						 			<td class="procclass">\${procclass}</td>
        						 			<td class="adjQty">\${item.adjQty}</td>
        						 			<td class="note"><input type="text" class="form-control" placeholder="비고를 입력해주세요."/></td>
										</tr>`
        					}
        				});
        		                     $('#inventoryCountInsertBody').append(rows);
        		                     $('#productInventoryModal').modal('hide');
        					},
        		error: function(xhr, status, error) {
        			console.error('AJAX error:', error);
        		}
        			});
        		};
        	  
        	    $(document).on('click', '.searchData', function() {
        	        $('.searchData').removeClass('selected');
        	        $(this).addClass('selected');
        	    });
        	    
                 });
      
      */
         $(document).ready(function () {
            $('#warehouseBox').on('change', function () {
            	//console.log(event.target.value);
            	if($('#inventoryCountInsertBody').children().length > 0 ){
            		if(!confirm("창고 변경 시, 기존 데이터가 소멸됩니다. 변경하시겠습니까?")){
            			return;
            		}
            		};
            	warehouselist = $("#warehouseBox").val();
            	
               $.ajax({
                  url: 'api/get-prodinv',
      			traditional: true,
                  data: { 
                	  warehouse : warehouselist,
                	  },
                  method: 'GET',
                  success: function (data) {
                	  console.log(data);
                     let rows = '';
						if(data.length<1){
							rows+=`<tr><td colspan='9' style="text-align:center">창고에 재고가 없습니다.</td></tr>`;
						}
                     data.forEach(function (item) {
                        if (item.cod) {
                        	let num = rows.length;
    						let diffQty = item.computingQty-item.countQty;
    						let procclass = '';
    						
    						if(item.procclass != null){
    							procclass = item.procclass;
    						}else{
    							procclass = '미처리';
    						}

                           rows +=
                        	`<tr class="searchData" data-cod="\${item.cod}" data-name="\${item.name}" style= "cursor: pointer">
                        	<td><input type="checkbox" name="prodInvCod"></td>
				 			<td class="cod">\${item.cod}</td>
				 			<td class="name">\${item.name}</td>
				 			<td class="account" id="prodInvAccount" value="\${item.account}">\${item.account}</td>
				 			<td class="computingQty" id="\${item.cod}\${num}">\${item.computingQty}</td>
				 			<td width=100 class="countQty">
				 				<input type="number" onkeyup="setCountDiff(this.id, '\${item.cod}\${num}')" id="\${item.cod}" class="countqtyinput form-control" placeholder="실사재고량을 입력해주세요." required/>
				 			</td>	
				 			<td class="diffQty">\${diffQty}</td>
				 			<td class="procclass">\${procclass}</td>
				 			<td class="adjQty">\${item.adjQty}</td>
				 			<td class="note"><input type="text" class="form-control" placeholder="비고를 입력해주세요."/></td>
						</tr>`;
                        };
                     });
                     $('#inventoryCountInsertBody').html(rows);  
                  }
                	  });
               
               $('#warehouseBox').on('click', 'tr', function(e){
                   if($(e.target).is('input:checkbox')) return;
                   var chkbox = $(this).find('td:first-child :checkbox');
                   chkbox.prop('checked', !chkbox.prop('checked'));
               }); 
          			});
               });
         
  /*       $(document).ready(function () {
                $.ajax({
                   url: 'api/get-warehouselist',
                 method: 'GET',
                 success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.cod) {
                           rows +=
                        	   `<option id="\${item.cod }" value="\${item.name}">\${item.name }</option>`
                        }
                     });
                     $('#warehouseBox').html(rows);  
                  },
               });
            });*/
            
         /* Product&InventoryModalTable END */
	function accountlist(){
            	case ($('#accountclass').val){
            		case '완제품':
            			$('#accountclass').val='완제품'
            	}
            	
            }
         

      </script>
   </body>
</html>
