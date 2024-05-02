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

			<table>
			<th>판매계획번호</th>
			<th>고객번호</th>
			<th>상품번호</th>
			<th>계획날짜</th>
			<th>기초계획수량</th>
			<th>수정계획수량</th>
			<th>상태</th>
		<c:forEach items="${Salesplan}" var="s">
				<tr>
					<td>${s.cod}</td>
					<td>${s.clientCod }</td>
					<td>${s.productCod }</td>
					<td>${s.planDate }</td>
					<td>${s.basicplnQty }</td>
					<td>${s.modplnQty }</td>
					<td>${s.stateCod }</td>
               		<td>
               			<button onclick="deleteSalesplan('${s.cod}')">삭제</button>
               			<!-- deleteSalesplan(${s.cod}) 이걸로 쓰면 문자열 인식이 안된다. -->
               		</td>
				</tr>
		</c:forEach>
			</table>
		
		<form action="salesplaninsert" method="post">
			<input type="text" name="cod" placeholder="판매계획번호">
			<input type="text" name="clientCod" placeholder="고객번호">
			<input type="text" name="productCod" placeholder="상품번호">
			<input type="text" name="basicplnQty" placeholder="기초계획수량">
			<input type="submit" value="등록">
		</form>

         </div>
      </div>
      
		<form id="frmDelete" action="salesplandelete" method="post">
			<input type="hidden" id="salesplandeleteId" name="salesplanCod" value="">
		</form>
      <script>

           	// function deleteSalesplan(cod) {
      		// document.getElementById("salesplandeleteId").value = cod;
      		// frmDelete.submit();
      		
      		function deleteSalesplan(cod) {
      			var salesplanCod = cod;
      			
      			fetch('/salesplandelete', {
      				method: 'POST',
      				headers: {
      					'Content-Type': 'application/json'
      				},
      				body: JSON.stringify({ salesplanCod: slaesplanCod })
      			})
      			.then(response => {
      				if (!response.ok) {
      					throw new Error('실패');
      				}
      				return response.json();
      			})
      			.then(data => {
      				console.log(data);
      				window.location.reload();
      			})
      			.catch(error => {
      				console.error('fetch operation 중 오류발생', error);
      			});

      		}
      	}
      	/* 
      	  fetch(url, options)
		  .then((response) => console.log("response:", response))
		  .catch((error) => console.log("error:", error));
      	
      	fetch() 함수는 첫 번째 인자로 URL, 두번째 인자로 옵션 
      	*/
           	
      </script>
   </body>
</html>
