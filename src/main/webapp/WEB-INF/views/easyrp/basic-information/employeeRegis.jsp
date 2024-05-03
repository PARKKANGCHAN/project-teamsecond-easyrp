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
					<div>모든항목은 필수항목입니다</div>
					<div class="card-body">
						<div>
							<div>
								<span>이름</span> <input type="text" id="empName" />
							</div>
						</div>
						<div>
							<div>
								<span>생년월일</span> <input type="date" id="empBirthdate" />
							</div>
							<div>
								<span>성별</span> <select id="empGender">
									<option value="">선택</option>
									<option value="M">여성</option>
									<option value="F">남성</option>
								</select>
							</div>
						</div>
						<div>
							<div>
								<span>이메일</span> <input type="text" id="empEmail" />
							</div>
							<div>
								<span>전화번호</span> <input type="text" id="empTel"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
							</div>
						</div>
						<div>
							<div>
								<span>입사일</span> <input type="date" id="empRegdate" />
							</div>
						</div>
						<div>
							<div>
								<span>부서코드</span> <input type="text" id="deptCod" readonly
									value="dept004" />
								<button type="button">부서찾기</button>
							</div>
							<div>
								<span>직책</span> <input type="text" id="empPosition" />
							</div>
						</div>
						<div>
							<div>
								<span>비밀번호</span> <input type="text" id="empPassword" />
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
		function checkNumber(event) {
		  if(event.key >= 0 && event.key <= 9) {
		    return true;
		  }
		  
		  return false;
		}
	
		function blankCheck(data){
			let blankBool = true;
			for(let key in data) {
				if(data[key] == '') {
					blankBool = false;
				}
			}
			if(!blankBool) {
				alert("입력하지 않은 값이 있습니다. 다시한번 확인 부탁드립니다.");
			}
			return blankBool
		};
	
		const employeeRegisSubmit = () => {

			const data = {
				name: $("#empName").val(),
				password: $("#empPassword").val(),
				departmentCod: $("#deptCod").val(),
				empPosition: $("#empPosition").val(),
				regdate: $("#empRegdate").val(),
				email: $("#empEmail").val(),
				tel: $("#empTel").val(),
				birthdate: $("#empBirthdate").val(),
				gender: $("#empGender").val()
			}
			
			if(blankCheck(data)) {
				$.ajax({
					url: "employeeregissubmit",
					method: "POST",
					data: data,
					async: false,
					success: function(res) {
						if(res == "success") {
							alert("사원이 등록되었습니다");
						} else {
							alert("예상치 못한 오류가 발생했습니다.");
						}
						},
					error: function(error) {
						alert("예상치 못한 오류가 발생했습니다.");
						console.log(error)
					}
				})	
			} 
		}
	</script>
</body>
</html>
