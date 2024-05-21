<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래명세서</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            font-size: 14px;
            line-height: 20px;
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            color: #555;
        }
        .invoice-box table {
            width: 100%;
            line-height: inherit;
            text-align: left;
        }
        .invoice-box table td {
            padding: 5px;
            vertical-align: top;
        }
        .invoice-box table tr td:nth-child(2) {
            text-align: right;
        }
        .invoice-box table tr.top table td {
            padding-bottom: 20px;
        }
        .invoice-box table tr.information table td {
            padding-bottom: 40px;
        }
        .invoice-box table tr.heading td {
            background: #eee;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
        }
        .invoice-box table tr.details td {
            padding-bottom: 20px;
        }
        .invoice-box table tr.item td {
            border-bottom: 1px solid #eee;
        }
        .invoice-box table tr.item.last td {
            border-bottom: none;
        }
        .invoice-box table tr.total td:nth-child(2) {
            font-weight: bold;
        }
        .flex-container {
            display: flex;
            justify-content: space-between;
        }
        .flex-item {
            width: 48%;
        }
        .title {
            font-size: 2em;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="invoice-box">
        <div class="flex-container">
            <div class="flex-item">
                <h2 class="title">거래명세서</h2>
                우리농산 貴 中<br>
                경기도 김포시 대곳면 OOOO<br>
                TEL: 031-111-2222<br>
            </div>
            <div class="flex-item" style="text-align:right;">
                <div>일련번호: 2021/12/22 -1</div>
                <div>사업자등록번호: 220-81-65848</div>
                <div>성명: 대표이사</div>
                <div>상호: (주)이가온토-고객지원팀 동영상</div>
                <div>주소: 서울 구로구 구로3동 에이스하이엔드타워2차 802호</div>
            </div>
        </div>
        <br>
        <div style="text-align: center; font-size: 1.5em; font-weight: bold;">금 액: 오십칠만이천원 정 (₩572,000)</div>
        <br>
        <table cellpadding="0" cellspacing="0">
            <tr class="heading">
                <td>일자</td>
                <td>품목명[규격]</td>
                <td>수량(단위포함)</td>
                <td>단가</td>
                <td>공급가액</td>
                <td>부가세</td>
            </tr>
            <c:forEach var="item" items="${invoiceItems}">
                <tr class="item">
                    <td>${item.date}</td>
                    <td>${item.name}</td>
                    <td>${item.quantity}</td>
                    <td>${item.unitPrice}</td>
                    <td>${item.supplyPrice}</td>
                    <td>${item.vat}</td>
                </tr>
            </c:forEach>
            <tr class="total">
                <td colspan="4"></td>
                <td>합계: ${totalAmount}</td>
                <td>${totalVat}</td>
            </tr>
        </table>
        <br>
        <div style="text-align: right;">
            <div>수신자확인 전</div>
            <div>인수:</div>
        </div>
    </div>
</body>
</html>


