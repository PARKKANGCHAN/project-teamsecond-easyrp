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
	<!-- BOM Modal START -->
	<div class="modal-header">
		<h5 class="modal-title" id="detailModalLabel">BOM 등록 페이지</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close" onClick="Modalclose()"></button>
	</div>
	<div class="modal-body">
		<table class="table">
			<tr>
				<th scope="col">완제품 번호</th>
				<td id="productCod"></td>
				<th scope="col">완제품 명</th>
				<td id="productName"></td>
				<th scope="col">창고 위치</th>
				<td id="warehouseName"></td>
			</tr>
			<tr>
				<th scope="col">담당 부서</th>
				<td id="deptName"></td>
				<th scope="col">담당 사원코드</th>
				<td id="empCod"></td>
				<th scope="col">담당자 명</th>
				<td id="empName"></td>
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
			</tr>
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
					<button type="button" class="btn btn-primary">이메일 보내기</button>
					<button type="button" class="btn btn-primary"
						onClick="bomUpdate();">BOM 수정</button>
					<button type="button" class="btn btn-primary" id="addColumnButton"
						onClick="addInventory();">제품 추가</button>
				</td>
			</tr>
		</table>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary"
			data-bs-dismiss="modal" onClick="Modalclose()">닫기</button>
	</div>
	<!-- BOM Modal END -->



	<script type="text/javascript">
        function productData(productCod) {
            var productCod = 'prd001';
            // 특정 견적의 상세 정보를 가져오는 Ajax 요청
            $.ajax({
                url: 'api/get-productdata',
                type: 'GET',
                data: {productCod: productCod},
                dataType: 'JSON',
                success: function(response) {
                    console.log(response);
                    handleDataSuccess(response);
                },
                error: function(xhr, status, error) {
                    console.error('실패', error);
                }
            });

            // 제품 추가 버튼 활성화
            $('#addColumnButton').prop('disabled', false);
        }

        function handleDataSuccess(response) {
            let totalPrice = 0; // 총 가격 합계 초기값 설정
            let totalVat = 0; // 부가세 합계 초기값 설정
            let totalSum = 0; // 총합 합계 초기값 설정

            // 가져온 데이터를 헤더 테이블에 text 삽입
            $('#productCod').text(response.productCod);
            $('#productName').text(response.productName);
            $('#warehouseName').text(response.warehouseName);
            $('#deptName').text(response.deptName);
            $('#empCod').text(response.empCod);
            $('#empName').text(response.empName);
        }

        function addInventory() {
            var newRow = $(`
                <tr class="generatedRow">
                    <td>--</td>
                    <td><input type="text" readonly="readonly" data-toggle="modal" data-target="#loadSubModal"
                    	 onclick="setValueInventoryModal();" class="form-control" id="inventoryName" placeholder="상품 선택" style="width: 140px;"></td>
                    <input type="hidden" id="inventoryCod" name="cod">
                    <td><input type="number" readonly="readonly" class="form-control" name="inventoryQty" id="inventoryQty" placeholder="수량 입력" style="width: 120px;"></td>
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                    <td id="buttonrow">
                        <div>
                            <button type="button" class="btn btn-primary" style="margin-right: 2px;">확인</button>
                            <button class="btn btn-primary">취소</button>
                        </div>
                    </td>
                </tr>
            `);
            $('#detailList').after(newRow);
        }

        productData(productCod);
    </script>
</body>
</html>
