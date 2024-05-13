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
	<!-- BOM Modal START  -->
	<div class="modal-header">
		<h5 class="modal-title" id="detailModalLabel">BOM 등록 페이지</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close" onClick="Modalclose()"></button>
	</div>
	<div class="modal-body">
		<table class="table">
			<tr>
				<th scope="col">BOM 번호</th>
				<td id="bomCod"></td>
				<th scope="col">완제품 번호</th>
				<td id="productCod"></td>
				<th scope="col">완제품 명</th>
				<td id="productName"></td>
			</tr>
			<tr>
				<th scope="col">담당 부서</th>
				<td id="productDept"></td>
				<th scope="col">담당 사원코드</th>
				<td id="productEmpCod"></td>
				<th scope="col">담당자 명</th>
				<td id="productEmpName"></td>
			</tr>
		</table>
		<table class="table">
			<tr id="detailList">
				<th colspan="1">원자재 코드</th>
				<th colspan="1" style="width: 160px;">원자재 명</th>
				<th colspan="1">수 량</th>
				<th colspan="1">단 가</th>
				<th colspan="1">공급가액</th>
				<th colspan="1">부가세</th>
				<th colspan="1">금 액</th>
				<th colspan="1">수정 및 삭제</th>
			<tr>
				<th colspan="1">총 합</th>
				<td colspan="1"></td>
				<td colspan="1"></td>
				<td colspan="1"></td>
				<td colspan="1" id="totalprice"></td>
				<td colspan="1" id="totalvax"></td>
				<td colspan="1" id="totalsum"></td>
			</tr>
			<tr>
				<td colspan="6" style="border-bottom-width: 0px">
					<button type="button" class="btn btn-primary">전표 생성</button>
					<button type="button" class="btn btn-primary">출력</button>
					<button type="button" class="btn btn-primary">이메일 보내기</button> <!-- 					<button type="button" class="btn btn-primary"
						onClick="estimateChange()">BOM 수정</button> -->
					<button type="button" class="btn btn-primary" id="addColumnButton"
						onClick="addcolumn()">제품 추가</button>
				</td>
			</tr>
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary"
			data-bs-dismiss="modal" onClick="Modalclose()">닫기</button>
	</div>
	<!--  BOM Modal END  -->





	<!-- 공통 Modal START  -->
	<div class="modal fade" id="loadSubModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="loadSubModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 여기에 Modal JSP가 삽입됩니다. -->
			</div>
		</div>
	</div>
	<!-- 공통 Modal END  -->





	<script type="text/javascript">
		/* modal CRUD START */
		function estimateDetail(estimateCod) {

			$.ajax({
				url : 'estimatedetail',
				type : 'GET',
				data : {
					cod : estimateCod
				},
				dataType : 'JSON',
				success : function(response) {

					let totalPrice = 0; // 총 가격 합계 초기값 설정
					let totalVat = 0; // 부가세 합계 초기값 설정
					let totalSum = 0; // 총합 합계 초기값 설정

					$('#estimateCod').text(response[0].cod);
					$('#clientName').text(response[0].clientName);
					$('#estimateDate').text(response[0].estDate);
					$('#estimateDept').text(response[0].deptName);
					$('#estimateEmp').text(response[0].employeeCod);
					$('#estimateEmpName').text(response[0].empName);

					response.forEach(function(item) {

						var newRow = $('<tr class="generatedRow">');

						newRow.append($('<td>').text(item.productCod));
						newRow.append($('<td>').text(item.prodName));
						newRow.append($('<td>').append($('<input>').attr({
							'id' : 'qty_' + item.num,
							'type' : 'number',
							'readonly' : 'readonly',
							'class' : 'form-control',
						}).css('width', '120px').val(item.qty)));

						newRow.append($('<td>').text(
								item.unitprice.toLocaleString()));

						// 각 항목의 총 가격 계산 및 표시
						var totalPriceItem = item.unitprice * item.qty;
						newRow.append($('<td>').text(
								totalPriceItem.toLocaleString())); // 숫자를 형식화하여 표시
						totalPrice += totalPriceItem; // 총 가격 합계 누적

						// 각 항목의 부가세 계산 및 표시
						var vat = Math.floor(totalPriceItem * 0.1);
						newRow.append($('<td>').text(vat.toLocaleString()));
						totalVat += vat; // 부가세 합계 누적

						// 각 항목의 총합 계산 및 표시
						var totalItem = totalPriceItem + vat;
						newRow.append($('<td>')
								.text(totalItem.toLocaleString()));
						totalSum += totalItem; // 총합 합계 누적

						var editButton = $('<button>').text('수정').addClass(
								'btn btn-primary').css('margin-right', '2px');
						var deleteButton = $('<button>').text('삭제').addClass(
								'btn btn-primary');
						var buttonGroup = $('<div>').append(editButton).append(
								deleteButton);

						newRow.append($('<td>').append(buttonGroup));

						$('#detailList').after(newRow);

						editButton.on('click', function() {
							var productCod = item.productCod;
							var estimateCod = response[0].cod;
							var num = item.num;
							var qty = $('#qty_' + item.num).val();

							console.log(qty);

							$.ajax({
								url : 'estimateupdate',
								type : 'POST',
								data : {
									cod : estimateCod,
									qty : qty,
									num : num
								},
								dataType : 'JSON',
								success : function(response) {
									console.log('성공');
									alert('수정이 완료되었습니다.');

									// 성공 시 기존 데이터 삭제
									$('.generatedRow').remove();

									// 수정 성공 시 해당 함수를 호출하여 전체적으로 다시 렌더링
									estimateDetail(estimateCod);

								},
								error : function(xhr, status, error) {
									console.error('실패');
									console.log(xhr, status);
								}
							});

						});

						deleteButton.on('click', function() {
							var productCod = item.productCod;
							var estimateCod = response[0].cod;
							var num = item.num;
							var qty = $('#qty_' + item.num).val();

							console.log(qty);

							$.ajax({
								url : 'estimatedetaildelete',
								type : 'POST',
								data : {
									productCod : productCod,
									cod : estimateCod,
								},
								dataType : 'JSON',
								success : function(response) {
									console.log('삭제 성공');
									alert('삭제가 완료되었습니다.');

									// 성공 시 기존 데이터 삭제
									$('.generatedRow').remove();

									// 삭제 성공 시 해당 함수를 호출하여 전체적으로 다시 렌더링
									estimateDetail(estimateCod);

								},
								error : function(xhr, status, error) {
									console.error('실패');
									console.log(xhr, status);
								}
							});

						});

					});

					$('#totalprice').text(totalPrice.toLocaleString());
					$('#totalvax').text(totalVat.toLocaleString());
					$('#totalsum').text(totalSum.toLocaleString());

					$('#detailModal').on('hidden.bs.modal', function() {
						// 모달이 닫힐 때 생성된 tr 요소 제거
						$('.generatedRow').remove();

					});

				},
				error : function(xhr, status, error) {
					console.error('실패');
				}
			});

			// 제품 추가 버튼 활성화
			$('#addColumnButton').prop('disabled', false);

		}

		function addcolumn() {

			var newRow = $('<tr class="generatedRow">');

			newRow.append($('<td>').attr({
				'id' : 'productCod',
			}).text("--"));

			newRow.append($('<td>').append($('<input>').attr({
				'type' : 'text',
				'readonly' : 'readonly',
				'class' : 'form-control',
				'name' : 'productName',
				'id' : 'productName',
				'placeholder' : '상품 선택',
			}).css('width', '140px').on('click', function() {
				$('#kvModal').modal('show'); // 자식 모달 열기
				console.log('자식 모달 오픈');
				searchModalOpen();
			})));

			newRow.append($('<td>').append($('<input>').attr({
				'type' : 'number',
				'readonly' : 'readonly',
				'class' : 'form-control',
				'name' : 'productQty',
				'id' : 'productQty',
				'placeholder' : '수량 입력',
			}).css('width', '120px')));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));
			newRow.append($('<td>').text("--"));

			var checkButton = $('<button>').text('확인').attr({
				'type' : 'button'
			}).addClass('btn btn-primary').css('margin-right', '2px');
			var cancelButton = $('<button>').text('취소').addClass(
					'btn btn-primary');
			var buttonGroup = $('<div>').append(checkButton).append(
					cancelButton);

			newRow.append($('<td>').attr({
				'id' : 'buttonrow'
			}).append(buttonGroup));

			checkButton.on("click", function() {
				console.log("확인 버튼 누름");
				var estimateCodValue = $('#estimateCod').text();
				var productName = $('#productName').val();
				var productQty = $('#productQty').val();

				insertAjax(productName, productQty, estimateCodValue);
			});

			cancelButton.on('click', function() {

				$(this).closest('tr').remove(); // 새로 추가된 행 삭제
				$('#addColumnButton').prop('disabled', false);
			});

			$('#detailList').after(newRow);

			$('#addColumnButton').prop('disabled', true);

		}

		function estimateChange() {
			$('input').removeAttr('readonly');
		}

		function estimateChange() {
			$('input').removeAttr('readonly');
		}

		function insertAjax(productName, productQty, estimateCodValue) {

			$.ajax({
				url : 'estimatedetailinsert',
				type : 'GET',
				dataType : 'JSON',
				data : {
					prodname : productName,
					qty : productQty,
					cod : estimateCodValue,
				},
				success : function(response) {
					console.log('ajax 성공');
					alert('상품 항목이 추가되었습니다.');

					// 성공 시 기존 데이터 삭제
					$('.generatedRow').remove();

					estimateDetail(estimateCodValue);

					$('#addColumnButton').prop('disabled', false);

				},
				error : function(xhr, status, error) {
					console.error('ajax 실패');
					alert('같은 제품이 이미 존재합니다.');
				}
			});
		}

		function Modalclose() {
			$('#addColumnButton').prop('disabled', false);
		}

		/* modal CRUD END */
	</script>
</body>
</html>
