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
						<h3>사원등록</h3>
						<p class="text-subtitle text-muted">사원등록을 할수있는 페이지</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page"><a
									href="employeelist">사원 기초 관리</a></li>
								<li class="breadcrumb-item active" aria-current="page">사원등록</li>
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
							<h5 class="card-title">기본정보</h5>
							<div>
								<a href="employeelist">돌아가기</a>
								<button type="button" onclick="employeeRegisSubmit()">등록</button>
							</div>
						</div>
						<div class="card-body">
							<div>
								<div>
									<span>이름</span> <input type="text" id="empName" value="test"/>
								</div>
							</div>
							<div>
								<div>
									<span>나이</span> <input type="text" id="empAge" value=10>
								</div>
								<div>
									<span>성별</span> <input type="text" id="empGender" value="M"/>
								</div>
							</div>
							<div>
								<div>
									<span>이메일</span> <input type="text" id="empEmail" value="test"/>
								</div>
								<div>
									<span>전화번호</span> <input type="text" id="empTel" value="test"/>
								</div>
							</div>
							<div>
								<div>
									<span>입사일</span> <input type="date" id="empRegdate" value="2024-04-29"/>
								</div>
							</div>
							<div>
								<div>
									<span>부서코드</span> <input type="text" id="deptCod" readonly value="test" />
									<button type="button">부서찾기</button>
								</div>
								<div>
									<span>직책</span> <input type="text" id="empPosition" value="test"/>
								</div>
							</div>
							<div>
								<div>
									<span>비밀번호</span> <input type="text" id="empPassword" value="test"/>
								</div>
							</div>
						</div>
					</div>
				</section>
			<!-- Basic Tables end -->
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		const employeeRegisSubmit = () => {
			$.ajax({
				url: "employeeregissubmit",
				method: "POST",
				data: {
					cod: "test",
					name: $("#empName").val(),
					password: $("#empPassword").val(),
					departmentCod: $("#deptCod").val(),
					empPosition: $("#empPosition").val(),
					regdate: $("#empRegdate").val(),
					email: $("#empEmail").val(),
					tel: $("#empTel").val(),
					age: $("#empAge").val(),
					gender: $("#empGender").val()
				},
				async: false,
				success: function(res) {
					if(res == "success") {
						alert("사원이 등록되었습니다");
					} else {
						alert("실패");
					}
					},
				error: function(error) {
					console.log(error)
				}
			})
		}
	</script>
</body>
</html>
