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
    </style>
  </head>
  <body>
    <div class="container-fluid px-4">
      <h1 class="mt-4">완제품 LOT관리</h1>
      <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item">
          <a href="/"><i class="fas fa-home"></i></a>
        </li>
        <li class="breadcrumb-item">> 영업관리</li>
        <li class="breadcrumb-item active">> LOT 관리</li>
      </ol>
      <div class="card mb-4">
        <div id="cont" style="padding-bottom: 0px">
          <div class="col">
            <div class="card-body">
              <div class="linelist" style="float: right; margin-bottom: 13px">
                <button class="btn btn-primary" id="searchBtn">
                  <i class="fas fa-search"></i> 조회
                </button>
                <button class="btn btn-primary" id="ReBtn">
                  <i class="fas fa-file"></i> 초기화
                </button>
              </div>
              <!-- onsubmit="return false" -->
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
                      <th>제품명</th>
                      <td style="width: 150px">
                        <input
                          type="text"
                          class="form-control"
                          id="proNm"
                          name="proNm"
                          style="width: 150px"
                        />
                      </td>
                      <td>
                        <button
                          type="button"
                          class="btn btn-primary"          
                          button data-bs-toggle="modal" 
                          id="modalBtn" 
                          data-bs-target="#proModal">
                          <i class="fas fa-search"></i>
                        </button>
                        
        
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
                      <!--   <button type="button" id="proBtn" class="btn btn-primary"
                            data-bs-dismiss="modal">확인</button> -->
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
                      <th style="border-bottom-width: 0px">제조일자</th>
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
      <button class="btn btn-primary" id="delBtn">
        <i class="fas fa-minus"></i> 삭제
      </button>
      <br />
      <br />
      <div id="lot"></div>
    </div>
  </body>
  <script>
  let proNmSearch = document.getElementById("proNmSearch"); //제품명 모달창 인풋박스 
  let checkLen = 0; //체크된 길이
//제품명 모달이 뜨면
  $('#proModal').on('shown.bs.modal', function (e) {
  	searchPro();
  	})
  $('#proModal').on('hidden.bs.modal', function (e) {
  	gridPro.clear();
  	proNmSearch.value="";
  	})

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

//제품명 그리드
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
	});


//제품명 더블클릭했을 때
gridPro.on('dblclick', (ev) => {
	$('#proModal').modal('hide');
	document.getElementById("proNm").value = gridPro.getData()[ev.rowKey].proNm;
	}); 
	
//초기화 눌렀을 때
document.getElementById("ReBtn").addEventListener('click', function(){
	 document.getElementById("proNm").value = "";
	 document.getElementById("start").value = "";
	 document.getElementById("end").value = "";	 
	}); 
	 
//lot 그리드
var gridLot = new tui.Grid({
  el: document.getElementById("lot"),
  scrollX: false,
  scrollY: true,
  bodyHeight: 243,
  rowHeaders: ['checkbox'],
  columns: [
    {
      header: "완제품LOT번호",
      name: "proLotNo"
    },
    {
        header: "제품코드",
        name: "proCd",
    },
    {
        header: "제품명",
        name: "proNm",
      },
      {
          header: "LOT수량",
          name: "lotCnt",
     },
   
    {
        header: "제조일자",
        name: "proWdt",
        formatter : function(data){          
            return dateChange(data.value);
       }
     },
      
    {
      header: "유통기한",
      name: "proExp",
      formatter : function(data){
    	  let date = dateChange(data.value);
    	  let result = "";
    	  
    	  if(data.value < (new Date().getTime() - (3*24*60*60*1000)))
          	result = '<span style="color:red";>'+date+'</span>';
          else
          	result = '<span style="black";>'+date+'</span>'; 
          	
          return result;
     }
    },
  ],
  bodyHeight: 300,
  pageOptions: {
      useClient: true,
      type: 'scroll',
      perPage: 30
   }
});

gridLot.on('check', (ev) => {
	checkLen = gridLot.getCheckedRows().length;
	});

gridLot.on('uncheck', (ev) => {
	checkLen = gridLot.getCheckedRows().length;
	});
	
gridLot.on('checkAll', (ev) => {
	checkLen = gridLot.getCheckedRows().length;
	//console.log(checkLen);
	});

//날짜 변환
function dateChange(date) {
  let date1 = new Date(date);
  let date2 =
    date1.getFullYear() + "-" + 
    (date1.getMonth() < 10 ? "0" + (date1.getMonth() + 1): date1.getMonth() + 1) +"-" +
    (date1.getDate() < 10 ? "0" + date1.getDate() : date1.getDate());
  return date2;
}

//조회 아작스
function lotSearch() {
	  let start = document.getElementById("start").value;
	  let end = document.getElementById("end").value;
	  let proNm = document.getElementById("proNm").value;
	 $.ajax({
	        url: "lotSearch",
	        method: "post",
	        data: { start: start, end: end, proNm: proNm },
	        success: function(data) {  	
	     	  gridLot.resetData(data)
	     	  //console.log(data);
	        },
	        error: function (reject) {
	          console.log(reject);
	        },

	      }); 
}
  
//페이지뜨자마자 조회
window.onload = lotSearch;

//조회버튼 누르면 조회
document.getElementById('searchBtn')
		.addEventListener('click', lotSearch); 
		
//삭제버튼 동작
delBtn.addEventListener("click", lotDel);

//삭제버튼 함수 
function lotDel() {
	let str="";
  
  for (let i = 0; i < checkLen; i++) {
    str += gridLot.getCheckedRows()[i].proLotNo + ",";
  }
  //console.log(str);
  $.ajax({
    url: "lotDelete",
    method: "post",
    data: { str: str },
    success: function (data) {
    	lotSearch();
    	//console.log(data);
    	if(data>0) 
    		Swal.fire({
                icon: 'success',
                title: data+'건이 삭제되었습니다',
                //text: '값을 조회 후 사용가능합니다.',
              });
    	else
    		Swal.fire({
                icon: 'error',
                title: '삭제할 주문서를 선택하세요',
                //text: '값을 조회 후 사용가능합니다.',
              });
    		
    },
    error: function (reject) {
      console.log(reject);
    },
  });
}


		
		
 </script>
</html>