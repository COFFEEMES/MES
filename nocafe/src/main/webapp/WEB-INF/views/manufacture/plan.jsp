<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>

#container {
	width: 98%;
	margin: 0 auto;
}

.col {
	width: 100%
}

.linelist {
	float: right;
	margin: 0 20px 20px 0;
}

#pDate {
	float: left;
}

.tui-datepicker {
	z-index: 99;
}
</style>
</head>

<body>
	<!-- 본문내용 -->
	<!-- 헤더부분 -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">생산계획</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="home.do"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 생산관리</li>
			<li class="breadcrumb-item active">> 생산계획</li>
		</ol>
	</div>
	<!-- 헤더부분 -->
	<div id="container">
		<div class="card mb-4">
			<div class="card-body">
				<div id="pDate">
					<!--<div class="tui-datepicker-input tui-datetime-input tui-has-focus">-->
					<label>생산계획일자</label> <input type="date"
						id="tui-date-picker-target" name="tui-date-picker-target"
						class="form-control" style="width: 150px">
					<!--<span class="tui-ico-date"></span>-->
					<!--<div id="tui-date-picker-container1" style="margin-top: -1px;"></div>-->
					<!--</div>-->
				</div>
				<div class="linelist">
					<button id="clearBtn" class="btn btn-primary" form="">
						<i class="fas fa-file"></i> 초기화
					</button>
					<button data-bs-toggle="modal" class="btn btn-primary"
						id="modalBtn" data-bs-target="#exampleModal">
						<i class="fas fa-search"></i> 주문서
					</button>
					<button class="btn btn-primary" id="regiBtn">
						<i class="fas fa-file"></i> 새계획
					</button>
					<button class="btn btn-primary" id="osBtn">
						<i class="fas fa-save"></i> 저장
					</button>
				</div>
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-body">
				<div id="grid"></div>
			</div>
		</div>
		<br>
		<div class="card mb-4">
			<div class="card-body">
				<div class="d-flex flex-row justify-content-between">
					<div id="grid2" style="width: 1000px;">제품</div>
					<div id="grid3" style="width: 500px;">제품공정확인</div>
				</div>
			</div>
		</div>
		<br>
		<div class="card mb-4">
			<div class="card-body">
				<div class="d-flex flex-row justify-content-between">
					<div id="grid4" style="width: 1000px;">사용가능자재</div>
					<div id="grid5" style="width: 500px;">자재확인</div>
				</div>
			</div>
		</div>


		<div id="tui-date-picker-container" style="margin-top: -1px;"></div>
		<br>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">주문서 조회</h5>
					<br> <br>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<br>
				<div id="modGrid" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" id="confirmBtn" class="btn btn-primary"
						data-bs-dismiss="modal">확인</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
        let date = new Date();

	    let day = date.getDate();
	    let month = date.getMonth() + 1;
	    let year = date.getFullYear();

	    if (month < 10) month = "0" + month;
	    if (day < 10) day = "0" + day;

	    let today = year + "-" + month + "-" + day;   
	    let endday = year + "-" + (month + 3)+ "-" + day;
	    
// 	    ↓↓↓↓↓bom 으로 가져온 공정
	    let bom;
	    let planDt = $("#tui-date-picker-target").val();
	    
	    
