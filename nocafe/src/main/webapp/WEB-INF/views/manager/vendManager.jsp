<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
  .modal {
    --bs-modal-width: none !important;
  }

  #vendUl {
    list-style: none;
    padding: 0;
  }

  #vendUl > li > label {
    margin-top: 20px;
    float: left;
    width: 30%;
    height: 31px;
    text-align: center;
    vertical-align: auto;
  }

  #vendUl > li > select {
    margin: 0 auto;
    margin-top: 20px;
  }

  .form-control {
    width: 60%;
    margin-top: 20px;
  }
</style>
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
      <div class="linelist" style="float: left">
        <label for="" autofocus="autofocus">거래처명</label>
        <input
          type="text"
          class="form-control"
          id="searchVend"
          name="searchVend"
          style="width: 150px; margin-top: 0px"
        />
        <button class="btn btn-primary" id="searchVendBtn">
          <i class="fas fa-search"></i> 검색
        </button>
      </div>
      <div class="linelist" style="float: right">
        <button class="btn btn-primary" id="searchBtn">
          <i class="fas fa-search"></i> 조회
        </button>
        <button
          class="btn btn-primary"
          id="newBtn"
          data-toggle="modal"
          data-target="#vendModal"
        >
          <i class="fas fa-file"></i> 새자료
        </button>
        <!-- <a href="vendExelView">-->
        <button class="btn btn-primary" id="excelBtn">
          <i class="fas fa-download"></i>Excel
        </button>
        <br />
        <br />
      </div>
      <!-- 거래처 등록/수정 Modal -->
      <div
        class="modal fade"
        id="vendModal"
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
              <form id="dataForm" name="dataForm" onsubmit="return false">
                <ul id="vendUl">
                  <li>
                    <label style="height: 25px">거래처 유형</label>
                    <input
                      class="form-control"
                      type="hidden"
                      id="vendCd"
                      name="vendCd"
                      maxlength="50"
                    />
                    <select
                      class="dataTable-selector"
                      name="vendTyp"
                      id="vendTyp"
                    >
                      <option selected value="">==등록시필수선택==</option>
                      <option value="SAL">매입처</option>
                      <option value="PUR">납품처</option>
                      <option value="TRA">운송업체</option>
                    </select>
                  </li>
                  <li>
                    <label>거래처명</label>
                    <input
                      class="form-control"
                      type="text"
                      id="vendNm"
                      name="vendNm"
                      maxlength="50"
                    />
                  </li>
                  <li>
                    <label>사업자등록번호</label>
                    <input
                      class="form-control"
                      type="text"
                      id="bizno"
                      name="bizno"
                      maxlength="50"
                    />
                  </li>
                  <li>
                    <label>전화번호</label>
                    <input
                      class="form-control"
                      type="text"
                      id="telno"
                      name="telno"
                      maxlength="50"
                    />
                  </li>
                  <li>
                    <label>소재지</label>
                    <input
                      type="text"
                      id="vendAddr"
                      name="vendAddr"
                      class="form-control"
                      maxlength="50"
                    />
                  </li>
                  <li>
                    <label>담당자</label>
                    <input
                      type="text"
                      id="empName"
                      name="empName"
                      class="form-control"
                      maxlength="50"
                      readonly
                    />
                  </li>
                </ul>
              </form>
            </div>
            <div class="modal-footer">
              <button
                id="closeBtn"
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal"
              >
                닫기
              </button>
              <button type="button" class="btn btn-primary" id="saveBtn">
                <i class="fas fa-save"></i> 저장
              </button>
              <button class="btn btn-primary" id="delBtn">
                <i class="fas fa-trash"></i> 비활성화
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
              <button
                class="btn btn-primary"
                id="searchEmp"
                style="margin-top: 20px"
              >
                <i class="fas fa-search"></i> 검색
              </button>
            </div>
            <div class="modal-body" id="grid2"></div>
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
      <div id="grid"></div>
    </div>
  </div>
