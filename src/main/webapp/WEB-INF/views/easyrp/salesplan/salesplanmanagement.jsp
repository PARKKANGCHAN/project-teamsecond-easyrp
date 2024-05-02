<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <div id="main">
         <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
               <i class="bi bi-justify fs-3"></i>
            </a>
         </header>

         <div class="page-heading">
            <div class="page-title">
               <div class="row">
                  <div class="col-12 col-md-6 order-md-1 order-last">
                     <h3>판매 계획 관리 및 목록</h3>
                     <p class="text-subtitle text-muted">판매계획에 대한 관리를 할 수 있는 목록</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">판매 계획 관리</li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>

		<c:forEach items="${Salesplan}" var="s">
			<table>
			<th>판매계획번호</th>
			<th>고객번호</th>
			<th>상품번호</th>
			<th>계획날짜</th>
			<th>기초계획수량</th>
			<th>수정계획수량</th>
			<th>상태</th>
				<tr>
					<td>${s.cod}</td>
					<td>${s.clientCod }</td>
					<td>${s.productCod }</td>
					<td>${s.planDate }</td>
					<td>${s.basicplnQty }</td>
					<td>${s.modplnQty }</td>
					<td>${s.stateCod }</td>
				</tr>
			</table>
		</c:forEach>

         </div>
      </div>
   </body>
</html>
