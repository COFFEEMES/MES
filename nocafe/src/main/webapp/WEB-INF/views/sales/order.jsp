<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>주문서 관리</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
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
                          id="openVend"
                          data-bs-toggle="modal"
                          data-bs-target="#comModal"
                        >
                          <i class="fas fa-search"></i>
                        </button>
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
      <br>
      <br>
            <div id="order"></div>
    </div> 
  </body>

  <script>
    let ordrBtn = document.getElementById("ordrBtn");
    let openVend =  document.getElementById("openVend");
    let DelBtn =  document.getElementById("DelBtn");
    let start = '';
    let end = '';
    let vendNm = '';

 //조회버튼 눌렀을때
    function search() {
    	start = document.getElementById("start").value;
    	end = document.getElementById("end").value;
    	vendNm = document.getElementById("vendNm").value.toUpperCase() ;
      $.ajax({
        url: "orderSearch",
        method: "post",
        data: { start: start, end: end, vendNm: vendNm },
        success: function(data) {  	
        	grid.resetData(data);  //그리드 적용
        },
        error: function (reject) {
          console.log(reject);
        },

      });
    }
  
//조회 그리드
   var grid = new tui.Grid({
        el: document.getElementById('order'),
        rowHeaders: ['checkbox'],
        columns: [
     
            {
                header: '주문번호',
                name: 'orderNo',
            },
            {
                header: '거래처코드',
                name: 'vendCd',
            },
            {
                header: '거래처',
                name: 'vendNm',
            },
            {
                header: '주문일자',
                name: 'orderDt',
                formatter : function(data){		 	
                	return dateChange(data.value);
                }
            },
            {
                header: '진행상황',
                name: 'orderSit',
            },
            {
                header: '납기일자',
                name: 'parrdDt',
                formatter : function(data){		 	
                	return dateChange(data.value);
                }
            }
        ]
	
    });

//조회버튼 동작
  ordrBtn.addEventListener("click", search);
 
//날짜 변환
   function dateChange(date) {
	   	let date1 = new Date(date);
		let date2 = date1.getFullYear() + '-' 
				+ ((date1.getMonth()<10)?'0'+(date1.getMonth()+1):(date1.getMonth()+1)) + '-'
				 + ((date1.getDate()<10)?'0'+date1.getDate():date1.getDate())	;	 	
   	return date2;
   }
   
 //거래처 검색  --> 해야됨
  function searchVend() {
	 vendNm = document.getElementById("vendNm").value.toUpperCase() ;
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
 
//거래처 검색 모달창 그리드 --> 해야됨
	  var gridVend = new tui.Grid({
      //el: document.getElementById(''), 추가
      rowHeaders: ['checkbox'],
      columns: [
   
          {
              header: '거래처',
              name: 'vendNm',
          },
          {
              header: '거래처코드',
              name: 'vendCd',
          },
         
      ]
	
  }); 

//거래처 검색 버튼 동작 --> 해야됨
 openVend.addEventListener("click", searchVend);
 
 
//삭제버튼 함수 --> 수정하기
function orderDel() {
	let str="";
	for(int i=0; grid.getCheckedRows().length; i++){
		str += grid.getCheckedRows()[i].orderNo + ",";	
	}
      $.ajax({
        url: "orderDelete",
        method: "post",
        data: {str:str},
        success: function(data) {  	
        	console.log(data);
        },
        error: function (reject) {
          console.log(reject);
        },

      });
    }

//삭제버튼 동작
 openVend.addEventListener("click", orderDel);


  </script>
</html>
