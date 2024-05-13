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
                           <form action="purchaseorderinsertfn" method="post">
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
									  			   name="searchClientCod"
									  			   class="form-control"
												   placeholder="거래처번호"
												   readonly 
												   required />
											<input type="text"
												   id="searchClientName"
												   name="searchClientName"
												   class="form-control"
												   placeholder="거래처명"
												   readonly
												   required />
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
												 name="searchEmpCodPo"
												 class="form-control"
												 placeholder="사원번호"
												 readonly 
 											     required />
										  <input type="text"
										  		 id="searchEmpNamePo"
												 name="searchEmpNamePo"
												 class="form-control"
												 placeholder="사원명"
												 readonly
												 required />
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
												 name="searchEmpCodIbound"
												 class="form-control"
												 placeholder="사원번호"
												 readonly 
												 required />
										  <input type="text"
										  		 id="searchEmpNameIbound"
												 name="searchEmpNameIbound"
												 class="form-control"
												 placeholder="사원명"
												 readonly 
												 required />
										  <button type="button"
										  		  class="btn btn-primary loadValues"
												  data-input-id1="searchEmpCodIbound"
												  data-input-id2="searchEmpNameIbound"
												  data-key="emp"
												  data-bs-toggle="modal"
												  data-bs-target="#searchModal">저장 값 가져오기</button>
                                       </td>
                                    </tr>
                                    <input type="hidden" name="employeeCodWriter" value="${sessionScope.empCode }" />
                                    <!-- 모달로 입력 테스트 -->
                                    <tr>
                                       <td width="150">청구적용</td>
                                       <td>
                                          <input
                                             type="text"
                                             id="modalInput"
                                             name="modalInput"
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
                                             저장 값 가져오기
                                          </button>
                                       </td>
                                    </tr>
                                 </table>
                              </div>
                              <!-- 공통등록 Button START -->
                              <div style="text-align: center">
                                 <button
                                    type="submit"
                                    class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                 >
                                    공통등록
                                 </button>
                                 <a href="commontable" class="me-2">
                                    <button
                                       type="button"
                                       class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4"
                                    >
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
      </script>
   </body>
</html>
