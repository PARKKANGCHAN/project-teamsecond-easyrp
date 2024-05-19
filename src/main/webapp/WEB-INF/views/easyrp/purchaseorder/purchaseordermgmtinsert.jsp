<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
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
                     <h3>발주 등록</h3>
                     <p class="text-subtitle text-muted">발주를 등록할수있는 페이지 입니다</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">발주등록</li>
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
                              <h5 class="m-0">발주 등록</h5>
                           </div>
                        </div>
                        <div class="card-body mb-3">
                           <form action="purchaseorderinsertfn" method="post" onsubmit="return prodNullChk()">
                              <div class="mb-4">
                                 <table class="table table-bordered">
                                    <tr>
                                       <td width="150">발주일자</td>
                                       <td>
                                          <input
                                             type="date"
                                             id="poDate"
                                             name="poDate"
                                             class="form-control"
                                             required
                                          />
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">거래처</td>
                                       <td>
                                            <input type="text"
                                            	   id="searchClientCod"
									  			   name="clientCod"
									  			   class="form-control"
												   placeholder="거래처번호"
												   required
												   autocomplete="off"
												   onkeypress="return false;" />
											<input type="text"
												   id="searchClientName"
												   name="searchClientName"
												   class="form-control"
												   placeholder="거래처명"
												   required
												   autocomplete="off"
												   onkeypress="return false;" />
											<button type="button"
												class="btn btn-primary loadValues"
												data-input-id1="searchClientCod"
												data-input-id2="searchClientName"
												data-key="client"
												data-bs-toggle="modal"
												data-bs-target="#searchModal">저장 값 가져오기</button>
                        	           </td>
                                    </tr>
                                    <tr>
                                       <td width="150">과세구분</td>
                                       <td>
                                          <select id="taxdivisionCod" name="taxdivisionCod" required>
											<option value="">선택</option>
											<c:forEach items="${taxDivList }" var="t">
												<option value="${t.cod }">${t.name }</option>
											</c:forEach>
										</select>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">발주담당자</td>
                                       <td>
                                          <input type="text"
                                          		 id="searchEmpCodPo"
												 name="employeeCodPo"
												 class="form-control"
												 placeholder="사원번호"
 											     required
 											     autocomplete="off"
												 onkeypress="return false;" />
										  <input type="text"
										  		 id="searchEmpNamePo"
												 name="searchEmpNamePo"
												 class="form-control"
												 placeholder="사원명"
												 required
												 autocomplete="off"
												 onkeypress="return false;" />
										  <button type="button"
										  		  class="btn btn-primary loadValues"
												  data-input-id1="searchEmpCodPo"
												  data-input-id2="searchEmpNamePo"
												  data-key="emp"
												  data-bs-toggle="modal"
												  data-bs-target="#searchModal">저장 값 가져오기</button>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">입고담당자</td>
                                       <td>
                                          <input type="text" 
                                          		 id="searchEmpCodIbound"
												 name="employeeCodIbound"
												 class="form-control"
												 placeholder="사원번호"
												 required
												 autocomplete="off"
												 onkeypress="return false;" />
										  <input type="text"
										  		 id="searchEmpNameIbound"
												 name="searchEmpNameIbound"
												 class="form-control"
												 placeholder="사원명"
												 required
												 autocomplete="off"
												 onkeypress="return false;" />
										  <button type="button"
										  		  class="btn btn-primary loadValues"
												  data-input-id1="searchEmpCodIbound"
												  data-input-id2="searchEmpNameIbound"
												  data-key="emp"
												  data-bs-toggle="modal"
												  data-bs-target="#searchModal">저장 값 가져오기</button>
                                       </td>
                                    </tr>
                                    <tr>
                                       <td width="150">납기일</td>
                                       <td>
                                          <input
                                             type="date"
                                             id="dday"
                                             name="dday"
                                             class="form-control"
                                          />
                                       </td>
                                    </tr>
                                    <input type="hidden" name="employeeCodWriter" value="${sessionScope.empCode }" />
                                    <tr>
                                       <td width="150">주문 제품
                                          <button type="button"
										  		  class="btn btn-primary"
										  		  id="prodInputModalBtn"
												  data-bs-toggle="modal"
												  data-bs-target="#prodInputModal">직접입력</button>
										  <button type="button"
										  		  class="btn btn-primary"
										  		  id="applyInvoice"
												  data-bs-toggle="modal"
												  data-bs-target="#applyInvoiceModal">청구적용</button>
                                       </td>
                                       <td>
                                          <table style="width: 1000px">
                                          	<thead>
                                          		<tr>
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
                                          			<th></th>
                                          		</tr>
                                          	</thead>
                                          	<tbody id="prodList">
                                          	</tbody>
                                          </table>
                                       </td>
                                    </tr>
                                 </table>
                              </div>
                              <div style="text-align: center">
                                 <button
                                    type="submit"
                                    class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                 >
                                    등록
                                 </button>
                                 <a href="purchaseordermgmttable" class="me-2">
                                    <button
                                       type="button"
                                       class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                    >
                                       취소
                                    </button>
                                 </a>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>
      </div>
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
							data-bs-target="#prodSearchModal">제품찾기</button>
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
						<button type="button" onclick="amountChange('+')">+</button>
						<button type="button" onclick="amountChange('-')">-</button>
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
	<script type="text/javascript">
   
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
    
    /* 청구적용 Modal START */
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
                        row += '<td><input type="hidden" name="'+ data.name +'" value="'+ data.value +'">' + data.value + '</td>';                	
        			}
                });
                row += '<td><button type="button" aria-label="Close" onClick="{delProd(event)}">X</button></td></tr>';
                rows += row;    			
    		}
    	});
       $('#prodList').append(rows);    
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
                	let checkedStr = '';
                	$('.applyInvoiceProd').each((index, value) => {
              		  if($(value).data('key') == item.invoice_cod + item.num) {
              			  checkedStr = 'checked';
              		  }; 
              	   });
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
                         checkedStr +
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
    
    /* 부가세.공급가.합계액을 계산해주는 함수 */
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
    
    /* 주문제품목록에 항목을 추가하는 함수 */
    function addProd() {
    	const cod = $('#prodCod').val();
    	const name = $('#prodName').val();
    	const mgmtUnitAmount = $('#prodMgmtUnitAmount').val();
    	const unitAmount = $('#prodUnitAmount').val();
    	const mgmtUnitCod = $('#mgmtUnitCod').val();
    	const unitCod = $('#unitCod').val();
    	const mgmtUnitName = $('#prodMgmtUnitName').text();
    	const unitName = $('#prodUnitName').text();
    	const unitprice = $('#prodUnitprice').val();
    	const vax = $('#prodVax').val();
    	const supprice = $('#prodSupprice').val();
    	const total = $('#prodTotal').val();
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
        		name: 'invQty',
        		value: unitAmount
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
        		value: mgmtUnitAmount
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
    	let rows = '<tr class="prodList">';
    	values.forEach((item,index) => {
    		if(item.name === 'unitMgmt' || item.name === 'unitInv'){
            	rows += '<input type="hidden" name="'+ item.name +'" value="'+ item.value +'">';
    		} else {
            	rows += '<td><input type="hidden" name="'+ item.name +'" value="'+ item.value +'">' + item.value + '</td>';
    		}
    	})
    	rows += '<td><button type="button" aria-label="Close" onClick="{delProd(event)}">X</button></td></tr>';
    	$('#prodList').append(rows);
    }
    
    /* 주문제품목록에 있는 항목을 삭제하는 함수 */
    function delProd(e) {
    	e.target.parentElement.parentElement.remove();
    }
    
    /* 주문제품목록에 값이 들어있는지 확인하는 함수 */
    function prodNullChk() {
    	let returnBool = true;
    	if($('.prodList').length === 0) {
    		alert("주문제품을 입력해주세요");
    		returnBool = false;
    	} else {
    		$('.prodList').each((index,item) => {
    			$($(item).children()).each((childIndex,childItem) => {
    				if($(childItem).prop('tagName') === 'INPUT') {
    					$(childItem).attr('name', 'poDetailList['+ index +'].'.concat($(childItem).attr('name')));
    				} else if($(childItem).prop('tagName') === 'TD' && 
    						  $(childItem).children('input').attr('name') !== '' &&
    						  $(childItem).children('input').attr('name') != null) {
    					$(childItem).children('input').attr('name', 'poDetailList['+ index +'].'.concat($(childItem).children('input').attr('name')));
    				}
    			})
    		})
    	}
    	return returnBool;
    }
    
    /* 직접입력에서 수량을 변경하는 함수 */
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
    
      </script>
   </body>
</html>
