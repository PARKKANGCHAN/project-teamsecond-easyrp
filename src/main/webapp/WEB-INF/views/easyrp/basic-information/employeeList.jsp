<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
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
						<h3>사원 기초 관리 및 목록</h3>
						<p class="text-subtitle text-muted">사원에 대한 관리를 할 수 있는 목록</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">사원
									기초 관리</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>

			<!-- Basic Tables start -->
			<section class="section">
				<div class="card">
					<div class="card-header"
						style="display: flex; justify-content: space-between;">
						<h5 class="card-title">jQuery Datatable</h5>
						<div>
							<a href="employeeregis">사원등록</a>
							<button id="quitRegisBtn" type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								onclick="return quitRegis()" >
								퇴사등록</button>
							<a href="employeeregis">수정</a> <a href="employeeregis">삭제</a>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table" id="table1" style="width: 100%">
								<thead>
									<tr>
										<th>사원코드</th>
										<th>사원명</th>
										<th>성별</th>
										<th>생년월일</th>
										<th>연락처</th>
										<th>이메일</th>
										<td>부서코드</td>
										<th>부서명</th>
										<th>직급</th>
										<th>사업장</th>
										<td>지역</td>
										<th>입사일</th>
										<th>퇴사일</th>
										<th>퇴사사유</th>
										<!-- 비밀번호는 인사팀관리자가 로그인했을때만 보여지도록 나중에 수정하기 -->
										<th>비밀번호</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${employeeList }" var="e">
										<tr onclick="itemCheck('${e.cod}')">
											<td>${e.cod }</td>
											<td>${e.name }</td>
											<td>${e.gender }</td>
											<td>${e.birthdate }</td>
											<td>${e.tel }</td>
											<td>${e.email }</td>
											<td>${e.dept_cod }</td>
											<td>${e.dept_name }</td>
											<td>${e.emp_position }</td>
											<td>${e.wrkname }</td>
											<td>${e.location }</td>
											<td>${e.regdate }</td>
											<td>${e.quitdate }</td>
											<td>${e.quit_reason }</td>
											<td>${e.password }</td>
											<input type="hidden" id="${e.cod }" class="unchecked"/>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
			<!-- Basic Tables end -->
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true" data-dismiss="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">퇴사등록</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div>
							<span>퇴사일</span>
							<input type="date"/>
						</div>
						<div>
							<span>퇴사사유</span>
							<input type="text" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal end -->
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	const myModal = document.getElementById('myModal');
	const myInput = document.getElementById('myInput');
	document.getElementById('exampleModal').toggle();
	
	//퇴사등록.수정.삭제할 항목을 고르는 함수
	const itemCheck = (cod) => {
		const input = document.getElementById(cod);
		const tr = document.getElementById(cod).parentElement;
		
		if(input.className == "checked") {
			tr.style.backgroundColor = "white";
			input.className = "unchecked";
		} else {
			tr.style.backgroundColor = "#f2f7ff";
			input.className = "checked";		
		}
		
		$(".checked").each((index,item) => {
			if(input.id != item.id) {
				item.parentElement.style.backgroundColor = "white";
				item.className = "unchecked";
			}
			
		})
	}
	
	//퇴사등록창을 띄우기전 퇴사등록할 항목을 선택했는지 확인하는 함수
	const quitRegis = () => {
		if($(".checked").length == 0) {
			alert("퇴사등록을 하고자하는 사원을 체크해주세요");			
		}
	}
  </script>
</body>
</html>
