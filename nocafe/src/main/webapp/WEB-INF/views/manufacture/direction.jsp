<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<link
  rel="stylesheet"
  href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css"
/>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<style>
  #container {
    width: 98%;
    margin: 0 auto;
  }

  #lineb {
    display: inline-block;
  }
  .col {
    width: 700px;
  }

  .linelist {
    float: right;
    margin: 0 20px 20px 0;
  }
  label {
    width: 100px;
  }
  .tui-grid-cell.select-allow-row {
    background-color: rgb(239, 246, 230);
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
				<div id="lineb">
				<div id="pDate">
					
					<label>생산기간</label> <input type="date"
						id="ex-start" name="tui-date-picker-target"
						class="form-control" style="width: 150px">
					-
					<input type="date"	id="ex-end" name="tui-date-picker-target"	class="form-control tragetDate" style="width: 150px">
					
				</div>
				
				</div>
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
<!-- 				<div class="d-flex flex-row justify-content-between"> -->
					<div>
<!-- 					<div id="grid2" style="width: 1500px;">공정자재</div> -->
					<div id="grid2">공정자재</div>
<!-- 					<div id="grid3" style="width: 500px;">자재지시</div> -->
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
			<div class="modal-content" style="width: 800px">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">생산계획조회</h5>
					<br> <br>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<br>
				<div id="modGrid" class="modal-body" style="width: 800px;"></div>
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
	class planObj{
		constructor(planCd,proNm,planCnt){
			this.planCd = planCd;
			this.proNm 	= proNm;
			this.planCnt = planCnt;
		}
			
	}
	
	
	let planList = new Array(new planObj);
	let planCntList ;
	let proNmList ;
	let cd ;
	let cnt = 0;
	let cntt = 0;
	let secGridData;
	let totalData;
	let nom;
	//		↓↓↓↓↓오늘 날짜
	let todayForgrid = new Date();
//         console.log(todayForgrid);
		let threeDateLater = new Date();
		threeDateLater.setDate(todayForgrid.getDate() + 3);
	
	    let today = dateChange(todayForgrid);
	    let after = dateChange(threeDateLater);


	    $("#ex-start").attr({ max: after, min: today });
	    $("#ex-end").attr({ max: after, min: today });

	 $('#grid').mouseleave(ev => {
			grid.finishEditing();
		})
	   
	   //미진행 생산계획 띄우기
	   	$("#modalBtn").on("click", function() {
	   		modGrid.clear()
	   		modGrid.on('dblclick', ev => {
	   				if(modGrid.getCheckedRows().length == 1){
						modGrid.uncheckAll()
	   				}
					modGrid.check(ev.rowKey);
				})  
	   		$.ajax({
	   			url : 'getPlanList',
	   			method : 'GET',
	   			dataType : 'JSON',
	   			success: function (result) {
// 	   				modGrid.resetData(result);
	   				console.log(result)
	   				let i = 0
	   				let j = 0
	   				for( ;i<result.length;i++){
// 	   					console.log(i)
// 	   					console.log(j)
						
	   					cd =  result[i].planCd;
	   					for(;j<result.length;j++){
	   						if(result[i].planCd == result[j].planCd){
	   							if(cnt==0){
	   								proNmList 	= result[j].proNm;
	   								planCntList	= result[j].planCnt;
	   								cnt++
// 	   								console.log(proNmList,planCntList,i,j)
	   							}else{
	   								proNmList 	+= ","+ result[j].proNm;
	   								planCntList	+= ","+ result[j].planCnt;
	   								cnt++
// 	   								console.log(proNmList,planCntList,i,j)
	   							}
	   						}else{
	   							i=j-1
// 	   							j--
	   						
	   						
	   							planList[cntt]=(new planObj(cd,proNmList,planCntList));
	   							cd ='';
	   							proNmList =''
	   							planCntList= ''
	   							cntt++
	   							cnt=0
	   							break ;
	   						}
	   					}
	   				}
	   							planList[cntt]=(new planObj(cd,proNmList,planCntList));
	   				cntt = 0;
	   				cnt=0;
	   				modGrid.resetData(planList);
	  				planList = new Array;
	  				proNmList =''
					planCntList= ''
	   			},error : function (err){
	   				console.log(err)
	   			}
	   		})
	   	});
	   	
	 	//grid에 모달 내용 띄우기
   	 $("#confirmBtn").on("click", function(){
        	let data = modGrid.getCheckedRows()[0].planCd
        	console.log(data)
        	
        	
        	$.ajax({
				url : 'getDataForGrid',
				method : 'POST',
				dataType: 'json',
		        contentType: 'application/json; charset=utf-8',
				data : data,
				success : function(res){
				 grid.resetData(res)
				},error: function(err){
					console.log(err);
				}
			})
        
     })
     
   	
   	 const modGrid = new tui.Grid({
                el: document.getElementById('modGrid'),
                scrollX: false,
                scrollY: true,
                bodyHeight :280,
                columnOptions: {
                    minWidth: 180
                  },
                columns: [{
                    header: '생산계획코드',
                    name: 'planCd',
                    align: 'center',
                }, {
                    header: '제품명',
                    name: 'proNm',
                    align: 'center'
                }, {
                    header: '주문수량',
                    name: 'planCnt',
                    align: 'center',
                }]
            })
   	
   	$("#clearBtn").on("click", function(){
   		grid.clear()
   		grid2.clear()
   		modGrid.clear()
   	})  	
   	
   
   const gridData = [];
  
   const grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: gridData,
	      scrollX: false,
	      scrollY: false,
	      columns: [
	        {
	          header: '계획번호',
	          name: 'planCd',
	          align : 'center'
	        },
	        {
	          header: '마감일자',
	          name: 'exEndDt',
	          align : 'center',
			  formatter: function(data){
				return dateChange(data.value)
						}
	        },
	        {
	          header: '제품명',
	          name: 'proNm',
	          align : 'center'
	        },
	        {
	          header: '필요수량',
	          name: 'planCnt',
	          align : 'right'
	        },
	        {
	          header: '지시수량',
	          name: 'orderOutput',
	          align : 'right',
						validation :{
							dataType : 'number',
							required : 'true'
						},
						editor: {
							type : 'text'
						}
	        },
	        {
	          header: '작업지시일',
	          name: 'indicaDt',
	          align : 'center',
	          editor : 'datePicker'
	        }
	      ],
				onGridUpdated(ev){
					grid.setColumnValues('indicaDt',today)
					
					let gridData = grid.getData();
					console.log(gridData)
			    	writeSecGrid(gridData,0)
				}
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
	          header: '순서',
	          name	: 'bomSq',
	          align : 'center',
	          width	: 50
		     },
	    	{
	          header: '공정명',
	          name	: 'prcsNm',
	          align : 'center'
	        },
	        {
	          header: '자재명',
	          name	: 'rscNm',
	          align : 'center'
	        },
	    
	        {
	          header: '재고수량',
	          name	: 'lotCnt',
	          align : 'right'
	        },
	        {
	          header: '사용량',
	          name	: 'exCnt',
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
		    
		 function writeSecGrid(data,num){
			 $.ajax({
					url : 'getDataForSecGrid',
					method : 'POST',
					dataType: 'json',
			        contentType: 'application/json; charset=utf-8',
					data : JSON.stringify(data),
					success : function(res){
						grid2.resetData(res[num]);
						secGridData = res;
						console.log(secGridData)
					},error: function(err){
						console.log(err);
					}
				})
			 
		 }
		 
		 grid.on('dblclick',function(ev){
			 nom = ev.rowKey
			 let gridData = grid.getRow(ev.rowKey)
			 grid2.resetData(secGridData[ev.rowKey])
			 
		 })
		 
		 grid.on("afterChange",function(ev){
			
			 console.log(ev.changes)
			 console.log(ev.changes[0].rowKey)
			 console.log(ev.changes[0].value)
			 
			 let rowKey = ev.changes[0].rowKey
			 let rowVal = ev.changes[0].value
			 
			 for(let i=0;i<secGridData[rowKey].length;i++){
				 secGridData[rowKey][i].exCnt = rowVal
			 }
			 
			 if(rowKey == nom){
				 grid2.resetData(secGridData[nom])
			 }

		 })
		 $("#regiBtn").on("click", function() {
			 let gridData = grid.getData(); 
			 let startDt = $("#ex-start").val();
			 let endDt = $("#ex-end").val();
			 let cntSum = 0;
			  if (startDt == "" || endDt == "") {
			    Swal.fire({
			      icon: "error",
			      title: "데이터 없음!",
			      text: "생산기간을 지정해 주세요!",
			    });
			    return;
			  }
			 for(let i = 0; i<gridData.length;i++){
				 cntSum += gridData[i].orderOutput
			 }
			 if (cntSum == 0) {
				    Swal.fire({
				      icon: "error",
				      title: "미입력!!!",
				      text: "생산지시 수량을 입력해 주세요!",
				    });
				    return;
				  }
			 
			 
		for(let i = 0;i<secGridData.length;i++){
   			for(let j = 0;j<secGridData[i].length;j++){
   				
   		       secGridData[i][j].prOrderCd 	 = null
   		       secGridData[i][j].planCd 	 = gridData[i].planCd
   		       secGridData[i][j].prOrderDt 	 = gridData[i].indicaDt
   		       secGridData[i][j].dirStartDt  = startDt
   		       secGridData[i][j].dirEndDt 	 = endDt
   		       secGridData[i][j].orderOutput = gridData[i].orderOutput
   				
   			}
   		}
		console.log(secGridData)
		 $.ajax({
				url : 'insertAll',
				method : 'POST',
				dataType: 'json',
		        contentType: 'application/json; charset=utf-8',
				data : JSON.stringify(secGridData),
				success : function(res){
					if(res == 1){
						 Swal.fire({
						      icon: "success",
						      title: "저장",
						      text: "생산지시가 완료되었습니다!",
						    });
						$("clearBtn").click()
					}else{
						Swal.fire({
						      icon: "error",
						      title: "에러",
						      text: "생산지시가 정상적으로 완료되지 않았습니다!",
						    });
					}
				},error: function(err){
					console.log(err);
				}
			})
   		
   	})

	</script>
