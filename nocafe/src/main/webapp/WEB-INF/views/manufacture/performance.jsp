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

  .modal {
    --bs-modal-width: none !important;
  }

  #resultUl {
    list-style: none;
    padding: 0;
  }

  #resultUl > li {
    height: 55px;
    width: 48%;
    display: inline-block;
  }

  #resultUl > li > label {
    margin-top: 16px;
    float: left;
    width: 30%;
    height: 31px;
    text-align: center;
    vertical-align: auto;
  }

  .form-control {
    width: 60%;
  }

  .pro-qty {
    width: 140px;
    height: 50px;
    display: inline-block;
    position: relative;
    text-align: center;
    background: #f5f5f5;
    margin-bottom: 5px;
  }

  .pro-qty input {
    height: 100%;
    width: 100%;
    font-size: 16px;
    color: #6f6f6f;
    width: 50px;
    border: none;
    background: #f5f5f5;
    text-align: center;
  }

  .pro-qty .qtybtn {
    width: 35px;
    font-size: 16px;
    color: #6f6f6f;
    cursor: pointer;
    display: inline-block;
  }
</style>
<div class="container-fluid px-4">
  <h1 class="mt-4">생산실적</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 생산관리</li>
    <li class="breadcrumb-item active">> 생산실적</li>
  </ol>

  <div class="row">
    <div class="card col-xl-4">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="padding-left: 15px">생산지시 목록</h3>
      </div>
      <div class="card-body">
        <div id="grid"></div>
      </div>
    </div>

    <div class="card col-xl-7">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          생산지시 상세
        </h3>
      </div>
      <div class="card-body">
        <div id="grid2"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="card col-xl-11">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          공정 실적 관리
        </h3>
      </div>
      <div class="card-body">
        <div id="grid3"></div>
      </div>
    </div>
  </div>
</div>
<!-- 공정 실적 Modal -->
<div
  class="modal fade"
  id="prcsResult"
  tabindex="-1"
  role="dialog"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div
    class="modal-dialog"
    role="document"
    style="margin: 28px auto; width: 1000px"
  >
    <div class="modal-content">
      <div class="modal-body">
        <form id="dataForm" name="dataForm" onsubmit="return false">
          <ul id="resultUl">
            <li>
              <label>제품명</label>
              <input
                class="form-control"
                type="text"
                id="proNm"
                name="proNm"
                style="margin-top: 10px"
                maxlength="50"
                readonly
              />
            </li>
            <li>
              <label>공정명</label>
              <input
                class="form-control"
                type="text"
                id="prcsNm"
                name="prcsNm"
                style="margin-top: 10px"
                maxlength="50"
                readonly
              />
            </li>
            <li>
              <label>작업자</label>
              <input
                class="form-control"
                type="text"
                id="empName"
                name="empName"
                style="margin-top: 10px"
                maxlength="50"
                readonly
              />
            </li>
            <li>
              <label>투입량</label>
              <input
                class="form-control"
                type="text"
                id="stock"
                name="stock"
                style="margin-top: 10px"
                maxlength="50"
                readonly
              />
              <input type="hidden" id="prcsCd" name="prcsCd" />
              <input type="hidden" id="empCode" name="empCode" />
              <input type="hidden" id="proCd" name="proCd" />
              <input type="hidden" id="eqmCd" name="eqmCd" />
              <input type="hidden" id="prOrderCd" name="prOrderCd" />
              <input type="hidden" id="bomSq" name="bomSq" />
            </li>
          </ul>
          <h5>사용 가능 설비</h5>
          <div id="grid4" style="width: 35%; display: inline-block"></div>
          <div id="grid5" style="width: 60%; display: inline-block"></div>
          <div class="linelist" style="width: 100%">
            <span>불량등록</span>
            <div class="pro-qty">
              <input type="text" value="0" id="inferCnt" name="inferCnt" />
            </div>

            <button
              data-bs-toggle="modal"
              class="btn btn-primary"
              id="prcsEnd"
              data-bs-target="#exampleModal"
              style="float: right; margin-left: 8px; margin-top: 12px"
            >
              <i class="fas fa-search"></i> 작업 완료
            </button>
            <button
              data-bs-toggle="modal"
              class="btn btn-primary"
              id="prcsStart"
              data-bs-target="#exampleModal"
              style="float: right; margin-top: 12px"
            >
              <i class="fas fa-search"></i> 작업 시작
            </button>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button
          id="closePrcsBtn"
          type="button"
          class="btn btn-secondary"
          data-dismiss="modal"
        >
          닫기
        </button>
      </div>
    </div>
  </div>
