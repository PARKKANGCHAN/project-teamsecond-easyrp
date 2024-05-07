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

			<table id="salesplanTable">
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
		
			<input type="text" id="cod" name="cod" placeholder="판매계획번호">
			<input type="text" id="clientCod" name="clientCod" placeholder="고객번호">
			<input type="text" id="productCod" name="productCod" placeholder="상품번호">
			<input type="text" id="basicplnQty" name="basicplnQty" placeholder="기초계획수량">
			<input type="button" value="등록" onclick="salesplanInsert()">

         </div>
      </div>
      
		<form id="frmDelete" action="salesplandelete" method="post">
			<input type="hidden" id="salesplandeleteId" name="salesplanCod" value="">
		</form>
      <script>
		
      		
      		/*
      		fetch(url[, options])
      	    .then(response => {
      	        // 응답을 처리하는 로직
      	    })
      	    .catch(error => {
      	        // 에러를 처리하는 로직
      	    });
      		*/
      		
      		function salesplanInsert() {
				
				const newSalesplan = {
						cod: document.getElementById("cod").value,
						clientCod: document.getElementById("clientCod").value,
						productCod: document.getElementById("productCod").value,
						basicplnQty: document.getElementById("basicplnQty").value
					};
				
				console.log(newSalesplan);
				
			    const newRow = document.createElement("tr");
			    newRow.innerHTML = `
			        <td colspan="7">로딩 중...</td>
			    `;
			    document.getElementById("salesplanTable").appendChild(newRow);
				
				fetch("salesplaninsert", {
					method: "POST",
					headers: {
						"Content-Type" : "application/json" // 요청 데이터가 JSON 형식임을 명시함
					},
					body: JSON.stringify(newSalesplan) // 새 판매 계획 데이터를 JSON 문자열로 변환하여 전송
				})
					.then(response => {
						// 여기서 응답을 처리
						if (!response.ok) {
          				  throw new Error("네트워크 상태가 정상이 아님");
      					  }
       					 return response.json(); // json 형식의 응답을 파싱하여 반환
					})
					.then(data => {
						// 서버로부터 받은 data를 이용하여 필요한 작업 수행
						console.log("판매 계획이 추가되었습니다.", data);
										
						const newRow = document.createElement("tr");
				       
						let newData =  "<td>" + data.cod + "</td>";
							newData += "<td>" + data.clientCod + "</td>";
							<td>data.productCod</td>
							<td>data.planDate</td>
							<td>data.basicplnQty</td>
							<td>data.modplnQty</td>
							<td>data.stateCod</td>
							<td>
								<button onclick="deleteSalesplan('data.cod')">삭제</button>	
							</td>
						;
						newRow.appendChild(newData);												
						document.getElementById("salesplanTable").appendChild(newRow);
						
			            // 로딩 행을 제거
			            newRow.previousElementSibling.remove();
					})
					.catch(error => {
						console.error("판매 계획 추가 오류발생", error);
					});
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
