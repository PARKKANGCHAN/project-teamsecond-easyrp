<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasyRP</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="main">
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>

		<div class="page-heading">
			<h3>전체 현황</h3>
		</div>
		<div class="page-content">
			<section class="row">
				<div class="col-12 col-lg-9">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h4>월별 판매계획 대비 목표 달성량</h4>
								</div>
								<div class="card-body">
									<div>
										<select id="yearSelector">
											<option value="2024">2024</option>
											<option value="2023">2023</option>
											<option value="2022">2022</option>
											<option value="2021">2021</option>
											<option value="2020">2020</option>
											<option value="2019">2019</option>
											
										</select> 
										<select id="productSelector">
											<c:forEach items="${productList}" var="p">
												<option value="${p.productCod }">${p.prodname }</option>
											</c:forEach>
										</select>
										<canvas id="myChart"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 col-xl-4">
							<div class="card">
								<div class="card-header">
									<h4>Profile Visit</h4>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-7">
											<div class="d-flex align-items-center">
												<svg class="bi text-primary" width="32" height="32"
													fill="blue" style="width: 10px">
                                            <use
														xlink:href="resources/easyrp/assets/static/images/bootstrap-icons.svg#circle-fill" />
                                        </svg>
												<h5 class="mb-0 ms-3">Europe</h5>
											</div>
										</div>
										<div class="col-5">
											<h5 class="mb-0 text-end">862</h5>
										</div>
										<div class="col-12">
											<div id="chart-europe"></div>
										</div>
									</div>
									<div class="row">
										<div class="col-7">
											<div class="d-flex align-items-center">
												<svg class="bi text-success" width="32" height="32"
													fill="blue" style="width: 10px">
                                            <use
														xlink:href="resources/easyrp/assets/static/images/bootstrap-icons.svg#circle-fill" />
                                        </svg>
												<h5 class="mb-0 ms-3">America</h5>
											</div>
										</div>
										<div class="col-5">
											<h5 class="mb-0 text-end">375</h5>
										</div>
										<div class="col-12">
											<div id="chart-america"></div>
										</div>
									</div>
									<div class="row">
										<div class="col-7">
											<div class="d-flex align-items-center">
												<svg class="bi text-danger" width="32" height="32"
													fill="blue" style="width: 10px">
                                            <use
														xlink:href="resources/easyrp/assets/static/images/bootstrap-icons.svg#circle-fill" />
                                        </svg>
												<h5 class="mb-0 ms-3">Indonesia</h5>
											</div>
										</div>
										<div class="col-5">
											<h5 class="mb-0 text-end">1025</h5>
										</div>
										<div class="col-12">
											<div id="chart-indonesia"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-xl-8">
							<div class="card">
								<div class="card-header">
									<h4>Latest Comments</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover table-lg">
											<thead>
												<tr>
													<th>Name</th>
													<th>Comment</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="col-3">
														<div class="d-flex align-items-center">
															<div class="avatar avatar-md">
																<img src="resources/easyrp/assets/compiled/jpg/5.jpg">
															</div>
															<p class="font-bold ms-3 mb-0">Si Cantik</p>
														</div>
													</td>
													<td class="col-auto">
														<p class=" mb-0">Congratulations on your graduation!</p>
													</td>
												</tr>
												<tr>
													<td class="col-3">
														<div class="d-flex align-items-center">
															<div class="avatar avatar-md">
																<img src="resources/easyrp/assets/compiled/jpg/2.jpg">
															</div>
															<p class="font-bold ms-3 mb-0">Si Ganteng</p>
														</div>
													</td>
													<td class="col-auto">
														<p class=" mb-0">Wow amazing design! Can you make
															another tutorial for this design?</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-lg-3">
					<div class="card">
						<div class="card-body py-4 px-4">
							<div class="d-flex align-items-center">
								<div class="avatar avatar-xl">
									<img src="resources/easyrp/assets/compiled/jpg/1.jpg" alt="Face 1">
								</div>
								<div class="ms-3 name">
									<h5 class="font-bold">John Duck</h5>
									<h6 class="text-muted mb-0">@johnducky</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<h4>Recent Messages</h4>
						</div>
						<div class="card-content pb-4">
							<div class="recent-message d-flex px-4 py-3">
								<div class="avatar avatar-lg">
									<img src="resources/easyrp/assets/compiled/jpg/4.jpg">
								</div>
								<div class="name ms-4">
									<h5 class="mb-1">Hank Schrader</h5>
									<h6 class="text-muted mb-0">@johnducky</h6>
								</div>
							</div>
							<div class="recent-message d-flex px-4 py-3">
								<div class="avatar avatar-lg">
									<img src="resources/easyrp/assets/compiled/jpg/5.jpg">
								</div>
								<div class="name ms-4">
									<h5 class="mb-1">Dean Winchester</h5>
									<h6 class="text-muted mb-0">@imdean</h6>
								</div>
							</div>
							<div class="recent-message d-flex px-4 py-3">
								<div class="avatar avatar-lg">
									<img src="resources/easyrp/assets/compiled/jpg/1.jpg">
								</div>
								<div class="name ms-4">
									<h5 class="mb-1">John Dodol</h5>
									<h6 class="text-muted mb-0">@dodoljohn</h6>
								</div>
							</div>
							<div class="px-4">
								<button
									class='btn btn-block btn-xl btn-outline-primary font-bold mt-3'>Start
									Conversation</button>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<h4>Visitors Profile</h4>
						</div>
						<div class="card-body">
							<div id="chart-visitors-profile"></div>
						</div>
					</div>
				</div>
			</section>
		</div>

		<footer>
			<div class="footer clearfix mb-0 text-muted">
				<div class="float-start">
					<p>2024 &copy; EasyRP</p>
				</div>
				<div class="float-end">
					<p>
						Crafted with <span class="text-danger"><i
							class="bi bi-heart-fill icon-mid"></i></span> by <a
							href="https://saugi.me">Saugi</a>
					</p>
				</div>
			</div>
		</footer>
	</div>
