<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid px-4">
		<h1 class="mt-4">제품 입/출고 조회</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 입/출고 조회</li>
		</ol>
		
		<div class="card mb-4">
      		<div id="cont" style="padding-bottom:0px">
				<div class="col">
					<div class="card-body">
						<div class="linelist" style="float:right;margin-bottom: 13px;">
							<button type="button" class="btn btn-primary" id="optionSearchBtn"><i class="fas fa-search"></i> 조회</button></td>
							<button class="btn btn-primary" id="ReBtn"><i class="fas fa-file"></i> 초기화</button>
						</div>
                     <form name="IstSearchFrm" id="IstSearchFrm">
                     <table class="table" style="vertical-align : middle;">
                     	<colgroup>
                     	<col style="width: 150px;">
                     	<col>
                     	<col style="width: 150px;">
                     	<col>
                     	<col style="width: 150px;">
                     	<col>
                     	<col style="width: 150px;">
                     	<col>
                     	</colgroup>
                     	<tbody>  
	                     	<tr>  	
								<th style="border-bottom-width: 0px" ><label><input type="radio" id ="receive"  name="radio" value="receive" checked="checked">입고</label><!-- </th> -->
								<label><input type="radio" id="release" name="radio" value="release">출고</label></th>
							<tr>
                     		<tr>
                     			<th style="border-bottom-width: 0px">제품명</th>
                     			<td style="border-bottom-width: 0px"><input type="text" class="form-control" id="proName" name="proName" style="width:200px;">
		    						<!-- 모달버튼 -->
		    						<button type="button" class="btn btn-primary" id="lotSearchBtn" data-bs-toggle="modal" data-bs-target="#proModal" style="margin-bottom: 3px;"><i class="fas fa-search"></i></button></td>
		    				</tr>
		    				<tr>		
								<th style="border-bottom-width: 0px" >제품 입고일자</th>
								<td style="border-bottom-width: 0px"><input type="date" id="start" name="start" class="form-control" style="width:150px;"> - <input type="date" id="end" name="end" class="form-control" style="width:150px;">                 			
                     		</tr>
                     	</tbody>
                     </table>
                     </form>
                     </div>   
            	</div>
			</div>
        </div>
            <div id="grid" class="card mb-4"></div>
            <div id="grid2" class="card mb-4"></div>
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
      </div>
 
 <script>
 let proNmSearch = document.getElementById("proNmSearch"); //제품명 인풋박스 
 let start="";
 let end="";
 let proNm="";
 
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
	document.getElementById("proName").value = gridPro.getData()[ev.rowKey].proNm;
	}); 
	
//초기화 눌렀을 때
 document.getElementById("ReBtn").addEventListener('click', function(){
	 document.getElementById("proName").value = "";
	 document.getElementById("start").value = "";
	 document.getElementById("end").value = "";	 
	}); 
	 

//입고 조회 그리드
var gridRe = new tui.Grid({
  el: document.getElementById("grid"),
  scrollX: false,
  scrollY: true,
  //bodyHeight: 500,

  columns: [
    {
      header: "입고번호",
      name: "proIstNo"
    },
    {
        header: "입고일자",
        name: "proIstDt",
        formatter : function(data){          
            return dateChange(data.value);
       }
    },
    {
        header: "제품명",
        name: "proNm",
      },
      {
          header: "제품코드",
          name: "proCd",
          hidden: true,    
     },
   
    {
        header: "입고수량",
        name: "proIstCnt",
     },
      
    {
      header: "LOT번호",
      name: "proLotNo",
    },
    {
   	 header:"생산지시코드",
   	 name:"prOrderCd",
   	 hidden: true
    },
    {
   	 header:"공정코드",
   	 name:"prcsCd",
   	 hidden: true
    }
  ],
  bodyHeight: 450,
  pageOptions: {
      useClient: true,
      type: 'scroll',
      perPage: 30
   }
});

//페이지뜨자마자 입고 조회
window.onload = reSearch;
	
	
function search() {
	 start = document.getElementById("start").value;
     end = document.getElementById("end").value;
     proNm = document.getElementById("proName").value;
     
     //입고버튼이 눌려있으면
     if(document.getElementById('receive').checked==true) {
    	 reSearch();
     } 
     else {
    	 relsearch();
     }
}

//입고조회 아작스
function reSearch() {
	 $.ajax({
	        url: "reCheck",
	        method: "post",
	        data: { start: start, end: end, proNm: proNm },
	        success: function(data) {  	
	     	  gridRe.resetData(data)
	        },
	        error: function (reject) {
	          console.log(reject);
	        },

	      }); 
		gridRe.el.hidden = false;
		gridRel.el.hidden=true;
}

//출고조회 아작스
function relsearch() {
	 $.ajax({
	        url: "releaseCheck",
	        method: "post",
	        data: { start: start, end: end, proNm: proNm },
	        success: function(data) {  	
	     	  gridRel.resetData(data)
	        },
	        error: function (reject) {
	          console.log(reject);
	        },

	      }); 
		gridRe.el.hidden = true;
		gridRel.el.hidden=false;
}

//조회버튼 누르면 조회
document.getElementById('optionSearchBtn')
		.addEventListener('click', search); 
 
//날짜 변환
function dateChange(date) {
  let date1 = new Date(date);
  let date2 =
    date1.getFullYear() + "-" + 
    (date1.getMonth() < 10 ? "0" + (date1.getMonth() + 1): date1.getMonth() + 1) +"-" +
    (date1.getDate() < 10 ? "0" + date1.getDate() : date1.getDate());
  return date2;
}
 
 
//라디오버튼 출고클릭하면
document.getElementById('release').addEventListener('click', function(){
	gridRe.el.hidden = true;
	gridRel.el.hidden=false;
	relsearch();
});   
//라디오버튼 입고클릭하면
document.getElementById('receive').addEventListener('click', function(){
	gridRe.el.hidden = false;
	gridRel.el.hidden=true;
	
}); 
 
//출고 조회 그리드
var gridRel = new tui.Grid({
  el: document.getElementById("grid2"),
  scrollX: false,
  scrollY: true,
  bodyHeight: 243,

  columns: [
    {
      header: "출고번호",
      name: "proOustNo"
    },
    {
        header: "출고일자",
        name: "proOustDt",
        formatter : function(data){          
            return dateChange(data.value);
       }
    },
    {
        header: "제품명",
        name: "proNm",
      },
      {
          header: "제품코드",
          name: "proCd",
          hidden: true,    
     },
   
    {
        header: "출고수량",
        name: "proOustCnt",
     },
      
    {
      header: "LOT번호",
      name: "proLotNo",
    },
    
  ],
  bodyHeight: 300,
  pageOptions: {
      useClient: true,
      type: 'scroll',
      perPage: 30
   }
});
 

 </script>
 
   
</body>
</html>