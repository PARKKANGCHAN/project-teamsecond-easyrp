	<div id="main">
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>
		<div class="page-heading">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>
							<a href="/easyrp/inventory/inventorycountdetail">재고 실사 상세 현황</a>
						</h3>

					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/easyrp">home</a></li>
								<li class="breadcrumb-item active" aria-current="page">재고 실사 상세</li>
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
												<th>실사번호</th>
												<th>실사일자</th>
												<th>재고기준일</th>
												<th>창고</th>
												<th>장소</th>
												<th>실사구분</th>
												<th>담당자</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty inventoryCountList}">
											<c:forEach var="inventoryCountList" items="${inventoryCountList}">
												<tr>
													<td class="text-bold-500">${inventoryCountList.cod }</td>
													<td>${inventoryCountList.countDate}</td>
													<td class="text-bold-500">${inventoryCountList.invDate}</td>
													<td>${inventoryCountList.warehouse}</td>
													<td>${inventoryCountList.location}</td>
													<td>${inventoryCountList.countclass}</td>
													<td>${inventoryCountList.employee}</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="updateinventoryCount?cod=${inventoryCountList.cod}">수정</a></li>
																<li><a class="dropdown-item"
																	href="deleteinventoryCount?cod=${inventoryCountList.cod}">삭제</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty inventoryCountList}">
											<tr>
												<td colspan='8' style="text-align:center">실사기록이 없습니다.</td>
											</tr>
											</c:if>
										</tbody>
									</table>
									<tr>
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th>실사상세번호</th>
												<th>재고코드</th>
												<th>규격</th>
												<th>단위</th>
												<th>수량</th>
												<th>처리구분</th>
												<th>조정구분</th>
												<th>조정수량</th>
												<th>비고</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty inventoryCountDetailList}">
											<c:forEach var="inventoryCountDetailList" items="${inventoryCountDetailList}">
												<tr>
													<td class="text-bold-500">${inventoryCountDetailList.num }</td>
													<c:if test="{}">
													<td>${inventoryCountDetailList.}</td>
													</c:if>
													<td class="text-bold-500">${inventoryCountDetailList.invDate}</td>
													<td>${inventoryCountDetailList.warehouse}</td>
													<td>${inventoryCountDetailList.location}</td>
													<td>${inventoryCountDetailList.countclass}</td>
													<td>${inventoryCountDetailList.employee}</td>
													<td>
														<div class="btn-group">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-expanded="false">
																<i class="fa-solid fa-gear"></i>
															</button>
															<ul class="dropdown-menu">
																<li><a class="dropdown-item"
																	href="updateinventoryCount?cod=${inventoryCountList.cod}">수정</a></li>
																<li><a class="dropdown-item"
																	href="deleteinventoryCount?cod=${inventoryCountList.cod}">삭제</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty inventoryCountList}">
											<tr>
												<td colspan='8' style="text-align:center">실사기록이 없습니다.</td>
											</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- 페이지네이션 START -->
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<!-- Previous 10 Pages -->
							<c:if test="${empty inventoryCountList}">
							<tr>
							</c:if>
							<c:if test="${not empty inventoryCountList}">						
							<li
								class="page-item <c:if test='${startPage == 1}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${startPage > 1}'>?page=${startPage - 10}&searchCod=${searchVO.searchCod}&searchWarehouse=${searchVO.searchWarehouse}&searchProduct=${searchVO.searchProduct}&searchLocation=${searchVO.searchLocation}&searchInventory=${searchVO.searchInventory}&searchCountClass=${searchVO.searchCountClass}&searchEmployee=${searchVO.searchEmployee}&searchAccount=${searchVO.searchAccount}&preSearchDate=${searchVO.preSearchDate}&postSearchDate=${searchVO.postSearchDate}</c:if>">이전
									10 페이지</a>
							</li>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<li
									class="page-item <c:if test='${i == currentPage}'>active</c:if>">
									<a class="page-link"
									href="?page=${i}&searchCod=${searchVO.searchCod}&searchWarehouse=${searchVO.searchWarehouse}&searchProduct=${searchVO.searchProduct}&searchLocation=${searchVO.searchLocation}&searchInventory=${searchVO.searchInventory}&searchCountClass=${searchVO.searchCountClass}&searchEmployee=${searchVO.searchEmployee}&searchAccount=${searchVO.searchAccount}&preSearchDate=${searchVO.preSearchDate}&postSearchDate=${searchVO.postSearchDate}">${i}</a>
								</li>
							</c:forEach>

							<li
								class="page-item <c:if test='${endPage == totalPages}'>disabled</c:if>">
								<a class="page-link"
								href="<c:if test='${endPage < totalPages}'>?page=${endPage + 1}&searchCod=${searchVO.searchCod}&searchWarehouse=${searchVO.searchWarehouse}&searchProduct=${searchVO.searchProduct}&searchLocation=${searchVO.searchLocation}&searchInventory=${searchVO.searchInventory}&searchCountClass=${searchVO.searchCountClass}&searchEmployee=${searchVO.searchEmployee}&searchAccount=${searchVO.searchAccount}&preSearchDate=${searchVO.preSearchDate}&postSearchDate=${searchVO.postSearchDate}</c:if>">다음
									10 페이지</a>
							</li>
							</c:if>		
						</ul>
					</nav>

					<!-- 페이지네이션 END -->
					<div class="d-flex"
						style="padding-bottom: 0.5rem; padding-top: 0.5rem;">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary">
								<a href="inventorycountinsert" style="color: white">등록</a>
							</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>