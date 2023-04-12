<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"
></script>
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
          style="width: 150px"
        />
        <button class="btn btn-primary" id="searchProBtn">
          <i class="fas fa-search"></i> 검색
        </button>
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
      <div class="linelist" style="margin-top: 16px"></div>
      <h3 style="padding-left: 15px">자재 목록</h3>
      <div class="card-body">
        <div id="grid2"></div>
      </div>
    </div>
    <div class="card col-xl-6">
      <div class="linelist" style="margin-top: 16px"></div>
      <h3 style="padding-left: 15px">공정 순서</h3>
      <div class="card-body">
        <div id="grid3"></div>
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

  let searchData = [];

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

  grid.on('click', ev => {

    //셀 클릭시 로우 하이라이팅
    if (selectedRowKey != ev.rowKey) {
      grid.removeRowClassName(selectedRowKey, 'highlight');
    }
    selectedRowKey = ev.rowKey;
    grid.addRowClassName(selectedRowKey, 'highlight');

    $.ajax({
      url: "getPro",
      method: "POST",
      data: { proCd: grid.getValue(selectedRowKey, 'proCd')},
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
        console.log(data)
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

  //저장 버튼
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

  //삭제
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
</script>
