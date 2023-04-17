<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
#container {
	width: 98%;
	margin: 0 auto;
}

.col {
	width: 700px
}

.linelist {
	float: right;
	margin: 0 20px 20px 0;
}
</style>
</head>
<body>
	<!-- 본문내용 -->
	<!-- 헤더부분 -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">생산지시</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="home.do"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 생산관리</li>
			<li class="breadcrumb-item active">> 생산지시</li>
		</ol>
	</div>
	<!-- 헤더부분 -->
	<div id="container">
		<div class="card mb-4">
			<div class="card-body">
				<div class="linelist">
					<button id="clearBtn" class="btn btn-primary" form="">
						<i class="fas fa-file"></i> 초기화
					</button>
					<button data-bs-toggle="modal" class="btn btn-primary"
						id="modalBtn" data-bs-target="#exampleModal">
						<i class="fas fa-search"></i> 계획조회
					</button>
					<button class="btn btn-primary" id="regiBtn">
						<i class="fas fa-save"></i> 저장
					</button>
				</div>

				<div id="grid"></div>
			</div>
		</div>
		<br>
		<div class="card mb-4">
			<div class="card-body">
				<div class="d-flex flex-row justify-content-between">
					<div id="grid2" style="width: 1000px;">공정자재</div>
					<div id="grid3" style="width: 500px;">자재지시</div>
				</div>
			</div>
		</div>
		<div id="#tui-date-picker-container1"></div>
		<div id="dialog" title="생산계획조회"></div>
		<br>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">생산계획조회</h5>
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
	</body>
	<script>
	 $('#grid').mouseleave(ev => {
			grid.finishEditing();
		})
	   
	   //미진행 생산계획 띄우기
	   	$("#modalBtn").on("click", function() {
	   		modGrid.on('dblclick', ev => {
					modGrid.check(ev.rowKey);
					//$("#exampleModal").modal('hide')	
				})  
	   		$.ajax({
	   			url : 'planListModal',
	   			method : 'GET',
	   			dataType: "JSON",
	   			success: function (result) {
	   				modGrid.resetData(result);
	   			}
	   		})
	   	})
	   	
	   	//grid에 모달 내용 띄우기
	   	 $("#confirmBtn").on("click", function(){
	        	let result = modGrid.getCheckedRows();
	        	console.log(result)
	        	grid.resetData(result);
	     })
	     
	     
	   	//grid2에 내용 띄우기 grid에서 엔터(keyCode=13) 누르면 넘어감
	   	$("#grid").on("keyup", function(key) {
	   		let edctsCd = grid.getData()[0].edctsCd;
	   		
	   		if(key.keyCode == 13) {
	   			$.ajax({
	   				url : 'getRsc',
	   				method : 'GET',
	   				data : {"edctsCd" : edctsCd},
	   				success: function (result) {
	   					$.each(result, function(index, item) {
							item.useCnt = item.useCnt * grid.getData()[0].indicaCnt
						})
						
						console.log(result)
	   					grid2.resetData(result); 
	   					grid3.resetData(result);
	   				}
	   			})
	   		}
	   }) 
	   	
	   	//그리드에 띄운 데이터들을 저장 버튼을 눌렀을 때 테이블 두 개에 저장하기+ 지시가 내려졌으므로 계획 테이블 상태 업데이트
	   	$("#regiBtn").on("click", function() {
	   		let gridData = grid.getData()
	   		console.log(gridData)
	   		
	   		let linePsch = grid.getData()[0].linePsch
			console.log(linePsch)
			let indicaDt = grid.getData()[0].indicaDt
			console.log(indicaDt)
	   			
			gridData[0].linePsch = linePsch 
			gridData[0].indicaDt = indicaDt
	   		console.log(JSON.stringify(gridData))
	   		
	   		let planCd = grid.getData()[0].planCd;
	   		
	   		$.ajax({
	   			url : 'indInsert',
	   			method : 'post',
	   			contentType : 'application/json',
	   			data : JSON.stringify(gridData),
	   			error : function(error){
	   				console.log("error!")
	   			},
	   			success : function() {
	   				toastr.success("저장되었습니다.")  
	        		grid.clear()
			   		grid2.clear()
			   		grid3.clear()
			   		grid4.clear()
			   		grid5.clear()
	   			}
	   		})
	   		$.ajax({
	   			url : 'updatePlan',
	   			data : {"planCd" : planCd}
	   		})
	   		
	   	})
	   	
	   	$("#clearBtn").on("click", function(){
	   		grid.clear()
	   		grid2.clear()
	   		grid3.clear()
	   	})  	
	   	
	   	 const modGrid = new tui.Grid({
	                el: document.getElementById('modGrid'),
	                scrollX: false,
	                scrollY: false,
	                rowHeaders: ['checkbox'],
	                columns: [{
	                    header: '생산계획코드',
	                    name: 'planCd',
	                    align: 'center',
	                }, {
	                    header: '제품명',
	                    name: 'prdtNm',
	                    align: 'center'
	                }, {
	                    header: '주문수량',
	                    name: 'orderCnt',
	                    align: 'center',
	                }]
	            })
	   	
	   
	   const gridData = [];
	  
	   const grid = new tui.Grid({
		      el: document.getElementById('grid'),
		      data: gridData,
		      scrollX: false,
		      scrollY: false,
		      columns: [
		        {
		          header: '제품코드',
		          name: 'edctsCd',
		          align : 'center'
		        },
		        {
		          header: '제품명',
		          name: 'prdtNm',
		          align : 'left'
		        },
		        {
		          header: '계획번호',
		          name: 'planCd',
		          align : 'center'
		        },
		        {
			      header: '납기일자',
			      name: 'paprdDt',
			      align : 'center'
			    },
		        {
		          header: '라인코드',
		          name: 'lineCd',
		          align : 'center'
		        },
		        {
		          header: '라인책임자',
		          name: 'linePsch',
		          align : 'left',
		          editor: {
	                  type: 'select',
	                  options: {
	                      listItems: [{
	                              text: '강길동',
	                              value: '강길동'
	                          },
	                          {
	                              text: '유길동',
	                              value: '유길동'
	                          },
	                          {
	                              text: '장길동',
	                              value: '장길동'
	                          }
	                      ]
	                  }
	              }
		        },
		        {
		          header: '필요수량',
		          name: 'orderCnt',
		          align : 'right'
		        },
		        {
		          header: '지시수량',
		          name: 'indicaCnt',
		          align : 'right'
		        },
		        {
		          header: '작업지시일',
		          name: 'indicaDt',
		          align : 'center',
		          editor : 'datePicker'
		        }
		      ]
		    });
		    
	    
	   
	   
	   const gridData2 = [];
	      
	   const grid2 = new tui.Grid({
		      el: document.getElementById('grid2'),
		      data: gridData2,
		      bodyHeight : 169,
		      scrollX: false,
		      scrollY: true,
		      columns: [
		        {
		          header: '공정코드',
		          name: 'prcsCd',
		          align : 'center'
		        },
		        {
		          header: '자재명',
		          name: 'rscNm',
		          align : 'left'
		        },
		        {
		          header: 'LOT번호',
		          name: 'rscLotCd',
		          align : 'center'
		        },
		        {
		          header: '재고수량',
		          name: 'lotRmnCnt',
		          align : 'right'
		        },
		        {
		          header: '출고수량',
		          name: 'holdCnt',
		          align : 'right'
		        },
		        {
		          header: '사용량',
		          name: 'useCnt',
		          align : 'right'
		        }
		      ]
		    });
		    
	   	    
	   
	   const gridData3 = [];
	  
	   const grid3 = new tui.Grid({
		      el: document.getElementById('grid3'),
		      //data: gridData2,
		      bodyHeight : 169,
		      scrollX: false,
		      scrollY: true,
		      columns: [
		        {
		          header: '자재명',
		          name: 'rscNm',
		          align : 'center'
		        },
		        {
		          header: 'LOT번호',
		          name: 'rscLotCd',
		          align : 'center'
		        },
		        {
		          header: '출고수량',
		          name: 'holdCnt',
		          align : 'right'
		        }
		      ]
		    });
		    
		modalBtn.addEventListener('click', function () {
	                setTimeout(function () {
	                    modGrid.refreshLayout()
	                }, 300);
	            }); 
	            
	        let hoverOption = {
		     row: {
		         hover: {
		             background: 'rgba(19,78,94,0.2)'
		         }
	     	}
			 }
			 tui.Grid.applyTheme('default', hoverOption);   
		


	</script>