</div>
<!-- 담당사원 선택 Modal -->
<div
  class="modal fade"
  id="empModal"
  tabindex="-1"
  role="dialog"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog" role="document" style="width: 500px">
    <div class="modal-content">
      <div class="modal-header">
        <input
          type="text"
          id="searchEmpInput"
          name="searchEmpInput"
          class="form-control"
          placeholder="사원이름 검색"
        />
        <button class="btn btn-primary" id="searchEmp" style="margin-top: 20px">
          <i class="fas fa-search"></i> 검색
        </button>
      </div>
      <div class="modal-body" id="grid6"></div>
      <div class="modal-footer">
        <button
          id="closeEmpBtn"
          type="button"
          class="btn btn-secondary"
          data-dismiss="modal"
        >
          닫기
        </button>
      </div>
    </div>
  </div>
</div>
<script language="Javascript">
  let gridData = [
  <c:forEach items="${instList }" var="inst">
    {
      prOrderCd : '${inst.prOrderCd}',
      prOrderDt : '${inst.formedDate}',
    },
  </c:forEach>
  ];

  let searchData = [];

  const grid = new tui.Grid({
    el: document.getElementById('grid'),
    data: gridData,
    scrollY: true,
    bodyHeight: 480,
    rowHeaders: ['rowNum'],
    columns: [
      {
        header: '생산 지시 코드',
        name: 'prOrderCd',
        align: 'center',
      },
      {
        header: '지시 일자',
        name: 'prOrderDt',
        align: 'center',
        formatter: function (data) {
      	  let dateVal = '';
      	  if(data.value != null ){
      		  dateVal = dateChange(data.value);
      	  }else{
      		  dateVal = getToday();
      	  }
          return dateVal;
        },
      },
    ]
  });

  function dateChange(date) {
    let date1 = new Date(date);
    let date2 = date1.getFullYear() + "-"
              + (date1.getMonth() < 10 ? "0" + (date1.getMonth() + 1): date1.getMonth() + 1) + "-"
              + (date1.getDate() < 10 ? "0" + date1.getDate() : date1.getDate());
    return date2;
  }

  //테마 호버
  let hoverOption = {
    row: {
      hover: {
        background: 'rgba(19,78,94,0.2)'
      }
    }
  }

  tui.Grid.applyTheme('default', hoverOption);

  let gridData2 = [];

  const grid2 = new tui.Grid({
    el: document.getElementById('grid2'),
    scrollY: false,
    bodyHeight: 480,
    rowHeaders: ['rowNum'],
    columns: [
      {
        header: '제품 코드',
        name: 'proCd',
        align: 'center',
      },
      {
        header: '제품명',
        name: 'proNm',
        align: 'center',
      },
      {
        header: '지시 수량',
        name: 'orderOutput',
        align: 'center',
      },
      {
        header: '진행상태',
        name: 'prEndDt',
        align: 'center',
        formatter: function (data) {
          if (data.row.prStartDt == null){
            return '진행전';
          } else if(data.row.prEndDt == null) {
            return '진행중';
          } else {
            return '생산 완료';
          }
        },
      },
    ]
  });

  var selectedRowKey = null;
  var prOrderCd = '';

  grid.on('click', ev => {
    prOrderCd = grid.getValue(ev.rowKey, 'prOrderCd');
    $('#prOrderCd').val(prOrderCd);

    //셀 클릭시 로우 하이라이팅
    if (selectedRowKey != ev.rowKey) {
      grid.removeRowClassName(selectedRowKey, 'highlight');
    }
    selectedRowKey = ev.rowKey;
    grid.addRowClassName(selectedRowKey, 'highlight');

    grid3.clear();

    //생산지시 상세 list 호출
    $.ajax({
      url: "getPrOrderDetail",
      method: "POST",
      data: { prOrderCd: prOrderCd},
      success: function(data) {
        gridData2 = data;
        grid2.resetData(gridData2);
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });

  //검색버튼
  $('#searchBtn').click(ev => {
    search();
  })

  function search() {
    var keyword = $('#searchBcode').val()
    searchData = gridData.filter( function (Bcode) {
      return Bcode.basicName.indexOf(keyword) != -1
    })
    grid.resetData(searchData);
  }

  let gridData3 = [];

  const grid3 = new tui.Grid({
    el: document.getElementById('grid3'),
    scrollY: true,
    bodyHeight: 480,
    rowHeaders: ['rowNum'],
    columns: [
      {
        header: '공정 코드',
        name: 'prcsCd',
        align: 'center',
      },
      {
        header: '공정명',
        name: 'prcsNm',
        align: 'center',
      },
      {
        header: '투입량',
        name: 'stock',
        align: 'center',
        formatter: function (data) {
          if (data.row.stock == 0){
            return '';
          } else {
            return data.row.stock;
          }
        },
      },
      {
        header: '불량량',
        name: 'badQuantity',
        align: 'center',
        formatter: function (data) {
          if (data.row.badQuantity == 0){
            return '';
          } else {
            return data.row.badQuantity;
          }
        },
      },
      {
        header: '생산량',
        name: 'output',
        align: 'center',
        formatter: function (data) {
          if (data.row.output == 0){
            return '';
          } else {
            return data.row.output;
          }
        },
      },
      {
        header: '담당자',
        name: 'empName',
        align: 'center',
      },
      {
        header: '공정 진행 상태',
        name: 'completed',
        align: 'center',
        formatter: function (data) {
          if (data.row.wkFrDttm == null){
            return '진행전';
          } else if( data.row.wkToDttm == null) {
            return '진행중';
          } else {
            return '완료';
          }
        },
      },
      {
        header: '시작 시간',
        name: 'wkFrDttm',
        align: 'center',
        formatter: function (data) {
          if( data.row.wkFrDttm == null) {
            return '';
          } else {
            return dateChange2(data.row.wkFrDttm);
          }
        },
      },
      {
        header: '완료 시간',
        name: 'wkToDttm',
        align: 'center',
        formatter: function (data) {
          if( data.row.wkToDttm == null) {
            return '';
          } else {
            return dateChange2(data.row.wkToDttm);
          }
        },
      },
    ]
  });

  function dateChange2(date) {
    function pad(n) { return n<10 ? "0"+n : n }
    d = new Date(date);
    d.setHours(d.getHours() + 9);
    return d.getFullYear()+"-"+
    pad(d.getMonth()+1)+"-"+
    pad(d.getDate())+" "+
    pad(d.getHours())+":"+
    pad(d.getMinutes())
  }


  //제품 선택시 공정 출력
  var selectedRowKey2 = null;
  var proCd = '';

  grid2.on('click', (ev) => {
    proCd = grid2.getValue(ev.rowKey, 'proCd');

    if (selectedRowKey2 != ev.rowKey) {
      grid2.removeRowClassName(selectedRowKey2, 'highlight');
    }
    selectedRowKey2 = ev.rowKey;
    grid2.addRowClassName(selectedRowKey2, 'highlight');

    $.ajax({
      url: "getPrcsBom",
      method: "POST",
      data: { prOrderCd: prOrderCd, proCd: proCd},
      success: function(data) {
        gridData3 = data;
        grid3.resetData(gridData3);
        let addClass = grid3.getData();
        for(let i = 0; i < addClass.length; i++) {
          if(addClass[i].wkFrDttm != null && addClass[i].wkToDttm == null ){
            grid3.addRowClassName(i, 'highlight2');
          } else {
            grid3.removeRowClassName(i, 'highlight2');
          }
        }
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });

  let gridData4 = [];

  const grid4 = new tui.Grid({
    el: document.getElementById('grid4'),
    scrollX: true,
    scrollY: true,
    bodyHeight: 200,
    columns: [
      {
        header: '설비 코드',
        name: 'eqmCd',
        align: 'center',
      },
      {
        header: '설비명',
        name: 'eqmNm',
        align: 'center',
      },
    ]
  });

  let gridData5 = [];

  const grid5 = new tui.Grid({
    el: document.getElementById('grid5'),
    scrollX: true,
    scrollY: true,
    bodyHeight: 200,
    columns: [
      {
        header: '자재 코드',
        name: 'rscCd',
        align: 'center',
      },
      {
        header: '자재명',
        name: 'rscNm',
        align: 'center',
      },
      {
        header: '사용량',
        name: 'rscUse',
        align: 'center',
        editor: 'text',
      },
    ]
  });

  //공정 선택시 실적 입력 모달
  let prcsCd = '';
  let selectedRowKey3 = 0;

  grid3.on('click', (ev) => {
    let { columnName, rowKey } = ev;
    prcsCd = grid3.getValue(rowKey, 'prcsCd');

    selectedRowKey3 = rowKey;

    $.ajax({
      url: "getPrcsEqm",
      method: "POST",
      data: { prcsCd:prcsCd },
      success: function(data) {
        gridData4 = data;
        grid4.resetData(gridData4);
        setTimeout(()=> grid4.refreshLayout(), 300);
      },
      error: function (reject) {
        console.log(reject);
      },
    });

    $.ajax({
      url: "getPrcsRsc",
      method: "POST",
      data: { proCd:proCd ,prcsCd:prcsCd },
      success: function(data) {
        gridData5 = data;
        grid5.resetData(gridData5);
        $.ajax({
          url: "getUseCnt",
          method: "POST",
          data: { prOrderCd:prOrderCd, proCd:proCd ,prcsCd:prcsCd },
          success: function(data2) {
            for(let temp of data2){
              let g5 = grid5.getData();
              for(let i = 0;  i < g5.length; i++){
                if(temp.rscCd == g5[i].rscCd){
                  grid5.setValue(i, 'rscUse', temp.rscUse);
                }
              }
            }
            setTimeout(()=> grid5.refreshLayout(), 300);
          },
          error: function (reject) {
            console.log(reject);
          },
        });
      },
      error: function (reject) {
        console.log(reject);
      },
    });


    if( grid3.getValue(rowKey, 'wkFrDttm') != null && grid3.getValue(rowKey, 'wkToDttm') != null) {
      Swal.fire({
        icon: "error",
        title: '이미 완료된 공정입니다',
        text: '',
      });
    } else if( rowKey == 0 || grid3.getValue(rowKey - 1, 'wkFrDttm') != null && grid3.getValue(rowKey - 1, 'wkToDttm') != null){
      if(grid3.getRow(rowKey).prcsCd.indexOf('PRCTES') != -1){
        Swal.fire({
          title: '픔질 검사중인 제품입니다',
          text: '품질 검사 페이지로 이동하시겠습니까?',
          icon: 'warning',

          showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
          confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
          cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
          confirmButtonText: '확인', // confirm 버튼 텍스트 지정
          cancelButtonText: '취소', // cancel 버튼 텍스트 지정

          reverseButtons: true, // 버튼 순서 거꾸로
        }).then(result => {
          if(result.isConfirmed){
            location.href = "inspection";
          } else if (result.isDismissed){
            return;
          }
        })
      } else {

        $('#proNm').val(grid2.getValue(selectedRowKey2, 'proNm'));
        $('#proCd').val(proCd);
        $('#prcsNm').val(grid3.getValue(rowKey, 'prcsNm'));
        $('#prcsCd').val(prcsCd);
        $('#stock').val(grid3.getValue(rowKey, 'stock'));
        $('#bomSq').val(grid3.getValue(rowKey, 'bomSq'));
        $('#empCode').val(grid3.getValue(rowKey, 'empCode'));
        $('#empName').val(grid3.getValue(rowKey, 'empName'));
        $('#eqmCd').val(grid3.getValue(rowKey, 'eqmCd'));
        $('#prcsResult').modal('show');
      }
    } else if( grid3.getData().length == 0) {
      Swal.fire({
        icon: "error",
        title: '제품이 선택되지 않았습니다',
        text: '',
      });
    } else {
      Swal.fire({
        icon: "error",
        title: '이전 공정이 완료되지 않았습니다',
        text: '',
      });
    }
  })

  $('#grid5').mouseleave(ev => {
    grid5.finishEditing();
  })

  //공정 실적 모달 닫기
  $('#closePrcsBtn').on('click', () => {
    $('#prcsResult').modal('hide');
  })

  //불량 갯수 증감 버튼
  var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
      var $button = $(this);
      var oldValue = $button.parent().find('input').val();
      if ($button.hasClass('inc')) {
        var newVal = parseFloat(oldValue) + 1;
      } else {
        // Don't allow decrementing below zero
        if (oldValue > 0) {
          var newVal = parseFloat(oldValue) - 1;
        } else {
          newVal = 0;
        }
      }
      $button.parent().find('input').val(newVal);
  });

  //담당사원 전체조회
  $("#empName").on('click', searchEmp)

  function searchEmp () {
    setTimeout(()=> grid6.refreshLayout() , 300);
    $('#empModal').modal('show');
  }

  //담당사원 그리드
  const gridData6 = [
    <c:forEach items="${empList }" var="emp">
      {
        empCode : '${emp.empCode}',
        empName : '${emp.empName}',
        dept : '${emp.detailName}',
      },
    </c:forEach>
  ];

  const grid6 = new tui.Grid({
    el: document.getElementById("grid6"),
    scrollX: false,
    bodyHeight: 500,
    data: gridData6,
    rowHeaders: ["rowNum"],
    columns: [
      {
        header: "사원 코드",
        name: "empCode",
        align: "center",
      },
      {
        header: "사원명",
        name: "empName",
        align: "center",
      },
      {
        header: "직책",
        name: "dept",
        align: "center",
      },
    ],
  });

  //담당사원 선택시 값 입력, 모달창 종료
  grid6.on('click', (ev) => {
    $("#empCode").val(grid6.getValue(ev.rowKey, "empCode"));
    $("#empName").val(grid6.getValue(ev.rowKey, "empName"));
    $('#empModal').modal('hide');
  })

  //담당사원 검색
  let searchEmpArr = [];
  $("#searchEmp").on('click', () => {
    var keyword = $('#searchEmpInput').val()
    searchEmpArr = gridData6.filter( function (emp) {
      return emp.empName.indexOf(keyword) != -1
    })
    grid6.resetData(searchEmpArr);
  })

  //사원 검색 닫기 버튼
  $('#closeEmpBtn').on('click', () => {
    $('#empModal').modal('hide');
  })


  //모달이 꺼지면 내부 인풋 초기화
  $('#prcsResult').on('hidden.bs.modal', function (e) {
    $("#empName").val('');
  })

  //설비 그리드 선택
  var selectedRowKey4 = null;
  var eqmCd = '';

  grid4.on('click', (ev) => {
    if( grid3.getValue(selectedRowKey3, 'wkFrDttm') == null){
      eqmCd = grid4.getValue(ev.rowKey, 'eqmCd');
      $('#eqmCd').val(eqmCd);

      if (selectedRowKey4 != ev.rowKey) {
        grid4.removeRowClassName(selectedRowKey4, 'highlight');
      }
      selectedRowKey4 = ev.rowKey;
      grid4.addRowClassName(selectedRowKey4, 'highlight');
    }
  });

  //작업 시작 버튼
  $('#prcsStart').on('click', () => {
    if($('#empCode').val() == null || $('#empCode').val() == ''){
      Swal.fire({
        icon: "error",
        title: '담당자가 선택되지 않았습니다',
        text: '',
      });
    } else if($('#eqmCd').val() == null ||  $('#eqmCd').val() == ''){
      Swal.fire({
        icon: "error",
        title: '설비가 선택되지 않았습니다',
        text: '',
      });
    } else {
      let data = grid5.getData();
      for(let temp of data){
        temp.proNm = $('#proNm').val();
        temp.proCd = $('#proCd').val();
        temp.prcsNm = $('#prcsNm').val();
        temp.prcsCd = $('#prcsCd').val();
        temp.empName = $('#empName').val();
        temp.empCode = $('#empCode').val();
        temp.stock = $('#stock').val();
        temp.eqmCd = $('#eqmCd').val();
        temp.prOrderCd = $('#prOrderCd').val();
        temp.bomSq = $('#bomSq').val();
        temp.inferCnt = $('#inferCnt').val();
      }

      for(let i = 1; i < data.length; i++){
        data[i].inferCnt = 0;
      }

      $('#prcsResult').modal('hide');
      $.ajax({
        url: "prcsStart",
        method: "POST",
        data: JSON.stringify(data),
        contentType: 'application/json',
        dataType: "json",
        success: function(data) {
          gridData3 = data;
          grid3.resetData(gridData3);
          setTimeout(()=> grid3.refreshLayout(), 300);
          let addClass = grid3.getData();
          for(let i = 0; i < addClass.length; i++) {
            if(addClass[i].wkFrDttm != null && addClass[i].wkToDttm == null ){
              grid3.addRowClassName(i, 'highlight2');
            } else {
              grid3.removeRowClassName(i, 'highlight2');
            }
          }
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }
  })

  //작업 완료 버튼
  $('#prcsEnd').on('click', () => {
    let endAble = true;
    for( let temp of grid5.getData()){
      if( temp.rscUse == null || temp.rscUse == ''){
        endAble = false;
        Swal.fire({
          icon: "error",
          title: '자재 사용량을 입력해 주세요',
          text: '',
        });
        return;
      }
    }

    if( grid3.getValue(selectedRowKey3, 'wkFrDttm') == null ){
      Swal.fire({
        icon: "error",
        title: '시작되지 않은 공정입니다!',
        text: '',
      });
      return;
    }

    let data = grid5.getData();
    for(let temp of data){
      temp.proNm = $('#proNm').val();
      temp.proCd = $('#proCd').val();
      temp.prcsNm = $('#prcsNm').val();
      temp.prcsCd = $('#prcsCd').val();
      temp.empName = $('#empName').val();
      temp.empCode = $('#empCode').val();
      temp.stock = $('#stock').val();
      temp.eqmCd = $('#eqmCd').val();
      temp.prOrderCd = $('#prOrderCd').val();
      temp.bomSq = $('#bomSq').val();
      temp.inferCnt = $('#inferCnt').val();
    }

    for(let i = data.length - 2; i >= 0; i--){
      data[i].inferCnt = 0;
    }

    if( endAble ){
      $('#prcsResult').modal('hide');

      $.ajax({
        url: "prcsEnd",
        method: "POST",
        data: JSON.stringify(data),
        contentType: 'application/json',
        dataType: "json",
        success: function(data) {
          gridData3 = data;
          grid3.resetData(gridData3);
          setTimeout(()=> grid3.refreshLayout(), 300);
          let addClass = grid3.getData();
          for(let i = 0; i < addClass.length; i++) {
            if(addClass[i].wkFrDttm != null && addClass[i].wkToDttm == null ){
              grid3.addRowClassName(i, 'highlight2');
            } else {
              grid3.removeRowClassName(i, 'highlight2');
            }
          }
          if (grid3.getData()[grid3.getData().length-1].wkToDttm != null){
            grid2.setValue(selectedRowKey2, 'prEndDt', grid3.getData()[grid3.getData().length-1].wkToDttm);
            grid2.refreshLayout()
          }
          let reload = true;
          for(let temp of grid2.getData()){
            if(temp.prEndDt == null){
              reload = false;
            }
          }
          if(reload){
            grid.removeRow(selectedRowKey);
            grid2.clear();
            grid3.clear();
          }
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }
  })
</script>