</body>
<script>

	
	
    $(document).ready(function() {
    	
    	let myChart;
    	
        function fetchData() {
            const productCod = $('#productSelector').val();
            const year = $('#yearSelector').val();
			
            
            $.ajax({
                url: `ChartUpdate?productCod=\${productCod}&year=\${year}`,
                method: 'GET',
                success: function(data) {
                    console.log('data : ', data);
                    
                    const orderData = data.orderData;
                    const planData = data.planData;
                    
                    const orderSalesData = Array(12).fill(0);
                    orderData.forEach(item => {
                        orderSalesData[item.month - 1] = item.totalQty;  // 월별 주문량 데이터 채우기
                    });
                    
                    const planSalesData = Array(12).fill(0);
                    planData.forEach(item => {
                        planSalesData[item.month - 1] = item.totalQty;  // 월별 판매 계획량 데이터 채우기
                    });
                    
                    if (!myChart) {
                        // 차트가 없는 경우, 차트를 생성합니다.
                        createChart(orderSalesData, planSalesData);
                    } else {
                        // 차트가 있는 경우, 데이터를 업데이트합니다.
                        updateChart(myChart, orderSalesData, planSalesData);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching data: ", error);
                }
            });
        }

	
        function createChart(orderData, planData) {
            const ctx = document.getElementById('myChart').getContext('2d');
            myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    datasets: [
                        {
                            label: '주문 수량',
                            data: orderData,
                            borderWidth: 1,
                            type: 'bar'
                        },
                        {
                            label: '판매 계획 수량',
                            data: planData,
                            borderWidth: 1,
                            type: 'line'
                        }
                    ]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }

        function updateChart(chart, orderData, planData) {
            chart.data.datasets[0].data = orderData;
            chart.data.datasets[1].data = planData;
            chart.update();
        }

        $('#productSelector, #yearSelector').change(fetchData);
        fetchData();  // 초기 로드 시 데이터 가져오기
    });
	
</script>

</html>