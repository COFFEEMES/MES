<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"
/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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
  <h1 class="mt-4">자재입고검사</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 자재관리</li>
    <li class="breadcrumb-item active">> 자재입고검사</li>
  </ol>
  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <div id="lineb">
          <div id="planDate">
            <label style="width: 80px">업체명</label>
            <input
              id="vendNm"
              type="text"
              class="form-control"
              placeholder="검색버튼을 이용하세요"
              style="width: 200px"
              required
              readonly
            />
            <button
              type="button"
              class="btn btn-primary"
              button
              data-bs-toggle="modal"
              id="modalBtn"
              data-bs-target="#exampleModal"
            >
              <i class="fas fa-search"></i>
            </button>
            <label style="margin-left: 30px; width: 100px">납기예정일</label>
            <input
              type="date"
              id="start"
              name="tui-date-picker-target"
              class="form-control tragetDate"
              style="width: 150px"
            />
            -
            <input
              type="date"
              id="end"
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
          <button class="btn btn-primary" id="searchBtnList">
            <i class="fas fa-search"></i> 조회
          </button>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="card col-xl-4">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="padding-left: 15px">자재발주 목록</h3>
      </div>
      <div class="card-body">
        <div id="grid"></div>
      </div>
    </div>

    <div class="card col-xl-7">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          자재발주 상세
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
          입고검사
        </h3>
        <button class="btn btn-primary" id="saveBtn" style="float: right">
          <i class="fas fa-save"></i> 저장
        </button>
        <!-- <button
          class="btn btn-primary"
          id="newPrcs"
          style="float: right; margin: 0 16px"
        >
          <i class="fas fa-file"></i> 추가
        </button>
        <button class="btn btn-primary" id="delPrcs" style="float: right">
          <i class="fas fa-trash"></i> 삭제
        </button> -->
      </div>
      <div class="card-body">
        <div id="grid3"></div>
      </div>
    </div>
  </div>
</div>
<!-- 거래처 검색 Modal -->
<div
  class="modal fade"
  id="exampleModal"
  tabindex="-1"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">업체검색</h5>
        <br /><br />
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <br />
      <div>
        <!-- <label style="margin-left: 20px;">업체명</label>  -->
        <input
          type="text"
          id="vendNmSearch"
          class="form-control"
          style="width: 150px; display: inline-block; margin-left: 20px"
          placeholder="업체명검색"
        />
        <button
          type="button"
          id="searchBtn"
          class="btn btn-primary"
          style="width: 43px"
        >
          <i class="fas fa-search"></i>
        </button>
      </div>
      <br />
      <div id="modGrid" class="modal-body"></div>
      <div class="modal-footer">
        <button
          type="button"
          id="clearBtn2"
          class="btn btn-secondary"
          data-bs-dismiss="modal"
        >
          닫기
        </button>
      </div>
    </div>
  </div>
</div>
<!-- 거래처 검색 Modal 끝-->
<!-- 검사 Modal -->
<div
  class="modal fade"
  id="testModal"
  tabindex="-1"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">불량상세</h5>
        <br /><br />
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <br />
      <div>
        <div id="grid4" class="modal-body"></div>
        <div class="modal-footer">
          <button
            type="button"
            id="inputBtn"
            class="btn btn-primary"
            data-bs-dismiss="modal"
          >
            입력
          </button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 거래처 검색 Modal 끝-->
<!-- 검사자 모달-->
<div
  class="modal fade"
  id="empModal"
  tabindex="-1"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">사원 검색</h5>
        <br /><br />
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <br />
      <div>
        <!--           <label style="margin-left: 20px;">사원 이름</label>                    
                     <input
                          type="text"
                          id="empSearch"
                          class="form-control"
                          style="width: 150px; display:inline-block;" />
                     <button
                          type="button"
                          id="empBtn"
                          class="btn btn-primary" style="width: 43px;">
                          <i class="fas fa-search"></i></button>    
                          </div>   
                          <br>   -->
        <div id="empGrid" class="modal-body"></div>
        <!-- <div class="modal-footer">  -->
        <!--      <button type="button" id="clearBtn2" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
        <br />
      </div>
    </div>
  </div>
