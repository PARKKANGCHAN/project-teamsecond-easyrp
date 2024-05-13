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
                               <table class="table table-hover mb-0">
                              <!-- 재고 목록 모달 -->
							<tr>
                              <button type="button" class="btn btn-primary" id="loadProdInv" data-bs-toggle="modal" data-bs-target="#dataProductInventoryModal" style="margin-right: 2rem; width: 10%">재고목록 가져오기</button>
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
										<tbody>
											<c:forEach var="getAllProductInventoryList" items="${getAllProductInventoryList}">
												<tr>
													<td class="text-bold-500" id="ProdInvCod">${getAllProductInventoryList.Cod }</td>
													<td id="ProdInvName">${getAllProductInventoryList.name}</td>
													<td id="ProdInvComputingQty"class="text-bold-500">${selectedInventoryList.computingQty}</td>
													<td id="ProdInvCountQty"> <input type="text" id="countqty" class="form-control" placeholder="실사재고량을 입력해주세요." required/></td>
													<td id="ProdInvDiffQty">${selectedInventoryList.diffQty}</td>
													<td id="ProdInvCountClass">${selectedInventoryList.countclass}</td>
													<td id="ProdInvAdjQty">${selectedInventoryList.adjqty}</td>
													<td id="ProdInvNote"><input type="text" id="countnote" class="form-control" placeholder="비고를 입력해주세요." /></td>
												</tr>
											</c:forEach>
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
      	      <!-- Value Modal START  -->
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
                     <tbody id="productInventorymodalTableBody">
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
      <!-- 상세페이지 모달 START -->
	<div class="modal fade" id="detailModal" tabindex="-1"
		aria-labelledby="detailModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">공통 상세 페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<section class="section">
				<div class="row" id="table-hover-row">
					<div class="col-12">
						<div class="card mb-4">
							<div class="card-header py-3">
								<div>
									<h5 class="m-0">공통 수정</h5>
								</div>
							</div>
							<div class="card-body mb-3">
								<form action="commoninsertfn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<!-- 글제목 INPUT INPUT -->
											<tr>
												<td width="150">글제목</td>
												<td><input type="text" id="title" name="title"
													class="form-control" placeholder="제목을 입력해주세요."
													value="${updateData.title }" required /></td>
											</tr>
											<!-- 내용 INPUT -->
											<tr>
												<td width="150">내 용</td>
												<td><input type="text" id="content" name="content"
													value="${updateData.content }" class="form-control"
													placeholder="내용을 입력해주세요." required /></td>
											</tr>
											<!-- 글쓴이 INPUT (로그인 시 자동으로 값 입력 readonly) -->
											<tr>
												<td width="150">글쓴이</td>
												<td><input type="text" id="author" name="author"
													class="form-control" value="${empName }"
													placeholder="로그인을 하면 자동으로 입력됩니다." readonly required /></td>
											</tr>
										</table>
									</div>
									<!-- 공통등록 Button START -->
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											공통 수정</button>
										<a href="commontable" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												수정 취소</button>
										</a>
									</div>
									<!-- 공통 수정 Button END -->
								</form>
								<!-- 공통 수정 END -->
							</div>
						</div>
						<!-- 공통 수정 FORM END -->
					</div>
				</div>
			</section>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 상세페이지 모달 END  -->
      <script type="text/javascript">
         /* valueModal START */
         function setValue(cod, value) {
            $('#unit').val(value);
            $('#kvModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadValues').on('click', function () {
               $.ajax({
                  url: 'api/get-kv',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.id && item.cod) {
                           rows +=
                              '<tr onclick="setValue(\'' +
                              item.cod +
                              "', '" +
                              item.value +
                              '\')" ' +
                              'class="searchValue" data-cod="' +
                              item.cod +
                              '" data-value="' +
                              item.value +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              item.id +
                              '</td>' +
                              '<td>' +
                              item.cod +
                              '</td>' +
                              '<td>' +
                              item.value +
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
                  var cod = $(this).data('cod').toLowerCase()
                  var value = $(this).data('value').toLowerCase()
                  $(this).toggle(cod.includes(searchInputVlaue) || value.includes(searchInputVlaue));
               });
            });
         });
         /* valueModal END */

         /*Product&InventoryModalTable START */
         function setData(cod, name) {
            $('#cod').val(cod);
            $('#name').val(name);
            $('#dataProductInventoryModal').modal('hide');

            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadProdInv').on('click', function () {
               $.ajax({
                  url: 'api/get-prodinv',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.cod && item.name) {
                           rows +=
                              '<tr onclick="setData(\'' 
                              +item.cod +
                              "', '" +
                              item.name +
                              '\')" ' +
                              'class="searchData" data-cod="' +
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
                        }
                     });
                     $('#productInventoryModalTableBody').html(rows);  
                     $('#dataProductInventoryModal').modal('show');
                  },
               });
            });
            
            $('#searchDataInput').on('keyup', function () {
               var searchInputData = $(this).val();
               $('.searchData').each(function () {
                  var cod = $(this).data('cod');
                  var name = $(this).data('name');
                  $(this).toggle(cod.includes(searchInputData) || name.includes(searchInputData));
               });
            });
         });
         /* DataModal END */
      </script>
   </body>
</html>
