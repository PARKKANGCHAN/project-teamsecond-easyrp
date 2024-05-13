<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h3>소요량 등록</h3>
						<p class="text-subtitle text-muted">소요량을 등록해주세요.</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">소요량 전개</li>
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
									<h5 class="m-0 col-6">등록</h5>
									<div class="d-flex col-6 justify-content-end">
										<button type="button" class="btn btn-primary mx-2" id="loadDatas"
										data-bs-toggle="modal" data-bs-target="#dataModal"
										style="float: left; width: 24%">
											수주정보 가져오기</button>
										<button type="button" class="btn btn-primary" id="loadDatas"
											data-bs-toggle="modal" data-bs-target="#dataModal"
											style="float: left; width: 24%">
											판매계획 가져오기</button>
									</div>
								</div>
							</div>
							<div class="card-body mb-3">
								<form id="formContainer" action="mrpinsertfn" method="post">
									<div class="mb-4">
										<table class="table table-bordered">
											<!-- 품번 INPUT -->
											<tr>
												<td width="150">품번</td>
												<td><input type="text" id="productCod" name="productCod"
													class="form-control" placeholder="품번을 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 품명 INPUT -->
											<tr>
												<td width="150">품명</td>
												<td><input type="text" id="prodname" name="prodname"
													class="form-control" placeholder="품명을 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 규격 INPUT -->
											<tr>
												<td width="150">규격</td>
												<td><input type="text" id="spec" name="spec"
													class="form-control readonly""
													placeholder="규격을 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 계획일 INPUT -->
											<tr>
												<td width="150">계획일</td>
												<td><input type="text" id="takeDate" name="takeDate"
													class="form-control" placeholder="계획일를 입력해주세요." required/>
												</td>
											</tr>
										<!-- 예정발주일 INPUT -->
											<tr>
												<td width="150">예정발주일</td>
												<td><input type="date" id="poDate" name="poDate"
													class="form-control" placeholder="예정발주일 입력해주세요." required/>
												</td>
											</tr>
											<!-- 납기일 INPUT -->
											<tr>
												<td width="150">납기일</td>
												<td><input type="text" id="dday" name="dday"
													class="form-control" placeholder="납기일을 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 예정수량 INPUT -->
											<tr>
												<td width="150">예정수량</td>
												<td><input type="text" id="qty" name="qty"
													class="form-control" placeholder="예정수량을 입력해주세요." required oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
													maxlength="5"/>
												</td>
											</tr>
											<!-- 단위 INPUT -->
											<tr>
												<td width="150">단위</td>
												<td><input type="text" id="unitName" name="unitName"
													class="form-control" placeholder="단위를 불러오세요." required readonly/>
												</td>
											</tr>
											<!-- 계정구분 INPUT -->
											<tr>
												<td width="150">계정구분</td>
												<td><input type="text" id="account" name="account"
													class="form-control" placeholder="계정구분을 불러오세요." required readonly/>
												</td>
											</tr>
										</table>
										<br/>
										<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th></th>
												<th>품번</th>
												<th>품명</th>
												<th>규격</th>
												<th>소요일자</th>
												<th>예정발주일</th>
												<th>납기일</th>
												<th>계획수량</th>
												<th>단위</th>
												<th>계정구분</th>
												<th>기능</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty mrpTable }">
												<c:forEach var="mpsTable" items="${mrpTable }">
													<tr>
														<td><input type="checkbox" name="checkbox"></td>
														<td>${mrpTable.productCod}</td>
														<td>${mpsTable.prodname }</td>
														<td>${mpsTable.spec }</td>
														<td><fmt:formatDate value="${mrpTable.takeDate }" pattern="yyyy-MM-dd"/></td>
														<td><fmt:formatDate value="${mpsTable.poDate }" pattern="yyyy-MM-dd"/></td>
														<td><fmt:formatDate value="${mpsTable.dday }" pattern="yyyy-MM-dd"/></td>
														<td>${mpsTable.qty }</td>
														<td>${mpsTable.unitName }</td>
														<td>${mpsTable.account }</td>
														<td>
															<div class="btn-group">
																<button type="button"
																	class="btn btn-primary dropdown-toggle"
																	data-bs-toggle="dropdown" aria-expanded="false">
																	<i class="fa-solid fa-gear"></i>
																</button>
																<ul class="dropdown-menu">
																	<li><a class="dropdown-item"
																		href="mpsupdate?cod=${mpsTable.cod}">수정</a></li>
																	<li><a class="dropdown-item"
																		href="mpsdeletefn?cod=${mpsTable.cod}">삭제</a></li>
																</ul>
															</div>
														</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${empty mrpTable }">
												<tr>
													<td colspan="11" align="center">소요량전개 내역이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
									</div>
									<div>
										<input type="hidden" id="employeeCod" name="employeeCod" value="${empCode}" />
										<input type="hidden" id="plan" name="plan" value='수주' />
									</div>
									<!-- 등록 Button START -->
									<div style="text-align: center">
										<button type="submit"
											class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
											등록</button>
										<a href="mrpmanagement" class="me-2">
											<button type="button"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												등록취소</button>
										</a>
									</div>
									<!-- 등록 Button END -->
								</form>
								<!-- 등록 END -->
							</div>
						</div>
						<!-- 등록 FORM END -->
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 공통 사용 테이블 END -->
	<!-- Unit Value Modal START  -->
	<div class="modal fade" id="kvModal" tabindex="-1"
		aria-labelledby="kvModalLabel" aria-hidden="true" data-bs-backdrop='static' data-bs-keyboard='false' >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="kvModalLabel">품번-품명 선택</h5>
					<input type="text" id="searchInput" class="form-control"
						placeholder="품번 또는 품명을 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
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
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Value Modal END  -->
	<!-- Data Modal START  -->
	<div class="modal fade modal-lg" id="dataModal" tabindex="-1"
		aria-labelledby="dataModalLabel" aria-hidden="true" data-bs-backdrop='static' data-bs-keyboard='false'>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="dataModalLabel">데이터 선택</h5>
					<input type="text" id="searchDataInput" class="form-control"
						placeholder="검색할 데이터를 입력해주세요."
						style="margin-left: 10px; width: auto; flex-grow: 1" />
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">품번</th>
								<th scope="col">품명</th>
								<th scope="col">계획일</th>
								<th scope="col">예정수량</th>
								<th scope="col">단위</th>
								<th scope="col">계정구분</th>
							</tr>
						</thead>
						<tbody id="modalDataTableBody">
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
</body>
<!-- Data Modal END  -->
     <script type="text/javascript">
         /* DataModal START */
          function setData(productCod, prodname, spec, planDate, poDate, dday, qty, unitName, account) {
            $('#productCod').val(productCod);
            $('#prodname').val(prodname);
            $('#spec').val(spec);
            $('#takeDate').val(planDate);
            $('#poDate').val(poDate);
            $('#dday').val(dday);
            $('#qty').val(qty);
            $('#unitName').val(unitName);
            $('#account').val(account);
            $('#dataModal').modal('hide');
            $('.modal-backdrop').remove();
         }

         $(document).ready(function () {
            $('#loadDatas').on('click', function () {
               $.ajax({
                  url: 'api/get-mpsval',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.cod) {
                           //예정발주일을 납기일의 이틀 전으로 자동으로 설정한다.
                           let poDate = new Date(item.planDate);
                           poDate.setDate(poDate.getDate()-2);
                           
                           rows +=
                              '<tr onclick="setData(\'' +
                              item.productCod +
                              "', '" +
                              item.prodname +
                              "', '" +
                              item.spec +
                              "', '" +
                              item.planDate +
                              "', '" +
                              poDate.toISOString().slice(0, 10) +
                              "', '" +
                              item.dday +
                              "', '" +
                              item.qty +
                              "', '" +
                              item.unitName +
                              "', '" +
                              item.account +
                              '\')" ' +
                              'class="searchData" data-productCod="' +
                              item.productCod +
                              '" data-prodname="' +
                              item.prodname +
                              '" style= "' +
                              'cursor: pointer' +
                              '">' +
                              '<td>' +
                              item.productCod +
                              '</td>' +
                              '<td>' +
                              item.prodname +
                              '</td>' +
                              '<td>' +
                              item.planDate +
                              '</td>' +
                              '<td>' +
                              item.qty +
                              '</td>' +
                              '<td>' +
                              item.unitName +
                              '</td>' +
                              '<td>' +
                              item.account +
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
                  let productCod = String($(this).data('productcod')).toLowerCase();
                  let prodname = String($(this).data('prodname')).toLowerCase();
                  $(this).toggle(productCod.includes(searchInputData) || prodname.includes(searchInputData));
               });
            });
         });
         /* DataModal END */
	</script>
</html>