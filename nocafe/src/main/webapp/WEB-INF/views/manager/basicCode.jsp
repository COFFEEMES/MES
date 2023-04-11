<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"
></script>
<div class="container-fluid px-4">
  <h1 class="mt-4">공통코드관리</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 기준정보관리</li>
    <li class="breadcrumb-item active">> 공통코드관리</li>
  </ol>
  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <label for="" autofocus="autofocus">코드명</label>
        <input
          type="text"
          class="form-control"
          id="searchBcode"
          name="searchBcode"
          style="width: 150px"
        />
        <button class="btn btn-primary" id="searchBtn">
          <i class="fas fa-search"></i> 검색
        </button>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="card col-xl-4">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          공통 코드
        </h3>
        <div style="width: 100%; padding: 0 15px; margin-top: 5px">
          <form id="BcodeInfo" name="BcodeInfo" onsubmit="return false">
            <button
              class="btn btn-primary"
              id="saveBcode"
              style="float: right; width: 28%; height: 81px"
            >
              <i class="fas fa-save"></i> 추가
            </button>
            <input
              type="text"
              class="form-control"
              id="newBcode"
              name="basicCode"
              style="width: 70%"
              placeholder="공통 코드"
            />
            <input
              type="text"
              class="form-control"
              id="newBname"
              name="basicName"
              style="width: 70%; margin-top: 5px"
              placeholder="코드명"
            />
          </form>
        </div>
      </div>
      <div class="card-body">
        <div id="grid"></div>
      </div>
    </div>

    <div class="card col-xl-7">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          상세 코드
        </h3>
        <button
          class="btn btn-primary"
          id="saveDcode"
          style="float: right; margin-left: 16px"
        >
          <i class="fas fa-save"></i> 저장
        </button>
        <button
          class="btn btn-primary"
          id="newDcode"
          style="float: right; margin-left: 16px"
        >
          <i class="fas fa-file"></i> 추가
        </button>
      </div>
      <div class="card-body">
        <div id="grid2"></div>
      </div>
    </div>
  </div>
</div>
<script language="Javascript">
  let gridData = [
    <c:forEach items="${basicCode }" var="Bcode">
      {
        basicCode : '${Bcode.basicCode}',
        basicName : '${Bcode.basicName}'
      },
    </c:forEach>
  ];
  let gridData2 = [];
  let searchData = [];

  const grid = new tui.Grid({
    el: document.getElementById('grid'),
    data: gridData,
       scrollY: true,
       bodyHeight: 500,
       rowHeaders: ['rowNum'],
       columns: [
         {
           header: '공통 코드',
           name: 'basicCode',
           align: 'center',
          },
          {
            header: '코드명',
            name: 'basicName',
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

  const grid2 = new tui.Grid({
    el: document.getElementById('grid2'),
    scrollY: false,
    bodyHeight: 500,
    rowHeaders: ['checkbox'],
    columns: [
      {
        header: '상세 코드',
        name: 'detailCode',
        align: 'center',
        editor: 'text',
        validation: {
          required: true
        },
      },
      {
        header: '상세 코드명',
        name: 'detailName',
        align: 'center',
        editor: 'text',
        validation: {
          required: true
        },
      },
      {
        header: '상세 코드 설명',
        name: 'detailExplain',
        editor: 'text',
        align: 'center',
      },
      {
        header: '사용 여부',
        name: 'detailAvail',
        editor: {
          type: 'select',
          options: {
            listItems: [{
              text: 'Yes',
              value: 'Y'
            },
            {
              text: 'No',
              value: 'N'
            }]
          }
        },
        align: 'center',
      },
    ]
  });

  //공통코드 추가 버튼
  $("#saveBcode").click((ev) => {
    $.ajax({
      url: "insertBcode",
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

  grid.on('click', ev => {
    var basicName = grid.getValue(ev.rowKey, 'basicName');
    basicCode = grid.getValue(ev.rowKey, 'basicCode');
    $('#searchBcode').val(basicName);

    //셀 클릭시 로우 하이라이팅
    if (selectedRowKey != ev.rowKey) {
      grid.removeRowClassName(selectedRowKey, 'highlight');
    }
    selectedRowKey = ev.rowKey;
    grid.addRowClassName(selectedRowKey, 'highlight');

    //세부코드 list 호출
    $.ajax({
      url: "getDetailCode",
      method: "POST",
      data: { basicCode: basicCode},
      success: function(data) {
        gridData2 = data
        grid2.resetData(gridData2);  //그리드 적용
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
    if ($('#searchBcode').val() == '') {
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
        url: "upsertDcode",
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
