<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
  <h1 class="mt-4">자재입고등록</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 자재관리</li>
    <li class="breadcrumb-item active">> 입고등록</li>
  </ol>
  <div class="row">
    <div class="card col-xl-5">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="padding-left: 15px; display: inline-block">
          자재 검사 완료
        </h3>
        <button
          class="btn btn-primary"
          id="newBtn"
          style="float: right; margin: 0 16px"
        >
          <i class="fas fa-file"></i> 추가
        </button>
      </div>
      <div class="card-body">
        <div id="grid"></div>
      </div>
    </div>
    <div class="card col-xl-5">
      <div class="linelist" style="margin-top: 16px">
        <h3 style="width: 100px; display: inline; padding-left: 15px">
          자재입고
        </h3>
      </div>
      <div class="card-body">
        <div id="grid2"></div>
      </div>
    </div>
  </div>
</div>
<script>
  let comData = []; //체크된 데이터
  //검사완료 그리드
  var grid = new tui.Grid({
    el: document.getElementById("grid"),
    scrollX: false,
    scrollY: true,
    bodyHeight: 600,
    rowHeaders: ["checkbox"],
    columns: [
      {
        header: "검사코드",
        name: "inspCd",
      },
      {
        header: "발주번호",
        name: "ordrCd",
      },
      {
        header: "자재코드",
        name: "rscCd",
      },
      {
        header: "수량",
        name: "inspPassCnt",
      },
    ],
  });
  grid.on("check", (ev) => {
    comData = grid.getCheckedRows();
  });

  grid.on("uncheck", (ev) => {
    comData = grid.getCheckedRows();
  });

  grid.on("checkAll", (ev) => {
    comData = grid.getCheckedRows();
  });

  //자재입고 그리드
  var grid2 = new tui.Grid({
    el: document.getElementById("grid2"),
    scrollX: false,
    scrollY: true,
    bodyHeight: 600,
    columns: [
      {
        header: "입고코드",
        name: "istCd",
      },
      {
        header: "자재코드",
        name: "rscCd",
      },
      {
        header: "입고수량",
        name: "istCnt",
      },
      {
        header: "입고일자",
        name: "istDt",
        formatter: function (data) {
          return dateChange(data.value);
        },
      },
    ],
  });

  //페이지 켜지면
  window.onload = search;

  function search() {
    //검사완료 호출
    $.ajax({
      url: "comSearch",
      method: "get",
      success: function (data) {
        grid.resetData(data);
        setTimeout(function () {
          grid.refreshLayout();
        }, 300);
      },
      error: function (reject) {
        console.log(reject);
      },
    });

    //검사완료 호출
    $.ajax({
      url: "comInput",
      method: "get",
      success: function (data) {
        grid2.resetData(data);
        setTimeout(function () {
          grid.refreshLayout();
        }, 300);
      },
      error: function (reject) {
        console.log(reject);
      },
    });
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

  document.getElementById("newBtn").addEventListener("click", save);
  function save() {
    //console.log(comData);
    $.ajax({
      url: "allSave",
      method: "post",
      dataType: "json",
      contentType: "application/json",
      data: JSON.stringify(comData),
      success: function (data) {
        Swal.fire({
          icon: "success",
          title: "입고등록하였습니다.",
        });
        search();
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }
</script>
