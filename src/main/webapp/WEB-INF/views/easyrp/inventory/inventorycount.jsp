<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<!-- inventorycount START -->
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
							<a href="/easyrp/inventory/inventorycount">재고 실사 현황</a>
						</h3>

					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">재고 실사</li>
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
											<form id="searchForm" action="inventorycount" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">실사 번호</td>
															<td>
																<input type="text" id="searchCod" name="searchCod" class="form-control" value="${searchCod}" placeholder="실사 번호를 입력해주세요." />
															</td>
															<td width="100">창고</td>
															<td>
																<input type="text" id="searchWarehouse" name="searchWarehouse" class="form-control" value="${searchWarehouse}" placeholder="창고를 입력해주세요." />
															</td>
															<td width="100">품명</td>
															<td>
																<input type="text" id="searchProduct" name="searchProduct" class="form-control" value="${searchProduct}" placeholder="품명를 입력해주세요." />
															</td>
															<td width="100">담당자</td>
															<td>
																<input type="text" id="searchEmployee" name="searchEmployee" class="form-control" value="${searchEmployee}" placeholder="담당자명을 입력해주세요." />
															</td>
															<td width="100">자재명</td>
															<td>
																<input type="text" id="searchInventory" name="searchInventory" class="form-control" value="${searchInventory}" placeholder="자재명을 입력해주세요." />
															</td>
														</tr>
														<tr>
															<td width="100">검색 날짜</td>
															<td colspan="3"><input type="date"
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
												<th>실사번호</th>
												<th>실사일자</th>
												<th>재고기준일</th>
												<th>창고</th>
												<th>장소</th>
												<th>실사구분</th>
												<th>담당자</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty inventoryCountList}">
											<c:forEach var="inventoryCountList" items="${inventoryCountList}">
												<tr>
													<td class="text-bold-500">${inventoryCountList.cod }</td>
													<td>${inventoryCountList.countDate}</td>
													<td class="text-bold-500">${inventoryCountList.invDate}</td>
													<td>${inventoryCountList.warehouse}</td>
													<td>${inventoryCountList.location}</td>
													<td>${inventoryCountList.countclass}</td>
													<td>${inventoryCountList.employee}</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="updateinventoryCount?cod=${inventoryCountList.cod}">수정</a></li>
																<li><a class="dropdown-item"
																	href="deleteinventoryCount?cod=${inventoryCountList.cod}">삭제</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty inventoryCountList}">
											<tr>
												<td colspan='8' style="text-align:center">실사기록이 없습니다.</td>
											</tr>
											</c:if>
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
							<c:if test="${empty inventoryCountList}">
							<tr>
							</c:if>
							<c:if test="${not empty inventoryCountList}">						
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&searchCod=${searchVO.searchCod}&searchWarehouse=${searchVO.searchWarehouse}&searchProduct=${searchVO.searchProduct}&searchLocation=${searchVO.searchLocation}&searchInventory=${searchVO.searchInventory}&searchCountClass=${searchVO.searchCountClass}&searchEmployee=${searchVO.searchEmployee}&searchAccount=${searchVO.searchAccount}&preSearchDate=${searchVO.preSearchDate}&postSearchDate=${searchVO.postSearchDate}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&searchCod=${searchVO.searchCod}&searchWarehouse=${searchVO.searchWarehouse}&searchProduct=${searchVO.searchProduct}&searchLocation=${searchVO.searchLocation}&searchInventory=${searchVO.searchInventory}&searchCountClass=${searchVO.searchCountClass}&searchEmployee=${searchVO.searchEmployee}&searchAccount=${searchVO.searchAccount}&preSearchDate=${searchVO.preSearchDate}&postSearchDate=${searchVO.postSearchDate}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&searchCod=${searchVO.searchCod}&searchWarehouse=${searchVO.searchWarehouse}&searchProduct=${searchVO.searchProduct}&searchLocation=${searchVO.searchLocation}&searchInventory=${searchVO.searchInventory}&searchCountClass=${searchVO.searchCountClass}&searchEmployee=${searchVO.searchEmployee}&searchAccount=${searchVO.searchAccount}&preSearchDate=${searchVO.preSearchDate}&postSearchDate=${searchVO.postSearchDate}</c:if>">다음
									10 페이지</a>
							</li>
							</c:if>		
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="inventorycountinsert" style="color: white">등록</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 공통 사용 테이블 END -->
	    <script type="text/javascript">
        function resetSearchForm() {
            $('#cod').val('');
            $('#searchWarehouse').val('');
            $('#searchProduct').val('');
            $('#searchLocation').val('');
            $('#searchInventory').val('');
            $('#searchCountClass').val('');
            $('#searchEmployee').val('');
            $('#searchAccount').val('');
            $('#preSearchDate').val('');
            $('#postSearchDate').val('');
            
        }
    </script>
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
											<!-- 모달로 입력 테스트 -->
											<tr>
												<td width="150">모달 입력 테스트</td>
												<td><input type="text" id="modalInput"
													name="modalInput" class="form-control"
													value="${updateData.modalInput }"
													style="width: 80%; float: left"
													placeholder="모달을 이용해서 입력하는 테스트" required />
                                          <button
                                             type="button"
                                             class="btn btn-primary"
                                             id="loadValues"
                                             data-bs-toggle="modal"
                                             data-bs-target="#kvModal"
                                             style="margin-left: 2rem; width: 10%"
                                          >
                                             저장 값 가져오기
                                          </button></td>
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
