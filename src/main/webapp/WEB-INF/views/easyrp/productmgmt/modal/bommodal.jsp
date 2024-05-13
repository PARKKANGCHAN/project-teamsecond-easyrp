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
		<h5 class="modal-title" id="detailModalLabel">견적 상세 페이지</h5>
		<button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close" onClick="Modalclose()"></button>
	</div>
	<div class="modal-body">
		<table class="table">
			<tr>
				<th scope="col">견적 번호</th>
				<td id="estimateCod"></td>
				<th scope="col">거래처 명</th>
				<td id="clientName"></td>
				<th scope="col">견적 날짜</th>
				<td id="estimateDate"></td>
				<td></td>
			</tr>
			<tr>
				<th scope="col">견적 담당 부서</th>
				<td id="estimateDept"></td>
				<th scope="col">견적 담당 사원코드</th>
				<td id="estimateEmp"></td>
				<th scope="col">견적 담당자 명</th>
				<td id="estimateEmpName"></td>
				<td></td>
			</tr>
		</table>
		<table class="table">
			<tr id="detailList">
				<th colspan="1">상품 코드</th>
				<th colspan="1" style="width: 160px;">상품 명</th>
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
					<button type="button" class="btn btn-primary">이메일 보내기</button>
					<button type="button" class="btn btn-primary"
						onClick="estimateChange()">견적 수정</button>
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

	<script type="text/javascript">
         /* modal CRUD START */
         $(document).ready(function () {
            function loadData() {
               $.ajax({
                  url: 'api/get-unit',
                  method: 'POST',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item, index) {
                        if (item.cod && item.deleteyn === 'N') {
                           rows += `<tr class="searchData setMgmtUnit hyunwoo-pointer" data-cod="\${item.cod}" data-name="\${item.name}" >
                              <td>\${item.cod}</td>
                              <td class="hyunwoo-flex-wrap">
                              <input type="text" id="updateName\${item.cod}" name="name" class="form-control hyunwoo-input-disabled hyunwoo-pointer" value="\${item.name}" readonly />
                              </td>
                              </tr>`;
                        }
                     });
                     $('#modalDataTableBody').html(rows);
                  },
                  error: function (xhr, status, error) {
                     alert('데이터 로드에 실패했습니다: ' + error);
                  },
               });
            }

            $(document).on('click', '.setMgmtUnit', function () {
               let unitName = $(this).data('name');
               let unitCod = $(this).data('cod');
               
               /* 제품등록부분 value 삽입 */
               $(parent.document).find('#mgmtUnitName').val(unitName);
               $(parent.document).find('#mgmtUnitCod').val(unitCod);

               $('#loadModal', parent.document).modal('hide');
            });

            /* 검색기능 START */
            $('#modalSearch').on('keyup', function () {
               let searchInputValue = $(this).val().toLowerCase();
               $('.searchData').each(function () {
                  let cod = $(this).data('cod').toString().toLowerCase();
                  let name = $(this).data('name').toString().toLowerCase();
                  if (
                     cod.includes(searchInputValue) ||
                     name.includes(searchInputValue)
                  ) {
                     $(this).show();
                  } else {
                     $(this).hide();
                  }
               });
            });
            /* 검색기능 END */

            loadData();
         });

         /* modal CRUD END */
      </script>
</body>
</html>
