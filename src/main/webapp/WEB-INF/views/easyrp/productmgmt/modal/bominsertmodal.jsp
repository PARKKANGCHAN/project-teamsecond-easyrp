<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOM 등록 페이지</title>
<!-- 필요한 CSS와 JS 라이브러리 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- BOM Modal START -->
    <div class="modal-header">
        <h5 class="modal-title" id="loadModalLabel">BOM 등록 페이지</h5>
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
                <th>원자재 코드</th>
                <th style="width: 160px;">원자재 명</th>
                <th>수 량</th>
                <th>단 가</th>
                <th>공급가액</th>
                <th>부가세</th>
                <th>금 액</th>
                <th>수정 및 삭제</th>
            </tr>
            <tr>
                <th>총 합</th>
                <td colspan="3"></td>
                <td id="totalprice"></td>
                <td id="totalvax"></td>
                <td id="totalsum"></td>
            </tr>
            <tr>
                <td colspan="7" style="border-bottom-width: 0px">
                    <button type="button" class="btn btn-primary">전표 생성</button>
                    <button type="button" class="btn btn-primary">출력</button>
                    <button type="button" class="btn btn-primary">이메일 보내기</button>
                    <button type="button" class="btn btn-primary">BOM 수정</button>
                    <button type="button" class="btn btn-primary" id="addColumnButton" onClick="addColumn()">제품 추가</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onClick="Modalclose()">닫기</button>
    </div>
    <!-- BOM Modal END -->

    <div class="modal fade" id="kvModal" tabindex="-1"
        aria-labelledby="kvModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="kvModalLabel">코드-상품 선택</h5>
                    <input type="text" id="searchInput" class="form-control"
                        placeholder="코드 또는 상품명을 입력해주세요."
                        style="margin-left: 10px; width: auto; flex-grow: 1" />
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Index</th>
                                <th scope="col">Code</th>
                                <th scope="col">자재 명</th>
                            </tr>
                        </thead>
                        <tbody id="modalTableBody">
                            <!-- 여기에 Ajax로 만든 html 속성이 들어감 -->
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        // 견적 상세 정보 조회 함수
        function estimateDetail(estimateCod) {
            $.ajax({
                url: 'estimatedetail',
                type: 'GET',
                data: { cod: estimateCod },
                dataType: 'JSON',
                success: function(response) {
                    renderEstimateDetails(response);
                },
                error: function(xhr, status, error) {
                    console.error('견적 상세 조회 실패:', xhr, status, error);
                }
            });

            $('#addColumnButton').prop('disabled', false);
        }

        // 견적 상세 정보를 렌더링하는 함수
        function renderEstimateDetails(details) {
            var totalPrice = 0;
            var totalVat = 0;
            var totalSum = 0;

            // 견적 기본 정보 표시
            $('#productCod').text(details[0].productCod);
            $('#productName').text(details[0].productName);
            $('#warehouseName').text(details[0].warehouseName);
            $('#deptName').text(details[0].deptName);
            $('#empCod').text(details[0].empCod);
            $('#empName').text(details[0].empName);

            // 테이블 행 생성 및 추가
            details.forEach(function(item) {
                var newRow = $('<tr class="generatedRow">');
                newRow.append(`<td>${item.materialCod}</td>`);
                newRow.append(`<td>${item.materialName}</td>`);
                newRow.append(`
                    <td>
                        <input type="number" id="qty_${item.num}" readonly class="form-control" style="width: 120px;" value="${item.qty}">
                    </td>
                `);
                newRow.append(`<td>${item.unitPrice.toLocaleString()}</td>`);
                newRow.append(`<td>${(item.unitPrice * item.qty).toLocaleString()}</td>`);
                newRow.append(`<td>${Math.floor(item.unitPrice * item.qty * 0.1).toLocaleString()}</td>`);
                newRow.append(`<td>${(item.unitPrice * item.qty * 1.1).toLocaleString()}</td>`);
                newRow.append(`<td>${createActionButtons(item, details[0].productCod).prop('outerHTML')}</td>`);

                $('#detailList').after(newRow);

                // 총합 계산
                totalPrice += item.unitPrice * item.qty;
                totalVat += Math.floor(item.unitPrice * item.qty * 0.1);
                totalSum += item.unitPrice * item.qty * 1.1;
            });

            // 총합 표시
            $('#totalprice').text(totalPrice.toLocaleString());
            $('#totalvax').text(totalVat.toLocaleString());
            $('#totalsum').text(totalSum.toLocaleString());

            $('#detailModal').on('hidden.bs.modal', function() {
                $('.generatedRow').remove();
            });
        }

        // 수정 및 삭제 버튼 생성 함수
        function createActionButtons(item, productCod) {
            var editButton = $('<button>').text('수정').addClass('btn btn-primary').css('margin-right', '2px')
                .on('click', function() {
                    updateEstimateItem(item.num, productCod, $('#qty_' + item.num).val());
                });

            var deleteButton = $('<button>').text('삭제').addClass('btn btn-primary')
                .on('click', function() {
                    deleteEstimateItem(item.materialCod, productCod);
                });

            return $('<div>').append(editButton).append(deleteButton);
        }

        // 견적 항목 수정 함수
        function updateEstimateItem(num, productCod, qty) {
            $.ajax({
                url: 'estimateupdate',
                type: 'POST',
                data: {
                    cod: productCod,
                    qty: qty,
                    num: num
                },
                dataType: 'JSON',
                success: function(response) {
                    alert('수정이 완료되었습니다.');
                    $('.generatedRow').remove();
                    estimateDetail(productCod);
                },
                error: function(xhr, status, error) {
                    console.error('수정 실패:', xhr, status, error);
                }
            });
        }

        // 견적 항목 삭제 함수
        function deleteEstimateItem(materialCod, productCod) {
            $.ajax({
                url: 'estimatedetaildelete',
                type: 'POST',
                data: {
                    materialCod: materialCod,
                    cod: productCod
                },
                dataType: 'JSON',
                success: function(response) {
                    alert('삭제가 완료되었습니다.');
                    $('.generatedRow').remove();
                    estimateDetail(productCod);
                },
                error: function(xhr, status, error) {
                    console.error('삭제 실패:', xhr, status, error);
                }
            });
        }

        // 새로운 행 추가 함수
        function addColumn() {
            var newRow = $('<tr class="generatedRow">');
            newRow.append('<td id="materialCod">--</td>');
            newRow.append(`
                <td>
                    <input type="text" readonly class="form-control" name="materialName" id="materialName" placeholder="원자재 선택" style="width: 140px;" onclick="openProductModal()">
                </td>
            `);
            newRow.append(`
                <td>
                    <input type="number" readonly class="form-control" name="materialQty" id="materialQty" placeholder="수량 입력" style="width: 120px;">
                </td>
            `);
            newRow.append('<td>--</td>');
            newRow.append('<td>--</td>');
            newRow.append('<td>--</td>');
            newRow.append('<td>--</td>');
            newRow.append(`<td>${createRegisterButtons().prop('outerHTML')}</td>`);

            $('#detailList').after(newRow);
            $('#addColumnButton').prop('disabled', true);
        }

        // 제품 선택 모달 열기 함수
        function openProductModal() {
            $('#kvModal').modal('show');
            searchModalOpen();
        }

        // 등록 및 취소 버튼 생성 함수
        function createRegisterButtons() {
            var checkButton = $('<button>').text('확인').attr('type', 'button').addClass('btn btn-primary').css('margin-right', '2px')
                .on('click', function() {
                    insertEstimateItem($('#materialName').val(), $('#materialQty').val(), $('#productCod').text());
                });

            var cancelButton = $('<button>').text('취소').addClass('btn btn-primary')
                .on('click', function() {
                    $(this).closest('tr').remove();
                    $('#addColumnButton').prop('disabled', false);
                });

            return $('<div>').append(checkButton).append(cancelButton);
        }

        // 새로운 견적 항목 추가 함수
        function insertEstimateItem(materialName, materialQty, productCod) {
            $.ajax({
                url: 'estimatedetailinsert',
                type: 'GET',
                dataType: 'JSON',
                data: {
                    materialName: materialName,
                    qty: materialQty,
                    cod: productCod
                },
                success: function(response) {
                    alert('상품 항목이 추가되었습니다.');
                    $('.generatedRow').remove();
                    estimateDetail(productCod);
                    $('#addColumnButton').prop('disabled', false);
                },
                error: function(xhr, status, error) {
                    alert('같은 제품이 이미 존재합니다.');
                    console.error('추가 실패:', xhr, status, error);
                }
            });
        }

        // 클라이언트 선택 모달 열기 함수
        function clientModalOpen() {
            $('#clientNameModal').modal('show');
            $.ajax({
                url: 'clientnamelist',
                method: 'GET',
                success: function(data) {
                    renderClientModal(data);
                },
                error: function(xhr, status, error) {
                    console.error('클라이언트 목록 조회 실패:', xhr, status, error);
                }
            });
        }

        // 클라이언트 모달 내용 렌더링 함수
        function renderClientModal(clients) {
            let rows = '';
            clients.forEach(function(item, index) {
                rows += `
                    <tr onclick="setClientValue('${item.clientCod}', '${item.clientName}')" class="searchValue" data-cod="${item.clientCod}" data-value="${item.clientName}" style="cursor: pointer">
                        <td>${index + 1}</td>
                        <td>${item.clientCod}</td>
                        <td>${item.clientName}</td>
                    </tr>
                `;
            });
            $('#ClientmodalTableBody').html(rows);
            $('#RegisterModal').modal('show');
        }

        // 자재 선택 모달 열기 함수
        function searchModalOpen() {
            $.ajax({
                url: 'api/get-inventory',
                method: 'GET',
                success: function(data) {
                    renderInventoryModal(data);
                },
                error: function(xhr, status, error) {
                    console.error('제품 목록 조회 실패:', xhr, status, error);
                }
            });
        }

        // 자재 모달 내용 렌더링 함수
        function renderInventoryModal(inventory) {
            let rows = '';
            inventory.forEach(function(item, index) {
                rows += `
                    <tr onclick="setValue('${item.cod}', '${item.name}')" class="searchValue" data-cod="${item.cod}" data-value="${item.name}" style="cursor: pointer">
                        <td>${index + 1}</td>
                        <td>${item.cod}</td>
                        <td>${item.name}</td>
                    </tr>
                `;
            });
            $('#modalTableBody').html(rows);
            $('#kvModal').modal('show');
        }

        // 클라이언트 값 설정 함수
        function setClientValue(clientCod, clientName) {
            $('#registerClientName').val(clientName);
            $('#clientNameModal').modal('hide');
            $('.modal-backdrop').remove();
        }

        // 제품 값 설정 함수
        function setValue(cod, productName) {
            $('#materialName').val(productName);
            $('#kvModal').modal('hide');
            $('.modal-backdrop').remove();
        }

        // 검색 입력 필터링 함수
        $('#searchInput').on('keyup', function() {
            var searchInputValue = $(this).val().toLowerCase();
            $('.searchValue').each(function() {
                var cod = $(this).data('cod').toLowerCase();
                var productName = $(this).data('value').toLowerCase();
                $(this).toggle(cod.includes(searchInputValue) || productName.includes(searchInputValue));
            });
        });
    </script>
</body>
</html>
