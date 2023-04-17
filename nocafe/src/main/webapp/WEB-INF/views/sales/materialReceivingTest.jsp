<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"
></script>
<style>
  #container {
    width: 98%;
    margin: 0 auto;
  }

  .col {
    width: 100%;
  }

  .linelist {
    float: right;
  }

  #lineb {
    display: inline-block;
  }

  #planDate {
    float: left;
  }

  .tui-datepicker {
    z-index: 99;
  }

  label {
    width: 150px;
  }
</style>
<div class="container-fluid px-4">
  <h1 class="mt-4">자재입고검사</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 자재관리</li>
    <li class="breadcrumb-item active">> 자재입고검사</li>
  </ol>
  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <div id="lineb">
          <div id="planDate">
          	<label style="width:80px;">업체명</label>
				 <input id="vendNm" type="text" class="form-control" placeholder="검색버튼을 이용하세요" style="width: 200px;" 
				 		required readonly>
                  <button type="button" class="btn btn-primary" button data-bs-toggle="modal" id="modalBtn" 
                         data-bs-target="#exampleModal"> <i class="fas fa-search"></i> </button>
            <label style="margin-left:30px; width:100px;">납기예정일</label>
            <input
              type="date"
              id="ex-strat"
              name="tui-date-picker-target"
              class="form-control tragetDate"
              style="width: 150px"
            />
            -
            <input
              type="date"
              id="ex-end"
              name="tui-date-picker-target"
              class="form-control tragetDate"
              style="width: 150px"
            />
          </div>
        </div>
        <div class="linelist">
          <button id="clearBtn" class="btn btn-primary" form="">
            <i class="fas fa-file"></i> 초기화
          </button>
          <button
            class="btn btn-primary"
            id="searchBtnList"
          >
            <i class="fas fa-search"></i> 조회
          </button>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="card col-xl-4">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="padding-left: 15px">자재발주 목록</h3>
      </div>
      <div class="card-body">
        <div id="grid"></div>
      </div>
    </div>

    <div class="card col-xl-7">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          자재발주 상세
        </h3>
      </div>
      <div class="card-body">
        <div id="grid2"></div>
      </div>
    </div>
  </div>
<!--   <div class="row">
    <div class="card col-xl-11">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          공정 목록
        </h3>
        <button class="btn btn-primary" id="savePrcs" style="float: right">
          <i class="fas fa-save"></i> 저장
        </button>
        <button
          class="btn btn-primary"
          id="newPrcs"
          style="float: right; margin: 0 16px"
        >
          <i class="fas fa-file"></i> 새 공정
        </button>
        <button class="btn btn-primary" id="delPrcs" style="float: right">
          <i class="fas fa-trash"></i> 삭제
        </button>
      </div>
      <div class="card-body">
        <div id="grid3"></div>
      </div>
    </div>
  </div>
</div> -->
<!-- 거래처 검색 Modal -->
         <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">업체검색</h5>
                        <br><br>                    
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div><br>
                    <div>
                    <!-- <label style="margin-left: 20px;">업체명</label>  -->                   
                     <input
                          type="text"
                          id="vendNmSearch"
                          class="form-control"
                          style="width: 150px; display:inline-block; margin-left: 20px;" placeholder="업체명검색"/>
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
      </div>
        <!-- 거래처 검색 Modal 끝-->
<script language="Javascript">

//업체명 모달창 그리드 
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

//거래처 검색 모달 함수
function searchVend() {
	let vendNm = document.getElementById("vendNmSearch").value;
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


//거래처 모달창이 뜨면
$('#exampleModal').on('shown.bs.modal', function (e) {
	  searchVend();
	})
	
 $('#exampleModal').on('hidden.bs.modal', function (e) {
	  gridVend.clear();
	  document.getElementById("vendNmSearch").value="";
	})
	
// 선택시 거래처명 변경
gridVend.on('dblclick', (ev) => {
	   document.getElementById("vendNm").value = gridVend.getData()[ev.rowKey].vendNm;
	    $('#exampleModal').modal('hide');
	    });
	  
//거래처 모달 검색 버튼 동작 
searchBtn.addEventListener("click", searchVend);  
   
//발주주문 조회 그리드
var grid = new tui.Grid({
    el: document.getElementById('grid'),
    scrollX: false,
    scrollY: true,
    bodyHeight: 400,
    columns: [
 
        {
            header: '발주번호',
            name: 'ordrCd',
        },
        {
            header: '거래처명',
            name: 'vendNm',
        },
        {
            header: '발주신청일',
            name: 'ordrReqDt',
        },
       
    ],
});  

//발주 디테일 그리드
var grid2 = new tui.Grid({
    el: document.getElementById('grid2'),
    scrollX: false,
    scrollY: true,
    bodyHeight: 400,
    columns: [
 
        {
            header: '자재코드',
            name: 'rscCd',
        },
        {
            header: '발주량',
            name: 'ordrCnt',
        },
        {
            header: '미입고잔량',
            name: 'rmnCnt',
        },
        {
            header: '납기요청일',
            name: 'paprdCmndDt',
        },
       
    ],
}); 

//자재발주목록 아작스
function search() {
    start = document.getElementById("start").value;
    end = document.getElementById("end").value;
    vendNm = document.getElementById("vendNm").value.toUpperCase();
    $.ajax({
      url: "reList",
      method: "post",
      data: { start: start, end: end, vendNm: vendNm },
      success: function (data) {
          grid.resetData(data);      	
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  };
	
	
//조회 버튼 누르면 동작
document.getElementById("searchBtnList").addEventListener('click', search);






</script>