// 		↓↓↓↓↓input date에 오늘 날짜 담기
		$(document).ready(function() {
		    $("#tui-date-picker-target").attr("value", today);

		});

        //초기화
    	$("#clearBtn").on("click", function(){
	   		grid.clear();
	   		grid2.clear();
	   		grid3.clear();
	   		grid4.clear();
	   		grid5.clear();
	   	}) 
		let code
		$(modalBtn).on("click",function(e){
// 			계획일자 받을 변수	
// 			생성된 계획 코드 변수
// 			console.log(Date.now()+8032500)
// 			console.log(Date.now())
			let planDt = $("#tui-date-picker-target").val();
			console.log(planDt);
		
// 			↓↓↓↓↓ 계획번호 생성
			getPlanCd(planDt);
					
// 					↓↓↓↓ 생산미계획 주문서정보 모달창으로 조회
					$.ajax({
						url : 'orderListModal',
						method : 'GET',
						dataType : 'JSON',
						success : function(res){
							if(res==null){
								
								alert("정보가 없습니다.");
							}
// 								↓↓↓↓모달창 리셋
								modGrid.resetData(res);
								setTimeout(()=> modGrid.refreshLayout() , 300);
						},error: function(err){
							console.log(err);
						}
					})
    			})
		
		
		//	↓↓↓↓↓↓모달 확인 버튼 클릭시 화면에 뿌려주는 동작
		$("#confirmBtn").on("click", function(e){
			let oderInfo = modGrid.getCheckedRows();
			for(let i = 0 ; i<oderInfo.length;i++){
			oderInfo[i].planCd = code;
			};
			let proCd = oderInfo[0].proCd;
			
			$.ajax({
				url : 'getStock',
				method : 'GET',
				data : {proCd : proCd},
				success: function(result){
					for(let i = 0;i<oderInfo.length;i++){
					  oderInfo[i].stockCnt = result.stockCnt;
				  }
					grid.resetData(oderInfo);
					grid2.resetData(oderInfo);
				}
			});

// 	        console.log(oderInfo);
			
		});
	



// 		↓↓↓↓↓모달 grid
 		const modGrid = new tui.Grid({
			el : document.getElementById('modGrid'),
 			rowHeaders : [ 'checkbox' ],
 			columns : [ {
 				header : '주문번호',
 				name : 'orderNo'
			}, {
 				header : '납기일자',
				name : 'parrdDt',
				formatter: function(data) {
		            return dateChange(data.value);
		          },
 			}, {
 				header : '제품명',
				name : 'proNm'
 			} 				
 			], 
               					
 		});
 		
 		let todayForgrid = new Date();
		let threeMonthsLater = new Date();
		threeMonthsLater.setMonth(todayForgrid.getMonth() + 3);
 		
//  	↓↓↓↓↓계획서 개요 grid
 		const gridData = [];
		const grid = new tui.Grid({
			el : document.getElementById('grid'),
			data : gridData,
			scrollX : false,
			scrollY : false,
			columns : [{
				header 	: '계획코드',
				name	: 'planCd',
				align	: 'center'
			},
			{
				header 	: '주문번호',
				name	: 'orderNo',
				align	: 'center'
			},
			{
				header 	: '납기 일자',
				name	: 'parrdDt',
				align	: 'center',
				formatter: function(data) {
		            return dateChange(data.value);
		          },
			},
			{
				header 	: '시작 일자',
				name	: 'ex_start_dt',
				 editor: {
				      type: 'datePicker',
				      options: {
				        format: 'yyyy/MM/dd',
				        selectableRanges: [[todayForgrid,threeMonthsLater ]]
				      }
				    }
			},
			{
				header 	: '종료 일자',
				name	: 'ex_end_dt',
				 editor: {
				      type: 'datePicker',
				      options: {
				        format: 'yyyy/MM/dd',
				        selectableRanges: [[todayForgrid,threeMonthsLater ]]
				      }
				    }
			},
			],
		});
		
		const gridData2 = [];
		const grid2 = new tui.Grid({
			el : document.getElementById('grid2'),
			data : gridData2,
			scrollX : false,
			scrollY : false,
			columns : [{
				header 	: '제품명',
				name	: 'proNm',
				align	: 'center'
			},
		
			{
				header 	: '생산 수량',
				name	: 'orderCnt', 
				align	: 'right'
			},
			{
				header 	: '재고량',
				name	: 'stockCnt',
				align	: 'right'
			},
			{
				header 	: '제품 코드',
				name	: 'proCd', 
				hidden : 'true'
			},
			],
			onGridUpdated(ev){
				
				let proCd = grid2.getData()[0].proCd
				
				getPrcs(proCd);
			}
		});

		
		const gridData3 = [];
		const grid3 = new tui.Grid({
			el : document.getElementById('grid3'),
			data : gridData3,
			scrollX : false,
			scrollY : false,
			columns : [{
				header 	: '공정이름',
				name	: 'prcsNm',
				align	: 'center'
			},
			{
				header 	: '자재이름',
				name	: 'rscNm',
				align	: 'center'
			},
			{
				header 	: 'bom코드',
				name	: 'bomCd',
				align	: 'center',
			},
			{
				header 	: '불량률',
				name	: 'inferPct',
				align	: 'right'
			},
			
			],
			onGridUpdated(ev){
				console.log(grid3.getData()[0].bomCd);
				let data=grid3.getData()[0].bomCd;
				getRscInfo(data);
		
			}
		});
		
		const gridData4 = [];
		const grid4 = new tui.Grid({
			el : document.getElementById('grid4'),
			data : gridData4,
			columns : [{
				header 	: '자재명',
				name	: 'rscNm',
				align	: 'center'
			},
			{
				header 	: '재고량',
				name	: 'lotCnt',
				align	: 'center',
			},
			{
				header 	: '예상사용량',
				name	: 'exCnt',
				align	: 'center'
			},
			
			],
		});
		
		const gridData5 = [];
		const grid5 = new tui.Grid({
			el : document.getElementById('grid5'),
			data : gridData5,
			columns : [{
				header 	: '자재명',
				name	: 'rscNm',
				align	: 'center'
			},
			{
				header 	: '자재 LOT',
				name	: 'rscLotCd',
				align	: 'center'
			},
			{
				header 	: '사용가능 수량',
				name	: 'lotCnt',
				align	: 'center',
			},
			{
				header 	: '예상사용량',
				name	: 'orderNo',
				align	: 'center'
			},
			
			],
		});
		
		grid4.on('dblclick',(ev)=>{
			console.log(ev);
			if(ev.rowKey == null){
				Swal.fire({
				      icon: 'error',
				      title: '값이 없습니다.',
				      text: '값을 조회 후 사용가능합니다.',
				    });
			};
			console.log(ev.rowKey);
		 	let data = grid4.getData()[ev.rowKey].rscCd;
		 	$.ajax({
		 		url : 'getRscLot',
		 		method : 'GET',
		 		data : {rscCd : data},
		 		success : function(result){
		 			console.log(result);
		 			grid5.resetData(result);
		 		},error : function(err){
		 			console.log(err);
		 		}
		 		
		 	})
		 	
		});
		
		
		
