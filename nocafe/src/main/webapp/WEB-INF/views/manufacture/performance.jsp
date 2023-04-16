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
  <h1 class="mt-4">생산실적</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 생산관리</li>
    <li class="breadcrumb-item active">> 생산실적</li>
  </ol>
  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <div id="lineb">
          <div id="planDate">
            <label>생산지시일자</label>
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
            data-bs-toggle="modal"
            class="btn btn-primary"
            id="modalBtn"
            data-bs-target="#exampleModal"
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

    let gridData2 = [];
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
          name: 'prEndtDt',
          align: 'center',
          formatter: function (data) {
            if (data.prEndtDt == null){
              return '미완료';
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

      //셀 클릭시 로우 하이라이팅
      if (selectedRowKey != ev.rowKey) {
        grid.removeRowClassName(selectedRowKey, 'highlight');
      }
      selectedRowKey = ev.rowKey;
      grid.addRowClassName(selectedRowKey, 'highlight');

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
        },
        {
          header: '생산량',
          name: 'output',
          align: 'center',
        },
        {
          header: '공정 진행 상태',
          name: 'completed',
          align: 'center',
        },
      ]
    });

  var proCd = '';

  //제품 선택시 공정 출력
  var selectedRowKey2 = null;

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
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });
</script>
