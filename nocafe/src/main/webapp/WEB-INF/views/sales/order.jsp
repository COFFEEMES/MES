<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>주문서 관리</title>
    <link
      rel="stylesheet"
      href="https://uicdn.toast.com/grid/latest/tui-grid.css"
    />
    <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<link rel="stylesheet"
    href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <style>
      .c_btn {
        color: #fff;
        font-size: 13px;
        background: #333;
        border: none;
        padding: 6px;
        border-radius: 4px;
      }
      #proModal{
      	left: 30%;
  		margin-left: 10px;
      }
     .tui-grid-cell.not-allow-row {background-color : red}
    </style>
  </head>
  <body>
    <div class="container-fluid px-4">
      <h1 class="mt-4">주문서관리</h1>
      <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item">
          <a href="/"><i class="fas fa-home"></i></a>
        </li>
        <li class="breadcrumb-item">> 영업관리</li>
        <li class="breadcrumb-item active">> 주문서 관리</li>
      </ol>
      <div class="card mb-4">
        <div id="cont" style="padding-bottom: 0px">
          <div class="col">
            <div class="card-body">
              <div class="linelist" style="float: right; margin-bottom: 13px">
                <button class="btn btn-primary" id="ordrBtn">
                  <i class="fas fa-search"></i> 조회
                </button>
                <button class="btn btn-primary" id="ReBtn">
                  <i class="fas fa-file"></i> 초기화
                </button>
                <button class="btn btn-primary" id="excel">
                  <i class="bi bi-file-excel"></i> 엑셀
                </button>
              </div>
              <form name="searchFrm" id="searchFrm" >
                <table class="table" style="vertical-align: middle">
                  <colgroup>
                    <col style="width: 150px" />
                    <col />
                    <col style="width: 150px" />
                    <col />
                    <col style="width: 150px" />
                    <col />
                  </colgroup>
                  <tbody>
                    <tr>
                      <th>거래처명</th>
                      <td style="width: 150px">
                        <input
                          type="text"
                          class="form-control"
                          id="vendNm"
                          name="vendNm"
                          style="width: 150px"
                        />
                      </td>
                      <td>
                        <button
                          type="button"
                          class="btn btn-primary"          
                          button data-bs-toggle="modal" 
                          id="modalBtn" 
                          data-bs-target="#exampleModal">
                          <i class="fas fa-search"></i>
                        </button>
                        
                            <!-- 거래처 검색 Modal -->
         <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">거래처 조회</h5>
                        <br><br>                    
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div><br>
                    <div>
                    <label style="margin-left: 20px;">거래처명</label>                    
                     <input
                          type="text"
                          id="vendNmSearch"
                          class="form-control"
                          style="width: 150px; display:inline-block;" />
                     <button
                          type="button"
                          id="searchBtn"
                          class="btn btn-primary" style="width: 43px;">
                          <i class="fas fa-search"></i></button>    
                          </div>   
                          <br>             
                    <div id="modGrid" class="modal-body"></div>
                    <div class="modal-footer">
                        <button type="button" id="clearBtn2" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>   
        <!-- 거래처 검색 Modal 끝-->
        
        <!-- 상세조회 Modal -->
        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">주문서 상세 목록</h5>
                        <br><br>                    
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div><br>
                    <div>                                    
                    <div id="modGridDetail" class="modal-body"></div>
                    <div class="modal-footer">
                     <button type="button" class="btn btn-primary" id="addBtnDetail">
        					<i class="fas fa-plus"></i> 추가 </button>   
                     <button class="btn btn-primary" id="okBtn" type="button">
        					<i class="fas fa-save"></i> 저장 </button>
                        <button type="button" id="clearBtn3" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>   
        </div>
        <!-- 상세조회 Modal 끝-->
        
        <!-- 제품명 Modal -->
 <div class="modal fade" id="proModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">제품명 조회</h5>
                        <br><br>                    
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div><br>
                    <div>
                    <label style="margin-left: 20px;">제품명</label>                    
                     <input
                          type="text"
                          id="proNmSearch"
                          class="form-control"
                          style="width: 150px; display:inline-block;" />
                     <button
                          type="button"
                          id="proSearchBtn"
                          class="btn btn-primary" style="width: 43px;">
                          <i class="fas fa-search"></i></button>    
                          </div>   
                          <br>         
                    <div id="proSpace" class="modal-body"></div>
                    <div class="modal-footer">
                       <button type="button" id="clearBtn" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>    
        <!-- 제품명 Modal 끝-->
        
                      </td>
                      <th></th>
                      <td></td>
                      <th></th>
                      <td></td>
                    </tr>
                    <tr>
                      <th style="border-bottom-width: 0px">주문일자</th>
                      <td style="border-bottom-width: 0px" colspan="3">
                        <input
                          type="date"
                          id="start"
                          name="start"
                          class="form-control"
                          style="width: 150px; display: inline-block"
                        />
                        -
                        <input
                          type="date"
                          id="end"
                          name="end"
                          class="form-control"
                          style="width: 150px; display: inline-block"
                        />
                      </td>
                    </tr>
                  </tbody>
                </table>
              </form>
            </div>
          </div>
        </div>
      </div>
      <button class="btn btn-primary" id="addBtn">
        <i class="fas fa-plus"></i> 추가
      </button>
      <button class="btn btn-primary" id="okBtnTotal">
        <i class="fas fa-save"></i> 저장
      </button>
      <button class="btn btn-primary" id="delBtn">
        <i class="fas fa-minus"></i> 삭제
      </button>
      <br />
      <br />
      <div id="order"></div>
    </div>
  </body>

  <script>
    let ordrBtn = document.getElementById("ordrBtn"); //조회버튼
    let delBtn = document.getElementById("delBtn"); //삭제버튼
    let searchBtn = document.getElementById("searchBtn"); //모달 거래처 검색 버튼
    let confirmBtn = document.getElementById("confirmBtn");//거래처 모달창 확인버튼
    let vendNmInput = document.getElementById("vendNm"); //거래처명 검색 인풋박스
    let proNmSearch = document.getElementById("proNmSearch"); //제품명 인풋박스
    let start = ""; //주문일자 검색
    let end = ""; //주문일자 검색
    let vendNm = ""; //거래처명 검색
    let checkLen = 0; //체크박스 선택 개수
    let vendSearch=""; //모달창 거래처명 저장변수
    let row =0; //제품명 선택시 바뀔 행의 번호
    let val = ""; //선택된 제품명
    let gridDetailData = []; //상세조회 데이터 담은 변수
    let orderNo = "";//주문번호
    let dataa = {}; //getData;
    let gridData = [];//전체조회 데이터 담을 변수


    //조회버튼 눌렀을때 
    function search() {
      start = document.getElementById("start").value;
      end = document.getElementById("end").value;
      vendNm = document.getElementById("vendNm").value.toUpperCase();
      $.ajax({
        url: "orderSearch",
        method: "post",
        data: { start: start, end: end, vendNm: vendNm },
        success: function (data) {
            grid.resetData(data); //그리드 적용
            gridData = data;
        data.forEach(row=>{	
        	let detailCnt = Number(row.detailCnt);
        	if(detailCnt==0)
        		grid.addRowClassName(row.rowKey,'not-allow-row');
        	else grid.removeRowClassName(row.rowKey,'not-allow-row');
        })	       	
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    };

    //조회 그리드
    var grid = new tui.Grid({
      el: document.getElementById("order"),
      scrollX: false,
      scrollY: true,
      bodyHeight: 243,
      rowHeaders: ['checkbox'],
    	  
      columns: [
        {
          header: "주문번호",
          name: "orderNo",
          
        },
        {
          header: "거래처",
          name: "vendNm",
          editor: 'text',
        },
        {
          header: "주문일자",
          name: "orderDt",
          formatter: function (data) {
        	  let dateVal = '';
        	  if(data.value != null ){
        		  dateVal = dateChange(data.value);
        	  }else{
        		  dateVal = getToday();
        	  }
              return dateVal;
            },
            editor: {
                type: 'datePicker',
                options: {
                  format: 'yyyy-MM-dd',
            	  date : getToday()
                }
              }
        
        
        },
        {
          header: "진행상황",
          name: "orderSit",
        },
        {
          header: "납기일자",
          name: "parrdDt",
          formatter: function (data) {        	  
        	  let dateVal = '';
        	  if(data.value != null ){
        		  dateVal = dateChange(data.value);
        	  }else{
        		  dateVal = getToday();
        	  }
              return dateVal;
            },
          editor: {
              type: 'datePicker',
              options: {
                format: 'yyyy-MM-dd',
              }
            }
     
        },
        {
            header: "주문제품개수",
            name: "detailCnt",
            hidden: true,
            },
         
        
      ],
      bodyHeight: 400,
      pageOptions: {
          useClient: true,
          type: 'scroll',
          perPage: 30
       }
    });
    
    grid.on('check', (ev) => {
    	checkLen = grid.getCheckedRows().length;
    	});

    grid.on('uncheck', (ev) => {
    	checkLen = grid.getCheckedRows().length;
    	});
    	
    grid.on('checkAll', (ev) => {
    	checkLen = grid.getCheckedRows().length;
    	});

    
    
    //창 뜨자마자 조회 됨
    window.onload = search;
    
    //버튼 누르면 조회
    ordrBtn.addEventListener("click", search);
    
    //상세주문 조회
     grid.on('click', (ev) => {
 	 	if(ev.targetType=='cell' && ev.columnName =='orderNo') {
 	 		console.log(ev);
 	 	orderNo = grid.getData()[ev.rowKey].orderNo;
 	 	orderDetailFct();
 	 	 }
 		}); 

     
    //거래처 클릭했을때
    let clickEvent="";
    let vendRow = -1;
     grid.on('click', (ev) => {
    	 clickEvent="gridClick";
  	 	if(ev.targetType=='cell' && ev.columnName =='vendNm') {
  	 		vendRow = ev.rowKey;
  	 		$('#exampleModal').modal('show');	

  	 	 }
  		}); 
    
   //주문서 상세 가져오기
    function orderDetailFct(){

			$.ajax({
  			 url: "orderDetail",
  			 method: "post",
   			data: {orderNo: orderNo },
  			success: function(data) { 			
  				$('#detailModal').modal('show');
	   			gridDetail.resetData(data);
	   		 setTimeout(function () {
 	    		   gridDetail.refreshLayout()
 	    		   }, 100);
	   			gridDetailData = data;
	   		
   				},
   			error: function (reject) {
     			console.log(reject);
   				},
 			}); 
    }
    
    //상세조회 모달창이 뜨면
	  $('#detailModal').on('shown.bs.modal', function (e) {
		  gridDetail.resetData(gridDetailData);
		  setTimeout(function () {
	    		   gridDetail.refreshLayout()
	    		   }, 0);

		})
		
		 $('#detailModal').on('hidden.bs.modal', function (e) {
			 if(e.target != e.currentTarget) return;
			 gridDetail.clear();
		})
		   


    //거래처 검색 모달 함수
  function searchVend() {
	 vendNm = document.getElementById("vendNmSearch").value.toUpperCase() ;
     $.ajax({
       url: "vendSearch",
       method: "post",
       data: {vendNm: vendNm },
       success: function(data) {  	
    	   gridVend.resetData(data);
    	   setTimeout(function () {
    		   gridVend.refreshLayout()
    		   }, 0);
       },
       error: function (reject) {
         console.log(reject);
       },

     }); 
 }  
 
 //거래처 검색 모달창 그리드 
	  var gridVend = new tui.Grid({
      el: document.getElementById('modGrid'),
      columns: [
   
          {
              header: '거래처',
              name: 'vendNm',
          },
          {
              header: '거래처코드',
              name: 'vendCd',
          },
         
      ],
      pageOptions: {
          useClient: true,
          type: 'scroll',
          perPage: 30	
       }
	
  });  
 
 //거래처 모달창이 뜨면
	  $('#exampleModal').on('shown.bs.modal', function (e) {
		  searchVend();
		})
		
		 $('#exampleModal').on('hidden.bs.modal', function (e) {
			 gridVend.clear();
	       	vendNmSearch.value="";
		})
		
		
	 // 선택시 거래처명 변경
	    gridVend.on('dblclick', (ev) => {
	    if(clickEvent!="gridClick")
	    {document.getElementById("vendNm").value = gridVend.getData()[ev.rowKey].vendNm;}
	    else
	    	{
	    	let clickData = grid.getData();
	    	clickData[vendRow].vendNm = gridVend.getData()[ev.rowKey].vendNm;
	    	grid.resetData(clickData);
	    	clickEvent="";
	    	}
	    gridVend.clear();
	    vendNmSearch.value="";
	    $('#exampleModal').modal('hide');
	    });
	  
//거래처 모달 검색 버튼 동작 
searchBtn.addEventListener("click", searchVend);  
 
    //삭제버튼 함수 
    function orderDel() {
  	let str="";
      
      for (let i = 0; i < checkLen; i++) {
        str += grid.getCheckedRows()[i].orderNo + ",";
      }
      $.ajax({
        url: "orderDelete",
        method: "post",
        data: { str: str },
        success: function (data) {
        	search();
        	if(data>0) 
        		Swal.fire({
                    icon: 'success',
                    title: data+'건이 삭제되었습니다',
                  });
        	else
        		Swal.fire({
                    icon: 'error',
                    title: '삭제할 주문서를 선택하세요',
                  });
        		
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }

  //삭제버튼 동작
 delBtn.addEventListener("click", orderDel);
    
 //주문서 상세 목록 그리드
   var gridDetail = new tui.Grid({
      el: document.getElementById('modGridDetail'),
      columns: [
   
          {
              header: '주문상세코드',
              name: 'orderDetailNo',
          },
          {
              header: '제품명',
              name: 'proNm',
              editor: 'text',
          },
          {
              header: '주문량',
              name: 'orderCnt',
              editor: 'text',
          },
          {
              header: '진행상황',
              name: 'orderSitDetail',
          },
         
      ],
      pageOptions: {
          useClient: true,
          type: 'scroll',
          perPage: 30
       }
	
  });  

 //상세조회에서 추가 버튼 누르면
  document.getElementById('addBtnDetail').addEventListener('click', addDetail);
 function addDetail(e) {
	gridDetail.appendRow();
	gridDetailData.push({orderDetailNo:"", proNm:"", orderCnt:"", orderSitDetail:"" });
	e.stopPropagation();
 }
 
 //제품명 검색 그리드
 var gridPro = new tui.Grid({
    el: document.getElementById('proSpace'),
    columns: [
 
        {
            header: '제품코드',
            name: 'proCd',
        },
        {
            header: '제품명',
            name: 'proNm',
        },
    ],
    pageOptions: {
        useClient: true,
        type: 'scroll',
        perPage: 30
     }
	
});
 
 //제품명 클릭하면
    gridDetail.on('click', (ev) => {
	 	if(ev.targetType=='cell' && ev.columnName =='proNm') {
	 		$('#proModal').modal('show');
	 		row = ev.rowKey;
	 	 } 
		});  

 
//제품명 모달창에서 검색버튼 누르면
 document.getElementById('proSearchBtn').addEventListener('click', searchPro);     
function searchPro() {
	
	let proNm = proNmSearch.value;
	$.ajax({
		 url: "proSearch",
		 method: "post",
			data: {proNm: proNm },
		success: function(data) { 			
			gridPro.resetData(data);
			  setTimeout(function () {
				  gridPro.refreshLayout()
  	    		   }, 100);

				},
			error: function (reject) {
			console.log(reject);
				},
		})	
}   


//제품명 모달이 뜨면
$('#proModal').on('shown.bs.modal', function (e) {
	searchPro();
	})
$('#proModal').on('hidden.bs.modal', function (e) {
	gridPro.clear();
	proNmSearch.value="";
	})
		
//제품명 더블클릭했을 때
 gridPro.on('dblclick', (ev) => {
	gridDetailData[row].proNm = gridPro.getData()[ev.rowKey].proNm;
	gridDetail.resetData(gridDetailData);
	gridPro.clear();
	proNmSearch.value="";
	$('#proModal').modal('hide');
	}); 
	
   //오늘날짜로
   function getToday(){
       const date = new Date();
       const hours = String(date.getHours()).padStart(2, "0");
       const minutes = String(date.getMinutes()).padStart(2, "0");
       const seconds = String(date.getSeconds()).padStart(2, "0");
       const years = date.getFullYear();
       const month = String(date.getMonth() + 1).padStart(2, "0");
       const day = String(date.getDate()).padStart(2, "0");
       
       return years + "-" + month + "-" + day;
    } 
 
   //전체조회에서 추가 버튼 누르면
   document.getElementById('addBtn').addEventListener('click', addRow);
  function addRow() {
	  grid.appendRow();
	  gridData.push({orderNo:"", vendCd:"", vendNm:"", orderDt:"", orderSit:"", parrdDt:"" });

  }
     
   
//전체조회 저장버튼
 document.getElementById('okBtnTotal')
			.addEventListener('click', saveOrderTotal); 
   
 //주문서 저장
 function saveOrderTotal() {
	for(let i=0; i<grid.getData().length; i++) {
		if(grid.getData()[i].vendNm==null) {
			Swal.fire({
                icon: 'error',
                title: '주문서를 작성해주세요.',
              });
			return ;
		}
	}
	 
    $.ajax({
        url: "saveOrderTotal",
        method: "post",
        dataType : 'json',
        contentType : 'application/json',
        data: JSON.stringify(grid.getData()),
        success: function (data) {
				Swal.fire({
                    icon: 'success',
                    title: '주문서가 저장되었습니다.',
                  });
	    		   search();
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    
    
    
	
} 
  
   
//상세조회 저장버튼
 document.getElementById('okBtn')
			.addEventListener('click', saveOrder); 

    	
 //상세 주문서 저장
 function saveOrder() {
	dataa = gridDetail.getData();
	
	for(let i=0; i<dataa.length; i++) {
		dataa[i].orderNo = orderNo;
	}
		
    $.ajax({
        url: "saveOrder",
        method: "post",
        dataType : 'json',
        contentType : 'application/json',
        data: JSON.stringify(dataa),
        success: function (data) {
        	Swal.fire({
                icon: 'success',
                title: '주문서가 저장되었습니다.',
              });
        	search();

        },
        error: function (reject) {
          console.log(reject);
        },
      });
    
	
} 
  

 //날짜 변환
 function dateChange(date) {
   let date1 = new Date(date);
   let date2 =
     date1.getFullYear() + "-" + 
     (date1.getMonth() < 10 ? "0" + (date1.getMonth() + 1): date1.getMonth() + 1) +"-" +
     (date1.getDate() < 10 ? "0" + date1.getDate() : date1.getDate());
   return date2;
 }
 

 
       //초기화 버튼 누르면
       $("#ReBtn").on("click", function(){
    	   document.getElementById("vendNm").value="";
    	   document.getElementById("start").value="";
    	   document.getElementById("end").value="";
         }) 
            
         
  //엑셀버튼 클릭 이벤트
      const options = {
         includeHiddenColumns: false, //숨겨진 열 포함
         onlySelected: true,
         fileName: '주문서', //파일이름
         useFormattedValue:true, //지정된 값을 내보낼지
      };
      
        //엑셀버튼을 누르면 해당되는 발주상세목록을 엑셀로 만들어준다
       $("#excel").on('click', function(){
          Swal.fire({
             title: '엑셀파일로 받아보시겠습니까?',
             text: "원하지 않는다면 취소를 눌러주세요",
             icon: 'question',
             showCancelButton: true,
             confirmButtonColor: '#3085d6',
             cancelButtonColor: '#d33',
             confirmButtonText: '확인',
             cancelButtonText: '취소',
             reverseButtons: true, // 버튼 순서 거꾸로
             
          }).then((result) => {
             if (result.isConfirmed) {
                grid.export('xlsx', options);  
             } else {
                Swal.fire({
                   title: '취소되었습니다',
                   icon : 'success'
                });
             }
          });
       });  
  </script>
</html>