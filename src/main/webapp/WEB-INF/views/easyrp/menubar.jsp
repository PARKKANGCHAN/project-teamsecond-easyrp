<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <div id="sidebar">
         <div class="sidebar-wrapper active">
            <div class="sidebar-header position-relative">
               <div class="d-flex justify-content-between align-items-center">
                  <div class="logo" style="font-size: 1.6rem !important">
                     <a href="/easyrp">🪄EasyRP</a>
                  </div>
                  <div class="theme-toggle d-flex gap-2 align-items-center mt-2">
                     <svg
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        aria-hidden="true"
                        role="img"
                        class="iconify iconify--system-uicons"
                        width="20"
                        height="20"
                        preserveAspectRatio="xMidYMid meet"
                        viewBox="0 0 21 21"
                     >
                        <g
                           fill="none"
                           fill-rule="evenodd"
                           stroke="currentColor"
                           stroke-linecap="round"
                           stroke-linejoin="round"
                        >
                           <path
                              d="M10.5 14.5c2.219 0 4-1.763 4-3.982a4.003 4.003 0 0 0-4-4.018c-2.219 0-4 1.781-4 4c0 2.219 1.781 4 4 4zM4.136 4.136L5.55 5.55m9.9 9.9l1.414 1.414M1.5 10.5h2m14 0h2M4.135 16.863L5.55 15.45m9.899-9.9l1.414-1.415M10.5 19.5v-2m0-14v-2"
                              opacity=".3"
                           ></path>
                           <g transform="translate(-210 -1)">
                              <path d="M220.5 2.5v2m6.5.5l-1.5 1.5"></path>
                              <circle cx="220.5" cy="11.5" r="4"></circle>
                              <path d="m214 5l1.5 1.5m5 14v-2m6.5-.5l-1.5-1.5M214 18l1.5-1.5m-4-5h2m14 0h2"></path>
                           </g>
                        </g>
                     </svg>
                     <div class="form-check form-switch fs-6">
                        <input class="form-check-input me-0" type="checkbox" id="toggle-dark" style="cursor: pointer" />
                        <label class="form-check-label"></label>
                     </div>
                     <svg
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        aria-hidden="true"
                        role="img"
                        class="iconify iconify--mdi"
                        width="20"
                        height="20"
                        preserveAspectRatio="xMidYMid meet"
                        viewBox="0 0 24 24"
                     >
                        <path
                           fill="currentColor"
                           d="m17.75 4.09l-2.53 1.94l.91 3.06l-2.63-1.81l-2.63 1.81l.91-3.06l-2.53-1.94L12.44 4l1.06-3l1.06 3l3.19.09m3.5 6.91l-1.64 1.25l.59 1.98l-1.7-1.17l-1.7 1.17l.59-1.98L15.75 11l2.06-.05L18.5 9l.69 1.95l2.06.05m-2.28 4.95c.83-.08 1.72 1.1 1.19 1.85c-.32.45-.66.87-1.08 1.27C15.17 23 8.84 23 4.94 19.07c-3.91-3.9-3.91-10.24 0-14.14c.4-.4.82-.76 1.27-1.08c.75-.53 1.93.36 1.85 1.19c-.27 2.86.69 5.83 2.89 8.02a9.96 9.96 0 0 0 8.02 2.89m-1.64 2.02a12.08 12.08 0 0 1-7.8-3.47c-2.17-2.19-3.33-5-3.49-7.82c-2.81 3.14-2.7 7.96.31 10.98c3.02 3.01 7.84 3.12 10.98.31Z"
                        ></path>
                     </svg>
                  </div>
                  <div class="sidebar-toggler x">
                     <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                  </div>
               </div>
            </div>
            <!-- 로그인 & 회원가입 START -->
            <!-- 2024년 4월 29일 오후 9시 13분 수정 박현우  -->
            <c:if test="${empty empCode}">
               <div class="d-flex justify-content-between" style="margin-top: 1rem !important">
                  <div class="col-md-12" style="text-align: center !important">
                     <a href="login" class="btn icon icon-left btn-primary"><i data-feather="key"></i>로그인</a>
                  </div>
               </div>
            </c:if>
            <!-- 로그인 & 회원가입 END -->

            <!-- 사원 정보 카드 START -->
            <!-- 2024년 4월 29일 오후 9시 23분 수정 박현우  -->
            <c:if test="${not empty empCode}">
               <div class="card" style="margin-bottom: 0rem !important">
                  <div class="card-body px-4">
                     <div class="row" style="align-items: center">
                        <div class="col-md-4 col-lg-12 col-xl-12 col-xxl-5 d-flex justify-content-center">
                           <div class="avatar avatar-xl">
                              <img src="resources/easyrp/assets/compiled/jpg/1.jpg" alt="Face 1" />
                           </div>
                        </div>
                        <div class="col-md-8 col-lg-12 col-xl-12 col-xxl-7">
                           <h6 class="font-semibold">${empName }</h6>
                           <h6 class="font-semibold">직급 : ${empPosition }</h6>
                           <h6 class="font-semibold">부서 : ${empDeptCode }</h6>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="d-flex justify-content-between" style="margin-top: 0.3rem !important">
                  <div class="col-md-12" style="text-align: center !important">
                     <a href="logout" class="btn icon icon-left btn-primary"
                        ><i class="fa-solid fa-right-from-bracket"></i>로그아웃</a
                     >
                  </div>
               </div>
            </c:if>
            <!-- 사원 정보 카드 END -->
            <div class="sidebar-menu">
               <ul class="menu">
                  <!-- 기초 정보 관리 START -->
                  <li class="no_dot" style="font-size: 1.1rem !important">
                     📝 <span style="font-weight: 800 !important">기초 정보 관리</span>
                  </li>
                  <!-- 기초 정보 관리 / 사원 및 부서 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">사원 및 부서 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item">
                           <a href="employeelist" class="submenu-link">사원 기초 관리</a>
                        </li>
                        <li class="submenu-item"><a href="departmentmgmt" class="submenu-link">부서 관리</a></li>
                     </ul>
                  </li>
                  <!-- 기초 정보 관리 / 사원 및 부서 관리 END -->
                 <!-- 기초 정보 관리 / 거래처 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">거래처 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="client" class="submenu-link">거래처관리</a></li>
                     </ul>
                  </li>
                  <!-- 기초 정보 관리 / 거래처 관리 END -->
                  <!-- 기초 정보 관리 / 창고&제품 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">제품 및 창고 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="warehouse" class="submenu-link">창고 관리</a></li>
                        <li class="submenu-item"><a href="inventorymgmt" class="submenu-link">자재 관리</a></li>
                        <li class="submenu-item"><a href="productmgmt" class="submenu-link">제품 관리</a></li>
                     </ul>
                  </li>
                  <!-- 기초 정보 관리 / 공장&창고&제품 관리 END -->
                  <!-- 기초 정보 관리 END -->

                  <!-- 영업 관리 START -->
                  <li class="no_dot" style="font-size: 1.1rem !important; margin-top: 1rem; margin-bottom: 1rem">
                     📈 <span style="font-weight: 800 !important">영업 관리</span>
                  </li>
                  
                  <!-- 영업 관리 / 판매 계획 관리 START -->
                  <!-- 2024년 4월 30일 오전 11시 34분 류현석 수정 -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">계획 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="salesplanmanagement" class="submenu-link">판매 계획 관리</a></li>
                     </ul>
                  </li>
                  <!-- 영업 관리 / 판매 계획 관리 END -->

                  <!-- 영업 관리 / 견적 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">견적 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="estimatemanagement" class="submenu-link">견적 관리</a></li>
                     </ul>
                  </li>
                  <!-- 영업 관리 / 견적 관리 END -->

                  <!-- 영업 관리 / 수주 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">수주 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="ordersmanagement" class="submenu-link">수주 관리</a></li>
                     </ul>
                  </li>
                  <!-- 영업 관리 / 수주 관리 END -->

                  <!-- 영업 관리 / 매출 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">매출 마감 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="salesclosing" class="submenu-link">매출 마감 관리</a></li>
                     </ul>
                  </li>
                  <!-- 영업 관리 / 매출 관리 END -->

                  <!-- 영업 관리 / 매출 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">수금 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="collectedmoney" class="submenu-link">수금 관리</a></li>
                     </ul>
                  </li>
                  <!-- 영업 관리 / 매출 관리 END -->
                  <!-- 영업 관리 END -->

                  <!-- 구매 관리 START -->
                  <li class="no_dot" style="font-size: 1.1rem !important; margin-top: 1rem; margin-bottom: 1rem">
                     🚚 <span style="font-weight: 800 !important">구매 관리</span>
                  </li>
                  <!-- 구매 관리 / 계획 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">계획 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="mpsmanagement" class="submenu-link">주계획 관리</a></li>
                        <li class="submenu-item"><a href="mrpmanagement" class="submenu-link">소요량전개 관리</a></li>
                     </ul>
                  </li>
                  <!-- 구매 관리 / 계획 관리 END -->

                  <!-- 구매 관리 / 청구 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">청구 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="invoicemanagement" class="submenu-link">청구 관리</a></li>
                     </ul>
                  </li>
                  <!-- 구매 관리 / 청구 관리 END -->

                  <!-- 구매 관리 / 발주 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">발주 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="purchaseordermgmttable" class="submenu-link">발주 관리</a></li>
                     </ul>
                  </li>
                  <!-- 구매 관리 / 발주 관리 END -->

                  <!-- 구매 관리 / 입고 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">매입 마감 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="purchaseclosing" class="submenu-link">매입 마감 관리</a></li>
                        <!-- 
                        <li class="submenu-item"><a href="#" class="submenu-link">입고 집계</a></li>
                         -->
                     </ul>
                  </li>
                  <!-- 구매 관리 / 입고 관리 END -->
                  <!-- 구매 관리 END -->

                  <!-- 자재 관리 START -->
                  <li class="no_dot" style="font-size: 1.1rem !important; margin-top: 1rem; margin-bottom: 1rem">
                     📦 <span style="font-weight: 800 !important">자재 관리</span>
                  </li>
                  <!-- 자재 관리 / 재고 관리 START -->
                  <li class="sidebar-item has-sub">
                     <a href="#" class="sidebar-link">
                        <span style="font-weight: 800 !important">재고 관리</span>
                     </a>
                     <ul class="submenu">
                        <li class="submenu-item"><a href="inventorycount" class="submenu-link">재고 실사 관리</a></li>
                        <li class="submenu-item"><a href="inventory" class="submenu-link">현 재고 현황</a></li>
                     </ul>
                  </li>
                  <!-- 자재 관리 / 재고 관리 END -->
                  <!-- 자재 관리 END -->
               </ul>
            </div>
         </div>
      </div>
   </body>
</html>
