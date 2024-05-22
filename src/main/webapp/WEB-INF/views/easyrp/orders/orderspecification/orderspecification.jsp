<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>거래명세서</title>
<!-- CSS 추가 START (현우 추가)  -->
<link rel="stylesheet"
	href="resources/easyrp/assets/compiled/css/hyunwoo-css.css">
<link rel="stylesheet"
	href="resources/easyrp/assets/compiled/css/common-css.css">
<!-- CSS 추가 END (현우 추가)  -->

<!-- Font START (현우 추가)  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!-- Font END (현우 추가)  -->

<script src="resources/easyrp/assets/extensions/jquery/jquery.min.js"></script>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif !important;
	font-optical-sizing: auto;
	font-style: normal;
}
</style>
</head>
<body>
	<div class="invoice-box">
		<div class="flex-container">
			<div class="flex-item">
				<h2 class="title">거래명세서</h2>
				공급받는자 : <strong>${getOrderDatas[0].clientName }</strong><br>
				공급받는자 주소: <strong>${getOrderDatas[0].clientAddress }</strong><br>
				TEL: <strong>${getOrderDatas[0].clientTel }</strong><br>
			</div>
			<div class="flex-item" style="text-align: right;">
				<div>
					계약번호&nbsp;:&nbsp;<strong>${getOrderDatas[0].orderCod }</strong>
				</div>
				<div>
					사업자등록번호&nbsp;:&nbsp;<strong>123-456-789</strong>
				</div>
				<div>
					대표명&nbsp;:&nbsp;<strong>김이지</strong>
				</div>
				<div>
					상호&nbsp;:&nbsp;<strong>(주)영남쉬운ERP</strong>
				</div>
				<div>
					주소&nbsp;:&nbsp;<strong>대구광역시 서구 서대구로 30</strong>
				</div>
			</div>
		</div>
		<br>
		<div style="text-align: center; font-size: 1.5em; font-weight: bold;">금
			액: 오십칠만이천원 정 (₩572,000)</div>
		<br>
		<table id="materialTable" cellpadding="0" cellspacing="0">
			<tr class="heading">
				<td>일자</td>
				<td>품목명[규격]</td>
				<td>수량</td>
				<td>단가</td>
				<td>공급가액</td>
				<td>부가세</td>
			</tr>
			<c:forEach var="orderDatas" items="${getOrderDatas}">
				<tr class="item">
					<td>${orderDatas.orderDate}</td>
					<td>${orderDatas.productName}</td>
					<td>${orderDatas.orderQty}개</td>
					<td><fmt:formatNumber value="${orderDatas.unitPrice}"
							pattern="#,###" />원</td>
					<td class="supplyPrice"><fmt:formatNumber
							value="${orderDatas.supplyPrice}" pattern="#,###" />원</td>
					<td class="tax"><c:set var="tax" value="${orderDatas.supplyPrice * 0.1}" />
						<fmt:formatNumber value="${tax}" pattern="#,###" />원</td>
				</tr>
			</c:forEach>
			<tr class="total">
				<td colspan="4"></td>
				<td id="totalAmount"></td>
				<td></td>
			</tr>
		</table>
		<br>
		<div style="text-align: right;">
			<div>인수자 : ${getOrderDatas[0].clientName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)</div>
			<br />
			<div>공급자 : (주)영남쉬운ERP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(
				function() {

					/* 가격에 한국식 콤마 붙이는 Fn START  */
					function addCommas(value) {
						if (value === undefined || value === null) {
							return '';
						}
						value = value.toString().replace(/,/g, '');
						return Number(value).toLocaleString();
					}
					/* 가격에 한국식 콤마 붙이는 Fn END  */

					/* 총합 계산 함수 START */
					function updateTotalPrice() {
						let totalPrice = 0;
						$('#materialTable .supplyPrice').each(
								function() {
									console.log($(this).text());
									let amount = parseInt($(this).text()
											.replace(/,/g, ''), 10);
									if (!isNaN(amount)) {
										totalPrice += amount;
									}
								});
						$('#totalAmount').text(addCommas(totalPrice)+"원");
					}
					/* 총합 계산 함수 END */

					// 최초 총합 계산
					updateTotalPrice();
				}); // <- 닫는 태그 추가
	</script>

</body>
</html>