</div>
<script>
  //그리드 데이터
  const gridData = [
    <c:forEach items="${vendList }" var="vend">
      {
        vendCd : '${vend.vendCd}',
        vendNm : '${vend.vendNm}',
        bizno : '${vend.bizno}',
        telno : '${vend.telno}',
        vendAddr : '${vend.vendAddr}',
        empName : '${vend.empName}',
      },
    </c:forEach>
  ];

  let searchGrid = [];

  //전체 거래처 그리드
  const grid = new tui.Grid({
    el: document.getElementById("grid"),
    scrollX: false,
    bodyHeight: 500,
    data: gridData,
    rowHeaders: ["rowNum"],
    columns: [
      {
        header: "거래처 코드",
        name: "vendCd",
        align: "center",
      },
      {
        header: "거래처명",
        name: "vendNm",
        align: "center",
      },
      {
        header: "사업자등록번호",
        name: "bizno",
        align: "center",
      },
      {
        header: "전화번호",
        name: "telno",
        align: "center",
      },
      {
        header: "주소",
        name: "vendAddr",
        align: "center",
      },
      {
        header: "담당자",
        name: "empName",
        align: "center",
      },
    ],
  });

  //검색버튼
  $('#searchVendBtn').click(ev => {
    search();
  })

  function search() {
    var keyword = $('#searchVend').val()
    searchGrid = gridData.filter( function (Vend) {
      return Vend.vendNm.indexOf(keyword) != -1
    })
    grid.resetData(searchGrid);
  }

  //새 자료 모달창
  $('#newBtn').on('click', openModal);

  function openModal () {
    $('#vendModal').find('form')[0].reset();
    $("#vendCd").val('');
    $('#vendModal').modal('show')
  }

  //조회 버튼 모달창
  $('#searchBtn').on('click', function(){
    if($("#vendCd").val() == null || $("#vendCd").val() == ''){
      alert('선택된 거래처가 없습니다');
    } else {
      $('#vendModal').modal('show');
    }
  })

  //모달창 닫기
  $("#closeBtn").on("click", closeModal)

  function closeModal () {
    $('#vendModal').modal('hide')
    $('.modal').on('hidden.bs.modal', function (e) {
      $(this).find('form')[0].reset();
    })
    $("#vendCd").val('');
  }

  //테마 호버
  let hoverOption = {
    row: {
      hover: {
        background: "rgba(19,78,94,0.2)",
      },
    },
  };
  tui.Grid.applyTheme("default", hoverOption);

  let selectedRowKey = null;
  grid.on("click", (ev) => {
    //하이라이팅
    if (selectedRowKey != ev.rowKey) {
      grid.removeRowClassName(selectedRowKey, "highlight");
    }
    selectedRowKey = ev.rowKey;
    grid.addRowClassName(selectedRowKey, "highlight");

    //폼데이터 출력
    let selValue = ''
    if(grid.getValue(ev.rowKey, "vendCd").substr(3,3) == 'SAL'){
      salValue = 'SAL'
    } else if (grid.getValue(ev.rowKey, "vendCd").substr(3,3) == 'PUR'){
      salValue = 'PUR'
    } else if (grid.getValue(ev.rowKey, "vendCd").substr(3,3) == 'TRA'){
      salValue = 'TRA'
    } else (
      salValue = ''
    )
    $("select[name='vendTyp']").eq(0).val(salValue);
    $("#vendCd").val(grid.getValue(ev.rowKey, "vendCd"));
    $("#vendNm").val(grid.getValue(ev.rowKey, "vendNm"));
    $("#bizno").val(grid.getValue(ev.rowKey, "bizno"));
    $("#telno").val(grid.getValue(ev.rowKey, "telno"));
    $("#vendAddr").val(grid.getValue(ev.rowKey, "vendAddr"));
    $("#empName").val(grid.getValue(ev.rowKey, "empName"));
  });

  //저장
  $("#saveBtn").click((ev) => {
    if( $("select[name='vendTyp']").eq(0).val() == '' ) {
      alert('거래처 유형을 입력해주세요')
    } else {
      $.ajax({
        url: "mergeVend",
        method: "POST",
        data: $("#dataForm").serialize(),
        dataType: "json",
        success: function (result) {
          alert("정상적으로 저장되었습니다.");
          grid.resetData(result);
          closeModal();
        },
      });
    }
  });

  //삭제
  $("#delBtn").click((ev) => {
    if( $("#vendCd").val() == '' || $("#vendCd").val() == null) {
      alert('선택된 거래처가 없습니다')
    } else {
      $.ajax({
        url: "delVend",
        method: "POST",
        data: $("#dataForm").serialize(),
        dataType: "json",
        success: function (result) {
          alert("비활성화되었습니다.");
          grid.resetData(result);
          closeModal();
        },
      });
    }
  });

  //담당사원 전체조회
  $("#empName").on('click', searchEmp)

  function searchEmp () {
    setTimeout(()=> grid2.refreshLayout() , 300);
    $('#empModal').modal('show');
  }

  //담당사원 그리드
  const gridData2 = [
    <c:forEach items="${empList }" var="emp">
      {
        empCode : '${emp.empCode}',
        empName : '${emp.empName}',
        dept : '${emp.detailName}',
      },
    </c:forEach>
  ];

  const grid2 = new tui.Grid({
    el: document.getElementById("grid2"),
    scrollX: false,
    bodyHeight: 500,
    data: gridData2,
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
  grid2.on('click', (ev) => {
    $("#empName").val(grid2.getValue(ev.rowKey, "empName"));
    $('#empModal').modal('hide');
  })

  //담당사원 검색
  let searchData = [];
  $("#searchEmp").on('click', () => {
    var keyword = $('#searchEmpInput').val()
    searchData = gridData2.filter( function (emp) {
      return emp.empName.indexOf(keyword) != -1
    })
    grid2.resetData(searchData);
  })

  //사원 검색 닫기 버튼
  $('#closeEmpBtn').on('click', () => {
    $('#empModal').modal('hide');
  })

  //엑셀 그리드 다운
  $("#excelBtn").click((ev) => {
    const options = {
      includeHiddenColumns: false,
      fileName: "vend_list",
    };
    grid.export("xlsx", options);
  });
</script>
