<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <!-- (2024년 4월 30일 추가 박현우) -->
      <!-- 공통 사용 테이블 START -->
      <div id="main">
         <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i> </a>
         </header>
         <div class="page-heading">
            <div class="page-title">
               <div class="row">
                  <div class="col-12 col-md-6 order-md-1 order-last">
                     <h3>공통 테이블</h3>
                     <p class="text-subtitle text-muted">공통 테이블 소개(부제목)</p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="/easyrp">home</a></li>
                           <li class="breadcrumb-item active" aria-current="page">공통 테이블</li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
            <section class="section">
               <div class="row" id="table-hover-row">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-content">
                           <div class="table-responsive">
                              <table class="table table-hover mb-0">
                                 <thead>
                                    <tr>
                                       <th>글 번호</th>
                                       <th>제 목</th>
                                       <th>내 용</th>
                                       <th>작성자</th>
                                       <th>기 능</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:forEach var="commonTable" items="${commonTableValue }">
                                       <tr>
                                          <td class="text-bold-500">${commonTable.postId }</td>
                                          <td>${commonTable.title }</td>
                                          <td class="text-bold-500">${commonTable.content }</td>
                                          <td>${commonTable.author }</td>
                                          <td>
                                             <div class="btn-group">
                                                <button
                                                   type="button"
                                                   class="btn btn-primary dropdown-toggle"
                                                   data-bs-toggle="dropdown"
                                                   aria-expanded="false"
                                                >
                                                   <i class="fa-solid fa-gear"></i>
                                                </button>
                                                <ul class="dropdown-menu">
                                                   <li><a class="dropdown-item" href="#">수정</a></li>
                                                   <li><a class="dropdown-item" href="#">삭제</a></li>
                                                </ul>
                                             </div>
                                          </td>
                                       </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
                  <nav aria-label="Page navigation example">
                     <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                           <a class="page-link">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                           <a class="page-link" href="#">Next</a>
                        </li>
                     </ul>
                  </nav>
                  <div
                     class="d-flex fixed-bottom"
                     style="padding-bottom: 0.5rem; padding-top: 0.5rem; background-color: white"
                  >
                     <button type="button" class="btn btn-primary" style="margin-left: 20rem">등록</button>
                  </div>
               </div>
            </section>
         </div>
      </div>
      <!-- 공통 사용 테이블 END -->
   </body>
</html>
