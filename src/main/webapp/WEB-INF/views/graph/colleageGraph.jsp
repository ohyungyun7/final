<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.card *{
	font-size: 15px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script>

var seri = [];
var labe = [];

 $.ajax({
		url : "/graph/colleageCount",
		contentType : 'application/json;charset=utf-8',
		dataType : "json",
		type : "post",
		async : false,
		//data : JSON.stringify(data),
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			//학과이름 가져오기
			for(var i =0; i<result.colleageList.length; i++){
				labe.push(result.colleageList[i].collNm);
			}
			//sumPeopleList
			//단과대별 인원 가져오기
			for(var i =0; i<result.sumPeopleList.length; i++){
				seri.push(result.sumPeopleList[i].count);
			}
		}
});

document.addEventListener("DOMContentLoaded", () => {
    new ApexCharts(document.querySelector("#donutChart"), {
      //series: [44, 55, 13, 43, 22],
      series: seri,
      chart: {
        height: 350,
        type: 'donut',
        toolbar: {
          show: true
        }
      },
     // labels: ['Team A', 'Team B', 'Team C', 'Team D', 'Team E'],
      labels: labe,
    }).render();
  });


var departList = [];
var departCount = [];

$.ajax({
	url : "/graph/departmentCount",
	contentType : 'application/json;charset=utf-8',
	dataType : "json",
	type : "post",
	async : false,
	//data : JSON.stringify(data),
	beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	},
	success : function(result){
		for(var i =0; i<result.departSumPeople.length; i++){
			departList.push(result.departSumPeople[i].deptNm);
			departCount.push(result.departSumPeople[i].count);
		}
	}
});



document.addEventListener("DOMContentLoaded", () => {
    new ApexCharts(document.querySelector("#barChart"), {
      series: [{
        data: departCount
      }],
      chart: {
        type: 'bar',
        height: 350
      },
      plotOptions: {
        bar: {
          borderRadius: 4,
          horizontal: true,
        }
      },
      dataLabels: {
        enabled: false
      },
      xaxis: {
        categories: departList
      }
    }).render();
  });

window.onload = function(){
	var yearList = [];
	var male = [];
	var female = [];
	$.ajax({
		url : "/graph/maleAndFemale",
		contentType : 'application/json;charset=utf-8',
		dataType : "json",
		type : "post",
		async : false,
		//data : JSON.stringify(data),
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			//yearList,mealFemale
			for(var i = 0; i<result.yearList.length; i++){
				yearList.push(result.yearList[i].year2);
			}

			for(var i =0; i<result.mealFemale.length; i++){
				if(i%2==0){
					male.push(result.mealFemale[i].count);
				}else if(i%2!=0){
					female.push(result.mealFemale[i].count);
				}

			}
		}
	});


	var options = {
	        series: [{
	        //data: [44, 55, 41, 64, 22, 43, 21]//위에꺼
	        data: male//위에꺼
	      }, {
//	        data: [53, 32, 33, 52, 13, 44, 32]//아래꺼
	        data: female//아래꺼
	      }],
	        chart: {
	        type: 'bar',
	        height: 430
	      },
	      plotOptions: {
	        bar: {
	          horizontal: true,
	          dataLabels: {
	            position: 'top',
	          },
	        }
	      },
	      dataLabels: {
	        enabled: true,
	        offsetX: -6,
	        style: {
	          fontSize: '12px',
	          colors: ['#fff']
	        }
	      },
	      stroke: {
	        show: true,
	        width: 1,
	        colors: ['#fff']
	      },
	      tooltip: {
	        shared: true,
	        intersect: false
	      },
	      xaxis: {
	        //categories: [2001, 2002, 2003, 2004, 2005, 2006, 2007],//연도
	        categories: yearList,//연도
	      },
	      };

	      var chart = new ApexCharts(document.querySelector("#chart"), options);
	      chart.render();

	      $("#chart").find(".apexcharts-legend-series").find(".apexcharts-legend-text").each(function(index, item){
	    	  	if(index == 0){
	    	  		$(item).text("남자");
	    	  	}else{
	    	  		$(item).text("여자");
	    	  	}
	      });


	      var departList = [];
		  var departMaleList = [];
		  var departFemaleList = [];
	      $.ajax({
	  		url : "/graph/colleageMaleFemale",
	  		contentType : 'application/json;charset=utf-8',
	  		dataType : "json",
	  		type : "post",
	  		async : false,
	  		//data : JSON.stringify(data),
	  		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
	  	    	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	  		},
	  		success : function(result){
				//departList,departMaleFemale
				for(var i = 0; i<result.departList.length; i++){
					departList.push(result.departList[i].deptNm);
				}

				for(var i =0; i<result.departMaleFemale.length; i++){
					if(i % 2 == 0){
						departMaleList.push(result.departMaleFemale[i].count);
					}else if(i % 2 != 0){
						departFemaleList.push(result.departMaleFemale[i].count);
					}
				}
	  		}
	  	});




	      var options2 = {
	              series: [{
	              name: '남자',
	              //data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
	              data: departMaleList
	            }, {
	              name: '여자',
	              //data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
	              data: departFemaleList
	            }],
	              chart: {
	              type: 'bar',
	              height: 350
	            },
	            plotOptions: {
	              bar: {
	                horizontal: false,
	                columnWidth: '55%',
	                endingShape: 'rounded'
	              },
	            },
	            dataLabels: {
	              enabled: false
	            },
	            stroke: {
	              show: true,
	              width: 2,
	              colors: ['transparent']
	            },
	            xaxis: {
	              categories: departList,
	            },
	            yaxis: {
	              title: {
	                text: ''
	              }
	            },
	            fill: {
	              opacity: 1
	            },
	            tooltip: {
	              y: {
	                formatter: function (val) {
	                  return ""
	                }
	              }
	            }
	            };
	            var chart2 = new ApexCharts(document.querySelector("#chart2"), options2);
	            chart2.render();
}




</script>
<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="menu-icon tf-icons bx bx-bar-chart-square"></i>
	<span style="font-weight: normal;">총지표 / </span>대학 지표조회
</h4>

<div class="card">
	<div class="card-header">
		<br>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">단과대별 총원백분율</h5>
								<!-- Donut Chart -->
								<div id="donutChart"></div>
								<!-- End Donut Chart -->
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">학과별 총정원</h5>
								  <div id="barChart"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">연도별 신입생 성비</h5>
								  <div id="chart"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">학과별 성비</h5>
								  <div id="chart2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
