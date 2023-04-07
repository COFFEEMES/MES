<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"
></script>
<div class="container-fluid px-4">
  <h1 class="mt-4">거래처관리</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 기준정보관리</li>
    <li class="breadcrumb-item active">> 거래처관리</li>
  </ol>
  <div class="card mb-4">
    <div class="card-body">
      <div class="linelist" style="float: right">
        <button class="btn btn-primary" id="searchBtn">
          <i class="fas fa-search"></i> 조회
        </button>
        <button class="btn btn-primary" id="newBtn">
          <i class="fas fa-file"></i> 새자료
        </button>
        <button class="btn btn-primary" id="saveBtn">
          <i class="fas fa-save"></i> 저장
        </button>
        <!-- <a href="vendExelView">-->
        <button class="btn btn-primary" id="excelBtn">
          <i class="fas fa-download"></i>Excel
        </button>
        <!--</a>-->
        <button class="btn btn-primary" id="delBtn">
          <i class="fas fa-trash"></i> 삭제
        </button>
        <br />
        <br />
      </div>
      <form id="dataForm" name="dataForm" action="#" method="post">
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
              <th>구분 <strong class="blue">*</strong></th>
              <td>
                <select
                  class="dataTable-selector"
                  name="vendTyp"
                  id="vendTyp"
                  style="width: 250px"
                >
                  <option selected value="">==등록시필수선택==</option>
                  <option
                    th:each="code : ${ccds['VND']}"
                    th:value="${code.ccdDtlNm}"
                    th:text="${code.ccdDtlNm}"
                  ></option>
                </select>
              </td>
              <th>거래처코드 <strong class="blue">*</strong></th>
              <td>
                <input
                  class="form-control"
                  type="text"
                  id="vendCd"
                  name="vendCd"
                  style="width: 250px"
                  maxlength="20"
                  placeholder="등록시 자동부여됩니다."
                  readonly
                />
              </td>

              <th>거래처명 <strong class="blue">*</strong></th>
              <td>
                <input
                  class="form-control"
                  type="text"
                  id="vendNm"
                  name="vendNm"
                  style="width: 250px"
                  maxlength="50"
                />
              </td>
            </tr>
            <tr>
              <th>사업자등록번호</th>
              <td>
                <input
                  class="form-control"
                  type="text"
                  id="bizno"
                  name="bizno"
                  style="width: 250px"
                  maxlength="50"
                />
              </td>
              <th>전화번호</th>
              <td>
                <input
                  class="form-control"
                  type="text"
                  id="telno"
                  name="telno"
                  style="width: 250px"
                  maxlength="50"
                />
              </td>
              <th>비고</th>
              <td>
                <input
                  type="text"
                  id="remk"
                  name="remk"
                  class="form-control"
                  maxlength="50"
                  style="width: 250px"
                />
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  </div>
  <div class="card mb-4">
    <div class="card-body">
      <div id="grid"></div>
    </div>
  </div>
</div>
<script>
  const grid = new tui.Grid({
    el: document.getElementById("grid"),
    scrollX: false,
    bodyHeight: 350,
    rowHeaders: ["rowNum"],
    columns: [
      {
        header: "구분",
        name: "vendTyp",
        align: "center",
        filter: "select",
        sortable: true,
        sortingType: "desc",
      },
      {
        header: "거래처코드",
        name: "vendCd",
        align: "center",
        sortable: true,
        sortingType: "desc",
      },
      {
        header: "거래처명",
        name: "vendNm",
        align: "left",
        sortable: true,
        sortingType: "desc",
      },
      {
        header: "사업자등록번호",
        name: "bizno",
        align: "center",
        sortable: true,
        sortingType: "desc",
      },
      {
        header: "전화번호",
        name: "telno",
        align: "center",
        sortable: true,
        sortingType: "desc",
      },
      {
        header: "비고",
        name: "remk",
        align: "left",
        sortable: true,
        sortingType: "desc",
      },
    ],
  });

  //테마 호버
  let hoverOption = {
    row: {
      hover: {
        background: "rgba(19,78,94,0.2)",
      },
    },
  };
  tui.Grid.applyTheme("default", hoverOption);

  //그리드 영역 벗어나면 수정 종료
  $("#grid").mouseleave((ev) => {
    grid.finishEditing();
  });

  //페이지 로딩시 실행
  getVendList();

  function getVendList() {
    $.ajax({
      url: "getVendList",
      method: "POST",
      data: $("#dataForm").serialize(),
      dataType: "JSON",
      success: function (result) {
        grid.resetData(result);
      },
    });
  }

  //검색
  $("#searchBtn").click((ev) => {
    getVendList();
    toastr.success("정상적으로 조회되었습니다.");
  });

  //폼 리셋
  $("#newBtn").click((ev) => {
    $("#dataForm")[0].reset();
  });

  let selectedRowKey = null;
  grid.on("focusChange", (ev) => {
    //하이라이팅
    if (selectedRowKey != ev.rowKey) {
      grid.removeRowClassName(selectedRowKey, "highlight");
    }
    selectedRowKey = ev.rowKey;
    grid.addRowClassName(selectedRowKey, "highlight");

    //폼데이터 출력
    $("select[name='vendTyp']").eq(0).val(grid.getValue(ev.rowKey, "vendTyp"));
    $("#vendCd").val(grid.getValue(ev.rowKey, "vendCd"));
    $("#vendNm").val(grid.getValue(ev.rowKey, "vendNm"));
    $("#bizno").val(grid.getValue(ev.rowKey, "bizno"));
    $("#telno").val(grid.getValue(ev.rowKey, "telno"));
    $("#remk").val(grid.getValue(ev.rowKey, "remk"));
  });

  //수정&입력
  $("#saveBtn").click((ev) => {
    $.ajax({
      url: "saveVend",
      method: "POST",
      data: $("#dataForm").serialize(),
      dataType: "json",
      success: function (result) {
        toastr.success("정상적으로 저장되었습니다.");
        grid.resetData(result);
      },
    });
  });

  //삭제
  $("#delBtn").click((ev) => {
    $.ajax({
      url: "delVend",
      method: "POST",
      data: $("#dataForm").serialize(),
      dataType: "json",
      success: function (result) {
        toastr.success("정상적으로 삭제되었습니다.");
        grid.resetData(result);
      },
    });
  });

  //엑셀 그리드 다운
  $("#excelBtn").click((ev) => {
    const options = {
      includeHiddenColumns: false,
      fileName: "vend_list",
    };
    grid.export("xlsx", options);
  });
</script>