// 		↓↓↓↓↓↓↓날짜 포맷 적용함수
		function dateChange(date) {
		      let date1 = new Date(date);
		      let date2 =
		        date1.getFullYear() +
		        "-" +
		        (date1.getMonth() < 10
		          ? "0" + (date1.getMonth() + 1)
		          : date1.getMonth() + 1) +
		        "-" +
		        (date1.getDate() < 10 ? "0" + date1.getDate() : date1.getDate());
		      return date2;
		    };
		
// 		    ↓↓↓↓↓↓↓제품 공정 받아오는 Ajax
		function getPrcs(data){
			$.ajax({
				url : 'getBom',
				method : 'GET',
				data : {proCd : data},
				success : function(result){
					
					bom=result;
					
					$.ajax({
						url : 'getInfer',
						method : 'GET',
						data : {proCd : data},
						success : function(res){
							
							for(let i=0;i<bom.length;i++){
								bom[i].inferPct = res[i].inferPct;
							}
							console.log(bom);
							grid3.resetData(bom);
						}
					})
				},error: function(err){
					console.log(err);
				}
			})
};
		    function getPlanCd(data){
//	 			↓↓↓↓↓ 계획번호 생성
				$.ajax({
					url : 'getPlanCd',
					method : 'GET',
					data : {planDt: data},
					success: function (result){
						code = result.planCd;
					},
					error: function(err){
						console.log(err);
					}
				})
		    };
		    
		    function getRscInfo(data){
		    	$.ajax({
					url : 'getRsc',
					method : 'GET',
					data : {bomCd: data},
					success: function (result){
						let proCnt=0;
						for(let i=0;i<grid2.getData().length;i++){
							proCnt += grid2.getData()[i].orderCnt;
						};
						let bom = grid3.getData();
						console.log(result, bom, proCnt);
						for(let i = 0; i<result.length;i++){
							console.log(bom[i]);
							result[i].exCnt = (bom[i].useCnt)*proCnt;
						};
						grid4.resetData(result);
					},
					error: function(err){
						console.log(err);
					}
				})
		    };


        </script>
</body>
