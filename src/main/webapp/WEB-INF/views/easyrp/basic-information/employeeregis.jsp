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






							<a href="employeelist">돌아가기</a>
							<button type="button" onclick="employeeRegisSubmit()">등록</button>




			<section class="section">
				<div class="row" id="table-hover-row">
					<div class="col-12">
						<div class="card mb-4">
							<div class="card-header py-3">
								<div class="d-flex">
									<h5 class="m-0">제품 등록</h5>
								</div>
							</div>
					<div>모든항목은 필수항목입니다</div>
					<div class="card-body mb-3">
						<form action="productmgmtinsertfn" method="post">
							<div class="mb-4">
								<table class="table table-bordered">
									<tr>
										<td width="150">사원명</td>
										<td><input type="text" id="empName"
													class="form-control"
													placeholder="사원명을 입력해주세요."/></td>
									</tr>
									<tr>
										<td width="150">생년월일</td>
										<td><input type="date" id="empBirthdate"
													class="form-control"
													placeholder="사원명을 입력해주세요."/></td>
									</tr>
									<tr>
										<td width="150">성별</td>
										<td>
											<select class="form-control" id="empGender">
												<option value="">선택</option>
												<option value="M">여성</option>
												<option value="F">남성</option>
											</select>
										</td>
									</tr>

								<span>이메일</span> <input type="text" id="empEmail" />
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
								<span>부서번호</span> <input type="text" id="deptCod"
									name="deptCod" class="form-control" readonly />
								<button type="button" class="btn btn-primary" id="loadValues"
									data-bs-toggle="modal" data-bs-target="#kvModal"
									>
									저장 값 가져오기</button>
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
	<!-- 부서찾기 Modal START  -->
	<div class="modal fade" id="kvModal" tabindex="-1"
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
							<tr>
								<th scope="col">부서번호</th>
								<th scope="col">부서명</th>
								<th scope="col">사업장</th>
								<th scope="col">지역</th>
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
	<!-- 부서찾기 Modal END  -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	//모달 스크롤바
	function modalScroll() {
		$('.modal-body').addClass('overflow-y-auto');
		$('.modal-body').css('height', '60vh');
	};
	modalScroll();

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
							location.reload(true);
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
		
		 /* 부서찾기 Modal START */
	    function setValue(cod) {
	       $('#deptCod').val(cod);
	       $('#kvModal').modal('hide');
	       $('.modal-backdrop').remove();
	    }

	    $(document).ready(function () {
	       $('#loadValues').on('click', function () {
	          $.ajax({
	             url: 'deptsearch',
	             method: 'GET',
	             dataType:"json",
	             success: function (data) {
	                let rows = '';
	                data.forEach(function (item) {
	                      rows +=
	                         '<tr onclick="setValue(\'' +
	                         item.cod +
	                         '\')" ' +
	                         'class="searchValue" data-cod="' +
	                         item.cod +
	                         '" data-name="' +
	                         item.name +
	                         '" data-wrkname="' +
	                         item.wrkname +
	                         '" data-location="' +
	                         item.location +
	                         '" style= "' +
	                         'cursor: pointer' +
	                         '">' +
	                         '<td>' +
	                         item.cod +
	                         '</td>' +
	                         '<td>' +
	                         item.name +
	                         '</td>' +
	                         '<td>' +
	                         item.wrkname +
	                         '</td>' +
	                         '<td>' +
	                         item.location +
	                         '</td>' +
	                         '</tr>';
	                         
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
	             var name = $(this).data('name').toLowerCase()
	             var wrkname = $(this).data('wrkname').toLowerCase()
	             var location = $(this).data('location').toLowerCase()
	             $(this).toggle(cod.includes(searchInputVlaue) 
	            		 		|| name.includes(searchInputVlaue)
	            		 		|| wrkname.includes(searchInputVlaue)
	            		 		|| location.includes(searchInputVlaue));
	          });
	       });
	    });
	    /* 부서찾기 Modal END */
	</script>
</body>
</html>
