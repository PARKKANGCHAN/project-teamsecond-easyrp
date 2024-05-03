<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>재고이동</title>
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
                     <h3>재고이동관리 및 목록</h3>
                     <p class="text-subtitle text-muted">재고 이동 현황</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">재고 관리</li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>

            <!-- Basic Tables start -->
            <section class="section">
               <div class="card">
                  <div class="card-body">
                     <div class="table-responsive">
                        <table class="table" id="table1">
                           <thead>
                              <tr>
                                 <th>이동번호</th>
                                 <th>이동일자</th>
                                 <th>출고창고</th>
                                 <th>출고장소</th>
                                 <th>입고창고</th>
                                 <th>입고장소</th>
                                 <th>품번</th>
                                 <th>품명</th>
                                 <th>단위</th>
                                 <th>이동수량</th>
                                 
                              </tr>
                           </thead>
                           <c:forEach var="inventoryMovementList" items="${inventorymovementList }">
                           <tbody>
                              <tr>
                                 <td>${inventorymovementList.cod }</td>
                                 <td>${inventorymovementList.moveDate}</td>
                                 <td>${inventorymovementList.oboundWarehouse}</td>
                                 <td>${inventorymovementList.oboundLocation}</td>
                                 <td>${inventorymovementList.iboundWarehouse}</td>
                                 <td>${inventorymovementList.iboundLocation}</td>
                                 <td>${inventorymovementList.employeeCod}</td>
                                 <td>${inventorymovementList.productCod}</td>
                                 <td>${inventorymovementList.productName}</td>
                                 <td>${inventorymovementList.spec}</td>
                                 <td>${inventorymovementList.unit}</td>
                              </tr>
                              </tbody>
                              </c:forEach>
                        </table>
                     </div>
                  </div>
               </div>
            </section>
            <!-- Basic Tables end -->
         </div>
      </div>
   </body>
</html>
