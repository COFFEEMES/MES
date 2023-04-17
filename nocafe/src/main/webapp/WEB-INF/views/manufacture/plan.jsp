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
	display : inline-block;
	float: right;
	margin: 0 20px 20px 0;
}
#lineb{
	display : inline-block;
}

#pDate #planDate {
	float: left;
}

.tui-datepicker {
	z-index: 99;
}
label {
	width : 150px;
	
}
.tui-grid-cell.not-allow-row {background-color : red}
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
				<div id="lineb">
				<div id="pDate">
					<label>작성일자</label> <input type="date"
						id="tui-date-picker-target" name="tui-date-picker-target"
						class="form-control" style="width: 150px">
				</div>
				<br>
				<div id="planDate">
					<label>생산계획일자</label> 
					<input type="date"	id="ex-start" name="tui-date-picker-target"	class="form-control tragetDate" style="width: 150px">
					- <input type="date" id="ex-end" name="tui-date-picker-target"	class="form-control tragetDate" style="width: 150px">
				</div>
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
				<div style="margin-left : 30px;">미계획 주문서</div>
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
// //		계획일자 받을 변수	
// //		생성된 계획 코드 변수
// //		console.log(Date.now()+8032500)
// //		console.log(Date.now())
// 	let planDt = $("#tui-date-picker-target").val();
// 	console.log(planDt);

// //		↓↓↓↓↓ 계획번호 생성
// 	getPlanCd(planDt);		

// 	    ↓↓↓↓↓bom 으로 가져온 공정
	    let bom;
	    let planDt = $("#tui-date-picker-target").val();
//		↓↓↓↓↓오늘 날짜
 		let todayForgrid = new Date();
        console.log(todayForgrid);
		let threeMonthsLater = new Date();
		threeMonthsLater.setMonth(todayForgrid.getMonth() + 3);
	
	    let today = dateChange(todayForgrid);
	    let after = dateChange(threeMonthsLater);
// 		↓↓↓↓↓input date에 오늘 날짜 담기
		$(document).ready(function() {
		    $("#tui-date-picker-target").attr("value", today);
			$("#ex-start").attr({"max":after,
								  "min":today})
			$("#ex-end").attr({"max":after,
								  "min":today})
			
			
		});
		
		class proInfo{
			constructor(name, cnt){
				this.proNm = name;
				this.proCnt = cnt;
			};
		};
		class planInfo{
			constructor(planCd,proNm, planCnt,exStart,exEnd,planDt){
				this.planCd = planCd;
				this.proNm = proNm;
				this.planCnt = planCnt;
				this.exStart = exStart;
				this.exEnd = exEnd;
				this.planDt = planDt;
			};
		};
		class orderInfo{
			constructor(orderNo,planCd){
				this.orderNo = orderNo;
				this.planCd = planCd;
			}
		};
		
	    let proNmListAry = new Array; //계획 정보 담아 줄 배열
		let orderListAry = new Array; //주문정보 담아 줄 배열
		let containorAry = new Array; //grid3에 뿌려줄 제품이름, 주문수량 포함 객체 넣어줄 배열

        //초기화
    	$("#clearBtn").on("click", function(){
	   		grid.clear();
	   		grid2.clear();
	   		grid3.clear();
	   		grid4.clear();
	   		grid5.clear();
	   	}) 
		let code

		const gridData = [];
// 		↓↓↓↓↓수정가능한 컬럼 모듈
		const options = {
				el : document.getElementById('grid'),
				data : gridData,
				scrollX : false,
				scrollY : false,
				columns : [{
					header 	: '업체명',
					name	: 'vendNm',
					align	: 'center'
				},
				{
					header 	: '주문번호',
					name	: 'orderNo',
					align	: 'center',
					editor	: {
						type : 'text'
					}
				},
				{
					header 	: '납기 일자',
					name	: 'parrdDt',
					align	: 'center',
					formatter: function(data) {
			            return dateChange(data.value);
			          },
				},
// 				{
// 					header 	: '시작 일자',
// 					name	: 'ex_start_dt',
// 					 editor: {
// 					      type: 'datePicker',
// 					      options: {
// 					        format: 'yyyy/MM/dd',
// 					        selectableRanges: [[todayForgrid,threeMonthsLater ]]
// 					      }
// 					    }
// 				},
// 				{
// 					header 	: '종료 일자',
// 					name	: 'ex_end_dt',
// 					 editor: {
// 					      type: 'datePicker',
// 					      options: {
// 					        format: 'yyyy/MM/dd',
// 					        selectableRanges: [[todayForgrid,threeMonthsLater ]]
// 					      }
// 					    }
// 				},
				],
			};
		
		
