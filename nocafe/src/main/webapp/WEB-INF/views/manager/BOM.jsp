<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"
></script>
<style>
  .modal {
    --bs-modal-width: none !important;
  }

  #prcsUl {
    list-style: none;
    padding: 0;
  }

  #prcsUl > li {
    height: 55px;
  }

  #prcsUl > li > label {
    margin-top: 16px;
    float: left;
    width: 30%;
    height: 31px;
    text-align: center;
    vertical-align: auto;
  }

  .form-control {
    width: 60%;
    margin-top: 20px;
  }
</style>
<div class="container-fluid px-4">
  <h1 class="mt-4">BOM관리</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 기준정보관리</li>
    <li class="breadcrumb-item active">> BOM관리</li>
  </ol>
  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <label for="" autofocus="autofocus">제품명</label>
        <input
          type="text"
          class="form-control"
          id="searchPro"
          name="searchPro"
          style="width: 150px; margin-top: 0"
        />
        <button class="btn btn-primary" id="searchProBtn">
          <i class="fas fa-search"></i> 검색
        </button>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="card col-xl-5">
      <div class="linelist" style="margin-top: 16px"></div>
      <h3 style="padding-left: 15px">제품 목록</h3>
      <div class="card-body">
        <div id="grid"></div>
      </div>
    </div>

    <div class="card col-xl-6">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          제품 정보
        </h3>
        <button
          class="btn btn-primary"
          id="savePro"
          style="float: right; margin-left: 16px"
        >
          <i class="fas fa-save"></i> 저장
        </button>
        <button
          class="btn btn-primary"
          id="newPro"
          style="float: right; margin-left: 16px"
        >
          <i class="fas fa-file"></i> 새 자료
        </button>
        <button class="btn btn-primary" id="delBtn" style="float: right">
          <i class="fas fa-trash"></i> 비활성화
        </button>
      </div>
      <div class="card-body">
        <form id="dataForm" name="dataForm" onsubmit="return false">
          <table class="table" style="vertical-align: middle">
            <colgroup>
              <col style="width: 120px" />
              <col />
              <col style="width: 120px" />
              <col />
            </colgroup>
            <tbody>
              <tr>
                <th>구분 <strong class="blue">*</strong></th>
                <td>
                  <select
                    class="dataTable-selector"
                    name="proTyp"
                    id="proTyp"
                    style="width: 220px"
                  >
                    <option value="">==선택==</option>
                    <option value="LIQ">액상 커피</option>
                    <option value="SOL">분말 커피</option>
                  </select>
                </td>
                <th>완제품코드 <strong class="blue">*</strong></th>
                <td>
                  <input
                    class="form-control"
                    type="text"
                    id="proCd"
                    name="proCd"
                    style="width: 250px"
                    maxlength="20"
                    placeholder="등록시 자동부여됩니다."
                    readonly
                  />
                </td>
              </tr>
              <tr>
                <th>제품명 <strong class="blue">*</strong></th>
                <td>
                  <input
                    class="form-control"
                    type="text"
                    id="proNm"
                    name="proNm"
                    style="width: 250px"
                    maxlength="50"
                  />
                </td>
                <th>제품 규격</th>
                <td>
                  <input
                    class="form-control"
                    type="text"
                    id="proSpec"
                    name="proSpec"
                    style="width: 250px"
                    maxlength="50"
                  />
                </td>
              </tr>
              <tr>
                <th>단위</th>
                <td>
                  <input
                    class="form-control"
                    type="text"
                    id="proUnit"
                    name="proUnit"
                    style="width: 250px"
                    maxlength="50"
                  />
                </td>
                <th>안전재고</th>
                <td>
                  <input
                    type="text"
                    id="safRtc"
                    name="safRtc"
                    class="form-control"
                    maxlength="50"
                    style="width: 250px"
                  />
                </td>
                <th></th>
                <td></td>
              </tr>
            </tbody>
          </table>
        </form>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="card col-xl-5">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          공정 순서
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
    <div class="card col-xl-6">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          필요 자재 목록
        </h3>
      </div>
      <div class="card-body">
        <div id="grid2"></div>
      </div>
    </div>
  </div>
  <!-- 공정별 자재 필요량 Modal -->
  <div
    class="modal fade"
    id="useRscModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog" role="document" style="width: 500px">
      <div class="modal-content">
        <div class="modal-body" id="grid4"></div>
        <div class="modal-footer">
          <button
            id="closeUseRscBtn"
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
  <!-- 새 공정 Modal -->
  <div
    class="modal fade"
    id="newPrcsModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div
      class="modal-dialog"
      role="document"
      style="margin: 28px auto; width: 800px"
    >
      <div class="modal-content">
        <div class="modal-body">
          <ul id="prcsUl">
            <li>
              <label autofocus="autofocus">공정 코드</label>
              <input
                class="form-control searchPrcs"
                type="text"
                id="prcsSearch"
                name="prcsSearch"
                style="margin-top: 10px"
                maxlength="50"
                readonly
              />
            </li>
            <li>
              <label autofocus="autofocus">공정명</label>
              <input
                class="form-control searchPrcs"
                type="text"
                id="prcsNameSearch"
                name="prcsNameSearch"
                style="margin-top: 10px"
                maxlength="50"
                readonly
              />
            </li>
          </ul>
          <div id="grid5"></div>
        </div>
        <div class="modal-footer">
          <button
            id="closeNewPrcsBtn"
            type="button"
            class="btn btn-secondary"
            data-dismiss="modal"
          >
            닫기
          </button>
          <button type="button" class="btn btn-primary" id="saveNewPrcs">
            <i class="fas fa-save"></i> 저장
          </button>
          <button
            id="newRscRow"
            type="button"
            class="btn btn-primary"
            data-dismiss="modal"
          >
            <i class="fas fa-file"></i> 행 추가
          </button>
        </div>
      </div>
    </div>
  </div>
  <!-- 새 공정 선택 Modal -->
  <div
    class="modal fade"
    id="selNewPrcsModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog" role="document" style="width: 800px">
      <div class="modal-content">
        <div class="modal-header">
          <input
            type="text"
            id="searchPrcsInput"
            name="searchPrcsInput"
            class="form-control"
            placeholder="공정명 검색"
          />
          <button
            class="btn btn-primary"
            id="searchPrcs"
            style="margin-top: 20px"
          >
            <i class="fas fa-search"></i> 검색
          </button>
        </div>
        <div class="modal-body" id="grid6"></div>
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
  <!-- 새 자재 선택 Modal -->
  <div
    class="modal fade"
    id="selNewRscModal"
    tabindex="-1"
    role="dialog"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog" role="document" style="width: 800px">
      <div class="modal-content">
        <div class="modal-header">
          <input
            type="text"
            id="searchRscInput"
            name="searchRscInput"
            class="form-control"
            placeholder="자재명 검색"
          />
          <button
            class="btn btn-primary"
            id="searchRsc"
            style="margin-top: 20px"
          >
            <i class="fas fa-search"></i> 검색
          </button>
        </div>
        <div class="modal-body" id="grid7"></div>
        <div class="modal-footer">
          <button
            id="closeRscBtn"
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
</div>
<script>
    let gridData = [
      <c:forEach items="${proList }" var="pro">
        {
          proCd : '${pro.basicCode}${pro.detailCode}',
          proNm : '${pro.detailExplain}',
        },
      </c:forEach>
    ];

    const grid = new tui.Grid({
      el: document.getElementById('grid'),
      data: gridData,
      scrollY: true,
      bodyHeight: 300,
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
      ]
    });

    let gridData2 = [];

    const grid2 = new tui.Grid({
      el: document.getElementById('grid2'),
      scrollY: true,
      bodyHeight: 300,
      rowHeaders: ['rowNum'],
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
          name: 'useCnt',
          align: 'center',
        },
        {
          header: '단위',
          name: 'rscUnit',
          align: 'center',
        },
        {
          header: '공정',
          name: 'prcsNm',
          align: 'center',
        },
      ]
    });

    let gridData3 = [];

    const grid3 = new tui.Grid({
      el: document.getElementById('grid3'),
      scrollX: true,
      scrollY: true,
      bodyHeight: 300,
      rowHeaders: ['checkbox'],
      columns: [
        {
          header: '공정순서',
          name: 'bomSq',
          align: 'center',
        },
        {
          header: '공정코드',
          name: 'prcsCd',
          align: 'center',
        },
        {
          header: '공정명',
          name: 'prcsNm',
          align: 'center',
        },
        {
          header: '공정내용',
          name: 'prcsExplain',
          align: 'center',
          editor: 'text',
        },
      ]
    });

  let gridData4 = [];

  const grid4 = new tui.Grid({
    el: document.getElementById('grid4'),
    scrollY: true,
    rowHeaders: ['rowNum'],
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
        name: 'useCnt',
        align: 'center',
      },
      {
        header: '단위',
        name: 'rscUnit',
        align: 'center',
      },
    ]
  });

  let gridData5 = [{ rscCd:'', rscNm:'', rscUnit:'', useCnt:''}];

  const grid5 = new tui.Grid({
    el: document.getElementById('grid5'),
    scrollY: true,
    rowHeaders: ['checkbox'],
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
        header: '단위',
        name: 'rscUnit',
        align: 'center',
      },
      {
        header: '사용량',
        name: 'useCnt',
        align: 'center',
        editor: 'text',
      },
    ]
  });

  let gridData6 = [];

  const grid6 = new tui.Grid({
    el: document.getElementById('grid6'),
    scrollY: true,
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
        header: '공정 내용',
        name: 'prcsExplain',
        align: 'center',
      },
    ]
  });

  let gridData7 = [];

  const grid7 = new tui.Grid({
    el: document.getElementById('grid7'),
    scrollY: true,
    rowHeaders: ['rowNum'],
    columns: [
      {
        header: '구분',
        name: 'rscTyp',
        align: 'center',
      },
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
        header: '단위',
        name: 'rscUnit',
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

  var selectedRowKey = null;
  var selectedRowKey2 = null;
  var selectedRowKey3 = null;
  var selectedRowKey4 = null;
  let selProCd = '';

  grid.on('click', ev => {
    //셀 클릭시 로우 하이라이팅
    if (selectedRowKey != ev.rowKey) {
      grid.removeRowClassName(selectedRowKey, 'highlight');
    }
    selectedRowKey = ev.rowKey;
    grid.addRowClassName(selectedRowKey, 'highlight');

    selProCd = grid.getValue(selectedRowKey, 'proCd')

    $.ajax({
      url: "getPro",
      method: "POST",
      data: { proCd: selProCd},
      success: function(data) {
        let str = '';
        if( data.proCd.indexOf('LIQ') != -1 ) {
            str = 'LIQ';
        } else if ( data.proCd.indexOf('SOL') != -1 ) {
            str = 'SOL';
        }
        $("#proTyp").val(str)
        $("#proTyp").attr('disabled', 'disabled');
        $("#proCd").val(data.proCd);
        $("#proNm").val(data.proNm);
        $("#proSpec").val(data.proSpec);
        $("#proUnit").val(data.proUnit);
        $("#safRtc").val(data.safRtc);
      },
      error: function (reject) {
        console.log(reject);
      },
    });

    $.ajax({
      url: "getPrcs",
      method: "POST",
      data: { proCd: grid.getValue(selectedRowKey, 'proCd')},
      success: function(data) {
        gridData3 = data
        grid3.resetData(gridData3);
      },
      error: function (reject) {
        console.log(reject);
      },
    });

    $.ajax({
      url: "getUseRcs",
      method: "POST",
      data: { proCd: grid.getValue(selectedRowKey, 'proCd')},
      success: function(data) {
        gridData2 = data
        grid2.resetData(gridData2);
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });

  //검색버튼
  $('#searchProBtn').click(ev => {
    search();
  })
  function search() {
    var keyword = $('#searchPro').val()
    searchGrid = gridData.filter( function (Pro) {
      return Pro.proNm.indexOf(keyword) != -1
    })
    grid.resetData(searchGrid);
  }

  //새 자료 버튼
  $('#newPro').click(ev => {
    $('body').find('form')[1].reset();
    $("#proTyp").attr('disabled', false);
  });

  //제품 저장 버튼
  $('#savePro').click(ev => {
    if( $("#proTyp").val() == '' || $("#proNm").val() == null || $('#proNm').val() == '' ) {
      alert('필수 입력 사항을 입력해 주세요')
    } else {
      $("#proTyp").attr('disabled', false);
      $.ajax({
        url: "mergePro",
        type: "POST",
        data: $("#dataForm").serialize(),
        dataType: 'json',
        success: function (result) {
          let fixedData = [];
          for(let i = 0; i < result.length; i++) {
            fixedData[i] = {
              proCd : result[i].fullCode,
              proNm : result[i].detailExplain,
            }
          }
          grid.resetData(fixedData)
          alert('성공적으로 저장되었습니다.');
        }
      })
      $("#proTyp").attr('disabled', true);
    }
  })

  //제품 비활성화
  $("#delBtn").click((ev) => {
    if( $("#proCd").val() == '' || $("#proCd").val() == null) {
      alert('선택된 제품이 없습니다')
    } else {
      $.ajax({
        url: "delPro",
        method: "POST",
        data: $("#dataForm").serialize(),
        dataType: "json",
        success: function (result) {
          let fixedData = [];
          for(let i = 0; i < result.length; i++) {
            fixedData[i] = {
              proCd : result[i].fullCode,
              proNm : result[i].detailExplain,
            }
          }
          alert("비활성화되었습니다.");
          grid.resetData(fixedData);
          $('body').find('form')[1].reset();
          $("#proTyp").attr('disabled', false);
        },
      });
    }
  });

  //grid2 셀 클릭시 로우 하이라이팅
  grid2.on('click', (ev) => {
    if (selectedRowKey2 != ev.rowKey) {
      grid2.removeRowClassName(selectedRowKey2, 'highlight');
    }
    selectedRowKey2 = ev.rowKey;
    grid2.addRowClassName(selectedRowKey2, 'highlight');
  })

  //grid3 클릭시 모달창
  grid3.on('click', (ev) => {
    //셀 클릭시 로우 하이라이팅
    if (selectedRowKey3 != ev.rowKey) {
      grid3.removeRowClassName(selectedRowKey3, 'highlight');
    }
    selectedRowKey3 = ev.rowKey;
    grid3.addRowClassName(selectedRowKey3, 'highlight');

    let { columnName, rowKey } = ev;

    if( columnName != '_checked' && rowKey != undefined && columnName != 'prcsExplain' ){
      $.ajax({
        url: "getPrcsRcs",
        method: "POST",
        data: { proCd: selProCd, prcsCd: grid3.getValue(rowKey, 'prcsCd')},
        success: function(data) {
          gridData4 = data
          grid4.resetData(gridData4);
          setTimeout(()=> grid4.refreshLayout() , 300);
          $('#useRscModal').modal('show');
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }
  })

  $('#grid3').mouseleave(ev => {
    grid3.finishEditing();
  })

  //공정별 자재 모달 닫기 버튼
  $('#closeUseRscBtn').on('click', () => {
    $('#useRscModal').modal('hide');
  })

  //공정 삭제
  $('#delPrcs').on('click', () => {
    var data = grid3.getCheckedRows();
    if (data.length == 0){
      alert("선택된 공정이 없습니다");
    } else {
      for(let temp of data) {
        temp.proCd = selProCd;
      };
      $.ajax({
        url: "delPrcs",
        type: "POST",
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function (result) {
          $.ajax({
            url: "getUseRcs",
            method: "POST",
            data: { proCd: selProCd},
              success: function(data) {
              gridData2 = data
              grid2.resetData(gridData2);
            },
            error: function (reject) {
              console.log(reject);
            },
          });
          gridData3 = result;
          grid3.resetData(gridData3);
          alert('삭제되었습니다.');
        }
      })
    }
  })

  //공정 순서 저장 버튼
  $('#savePrcs').click(ev => {
    var data = grid3.getCheckedRows();

    if( selProCd == '' ) {
      alert('제품을 선택해주세요')
    } else if( data.length == 0) {
      alert('선택된 공정이 없습니다')
    } else {
      for(let temp of data){
        temp.proCd = selProCd;
      }
      $.ajax({
        url: "savePrcs",
        type: "POST",
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function (result) {
          grid3.resetData(result)
          alert('성공적으로 저장되었습니다.');
        }
      })
    }
  })

  //새 공정 버튼
  $("#newPrcs").on('click', () => {
    if( selProCd == ''){
      alert('제품을 선택해 주세요')
    } else {
      setTimeout(function () {
        grid5.refreshLayout()
      }, 300);
      grid5.resetData(gridData5);
      $('#newPrcsModal').modal('show')
    }
  })

  //공정 코드 클릭시 모달창
  $('.searchPrcs').on('click', () => {
    $.ajax({
      url: "getAllPrcs",
      method: "POST",
      success: function(data) {
        gridData6 = data
        grid6.resetData(gridData6);
        setTimeout(()=> grid6.refreshLayout() , 300);
        $('#selNewPrcsModal').modal('show');
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  })

  let rscRowKey = 0;

  //grid5 클릭시 모달창
  grid5.on('click', (ev) => {
    //셀 클릭시 로우 하이라이팅
    if (selectedRowKey4 != ev.rowKey) {
      grid5.removeRowClassName(selectedRowKey4, 'highlight');
    }
    selectedRowKey4 = ev.rowKey;
    grid5.addRowClassName(selectedRowKey4, 'highlight');

    let { columnName, rowKey } = ev;

    rscRowKey = rowKey;

    if( columnName != '_checked' && rowKey != undefined && columnName != 'useCnt' ){
      $.ajax({
        url: "getAllRsc",
        method: "POST",
        success: function(data) {
          gridData7 = data
          grid7.resetData(gridData7);
          setTimeout(()=> grid7.refreshLayout() , 300);
          $('#selNewRscModal').modal('show');
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }
  })

  $('#grid5').mouseleave(ev => {
    grid5.finishEditing();
  })

  //새 공정 저장 버튼
  $('#saveNewPrcs').on('click', () => {
    let saveAble = true;
    let data = grid5.getData();
    for( let temp of data ){
      if(temp.useCnt == '' || temp.useCnt == null){
        saveAble = false;
      } else {
        temp.prcsCd = $('#prcsSearch').val();
      }
    }
    if( saveAble ) {
      $.ajax({
        url: "saveNewPrcs",
        method: "POST",
        success: function(data) {

          //여기 작성해야함!!!!!!!!!!!!!

        },
        error: function (reject) {
          console.log(reject);
        },
      });
    } else {
      alert('자재 사용량을 입력해주세요')
    }
  })

  //새 공정 모달 닫기 버튼
  $('#closeNewPrcsBtn').on('click', () => {
    $('#newPrcsModal').modal('hide');
  })

  //새 공정 선택 모달 검색 버튼
  $('#searchPrcs').on('click', () => {
    var keyword = $('#searchPrcsInput').val()
    let searchData = gridData6.filter( function (Prcs) {
      return Prcs.prcsNm.indexOf(keyword) != -1
    })
    grid6.resetData(searchData);
  })

  //새 공정 선택 모달 그리드 클릭
  grid6.on('click', (ev) => {
    let { columnName, rowKey } = ev;
    if( columnName != '_number' && rowKey != undefined){
      $('#prcsSearch').val(grid6.getValue(rowKey, 'prcsCd'))
      $('#prcsNameSearch').val(grid6.getValue(rowKey, 'prcsNm'))
      $('#selNewPrcsModal').modal('hide');
    }
  })

  //새 공정 선택 모달 닫기 버튼
  $('#closePrcsBtn').on('click', () => {
    $('#selNewPrcsModal').modal('hide');
  })

  //새 공정 자재 선택 모달 검색 버튼
  $('#searchRsc').on('click', () => {
    var keyword = $('#searchRscInput').val()
    let searchData = gridData7.filter( function (Rsc) {
      return Rsc.rscNm.indexOf(keyword) != -1
    })
    grid7.resetData(searchData);
  })

  //새 공정 자재 선택 모달 그리드 클릭
  grid7.on('click', (ev) => {
    let { columnName, rowKey } = ev;
    if( columnName != '_number' && rowKey != undefined){
      gridData5[rscRowKey] = grid7.getRow(rowKey);
      for(let i = 0; i < gridData5.length; i++) {
        gridData5[i].rowKey = i;
        gridData5[i]._attributes.rowNum = i + 1;
      }
      grid5.resetData(gridData5);
      $('#selNewRscModal').modal('hide');
    }
  })

  //새 공정 자재 선택 행추가 버튼
  $('#newRscRow').on('click', () => {
    if (grid5.getRow(grid5.getRowCount() - 1).rscCd == null || grid5.getRow(grid5.getRowCount() - 1).rscCd == ''){
      alert('입력이 미완료된 추가건이 있습니다.')
    } else {
      grid5.appendRow();
    }
  })

  //새 공정 자재 선택 모달 닫기 버튼
  $('#closeRscBtn').on('click', (ev) => {
    $('#selNewRscModal').modal('hide');
  })
</script>
