<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    display: inline-block;
    float: right;
    margin: 0 20px 20px 0;
  }

  #lineb {
    display: inline-block;
  }

  #pDate #planDate {
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
          <div id="pDate">
            <label>작성일자</label>
            <input
              type="date"
              id="tui-date-picker-target"
              name="tui-date-picker-target"
              class="form-control"
              style="width: 150px"
            />
          </div>
          <br />
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
    <div class="card col-xl-5">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="padding-left: 15px">생산지시 목록</h3>
      </div>
      <div class="card-body">
        <div id="grid"></div>
      </div>
    </div>

    <div class="card col-xl-6">
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
            header: '생산 지시 코드',
            name: 'prOrderCd',
            align: 'center',
            editor: 'text',
            validation: {
              required: true
            },
          },
          {
            header: '제품명',
            name: 'rscNm',
            align: 'center',
            editor: 'text',
            validation: {
              required: true
            },
          },
          {
            header: '생산 지시량',
            name: 'orderOutput',
            editor: 'text',
            align: 'center',
          },
        ]
      });

      //공통코드 추가 버튼
      $("#saveBcode").click((ev) => {
        $.ajax({
          url: "",
          type: "POST",
          data: $('#BcodeInfo').serialize(),
          success: function(result) {
              setTimeout(function () {
                grid.refreshLayout()
              }, 300);
              grid.resetData(result);
              alert('성공적으로 추가되었습니다.');
          }
        })
      })

      var rowCount = 0;
      var selectedRowKey = null;
      var basicCode = '';
      var basicName = '';

      grid.on('click', ev => {
        basicName = grid.getValue(ev.rowKey, 'basicName');
        basicCode = grid.getValue(ev.rowKey, 'basicCode');

        //셀 클릭시 로우 하이라이팅
        if (selectedRowKey != ev.rowKey) {
          grid.removeRowClassName(selectedRowKey, 'highlight');
        }
        selectedRowKey = ev.rowKey;
        grid.addRowClassName(selectedRowKey, 'highlight');

        //세부코드 list 호출
        $.ajax({
          url: "",
          method: "POST",
          data: { basicCode: basicCode},
          success: function(data) {
            if(data.length != 0){
              gridData2 = data
              grid2.resetData(gridData2);  //그리드 적용
            } else {
              gridData2 = [];
              grid2.resetData(gridData2);  //그리드 적용
              grid2.appendRow();
            }
            rowCount = grid2.getRowCount();
          },
          error: function (reject) {
            console.log(reject);
          },
        });
      });

      //체크된 열 하이라이팅
      grid2.on('check', gridCheck)

      function gridCheck (ev) {
        grid2.addRowClassName(ev.rowKey, 'highlight2');
      };

      grid2.on('uncheck', gridUncheck)
      function gridUncheck(ev) {
        grid2.removeRowClassName(ev.rowKey, 'highlight2');
      };

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

      //상세 코드 추가 버튼
      $('#newDcode').click(ev => {
        if (basicName == '' || basicName == null) {
          alert('공통코드를 먼저 선택해주세요!')
        } else if (grid2.getRow(grid2.getRowCount() - 1).detailCode == null || grid2.getRow(grid2.getRowCount() - 1).detailCode == ''){
          alert('입력이 미완료된 추가건이 있습니다.')
        } else {
          //그리드 추가
          grid2.appendRow();
          rowCount = grid2.getRowCount();
        }
      });

      //기존정보 셀 편집 막기 & 하이라이팅
      var selectedRowKey2 = null;
      grid2.on('click', (ev) => {
        const { columnName, rowKey } = ev;
        if (columnName == 'detailCode') {
          if (grid2.getModifiedRows().createdRows.length == 0 || rowKey < rowCount - 1 ) {
            alert('이미 저장된 코드ID는 변경할 수 없습니다.');
            return;
          }
        }

        if (selectedRowKey2 != ev.rowKey) {
          grid2.removeRowClassName(selectedRowKey2, 'highlight2');
        }
        selectedRowKey2 = ev.rowKey;
        grid2.addRowClassName(selectedRowKey2, 'highlight2');
      });

      $('#grid2').mouseleave(ev => {
        grid2.finishEditing();
      })

      //상세 코드 저장 버튼
      $('#saveDcode').click(ev => {
        var data = grid2.getCheckedRows();
        if (data.length == 0){
          alert("선택된 행이 없습니다")
        } else {
          for(let temp of data) {
            temp.basicCode = basicCode
          }
          $.ajax({
            url: "",
            type: "POST",
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function (result) {
              setTimeout(function () {
                grid2.refreshLayout()
                grid2.uncheckAll()
              }, 300);
              grid2.resetData(result);
              alert('성공적으로 저장되었습니다.');
            }
          })
        }
      })
  </script>
</div>
