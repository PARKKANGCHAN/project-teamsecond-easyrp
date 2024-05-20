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
	<!-- setValue 단위 Modal START  -->
	<div class="modal-header">
		<h5 class="modal-title" id="loadSubModalLabel">자재 목록</h5>
		<input type="text" id="modalSearch" class="form-control"
			placeholder="검색어를 입력해주세요."
			style="margin-left: 10px; width: auto; flex-grow: 1" />
		<button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
	</div>
	<div class="modal-body overflow-y-auto" style="height: 60vh">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">자재번호</th>
					<th scope="col">자재명</th>
				</tr>
			</thead>
			<tbody id="modalDataTableBody">
				<!-- 여기에 Ajax Body 넣어주기 -->
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary"
			data-bs-dismiss="modal">닫기</button>
	</div>
	<!-- setValue 단위 Modal END  -->

	<script type="text/javascript">
		$(document).ready(function() {
			/* modal CRUD START */
			function loadData() {
				$.ajax({
					url: 'api/get-inventory',
					method: 'GET',
					success: function(data) {
						let rows = '';
						data.forEach(function(item, index) {
							if (item.cod && item.deleteyn === 'N') {
								rows += `<tr class="searchData setValue hyunwoo-pointer" data-cod="\${item.cod}" data-name="\${item.name}" >
									<td>${item.cod}</td>
									<td class="hyunwoo-flex-wrap">
									<input type="text" id="updateName\${item.cod}" name="name" class="form-control hyunwoo-input-disabled hyunwoo-pointer" value="\${item.name}" readonly />
									</td>
								</tr>`;
							}
						});
						$('#modalDataTableBody').html(rows);
					},
					error: function(xhr, status, error) {
						alert('데이터 로드에 실패했습니다: ' + error);
					},
				});
			}

			$(document).on('click', '.setValue', function() {
				let valueName = $(this).data('name');
				let valueCod = $(this).data('cod');

				/* 제품등록부분 value 삽입 */
				$(parent.document).find('#inventoryName').val(valueName);
				$(parent.document).find('#inventoryCod').val(valueCod);

				/* 모달 닫기 수정 */
				$('#loadModal', parent.document).modal('hide'); // 서브 모달 닫기
				$(parent.document).find('.modal-backdrop').remove(); // 배경 제거
				$('body').removeClass('modal-open'); // 스크롤바 복원
			});

			/* 검색기능 START */
			$('#modalSearch').on('keyup', function() {
				let searchInputValue = $(this).val().toLowerCase();
				$('.searchData').each(function() {
					let cod = $(this).data('cod').toString().toLowerCase();
					let name = $(this).data('name').toString().toLowerCase();
					if (cod.includes(searchInputValue) || name.includes(searchInputValue)) {
						$(this).show();
					} else {
						$(this).hide();
					}
				});
			});
			/* 검색기능 END */

			loadData();
			/* modal CRUD END */
		});
	</script>
</body>
</html>