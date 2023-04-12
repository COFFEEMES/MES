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
		<h1 class="mt-4">제품입고등록</h1>                                                         
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 제품입고등록</li>
		</ol>
		
		<div class="card mb-4">
      <div id="cont" style="padding-bottom:0px">
            <div class="col">
				<div class="card-body">
				<div class="mb-4">
                           
                                           
                        </div>
				<div class="linelist" style="float:right;">
                          <!--  <button type="button" class="btn btn-primary" id="dtSearchBtn"><i class="fas fa-search"></i> 조회</button> -->
                           <button type="button" class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 등록</button>
                           <button class="btn btn-primary" id="ReBtn"><i class="fas fa-file"></i> 초기화</button>
                       </div> 
                     <form name="IstSearchFrm" id="IstSearchFrm">
                    <!--  <label for="edctsIstDt" class="form-label">제품 입고일자</label> 
                           <input type="date" id="edctsIstDtStart" name="edctsIstDtStart" class="form-control" style="width:150px;margin-left: 5px;"> - <input type="date" id="edctsIstDtEnd" name="edctsIstDtEnd" class="form-control" style="width:150px;"> -->
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
                      <th for="edctsIstDt" class="form-label">제품생산일자</th> 
                          <td><input type="date" id="start" name="start" class="form-control" style="width:150px;margin-left: 5px;"> - <input type="date" id="end" name="end" class="form-control" style="width:150px;"></td>
                     	<th></th>
                     	<td></td>
                     	<th></th>
                     	<td></td>
                     	<th></th>
                     	<td></td>
                     	<th></th>
                     	<td></td>
                     	<th></th>
                     	<td></td>
                     	</tr>
                     	<tr> 
                     		<th>포장완료제품</th>
                     		<td><input type="text" class="form-control" id="edctsLotNo" name="edctsLotNo" style="width:150px" readonly>
                     			<!-- 모달버튼 -->
    							<button type="button" class="btn btn-primary" id="comSearchBtn" data-bs-toggle="modal" data-bs-target="#lotModal"><i class="fas fa-search"></i></button>	
    						</td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
                     	</tr>
<!--                      	<tr>
                     		<th>검사수량</th>
                     		<td><input type="text" class="form-control" id="inspCnt" name="inspCnt" style="width:150px;margin-left: 3px;" readonly></td>
                     		<th>제품 입고수량</th>
                     		<td><input type="text" class="form-control" id="edctsIstCnt" name="edctsIstCnt" style="width:150px;margin-left: 0px;"></td>                     		                     		
                     		<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
                     	</tr> -->
                     </tbody>
                       </div>
                       </table>
                      
                     </form>
                  </div>
            </div>
		
      </div>
    </div>
      <div id="grid" class="card mb-4"></div>
      
   </div>
      <!-- 검사완료 제품 모달 -->
		<div class="modal fade" id="lotModal" tabindex="-1" aria-labelledby="elLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">xampleModa
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="lotModalLabel">검사완료 제품</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div id="comGrid"></div>
		      </div>
		      <div class="modal-footer">
		      <button type="button" id="confirmBtn" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		      <button type="button" id="cancleLotBtn" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div> <!-- 모달 div끝 -->
		
		<div id="complete"  style="margin: 30px;"></div>
</body>
<script>
//검사완료 제품 모달 그리드
var gridCom = new tui.Grid({
  el: document.getElementById("comGrid"),
  rowHeaders: ['checkbox'],
  columns: [
    {
      header: "제품코드",
      name: "proCd"
    },
    {
        header: "제품명",
        name: "proNm",
      },
   
    {
        header: "수량",
        name: "output",
     },
     {
    	 header:"공정진행코드",
    	 name:"prcsTblCd",
    	 hidden: true
     }
  ],
  pageOptions: {
      useClient: true,
      type: 'scroll',
      perPage: 30
   }
});


//조회버튼 눌렀을 때
    function search() {
       start = document.getElementById("start").value;
      end = document.getElementById("end").value; 
      $.ajax({
        url: "testCom",
        method: "post",
         data: { start: start, end: end}, 
        success: function (data) {
        setTimeout(function () {
        	gridCom.refreshLayout()
 		   }, 0);
        gridCom.resetData(data); 
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    };

//버튼 누르면 조회
document.getElementById("comSearchBtn").addEventListener("click", search);

//모달창버튼 확인 누르면 append
document.getElementById("confirmBtn").addEventListener("click", append);

//입고 조회 그리드
var gridRe = new tui.Grid({
  el: document.getElementById("complete"),

  columns: [
    {
      header: "입고번호",
      name: "proIstNo"
    },
    {
        header: "입고일자",
        name: "proIstDt",
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
   	 header:"공정진행코드",
   	 name:"prcsTblCd",
   	 hidden: true
    }
  ],
  bodyHeight: 300,
  pageOptions: {
      useClient: true,
      type: 'scroll',
      perPage: 30
   }
});

let comData = []; //체크된 제품 정보 넣는 배열
let rowData = {}; //추가할 행
//등록하기전 그리드에 추가
function append() {
	comData = gridCom.getCheckedRows();
	for(let i =0; i<comData.length; i++) {	
		rowData.proNm = comData[i].proNm;
		rowData.proIstCnt = comData[i].output;
		rowData.proIstDt = getToday();
		rowData.proCd = comData[i].proCd;
		rowData.prcsTblCd = comData[i].prcsTblCd
		gridRe.appendRow(rowData);
	}
	
}


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
 
//날짜 변환
function dateChange() {
  let date1 = new Date();
  let date2 =
    (date1.getFullYear()+"").substr(2,4)+
    (date1.getMonth() < 10 ? "0" + (date1.getMonth() + 1): date1.getMonth() + 1)+ 
    (date1.getDate() < 10 ? "0" + date1.getDate() : date1.getDate());
  return date2;
}


document.getElementById("saveBtn").addEventListener("click", register);
function register(){
    $.ajax({
        url: "signUp",
        method: "post",
        //data: {},
        dataType : 'json',
        contentType : 'application/json',
        data: JSON.stringify(gridRe.getData()),
        success: function(data) {  	
     	  gridRe.clear();
     	  console.log("등록: "+ data);
        },
        error: function (reject) {
          console.log(reject);
        },

      }); 
}



</script>
</html>