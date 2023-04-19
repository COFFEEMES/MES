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
  <h1 class="mt-4">제품 품질 검사</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 생산관리</li>
    <li class="breadcrumb-item active">> 제품 품질 검사</li>
  </ol>

  <div class="row">
    <div class="card col-xl-4">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="padding-left: 15px">품질 검사 제품</h3>
      </div>
      <div class="card-body">
        <div id="grid"></div>
      </div>
    </div>

    <div class="card col-xl-7">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          품질 검사 항목
        </h3>
      </div>
      <div class="card-body">
        <div id="grid2"></div>
      </div>
    </div>
  </div>
</div>
<!-- 품질 검사 실적 Modal -->
<div
  class="modal fade"
  id="testResult"
  tabindex="-1"
  role="dialog"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div
    class="modal-dialog"
    role="document"
    style="margin: 28px auto; width: 700px"
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
            </li>
            <li>
              <label>검사 항목</label>
              <input
                class="form-control"
                type="text"
                id="testItem"
                name="testItem"
                style="margin-top: 10px"
                maxlength="50"
                readonly
              />
            </li>
            <li>
              <label>검출량</label>
              <input
                class="form-control"
                type="number"
                id="testAmt"
                name="testAmt"
                style="margin-top: 10px"
                maxlength="50"
              />
              <input type="hidden" id="proCd" name="proCd" />
              <input type="hidden" id="prcsCd" name="prcsCd" />
              <input type="hidden" id="testCd" name="testCd" />
              <input type="hidden" id="empCode" name="empCode" />
              <input type="hidden" id="prOrderCd" name="prOrderCd" />
            </li>
          </ul>
          <div class="linelist" style="width: 100%">
            <button
              data-bs-toggle="modal"
              class="btn btn-primary"
              id="testEnd"
              data-bs-target="#exampleModal"
              style="float: right; margin-left: 8px; margin-top: 12px"
            >
              <i class="fas fa-search"></i> 검사 완료
            </button>
            <button
              data-bs-toggle="modal"
              class="btn btn-primary"
              id="testStart"
              data-bs-target="#exampleModal"
              style="float: right; margin-top: 12px"
            >
              <i class="fas fa-search"></i> 검사 시작
            </button>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button
          id="closeTestBtn"
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
  <c:forEach items="${insList }" var="ins">
    {
      prOrderCd : '${ins.prOrderCd}',
      proNm : '${ins.proNm}',
      proCd : '${ins.proCd}',
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
        header: '제품명',
        name: 'proNm',
        align: 'center',
      },
    ]
  });

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
    scrollY: true,
    bodyHeight: 480,
    rowHeaders: ['rowNum'],
    columns: [
      {
        header: '검사 코드',
        name: 'testCd',
        align: 'center',
      },
      {
        header: '검사 항목',
        name: 'testItem',
        align: 'center',
      },
      {
        header: '기준',
        name: 'stanPs',
        align: 'center',
      },
      {
        header: '검출량',
        name: 'testAmt',
        align: 'center',
      },
      {
        header: '합격여부',
        name: 'testPsOrNot',
        align: 'center',
      },
      {
        header: '검사 시작 시간',
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
        header: '검사 완료 시간',
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

  var selectedRowKey = null;
  var prOrderCd = '';
  var proCd = '';

  grid.on('click', ev => {
    prOrderCd = grid.getValue(ev.rowKey, 'prOrderCd');
    proCd = grid.getValue(ev.rowKey, 'proCd');
    $('#prOrderCd').val(prOrderCd);
    $('#proCd').val(proCd);

    //셀 클릭시 로우 하이라이팅
    if (selectedRowKey != ev.rowKey) {
      grid.removeRowClassName(selectedRowKey, 'highlight');
    }
    selectedRowKey = ev.rowKey;
    grid.addRowClassName(selectedRowKey, 'highlight');

    //검사 항목 list 호출
    $.ajax({
      url: "getProTest",
      method: "POST",
      data: { prOrderCd: prOrderCd, proCd: proCd },
      success: function(data) {
        gridData2 = data;
        grid2.resetData(gridData2);
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });

  //검사 항목 선택시 모달 오픈
  var selectedRowKey2 = null;
  var testCd = '';

  grid2.on('click', (ev) => {
    testCd = grid2.getValue(ev.rowKey, 'testCd');

    if( grid2.getValue(ev.rowKey, 'wkFrDttm') != null && grid2.getValue(ev.rowKey, 'wkToDttm') != null){
      Swal.fire({
        icon: "error",
        title: '이미 완료된 검사입니다',
        text: '',
      });
    } else {

      if(testCd == 'LEATEST'){
        $('#testAmt').attr('step', '0.00001')
      } else if (testCd == 'TINTEST'){
        $('#testAmt').attr('step', '0.001')
      } else {
        $('#testAmt').attr('step', '1')
      }

      if (selectedRowKey2 != ev.rowKey) {
        grid2.removeRowClassName(selectedRowKey2, 'highlight');
      }
      selectedRowKey2 = ev.rowKey;
      grid2.addRowClassName(selectedRowKey2, 'highlight');

      $('#proCd').val(proCd);
      $('#proNm').val(grid2.getValue(ev.rowKey, 'proNm'));
      $('#stock').val(grid2.getValue(ev.rowKey, 'testCnt'));
      $('#testCd').val(testCd);
      $('#testItem').val(grid2.getValue(ev.rowKey, 'testItem'));
      $('#empCode').val(grid2.getValue(ev.rowKey, 'empCode'));
      $('#empName').val(grid2.getValue(ev.rowKey, 'empName'));

      $('#testResult').modal('show');
    }
  });

  $('#closeTestBtn').on('click', () => {
    $('#testResult').modal('hide');
  })

  //모달이 꺼지면 내부 인풋 초기화
  $('#testResult').on('hidden.bs.modal', function (e) {
    $("#testAmt").val('');
    $('#empName').val('');
  })

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

  //검사 시작
  $('#testStart').on('click', () => {
    if($('#empCode').val() == null || $('#empCode').val() == ''){
      Swal.fire({
        icon: "error",
        title: '담당자가 선택되지 않았습니다',
        text: '',
      });
    } else {
      $('#testResult').modal('hide');

      $.ajax({
        url: "testStart",
        method: "POST",
        data: $("#dataForm").serialize(),
        dataType: 'json',
        success: function(data) {
          gridData2 = data;
          grid2.resetData(gridData2);
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }
  })

  //검사 완료
  $('#testEnd').on('click', () => {
    if(grid2.getValue(selectedRowKey2, 'wkFrDttm') == null) {
      Swal.fire({
        icon: "error",
        title: '시작되지 않은 검사입니다',
        text: '',
      });
    } else if($('#testAmt').val() == null || $('#testAmt').val() == ''){
      Swal.fire({
        icon: "error",
        title: '검출량이 입력되지 않았습니다',
        text: '',
      });
    } else {
      $('#testResult').modal('hide');

      $.ajax({
        url: "testEnd",
        method: "POST",
        data: $("#dataForm").serialize(),
        dataType: 'json',
        success: function(data) {
          gridData2 = data;
          grid2.resetData(gridData2);
          let reload = true;

          for(let temp of data){
            if(temp.testPsOrNot == null){
              reload = false;
            }
          }

          for(let temp of data){
            if(temp.testPsOrNot == 'N'){
              reload = true;
            }
          }

          if( reload ) {
            grid.removeRow(selectedRowKey);
            grid2.clear();
          }
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }
  })
</script>