// 		↓↓↓↓ 주문서 버튼 클릭
		$(modalBtn).on("click",function(e){
					
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
// 								console.log(res[0].orderNo);
								for(let i = 0;i < res.length;i++){
									orderListAry[i] = res[i].orderNo;
								};
// 								console.log(orderListAry);
								
								
						},error: function(err){
							console.log(err);
						}
					})
    			})
		
		
		//	↓↓↓↓↓↓모달 확인 버튼 클릭시 화면에 뿌려주는 동작
		$("#confirmBtn").on("click", function(e){
			let oderInfo = modGrid.getCheckedRows();
			grid.resetData(oderInfo);
			
			$.ajax({
				url : 'getOrderPro',
				method : 'POST',
				dataType: 'json',
		        contentType: 'application/json; charset=utf-8',
				data : JSON.stringify(orderListAry),
				success : function(res){
// 					console.log(res);
					for(let i = 0; i<res.length; i++){
						res[i].proCnt = res[i].orderCnt 
					}
					grid2.resetData(res);
					
				},error: function(err){
					console.log(err);
				}
			})

		});
		



// 		↓↓↓↓↓모달 grid
 		const modGrid = new tui.Grid({
			el : document.getElementById('modGrid'),
 			rowHeaders : [ 'checkbox' ],
 			scrollX : false,
			scrollY : true,
			bodyHeight :400,
 			columns : [ {
 				header : '주문번호',
 				name : 'orderNo'
			}, 
			{
 				header : '주문일자',
				name : 'orderDt',
				formatter: function(data) {
		            return dateChange(data.value);
		          },
 			},
			{
 				header : '납기일자',
				name : 'parrdDt',
				formatter: function(data) {
		            return dateChange(data.value);
		          },
 			}  	
 			], 
               					
 		});

 		

 		
//  	↓↓↓↓↓계획서 개요 grid
 		
 		const gridFormat={
			el : document.getElementById('grid'),
			data : gridData,
			scrollX : false,
			scrollY : false,
			columns : [
			{
				header 	: '업체명',
				name	: 'vendNm',
				align	: 'center'
			},
			{
				header 	: '주문 일자',
				name	: 'orderDt',
				align	: 'center',
				formatter: function(data) {
		            return dateChange(data.value);
		          },
			},
			{
				header 	: '납기 일자',
				name	: 'parrdDt',
				align	: 'center',
				formatter: function(data) {
		            return dateChange(data.value);
		          },
			},
// 			{
// 				header 	: '시작 일자',
// 				name	: 'ex_start_dt',
// 				 editor: {
// 				      type: 'datePicker',
// 				      options: {
// 				        format: 'yyyy/MM/dd',
// 				        selectableRanges: [[todayForgrid,threeMonthsLater ]]
// 				      }
// 				    }
// 			},
// 			{
// 				header 	: '종료 일자',
// 				name	: 'ex_end_dt',
// 				 editor: {
// 				      type: 'datePicker',
// 				      options: {
// 				        format: 'yyyy/MM/dd',
// 				        selectableRanges: [[todayForgrid,threeMonthsLater ]]
// 				      }
// 				    }
// 			},
			],
		};
		let grid = new tui.Grid(gridFormat);
		
		
		
		
		
		const gridData2 = [];
		const grid2 = new tui.Grid({
			el : document.getElementById('grid2'),
			data : gridData2,
			scrollX : false,
			scrollY : true,
			bodyHeight : 243,
			columns : [{
				header 	: '제품명',
				name	: 'proNm',
				align	: 'center'
			},{
				header 	: '주문 수량',
				name	: 'orderCnt', 
				align	: 'right',
			},
		
			{
				header 	: '생산 수량',
				name	: 'proCnt', 
				align	: 'right',
				editor 	: 
					{
						type: 'text'
					},
// 				formatter:function(data){
// 					 let orderCnt = data.row.orderCnt;
// 		             let proCnt = data.row.proCnt;
// 		             let color ="";
// 		             if(proCnt < orderCnt) {
// 		            	 color = '<span style="color:red";>'+proCnt+'</span>';
// 		            	 setTimeout(()=>  Swal.fire({
// 						      icon: 'error',
// 						      title: '수량 경고!',
// 						      text: '주문수량보다 생산수량이 적을 수는 없습니다.',
// 						    }) , 10)
		            	
// 		             }		             
// 		             else if (proCnt==null) color = "";
// 		             else color = '<span style="black";>'+proCnt+'</span>';
// 		             return color;
// 				}
			},
			{
				header 	: '재고량',
				name	: 'stockCnt',
				align	: 'right'
			}
			],
			onGridUpdated(ev){
				
// 				기본값
				let gridData = grid2.getData()
				
				getPrcs(gridData[1].proNm);
				
				mkgrid3()

				
			}
		});

		
		const gridData3 = [];
		const grid3 = new tui.Grid({
			el : document.getElementById('grid3'),
			data : gridData3,
			scrollX : false,
			scrollY : true,
			bodyHeight : 243,
			rowHeaders : ['rowNum'],
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
				header 	: '불량률',
				name	: 'inferPct',
				align	: 'right'
			},
			
			],
