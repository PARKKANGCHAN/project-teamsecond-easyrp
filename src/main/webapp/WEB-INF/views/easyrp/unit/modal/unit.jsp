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
	<!-- 단위 관리 Modal START  -->
	<div class="modal-header">
		<h5 class="modal-title" id="loadWrksModalLabel">단위 목록</h5>
		<input type="text" id="modalSearch" class="form-control"
			placeholder="단위 코드 또는 단위명을 입력해주세요."
			style="margin-left: 10px; width: auto; flex-grow: 1" />
		<button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
	</div>
	<button type="button" class="btn btn-primary"
		style="width: 10rem; margin: 0.5rem;" onclick="insertForm()">단위
		등록</button>
	<tr>
		<form id="insertForm" action="unitinsertfn" method="post"
			style="margin: 0.5rem; display: none;">
			<td width="150"><strong>단위명</strong></td>
			<td><input type="text" id="name" name="name"
				class="form-control" placeholder="단위 명을 입력후 등록을 눌러주세요." required /></td>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</tr>
	<div class="modal-body">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">단위번호</th>
					<th scope="col">단위명</th>
					<th scope="col">기 능</th>
				</tr>
			</thead>
			<tbody id="loadWrksModalBody">
				<c:forEach var="unit" items="${unit}">
					<tr class="searchValue" data-cod="${unit.cod }"
						data-name="${unit.name }">
						<td>${unit.cod }</td>
						<td><input id="${unit.cod }"class="form-control" type="text" style="display:block" disabled value="${unit.name }" /></td>
						<td>
							<div class="btn-group">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-bs-toggle="dropdown" aria-expanded="false">
									<i class="fa-solid fa-gear"></i>
								</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="javascript:void(0);"
										onclick="updateForm();" role="button">수정</a></li>
									<li><a class="dropdown-item"
										href="unitdeletefn?cod=${unit.cod}">삭제</a></li>
								</ul>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary"
			data-bs-dismiss="modal">닫기</button>
	</div>
	<!-- 단위 관리 Modal END  -->

	<script type="text/javascript">
		/* 검색기능 START */
		function insertForm() {
			if ($('#insertForm').css('display') == 'none') {
				$('#insertForm').css('display', 'block');
			} else
				$('#insertForm').css('display', 'none');
		}

		function updateForm() {
			if ($('#updateForm').css('display') == 'none') {
				$('#updateForm').css('display', 'block');
			} else
				$('#updateForm').css('display', 'none');
		}

		$('#modalSearch')
				.on(
						'keyup',
						function() {
							var searchInputValue = $(this).val().toLowerCase();
							$('.searchValue')
									.each(
											function() {
												var cod = $(this).data('cod')
														.toString()
														.toLowerCase();
												var name = $(this).data('name')
														.toString()
														.toLowerCase();
												$(this)
														.toggle(
																cod
																		.includes(searchInputValue)
																		|| name
																				.includes(searchInputValue));
											});
						});
		/* 검색기능 END */
	</script>
</body>
</html>