</div>
<script language="Javascript">
  //업체명 모달창 그리드
  var gridVend = new tui.Grid({
    el: document.getElementById("modGrid"),
    columns: [
      {
        header: "거래처",
        name: "vendNm",
      },
      {
        header: "거래처코드",
        name: "vendCd",
      },
    ],
    pageOptions: {
      useClient: true,
      type: "scroll",
      perPage: 30,
    },
  });

  //거래처 검색 모달 함수
  function searchVend() {
    let vendNm = document.getElementById("vendNmSearch").value;
    $.ajax({
      url: "vendSearch",
      method: "post",
      data: { vendNm: vendNm },
      success: function (data) {
        gridVend.resetData(data);
        setTimeout(function () {
          gridVend.refreshLayout();
        }, 300);
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }

  //거래처 모달창이 뜨면
  $("#exampleModal").on("shown.bs.modal", function (e) {
    searchVend();
  });

  $("#exampleModal").on("hidden.bs.modal", function (e) {
    gridVend.clear();
    document.getElementById("vendNmSearch").value = "";
  });

  // 선택시 거래처명 변경
  gridVend.on("click", (ev) => {
    document.getElementById("vendNm").value =
      gridVend.getData()[ev.rowKey].vendNm;
    $("#exampleModal").modal("hide");
  });

  //거래처 모달 검색 버튼 동작
  searchBtn.addEventListener("click", searchVend);

  //발주주문 조회 그리드
  var grid = new tui.Grid({
    el: document.getElementById("grid"),
    scrollX: false,
    scrollY: true,
    bodyHeight: 400,
    columns: [
      {
        header: "발주번호",
        name: "ordrCd",
      },
      {
        header: "거래처명",
        name: "vendNm",
      },
      {
        header: "발주신청일",
        name: "ordrReqDt",
        formatter: function (data) {
          return dateChange(data.value);
        },
      },
    ],
  });

  //발주 주문서 더블클릭하면 상세조회
  grid.on("click", (ev) => {
    //console.log(grid.getData()[ev.rowKey].ordrCd);
    let ordrCd = grid.getData()[ev.rowKey].ordrCd;
    $.ajax({
      url: "detailList",
      method: "post",
      data: { ordrCd: ordrCd },
      success: function (data) {
        grid2.resetData(data);
        setTimeout(function () {
          grid2.refreshLayout();
        }, 300);

        grid3.resetData(data);
        setTimeout(function () {
          grid3.refreshLayout();
        }, 300);
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });

  //발주 디테일 그리드
  var grid2 = new tui.Grid({
    el: document.getElementById("grid2"),
    scrollX: false,
    scrollY: true,
    bodyHeight: 400,
    columns: [
      {
        header: "자재코드",
        name: "rscCd",
      },
      {
        header: "발주량",
        name: "ordrCnt",
      },
      {
        header: "미입고잔량",
        name: "rmnCnt",
        hidden: true,
      },
      {
        header: "납기요청일",
        name: "paprdCmndDt",
        formatter: function (data) {
          return dateChange(data.value);
        },
      },
    ],
  });

  //자재발주목록 아작스
  function search() {
    let start = document.getElementById("start").value;
    let end = document.getElementById("end").value;
    let vendNm = document.getElementById("vendNm").value.toUpperCase();
    $.ajax({
      url: "reList",
      method: "post",
      data: { start: start, end: end, vendNm: vendNm },
      success: function (data) {
        grid.resetData(data);
        setTimeout(function () {
          grid.refreshLayout();
        }, 300);

        setTimeout(function () {
          grid2.refreshLayout();
        }, 300);

        setTimeout(function () {
          grid3.refreshLayout();
        }, 300);
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }

  //페이지 켜지면
  window.onload = search;

  //조회 버튼 누르면 동작
  document.getElementById("searchBtnList").addEventListener("click", search);

  //날짜 변환
  function dateChange(date) {
    let date1 = new Date(date);
    let date2 =
      date1.getFullYear() +
      "-" +
      (date1.getMonth() < 10
        ? "0" + (date1.getMonth() + 1)
        : date1.getMonth() + 1) +
      "-" +
      (date1.getDate() < 10 ? "0" + date1.getDate() : date1.getDate());
    return date2;
  }

  //검사버튼
  let btn = "";
  class testBtn {
    constructor(props) {
      btn = document.createElement("button");
      btn.innerHTML = "검사";
      btn.id = "testBtn";
      this.el = btn;
    }
    getElement() {
      return this.el;
    }
  }

  //입고검사 그리드
  var grid3 = new tui.Grid({
    el: document.getElementById("grid3"),
    scrollX: false,
    scrollY: true,
    bodyHeight: 400,
    columns: [
      {
        header: "발주번호",
        name: "ordrCd",
        hidden: true,
      },

      {
        header: "자재코드",
        name: "rscCd",
      },
      {
        header: "자재명",
        name: "rscNm",
      },
      {
        header: "규격",
        name: "rscSpec",
      },
      {
        header: "단위",
        name: "rscUnit",
      },
      {
        header: "가입고량",
        name: "cnt",
        editor: "text",
        hidden: true,
      },
      {
        header: "검사량",
        name: "inspCnt",
        editor: "text",
        formatter: function (data) {
          if (data.value == 0) {
            return "";
          } else return data.value;
        },
      },
      {
        header: "검사",
        name: "test",
        renderer: { type: testBtn },
        align: "center",
        formatter: function (data) {
          if (data.value == 0) {
            return "";
          } else return data.value;
        },
      },
      {
        header: "합격량",
        name: "inspPassCnt",
        editor: "text",
        formatter: function (data) {
          if (data.value == 0) {
            return "";
          } else return data.value;
        },
      },
      {
        header: "불량수량",
        name: "inspFailCnt",
        editor: "text",
        formatter: function (data) {
          if (data.value == 0) {
            return "";
          } else return data.value;
        },
      },
      {
        header: "검사자",
        name: "empNm",
        //hidden: true,
      },
      {
        header: "사원코드",
        name: "inspTstr",
        hidden: true,
      },
    ],
  });

  let rowTest = 0; //검사클릭
  let rowEmp = 0; //검사자 클릭
  let errorData = []; //불량 데이터
  grid3.on("click", (ev) => {
    //검사 클릭하면
    if (ev.targetType == "cell" && ev.columnName == "test") {
      rowTest = ev.rowKey;
      $("#testModal").modal("show");
      setTimeout(function () {
        grid4.refreshLayout();
      }, 300);

      //아작스 호출
      $.ajax({
        url: "testPoor",
        method: "get",
        success: function (data) {
          grid4.resetData(data);
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }
    //검사자 클릭하면
    else if (ev.targetType == "cell" && ev.columnName == "empNm") {
      rowEmp = ev.rowKey;
      $("#empModal").modal("show");
      //아작스 호출
      $.ajax({
        url: "empList",
        method: "get",
        success: function (data) {
          gridEmp.resetData(data);
          setTimeout(function () {
            gridEmp.refreshLayout();
          }, 300);
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }
  });

  //모달창에서 입력 버튼 누르면
  let gridData = [];
  document.getElementById("inputBtn").addEventListener("click", function () {
    let sum = 0;
    for (let i = 0; i < grid4.getData().length; i++) {
      sum += Number(grid4.getData()[i].inferCnt);
    }

    for (let i = 0; i < grid4.getData().length; i++) {
      let data = grid4.getData()[i];
      data.rscCd = grid3.getData()[rowTest].rscCd;
      errorData.push(data);
    }

    $("#testModal").modal("hide");
    grid4.clear();

    gridData = grid3.getData();
    gridData[rowTest].inspFailCnt = sum;
    gridData[rowTest].inspPassCnt =
      Number(gridData[rowTest].inspCnt) - Number(gridData[rowTest].inspFailCnt);
    grid3.resetData(gridData);
  });

  //검사모달창
  var grid4 = new tui.Grid({
    el: document.getElementById("grid4"),
    scrollX: false,
    scrollY: true,
    bodyHeight: 200,
    columns: [
      {
        header: "불량코드",
        name: "detailCode",
      },
      {
        header: "불량사유",
        name: "detailName",
      },
      {
        header: "불량수량",
        name: "inferCnt",
        editor: "text",
      },
    ],
  });

  //저장버튼 누르면
  document.getElementById("saveBtn").addEventListener("click", function () {
    for (let i = 0; i < grid3.getData().length; i++) {
      if (
        grid3.getData()[i].inspCnt == 0 ||
        grid3.getData()[i].inspPassCnt == 0 ||
        grid3.getData()[i].empNm == null
      ) {
        Swal.fire({
          icon: "error",
          title: "작성을 완료해 주세요",
        });
        return;
      }
    }

    $.ajax({
      url: "error",
      method: "post",
      dataType: "json",
      contentType: "application/json",
      data: JSON.stringify(errorData),
      success: function (data) {
        //console.log("성공");
        errorData = [];
      },
      error: function (reject) {
        console.log(reject);
      },
    });

    $.ajax({
      url: "saveDetail",
      method: "post",
      dataType: "json",
      contentType: "application/json",
      data: JSON.stringify(grid3.getData()),
      success: function (data) {
        Swal.fire({
          icon: "success",
          title: "저장되었습니다.",
        });

        search();
        grid2.clear();
        grid3.clear();
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  });

  //사원 그리드
  var gridEmp = new tui.Grid({
    el: document.getElementById("empGrid"),
    scrollX: false,
    scrollY: true,
    bodyHeight: 200,
    columns: [
      {
        header: "사원코드",
        name: "empCode",
      },
      {
        header: "사원명",
        name: "empName",
      },
    ],
  });
  //사원그리드에서 더블클릭하면
  gridEmp.on("dblclick", (ev) => {
    let empCode = gridEmp.getData()[ev.rowKey].empCode;
    let empName = gridEmp.getData()[ev.rowKey].empName;
    gridData = grid3.getData();
    gridData[rowEmp].empNm = empName;
    gridData[rowEmp].inspTstr = empCode;
    grid3.resetData(gridData);

    $("#empModal").modal("hide");
  });
</script>
