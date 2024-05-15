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
						<h3>소요량 등록</h3>
						<p class="text-subtitle text-muted">소요량을 수정해주세요.</p>
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
											<!-- mps 번호 INPUT -->
											<tr>
												<td width="150">계획번호</td>
												<td><input type="text" id="mpsCod" name="mpsCod"
													class="form-control" placeholder="계획번호를 불러오세요." required readonly/>${mrpData.mrpcod }
												</td>
											</tr>
											<!-- 등록자 INPUT -->
											<tr>
												<td width="150">등록자</td>
												<td><input type="text" id="employeeName" name="employeeName" value="${empName }"
													class="form-control" placeholder="로그인하면 자동으로 불러옵니다." required readonly/>
												</td>
											</tr>
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
													class="form-control" placeholder="예정발주일 입력해주세요." required readonly/>
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
										<div>
											<input type="hidden" id="employeeCod" name="employeeCod" value="${empCode}" />
										</div>
										<div style="text-align: center">
											<button type="button" onclick="callAjax()"
												class="px-5 py-3 btn btn-primary border-2 rounded-pill animated slideInDown mb-4 ms-4">
												소요량전개</button>
										</div>
										<br/>
										<table class="table table-hover mb-0">
											<thead>
												<tr>
													<th>품번</th>
													<th>품명</th>
													<th>규격</th>
													<th>계획일</th>
													<th>예정발주일</th>
													<th>납기일</th>
													<th>예정수량</th>
													<th>단위</th>
													<th>계정구분</th>
												</tr>
											</thead>
											<tbody id="mrpTableBody">
												<!-- 여기에 Ajax로 만든 html 속성이 들어감  -->
												<tr>
													<td colspan="9" align="center">소요량 전개 버튼을 눌러주세요.</td>
												</tr>
											</tbody>
										</table>
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
</body>
</html>