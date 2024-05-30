$(function(){
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;

    boardList(year, month);

    // 월별 데이터 출력
    function boardList(year, month) {
        $(".tbody").empty();
        
        $.ajax({
            url: "boardList.ajax",
            type: "get",
            data: { year: year, month: month },
            dataType: "json",
            success: function(resData){

                // 차트 작업을 위한 초기화
                let writer = [];
                let price = [];
                let category = [];
                let payment = [];
                let writerData= {};
                let categoryData = {}; // 객체로 초기화
                let paymentData = {}; // payment 빈도수 집계
                

                $.each(resData, function(i, b){
                    writer.push(b.writer);
                    price.push(b.price);
                    category.push(b.category);
                    payment.push(b.payment);
                    
                    if(writerData[b.writer]) {
                        writerData[b.writer] += b.price;
                    } else {
                        writerData[b.writer] = b.price;
                    }
                    
                    //데이터 세팅
                    if (categoryData[b.category]) {
                        categoryData[b.category] += b.price;
                    } else {
                        categoryData[b.category] = b.price;
                    }

                    //데이터 세팅 
                    if (paymentData[b.payment]) {
                        paymentData[b.payment]++;
                    } else {
                        paymentData[b.payment] = 1;
                    }
                    
                    let boardList = `
                        <tr>
                            <td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark">${b.date}</a></td>
                            <td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark">${b.writer}</a></td>
                            <td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark">${b.category}</a></td>
                            <td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark">${new Intl.NumberFormat('ko-KR').format(b.price)}원</a></td>
                            <td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark">${b.content}</a></td>
                            <td><a href="boardDetail?no=${b.no}" class="text-decoration-none link-dark">${b.payment}</a></td>
                        </tr>
                    `;
                    $(".tbody").append(boardList);
                });

                // 도넛 차트를 위한 데이터 준비
                let writerLabels = Object.keys(writerData);
                let writerPrices = Object.values(writerData);
                
                // 차트 생성
                barChart(writerLabels, writerPrices);

                // 도넛 차트를 위한 데이터 준비
                let categoryLabels = Object.keys(categoryData);
                let categoryPrices = Object.values(categoryData);

                // 도넛 차트 생성 호출
                doughnutChart(categoryLabels, categoryPrices);
                
                // 파이 차트를 위한 데이터 준비
                let paymentLabels = Object.keys(paymentData);
                let paymentCounts = Object.values(paymentData);

                // 파이 차트 생성 호출
                pieChart(paymentLabels, paymentCounts);
            },
            error: function(xhr, status) {
                console.log("error: " + status);
            }
        });
    }

    // 절약왕 차트
    function barChart(writer, price) {
        var ctx = $("#chart1");
        var chart1 = new Chart(ctx, {
            type: "bar",
            data: {
                labels: writer,
                datasets: [{
                    label: '가격',
                    data: price,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    title: {
                        display: true,
                        text: '이달의 절약왕은?'
                    }
                }
            }
        });
    }

    // 도넛 차트 생성 함수
    function doughnutChart(labels, data) {
        var ctx = $("#chart2");
        var chart2 = new Chart(ctx, {
            type: "doughnut",
            data: {
                labels: labels,
                datasets: [{
                    label: '가격',
                    data: data,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: '카테고리별 가격 분포'
                    },
                    legend: {
                        display: true,
                        position: 'top'
                    },
                    datalabels: {
                        formatter: (value, ctx) => {
                            let sum = ctx.dataset.data.reduce((a, b) => a + b, 0);
                            let percentage = (value * 100 / sum).toFixed(2) + "%";
                            return percentage;
                        },
                		color: '#000',  // 색깔을 검정으로 변경
                	    anchor: 'end',  // 라벨의 위치를 바깥쪽으로 설정
                	    
                    }
                }
            },
            plugins: [ChartDataLabels]
        });
    }
    
    // 파이 차트 생성 함수
    function pieChart(labels, data) {
        var ctx = $("#chart3");
        var chart3 = new Chart(ctx, {
            type: "pie",
            data: {
                labels: labels,
                datasets: [{
                    label: '결제 수단',
                    data: data,
                    backgroundColor: [
                      'rgba(255, 0, 0, 0.2)',  // Red with 20% opacity
                      'rgba(0, 0, 255, 0.2)',  // Blue with 20% opacity
                      'rgba(255, 255, 0, 0.2)',  // Yellow with 20% opacity
                      'rgba(0, 255, 0, 0.2)',  // Green with 20% opacity
                      'rgba(128, 0, 128, 0.2)',  // Purple with 20% opacity
                      'rgba(255, 165, 0, 0.2)'   // Orange with 20% opacity
                  ],
                  borderColor: [
                      'rgba(255, 0, 0, 1)',  // Red
                      'rgba(0, 0, 255, 1)',  // Blue
                      'rgba(255, 255, 0, 1)',  // Yellow
                      'rgba(0, 255, 0, 1)',  // Green
                      'rgba(128, 0, 128, 1)',  // Purple
                      'rgba(255, 165, 0, 1)'   // Orange
                  ],
                    borderWidth: 1
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: '결제 수단별 사용 빈도'
                    },
                    legend: {
                        display: true,
                        position: 'top'
                    },
                    datalabels: {
                        formatter: (value, ctx) => {
                            let sum = ctx.dataset.data.reduce((a, b) => a + b, 0);
                            let percentage = (value * 100 / sum).toFixed(2) + "%";
                            return percentage;
                        },
                		color: '#000',  // 색깔을 검정으로 변경
                	    anchor: 'end',  // 라벨의 위치를 바깥쪽으로 설정
                	  
                    }
                }
            },
            plugins: [ChartDataLabels]
        });
    }
});
