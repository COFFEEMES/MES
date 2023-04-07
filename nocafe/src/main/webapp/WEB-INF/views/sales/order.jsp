<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>주문서 관리</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <link
      rel="stylesheet"
      href="https://uicdn.toast.com/grid/latest/tui-grid.css"
    />
    <style>
      .c_btn {
        color: #fff;
        font-size: 13px;
        background: #333;
        border: none;
        padding: 6px;
        border-radius: 4px;
      }
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
              </div>
              <form name="searchFrm" id="searchFrm">
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
                    <label>거래처명</label>                    
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
                    <div id="modGrid" class="modal-body"></div>
                    <div class="modal-footer">
                        <button type="button" id="confirmBtn" class="btn btn-primary"
                            data-bs-dismiss="modal">확인</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>   
        <!-- 거래처 검색 Modal 끝-->
        
        <!-- 상세조회 Modal -->
         <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">주문서 상세조회</h5>
                        <br><br>                    
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div><br>               
                    <div id="modGrid" class="modal-body"></div>
                    <div class="modal-footer">
                        <button type="button" id="confirmBtn" class="btn btn-primary"
                            data-bs-dismiss="modal">확인</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>   
        <!-- 상세조회 Modal 끝-->
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
      <button class="btn btn-primary" id="okBtn">
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
    let start = ""; //주문일자 검색
    let end = ""; //주문일자 검색
    let vendNm = ""; //거래처명 검색
    let checkLen = 0; //체크박스 선택 개수
    let vendSearch=""; //모달창 거래처명 저장변수

    
   

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
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }

    //조회 그리드
    var grid = new tui.Grid({
      el: document.getElementById("order"),
      rowHeaders: ['checkbox'],
    	  
      columns: [
        {
          header: "주문번호",
          name: "orderNo",
        },
        {
          header: "거래처코드",
          name: "vendCd",
        },
        {
          header: "거래처",
          name: "vendNm",
        },
        {
          header: "주문일자",
          name: "orderDt",
          formatter: function (data) {
            return dateChange(data.value);
          },
        },
        {
          header: "진행상황",
          name: "orderSit",
        },
        {
          header: "납기일자",
          name: "parrdDt",
          formatter: function (data) {
            return dateChange(data.value);
          },
        },
      ],
      pageOptions: {
          useClient: true,
          type: 'scroll',
          perPage: 30
       }
    });
    
    grid.on('check', (ev) => {
    	checkLen = grid.getCheckedRows().length;
    	console.log('check',ev);
    	});

    	grid.on('uncheck', (ev) => {
    		checkLen = grid.getCheckedRows().length;
    	});
    	
    	//상세주문
    	grid.on('click', (ev) => {
 	 	 if(ev.targetType=='cell' && ev.columnName =='orderNo')
 			 //그리드 동작
 			 console.log("ㄴㅇㄹㄴㅇ");
 	 	 $('#myModal').show();
 		  
 		});

    	
    //조회버튼 동작
    ordrBtn.addEventListener("click", search);

    //날짜 변환
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
    }
 
    //거래처 검색 모달 함수
  function searchVend() {
	 vendNm = document.getElementById("vendNmSearch").value.toUpperCase() ;
     $.ajax({
       url: "vendSearch",
       method: "post",
       data: {vendNm: vendNm },
       success: function(data) {  	
    	   gridVend.resetData(data);
       },
       error: function (reject) {
         console.log(reject);
       },

     }); 
 }  
 
 //거래처 검색 모달창 그리드 
	  var gridVend = new tui.Grid({
      el: document.getElementById('modGrid'),
      rowHeaders: [
    	    {
    	      type: 'checkbox'
    	    }
    	  ],
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
 
	  gridVend.on('check', (ev) => {
		  vendSearch = gridVend.getCheckedRows()[0].vendNm;
		  console.log(vendSearch);
	    	});
	  
	  


//거래처 모달 검색 버튼 동작 
searchBtn.addEventListener("click", searchVend);  
 
//거래처 모달창 확인버튼
confirmBtn.addEventListener("click", function(){
	vendNmInput.value=vendSearch;
	console.log(vendSearch);
	console.log(vendNmInput.value);
}); 
  

    //삭제버튼 함수 
    function orderDel() {
  	let str="";
      
      for (let i = 0; i < checkLen; i++) {
        str += grid.getCheckedRows()[i].orderNo + ",";
      }
      console.log(str);
      $.ajax({
        url: "orderDelete",
        method: "post",
        data: { str: str },
        success: function (data) {
          console.log(data);
          location.reload();
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }

    //삭제버튼 동작
    delBtn.addEventListener("click", orderDel);
    
    
  </script>
</html>
