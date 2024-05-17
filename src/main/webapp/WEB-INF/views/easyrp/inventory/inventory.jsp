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
						<h3>
							<a href="/easyrp/inventory">재고 현황</a>
						<button type="button" id="btnInventoryList"class="btn btn-primary" >자재</button>
						<button type="button" id="btnProductList" class="btn btn-primary">완제품</button>
						</h3>
						<p class="text-subtitle text-muted">재고 현황</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">재고 현황</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="row" id="table-hover-row">
					<div id="inventorySection">
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
											<form id="searchForm" action="inventory" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">재고 코드</td>
															<td><input type="text" id="cod"
																name="cod" class="form-control"
																value="${cod}" placeholder="재고 코드를 입력해주세요." /></td>
															<td width="100">창고</td>
															<td><input type="text" id="warehouse"
																name="warehouse" class="form-control"
																value="${warehouse}" placeholder="창고를 입력해주세요." /></td>
															<td width="100">담당자</td>
															<td><input type="text" id="employee"
																name="employee" class="form-control"
																value="${employee}" placeholder="담당자를 입력해주세요." /></td>
															<td width="100">계정</td>
															<td><input type="text" id="account"
																name="account" class="form-control"
																value="${account}" placeholder="계정을 입력해주세요." /></td>
														</tr>
														<tr>
															<td width="100">재고기준일</td>
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
									<button id="loadDetail" data-bs-toggle="modal" data-bs-target="#detailModal">재고실사</button>
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th>재고코드</th>
												<th>품명</th>
												<th>단위(재고)</th>
												<th>단가</th>
												<th>기초수량</th>
												<th>기초재고금액</th>
												<th>현재고수량</th>
												<th>현재고금액</th>
												<th>안전재고량</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty inventoryList}">
											<c:forEach var="inventoryList" items="${inventoryList }">
												<tr>
													<td class="text-bold-500">${inventoryList.cod }</td>
													<td>${inventoryList.name }</td>
													<td class="text-bold-500">${inventoryList.unit }</td>
													<td>${inventoryList.unitprice }
													<td>${inventoryList.qty }</td>
													<td>${inventoryList.price}
													<td>${inventoryList.curInvQty }</td>
													<td>${inventoryList.curInvPrice }</td>
													<td>${inventoryList.safetyInvQty }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="updateInventory?cod=${inventoryList.cod}">수정</a></li>
																<li><a class="dropdown-item"
																	href="deletefnInventory?cod=${inventoryList.cod}">삭제</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty inventoryList}">
											<tr>
												<td colspan="4">해당 재고가 없습니다.</td>
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
							<c:if test="${empty inventoryList}">
							<tr>
							</c:if>
							<c:if test="${not empty inventoryList}">
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
							</c:if>	
						</ul>
					</nav>
					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="easyrp/inventory/inventoryinsert" style="color: white">등록</a>
							</button>
						</div>
					</div>
					</div>
					<div id="productSection" style="display:none">
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
											<form id="searchForm" action="inventory" method="get">
												<div class="mb-4" style="text-align: center">
													<table class="table table-bordered" id="searchTable">
														<tr>
															<td width="100">재고 코드</td>
															<td><input type="text" id="cod"
																name="cod" class="form-control"
																value="${cod}" placeholder="재고 코드를 입력해주세요." /></td>
															<td width="100">창고</td>
															<td><input type="text" id="warehouse"
																name="warehouse" class="form-control"
																value="${warehouse}" placeholder="창고를 입력해주세요." /></td>
															<td width="100">담당자</td>
															<td><input type="text" id="employee"
																name="employee" class="form-control"
																value="${employee}" placeholder="담당자를 입력해주세요." /></td>
															<td width="100">계정</td>
															<td><input type="text" id="account"
																name="account" class="form-control"
																value="${account}" placeholder="계정을 입력해주세요." /></td>
														</tr>
														<tr>
															<td width="100">재고기준일</td>
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
									<button id="loadDetail" data-bs-toggle="modal"
										data-bs-target="#detailModal">재고실사</button>
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th>재고코드</th>
												<th>품명</th>
												<th>단위(재고)</th>
												<th>단가</th>
												<th>기초수량</th>
												<th>기초재고금액</th>
												<th>현재고수량</th>
												<th>현재고금액</th>
												<th>안전재고량</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty productList}">
											<c:forEach var="productList" items="${productList }">
												<tr>
													<td class="text-bold-500">${productList .cod }</td>
													<td>${productList .prodname }</td>
													<td class="text-bold-500">${productList.unit }</td>
													<td>${productList.unitprice }
													<td>${productList.basicInvQty }</td>
													<td>${productList.basicInvPrice}
													<td>${productList.curInvQty }</td>
													<td>${productList.curInvPrice }</td>
													<td>${productList.safetyInvQty }</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="updateInventory?cod=${productList.cod}">수정</a></li>
																<li><a class="dropdown-item"
																	href="deletefnInventory?cod=${productList.cod}">삭제</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty productList}">
											<tr>
												<td colspan="4">해당 재고가 없습니다.</td>
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
							<c:if test="${empty productList}">
							<tr>
							</c:if>
							<c:if test= "${not empty productList}">
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&size=${pageSize}&cod=${param.cod}&warehouse=${param.warehouse}&employee=${param.employee}&account=${param.account}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${startPage - 10}&size=${pageSize}&cod=${param.cod}&warehouse=${param.warehouse}&employee=${param.employee}&account=${param.account}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${startPage - 10}&size=${pageSize}&cod=${param.cod}&warehouse=${param.warehouse}&employee=${param.employee}&account=${param.account}&preSearchDate=${param.preSearchDate}&postSearchDate=${param.postSearchDate}</c:if>">다음
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
								<a href="easyrp/inventory/inventoryinsert" style="color: white">등록</a>
							</button>
						</div>
					</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 공통 사용 테이블 END -->
	<!-- 상세페이지 모달 START -->
	<div class="modal fade" id="detailModal" tabindex="-1"
		aria-labelledby="detailModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">재고 실사 등록</h5>
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
									<h5 class="m-0">재고 실사</h5>
								</div>
							</div>
							<div class="card-body mb-3">
								<form action="commoninsertfn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<!-- 글제목 INPUT INPUT -->
											<tr>
												<td width="150">재고코드</td>
												<td><input type="text" id="title" name="title"
													class="form-control" placeholder="을 입력해주세요."
													value="${inventoryCountList.cod }" required /></td>
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
        function resetSearchForm() {
            $('#cod').val('');
            $('#warehouse').val('');
            $('#employee').val('');
            $('#account').val('');
            $('#preSearchDate').val('');
            $('#postSearchDate').val('');
            
        }

      // AJAX를 사용하지 않고, 원래 있던 코드로 display + 세션스토리 사용해서 간단히 게시판 따로 보여주기 구현
      document.addEventListener('DOMContentLoaded', function () {
        var activeSection = sessionStorage.getItem('activeSection');

        // 기본값 설정
        if (!activeSection) {
          activeSection = 'inventoryList';
          sessionStorage.setItem('activeSection', 'inventoryList');
        }

        showSection(activeSection);

        document.getElementById('btnInventoryList').addEventListener('click', function () {
          showSection('inventoryList');
        });

        document.getElementById('btnProductList').addEventListener('click', function () {
          showSection('productList');
        });
      });
      
      //페이지 이동 전 스크롤 위치를 저장하는 함수
      function saveScrollPosition() {
        var scrollPosition = window.scrollY || document.documentElement.scrollTop;
        sessionStorage.setItem('scrollPosition', scrollPosition);
      }

      //페이지 이동 후, 스크롤 위치를 저장된 위치로 이동시키는 함수
      function restoreScrollPostion() {
        var scrollPosition = sessionStorage.getItem('scrollPosition');
        if (scrollPosition !== null) {
          window.scrollTo({
            top: scrollPosition,
            behavior: 'auto',
          });
          sessionStorage.removeItem('scrollPosition');
        }
      }
      // display 보여주고 세션스토리지 사용해서 담아두기
      function showSection(section) {
        var inventorySection = document.getElementById('inventorySection');
        var productSection = document.getElementById('productSection');

        inventorySection.style.display = 'none';
        productSection.style.display = 'none';

        if (section === 'inventoryList') {
          inventorySection.style.display = 'block';
          sessionStorage.setItem('activeSection', 'inventoryList');
        } else if (section === 'productList') {
          productSection.style.display = 'block';
          sessionStorage.setItem('activeSection', 'productList');
        }
      }
    </script>
</body>
</html>
