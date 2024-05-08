<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
						<h3>주계획 수정</h3>
						<p class="text-subtitle text-muted">주계획 수정</p>
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
											<!-- 수주번호 INPUT -->
											<tr>
												<td width="150">수주번호</td>
												<td><input type="text" id="orderCod" name="orderCod"
													class="form-control" value="${mpsData.cod}" readonly/>
												</td>
											</tr>
											<!-- 수주번호 상세 INPUT -->
											<tr>
												<td width="150">수주상세번호</td>
												<td><input type="text" id="orderdetailNum" name="orderdetailNum"
													class="form-control" value="${mpsData.orderdetailNum}" readonly/>
												</td>
											</tr>
											<!-- 등록자 INPUT (로그인 시 자동으로 값 입력 readonly) -->
											<tr>
												<td width="150">등록자</td>
												<td><input type="text" id="author" name="author"
													class="form-control readonly" value="${empName }"
													placeholder="로그인을 하면 자동으로 입력됩니다." required  />
												</td>
											</tr>
											<!-- 수주일자 INPUT -->
											<tr>
												<td width="150">수주일자</td>
												<td><input type="text" id="orderDate" name="orderDate"
													class="form-control" value="${mpsData.orderDate}" readonly/>
												</td>
											</tr>
											<!-- 고객명 INPUT -->
											<tr>
												<td width="150">고객명</td>
												<td><input type="text" id="clientName" name="clientName"
													class="form-control" value="${mpsData.clientName}" readonly/>
												</td>
											</tr>
											<!-- 품번 INPUT -->
											<tr>
												<td width="150">품번</td>
												<td><input type="text" id="productCod" name="productCod"
													class="form-control" value="${mpsData.productCod}" readonly/>
												</td>
											</tr>
											<!-- 품명 INPUT -->
											<tr>
												<td width="150">품명</td>
												<td><input type="text" id="prodname" name="prodname"
													class="form-control" value="${mpsData.prodname}" readonly/>
												</td>
											</tr>
											<!-- 수량 INPUT -->
											<tr>
												<td width="150">수량</td>
												<td><input type="text" id="qty" name="qty"
													class="form-control" value="${mpsData.qty}" required 
													oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
													maxlength="5" />
												</td>
											</tr>
											<!-- 단위 INPUT (모달) -->
											<tr>
												<td width="150">단위</td>
												<td><input type="text" id="unitName"
													name="unitName" class="form-control"
													style="width: 100%; float: left" value="${mpsData.unitName}" readonly/>
													<!-- 
													<button type="button" class="btn btn-primary"
														id="loadValues" data-bs-toggle="modal"
														data-bs-target="#kvModal"
														style="margin-left: 2rem; width: 10%">
														단위 불러오기</button></td>  -->
											<!-- 출고예정일 INPUT -->
											<tr>
												<td width="150">출고예정일</td>
												<td><input type="text" id="deliveryDate" name="deliveryDate"
													class="form-control" value="${mpsData.deliveryDate}" readonly/>
												</td>
											</tr>
											<!-- 계획일 INPUT -->
		                                    <tr>
		                                       <td width="150">계획일</td>
		                                       <td>
		                                          <input
		                                             type="date"
		                                             id="planDate"
		                                             name="planDate"
		                                             class="form-control"
		                                             value="${mpsData.planDate}"
		                                             required
		                                          />
		                                       </td>
		                                    </tr>
		                                    <!-- 조달구분 INPUT -->
											<tr>
												<td width="150">조달구분</td>
												<td><select id="procurement" name="procurement" class="form-select">
													<option value="구매">구매</option>
													<option value="생산">생산</option>
												</select>
												</td>
											</tr>
											<!-- 비고 INPUT -->
											<tr>
												<td width="150">비고</td>
												<td><input type="text" id="note" name="note"
													class="form-control" value="${mpsData.note}"/>
												</td>
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
	</div>
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
	<!-- 공통 수정 테이블 END -->
	<script type="text/javascript">
    /* valueModal START */
    function setValue(cod, value) {
       $('#modalInput').val(value);
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
	</script>
</body>
</html>