// 			onGridUpdated(ev){
// 				console.log(grid2.getData());
				
// 				let grid2Data = grid2.getData();
				
// 				for(let i=0;i<grid2Data.length;i++){
// 					proNmAry[i] = grid2Data[i].proNm
// 				}
// 				console.log(proNmAry);
// 				getRscInfo(proNmAry);
// 			}
			 
		});
		
		const gridData4 = [];
		const grid4 = new tui.Grid({
			el : document.getElementById('grid4'),
			data : gridData4,
			scrollX : false,
			scrollY : true,
			bodyHeight : 243,
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
			onGridUpdated(ev){
				let gridData = grid4.getData()
				let cnt = 0;
				
				gridData.forEach(row=>{
					let lotCnt = Number(row.lotCnt)
					let exCnt = Number(row.exCnt)
					
					if(lotCnt < exCnt){
						grid4.addRowClassName(row.rowKey,'not-allow-row');
							if(cnt == 0){
								lessLot = row.rscNm
							}else{
								lessLot += ","
								lessLot +=row.rscNm
								console.log(lessLot)
							}
						cnt++
						console.log(cnt)
// 						console.log(lessLot)
					}else{
						grid4.removeRowClassName(row.rowKey,'not-allow-row')
					}
						
				});
// 				grid5가 존재하면 불량률도 수정되야 한다
				if(grid5.getData().length>0){
					mkCal()
				};
				
			}
		});
		
		const gridData5 = [];
		const grid5 = new tui.Grid({
			el : document.getElementById('grid5'),
			data : gridData5,
			scrollX : false,
			scrollY : true,
			bodyHeight : 243,
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
				name	: 'exCnt',
				align	: 'center'
			},
			
			],
		});

		grid2.on('dblclick',(ev)=>{
			console.log(ev);
			if(ev.rowKey == null){
				Swal.fire({
				      icon: 'error',
				      title: '값이 없습니다.',
				      text: '값을 조회 후 사용가능합니다.',
				    });
			};
			console.log(ev.rowKey);
			if(ev.rowKey=== undefined){
				return
			}
			let proNm = grid2.getData()[ev.rowKey].proNm;
			getPrcs(proNm);
				
		})
		
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
		 	let rscNm = grid4.getData()[ev.rowKey].rscNm;
		 	console.log(rscNm)
		 
		 	$.ajax({
		 		url : 'getRscLot',
		 		method : 'POST',
		 		data : {rscNm : rscNm},
		 		success : function(result){
			 			console.log(result)
		 			
		 		let gridData = grid2.getData();
		 			
		 			$.ajax({
		 			url : 'getProNm',
			 		method : 'POST',
			 		data : {rscNm : rscNm},
			 		success : function(res){
						let exCnt = 0;
						

					
		 			grid5.resetData(result);
		 			mkCal()
			 		}
		 			})
		 			
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
				data : {proNm : data},
				success : function(result){
					console.log(result);
					bom=result;
					
					$.ajax({
						url : 'getInfer',
						method : 'GET',
						data : {proNm : data},
						success : function(res){
							console.log(res);
							
							
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
						console.log(code)
					},
					error: function(err){
						console.log(err);
					}
				})
		    };
		    
// 		    필요자재와 사용가능 자재 불러오기
		    function getRscInfo(data){
					console.log(data);
		    	$.ajax({
					url : 'getRscStock',
					method : 'POST',
					dataType: 'json',
			        contentType: 'application/json; charset=utf-8',
					data : JSON.stringify(data),
					success: function (result){

						console.log(result);
						
						grid4.resetData(result);
					},
					error: function(err){
						console.log(err);
					}
				})
		    };
// 		    grid3그리기
		    function mkgrid3(){
		    	let gridData = grid2.getData();
// 				필요자재 출력
				let con ;
				for(let i = 0;i<gridData.length;i++){					
					con = new proInfo(gridData[i].proNm,gridData[i].proCnt);
					containorAry[i] = con					
 				};
 				getRscInfo(containorAry);
		    };
		    
// 		    grid5 예상사용량 그리기
			function mkCal(){						
				let exCnt = 0;
				let gridData = grid4.getData();
				let grData = grid5.getData();
				for(let i=0;i<gridData.length;i++){
				for(let j=0;j<grData.length;j++){
					if(gridData[i].rscNm == grData[j].rscNm){
						exCnt = parseInt(gridData[i].exCnt)
						console.log(exCnt)
					}
					}
				};
				let rowCnt = 0
				console.log(grData)
				while(rowCnt < grData.length){
					if(rowCnt != 0){
					exCnt -= grData[rowCnt].lotCnt
					}
					if(exCnt<0){exCnt = 0};
					grData[rowCnt].exCnt = exCnt;
					rowCnt++
					console.log(grData)
				}
					grid5.resetData(grData)				
			}
			
			
			
// 			grid2의 내용을 수정했을때 예외처리
			let modData = 0;
			grid2.on("editingStart",(e)=>{
				console.log(e)
				modData = grid2.getRow(e.rowKey).proCnt
				console.log(modData)
			})
			$("#grid2").on("keyup",function(key){
				let gridData = grid2.getData()
				let lessLot = null;
				if(key.keyCode == 13){
					gridData.forEach(row=>{
						console.log(row)
						let orderCnt = Number(row.orderCnt)
						let proCnt = Number(row.proCnt)
						if(isNaN(proCnt)){
							 setTimeout(()=>  {Swal.fire({
	 						      icon: 'error',
	 						      title: '입력경고!',
	 						      text: 
	 						    	  '숫자만 입력 가능합니다!',
	 						    })	
	 						    console.log(row.rowKey)
	 						 	grid2.setValue(row.rowKey,'proCnt',modData)   
							 }					    
							 )
	 						    
						}
						
						if(orderCnt > proCnt){
							lessLot = row.proNm
							grid2.addRowClassName(row.rowKey,'not-allow-row');
							 setTimeout(()=>  Swal.fire({
	 						      icon: 'error',
	 						      title: '수량 경고!',
	 						      text: 
	 						    	lessLot + '주문수량보다 생산수량이 적을 수는 없습니다. 생산수량을 수정해주세요',
	 						    }) , 10)
	 						    grid2.setValue(row.rowKey,'proCnt',modData)   
						}else{
							grid2.removeRowClassName(row.rowKey,'not-allow-row')
						}
						mkgrid3()
					})
				}
				
			})
			
			
			$("#osBtn").on("click",function(){
				let startDt = $("#ex-start").val()
				let endDt = $("#ex-end").val()
				planDt =  $("#tui-date-picker-target").val();
				let orderNm = new Array();
				if(startDt == '' || endDt == ''){
					Swal.fire({
					      icon: 'error',
					      title: '데이터 없음!',
					      text: 
					    	'생산계획일자를 지정해 주세요!',
					    })
					    return
				};
				
				
				let data = grid2.getData();
				console.log(data)
				let resCnt = 0;
				 $.ajax({
					url : 'getPlanCd',
					method : 'GET',
					data : {planDt: planDt},
					success: function (result){
						code = result.planCd;
						 for(let i= 0; i<data.length;i++){
								proNmListAry[i] = new planInfo(code, data[i].proNm,data[i].proCnt,startDt,endDt,planDt);
							};
							
							for(let i=0;i<orderListAry.length;i++){
								console.log(orderListAry[i])
								orderNm[i]= new orderInfo(orderListAry[i],code);
							};
						 	console.log(proNmListAry)
							
					 				$.ajax({
				 					url : 'mkPlan',
				 					method : 'POST',
				 					dataType: 'json',
				 			        contentType: 'application/json; charset=utf-8',
				 					data : JSON.stringify(proNmListAry),
				 					success: function (res){
										resCnt += res
				 						console.log(res);
										
				 						$.ajax({
				 							url : 'updateOrder',
				 							method : 'post',
				 							dataType: 'json',
						 			        contentType: 'application/json; charset=utf-8',
						 					data : JSON.stringify(orderInfo),
						 					success: function (res2){
						 						resCnt += res2						 						
						 					}
				 						})
				 						
				 						
				 					},
				 					error: function(err){
				 						console.log(err);
				 					}
				 				})
							
							
							
							
					},
					error: function(err){
						console.log(err);
					}
				})
				
				
				
				
				

				
				
				
			})
				
// 			-------------------------------------------------------------
// 		제품별로 예상 사용량 계산하기
// 		function mkCal(){						
// 				let exCnt = 0;
// 				let gridData = grid2.getData();
// 				let grData = grid5.getData();
// 				for(let i=0;i<gridData.length;i++){
// 				for(let j=0;j<proNmList.length;j++){
// 					if(gridData[i].proNm == proNmList[j].proNm){
// 						exCnt += parseInt(gridData[i].proCnt)
// 					}
// 					}
// 				};
// 				let rowCnt = 0
// 				console.log(grData)
// 				while(rowCnt < grData.length){
// 					if(rowCnt != 0){
// 					exCnt -= grData[rowCnt].lotCnt
// 					}
// 					if(exCnt<0){exCnt = 0};
// 					grData[rowCnt].exCnt = exCnt;
// 					rowCnt++
// 					console.log(grData)
// 				}
// 					grid5.resetData(grData)				
// 			}
			
        </script>
</body>
