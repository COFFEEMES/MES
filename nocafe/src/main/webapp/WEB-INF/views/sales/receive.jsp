<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"
/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<div class="container-fluid px-4">
  <h1 class="mt-4">제품입고등록</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 영업관리</li>
    <li class="breadcrumb-item active">> 제품입고등록</li>
  </ol>

  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <div class="linelist" style="float: right">
          <button type="button" class="btn btn-primary" id="saveBtn">
            <i class="fas fa-save"></i> 등록
          </button>
          <button class="btn btn-primary" id="ReBtn">
            <i class="fas fa-file"></i> 초기화
          </button>
        </div>
        <tr>
          <th style="border-bottom-width: 0px">포장완료제품</th>
          <td style="border-bottom-width: 0px">
            <input
              type="text"
              class="form-control"
              id="com"
              name="com"
              style="width: 180px"
              readonly
            />
            <!-- 모달버튼 -->
            <button
              type="button"
              class="btn btn-primary"
              id="comSearchBtn"
              data-bs-toggle="modal"
              data-bs-target="#lotModal"
            >
              <i class="fas fa-search"></i>
            </button>
          </td>
        </tr>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <div id="complete"></div>
      </div>
    </div>
  </div>
</div>
<!-- 검사완료 제품 모달 -->
<div
  class="modal fade"
  id="lotModal"
  tabindex="-1"
  aria-labelledby="elLabel"
  aria-hidden="true"
>
  <div class="modal-dialog modal-lg">
    xampleModa
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="lotModalLabel">포장완료 제품</h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
        <div id="comGrid"></div>
      </div>
      <div class="modal-footer">
        <button
          type="button"
          id="confirmBtn"
          class="btn btn-primary"
          data-bs-dismiss="modal"
        >
          확인
        </button>
        <button
          type="button"
          id="cancleLotBtn"
          class="btn btn-secondary"
          data-bs-dismiss="modal"
        >
          닫기
        </button>
      </div>
    </div>
  </div>
</div>
<!-- 모달 div끝 -->
<script>
  //검사완료 제품 모달 그리드
  var gridCom = new tui.Grid({
    el: document.getElementById("comGrid"),
    scrollX: false,
    scrollY: true,
    bodyHeight: 243,
    rowHeaders: ["checkbox"],
    columns: [
      {
        header: "제품코드",
        name: "proCd",
      },
      {
        header: "제품명",
        name: "proNm",
      },

      {
        header: "수량",
        name: "output",
      },
      {
        header: "생산지시코드",
        name: "prOrderCd",
        hidden: true,
      },
      {
        header: "공정코드",
        name: "prcsCd",
        hidden: true,
      },
    ],
    pageOptions: {
      useClient: true,
      type: "scroll",
      perPage: 30,
    },
  });

  //조회버튼 눌렀을 때
  function search() {
    $.ajax({
      url: "testCom",
      method: "post",
      success: function (data) {
        setTimeout(function () {
          gridCom.refreshLayout();
        }, 300);
        gridCom.resetData(data);
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }

  //버튼 누르면 조회
  document.getElementById("comSearchBtn").addEventListener("click", search);

  //모달창버튼 확인 누르면 append
  document.getElementById("confirmBtn").addEventListener("click", append);

  //입고 조회 그리드
  var gridRe = new tui.Grid({
    el: document.getElementById("complete"),
    scrollX: false,
    scrollY: true,

    columns: [
      {
        header: "입고번호",
        name: "proIstNo",
      },
      {
        header: "입고일자",
        name: "proIstDt",
        formatter: function (data) {
          return dateChange(data.value);
        },
      },
      {
        header: "제품명",
        name: "proNm",
      },
      {
        header: "제품코드",
        name: "proCd",
        hidden: true,
      },

      {
        header: "입고수량",
        name: "proIstCnt",
      },

      {
        header: "LOT번호",
        name: "proLotNo",
      },
      {
        header: "생산지시코드",
        name: "prOrderCd",
        hidden: true,
      },
      {
        header: "공정코드",
        name: "prcsCd",
        hidden: true,
      },
    ],
    bodyHeight: 500,
    pageOptions: {
      useClient: true,
      type: "scroll",
      perPage: 30,
    },
  });

  let comData = []; //체크된 제품 정보 넣는 배열
  let rowData = {}; //추가할 행
  //등록하기전 그리드에 추가
  function append() {
    gridRe.clear();
    comData = gridCom.getCheckedRows();
    for (let i = 0; i < comData.length; i++) {
      rowData.proNm = comData[i].proNm;
      rowData.proIstCnt = comData[i].output;
      rowData.proIstDt = getToday();
      rowData.proCd = comData[i].proCd;
      rowData.prOrderCd = comData[i].prOrderCd;
      rowData.prcsCd = comData[i].prcsCd;
      gridRe.appendRow(rowData);
    }

    if (gridCom.getCheckedRows().length == 1) {
      document.getElementById("com").value = gridCom.getCheckedRows()[0].proNm;
    } else {
      document.getElementById("com").value =
        gridCom.getCheckedRows()[0].proNm +
        " 외 " +
        (gridCom.getCheckedRows().length - 1) +
        "건";
    }
  }

  //오늘날짜로
  function getToday() {
    const date = new Date();
    const hours = String(date.getHours()).padStart(2, "0");
    const minutes = String(date.getMinutes()).padStart(2, "0");
    const seconds = String(date.getSeconds()).padStart(2, "0");
    const years = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");

    return years + "-" + month + "-" + day;
  }

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

  //저장누르면 입고처리
  document.getElementById("saveBtn").addEventListener("click", register);
  function register() {
    $.ajax({
      url: "signUp",
      method: "post",
      //data: {},
      dataType: "json",
      contentType: "application/json",
      data: JSON.stringify(gridRe.getData()),
      success: function (data) {
        load();
        document.getElementById("com").value = "";
        Swal.fire({
          icon: "success",
          title: data + "건 입고 등록되었습니다",
        });
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }

  //페이지뜨자마자 입고 조회(오늘날짜)
  window.onload = load;

  function load() {
    $.ajax({
      url: "receiveData",
      method: "get",
      success: function (data) {
        gridRe.resetData(data);
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }

  //초기화 버튼 누르면
  document.getElementById("ReBtn").addEventListener("click", returnFun);
  function returnFun() {
    document.getElementById("com").value = "";
    gridRe.clear();
    load();
  }
</script>
