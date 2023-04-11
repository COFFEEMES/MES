<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"
></script>
<div class="container-fluid px-4">
  <h1 class="mt-4">자재관리</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 기준정보관리</li>
    <li class="breadcrumb-item active">> 자재관리</li>
  </ol>
  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <select class="dataTable-selector" name="searchParam" id="searchParam">
          <option selected value="">전체</option>
          <option value="matTyp">구분</option>
          <option value="matNm">자재명</option>
          <option value="matCd">자재코드</option>
        </select>
        <input
          type="text"
          class="form-control"
          id="searchMat"
          name="searchMat"
          style="width: 150px"
        />
        <button class="btn btn-primary" id="searchBtn">
          <i class="fas fa-search"></i> 검색
        </button>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="card col-xl-5">
      <div class="linelist" style="margin-top: 16px"></div>
      <h3 style="padding-left: 15px">자재 목록</h3>
      <div class="card-body">
        <div id="grid"></div>
      </div>
    </div>

    <div class="card col-xl-6">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          자재 상세 정보
        </h3>
        <button
          class="btn btn-primary"
          id="saveRsc"
          style="float: right; margin-left: 16px"
        >
          <i class="fas fa-save"></i> 저장
        </button>
        <button
          class="btn btn-primary"
          id="newRsc"
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
          <table class="table" style="vertical-align: middle; margin-top: 20px">
            <colgroup>
              <col style="width: 100px" />
              <col />
              <col style="width: 100px" />
              <col />
            </colgroup>
            <tbody>
              <tr>
                <th>구분 <strong class="blue">*</strong></th>
                <td>
                  <select
                    class="dataTable-selector"
                    name="rscTyp"
                    id="rscTyp"
                    style="width: 220px"
                  >
                    <option selected value="">==등록시필수선택==</option>
                    <c:forEach items="${matType }" var="mat">
                      <option value="${mat.detailName}">
                        ${mat.detailName}
                      </option>
                    </c:forEach>
                  </select>
                  <input type="hidden" id="hInput" name="hInput" />
                </td>
                <th>자재코드 <strong class="blue">*</strong></th>
                <td>
                  <input
                    class="form-control"
                    type="text"
                    id="rscCd"
                    name="rscCd"
                    style="width: 220px"
                    placeholder="등록시 자동부여됩니다."
                    readonly
                  />
                </td>
              </tr>
              <tr>
                <th>자재명 <strong class="blue">*</strong></th>
                <td>
                  <input
                    class="form-control"
                    type="text"
                    id="rscNm"
                    name="rscNm"
                    style="width: 220px"
                    maxlength="50"
                  />
                </td>
                <th>관리단위</th>
                <td>
                  <input
                    type="text"
                    id="rscUnit"
                    name="rscUnit"
                    class="form-control"
                    maxlength="30"
                    style="width: 220px"
                  />
                </td>
              </tr>
              <tr>
                <th>자재규격</th>
                <td>
                  <input
                    class="form-control"
                    type="text"
                    id="rscSpec"
                    name="rscSpec"
                    style="width: 220px"
                    maxlength="50"
                  />
                </td>
                <th>안전재고</th>
                <td>
                  <input
                    class="form-control"
                    type="text"
                    id="safRtc"
                    name="safRtc"
                    style="width: 220px"
                  />
                </td>
              </tr>
              <tr style="height: 55px">
                <th>사용유무</th>
                <td>
                  <select
                    class="dataTable-selector"
                    name="rscAvail"
                    id="rscAvail"
                    style="width: 220px"
                  >
                    <option value="">==선택==</option>
                    <option value="Y">Yes</option>
                    <option value="N">No</option>
                  </select>
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
</div>
<script language="Javascript">
  let gridData = [
    <c:forEach items="${matList }" var="mat">
      {
        rscTyp : '${mat.detailName}',
        rscCd : '${mat.basicCode}${mat.detailCode}',
        rscNm : '${mat.detailExplain}',
      },
    </c:forEach>
  ];

  let searchData = [];

  const grid = new tui.Grid({
    el: document.getElementById('grid'),
    data: gridData,
       scrollY: true,
       bodyHeight: 500,
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

    let str = grid.getValue(selectedRowKey, 'rscCd');
    str = str.substring(3, str.length-3);

    // $("#rscTyp").val(str);
    // $("#rscCd").val(grid.getValue(selectedRowKey, 'rscCd'));
    // $("#rscNm").val(grid.getValue(selectedRowKey, 'rscNm'));
    $.ajax({
      url: "getRsc",
      method: "POST",
      data: { rscCd: grid.getValue(selectedRowKey, 'rscCd')},
      success: function(data) {
        $("#rscTyp").val(data.rscTyp);
        $("#hInput").val(str);
        $("#rscCd").val(data.rscCd);
        $("#rscNm").val(data.rscNm);
        $("#rscUnit").val(data.rscUnit);
        $("#rscSpec").val(data.rscSpec);
        $("#safRtc").val(data.safRtc);
        $("#rscAvail").val(data.rscAvail);
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
    var searchKeyword = $('#searchParam').val()
    var keyword = $('#searchMat').val()
    searchData = gridData.filter( function (Mat) {
      if(searchKeyword == 'matTyp'){
        return Mat.matTyp.indexOf(keyword) != -1
      } else if(searchKeyword == 'matCd') {
        return Mat.matCd.indexOf(keyword) != -1
      } else if(searchKeyword == 'matNm') {
        return Mat.matNm.indexOf(keyword) != -1
      } else {
        return Mat.matTyp.indexOf(keyword) != -1 || Mat.matCd.indexOf(keyword) != -1 || Mat.matNm.indexOf(keyword) != -1
      }
    })
    grid.resetData(searchData);
  }

  //새 자료 버튼
  $('#newRsc').click(ev => {
    $('body').find('form')[1].reset();
    $("#hInput").val('');
  });

  //구분 선택시 타입 입력
  $("#rscTyp").on('click', () => {
    <c:forEach items="${matType }" var="mat">
      if( $("#rscTyp").val() == '${mat.detailName}') {
        $("#hInput").val('${mat.detailCode}')
      }
    </c:forEach>
  })

  //저장 버튼
  $('#saveRsc').click(ev => {
    if( $('#rscTyp').val() == '' || $("#rscNm").val() == null || $('#rscNm').val() == '' ) {
      alert('필수 입력 사항을 입력해 주세요')
    } else {
      $.ajax({
        url: "mergeRsc",
        type: "POST",
        data: $("#dataForm").serialize(),
        dataType: 'json',
        success: function (result) {
          let fixedData = [];
          for(let i = 0; i < result.length; i++) {
            fixedData[i] = {
              rscTyp : result[i].detailName,
              rscCd : result[i].basicCode + result[i].detailCode,
              rscNm : result[i].detailExplain,
            }
          }
          grid.resetData(fixedData)
          alert('성공적으로 저장되었습니다.');
        }
      })
    }
  })

  //삭제
  $("#delBtn").click((ev) => {
    if( $("#rscCd").val() == '' || $("#rscCd").val() == null) {
      alert('선택된 자재가 없습니다')
    } else {
      $.ajax({
        url: "delRsc",
        method: "POST",
        data: $("#dataForm").serialize(),
        dataType: "json",
        success: function (result) {
          alert("정상적으로 삭제되었습니다.");
          grid.resetData(result);
        },
      });
    }
  });
</script>
