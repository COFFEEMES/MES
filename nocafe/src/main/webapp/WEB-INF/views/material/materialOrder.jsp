<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jstl/core_rt" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jstl/fmt_rt" %>
<style>
  label {
    width: 100px;
    float: left;
  }

  .tui-grid-cell.cell-red {
    background-color: rgba(255, 0, 0, 0.3);
  }

  .tui-grid-cell.cell-green {
    background-color: rgba(0, 255, 0, 0.3);
  }
</style>

<div class="container-fluid px-4">
  <h1 class="mt-4">자재발주</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 자재관리</li>
    <li class="breadcrumb-item active">> 자재발주관리</li>
  </ol>

  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <tr>
          <th>자재명</th>
          <td>
            <input
              class="form-control"
              type="text"
              id="rscNm"
              name="rscNm"
              style="width: 150px"
            />
          </td>
          <button
            style="margin-bottom: 3px"
            class="btn btn-primary"
            id="SearchBtn"
          >
            <i class="fas fa-search"></i>
          </button>

          &nbsp&nbsp
        </tr>

        <br />
        <br />
        <div id="grid">
          <h6>자재목록</h6>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="card col-xl-11">
      <div class="card-body">
        <div class="linelist" style="float: right">
          <button class="btn btn-primary" id="minusBtn">
            <i class="fas fa-minus"></i> 삭제
          </button>
          <button class="btn btn-primary" id="saveBtn">
            <i class="fas fa-save"></i> 발주
          </button>
          <br />
          <br />
        </div>

        <br />
        <br />

        <div id="grid2">
          <h6>자재발주</h6>
        </div>
      </div>
    </div>
  </div>

  <script>
    let today = new Date();
    let year = today.getFullYear();
    let month = today.getMonth() + 1;
    let date = today.getDate();
    let format =
      year +
      ("00" + month.toString()).slice(-2) +
      ("00" + date.toString()).slice(-2);

    const gridData = [];

    const grid = new tui.Grid({
      el: document.getElementById("grid"),
      bodyHeight: 450,
      rowHeaders: ["rowNum"],
      columns: [
        {
          header: "자재코드",
          name: "rscCd",
          sortingType: "asc",
          sortable: true,
        },
        {
          header: "자재명",
          name: "rscNm",
          sortingType: "asc",
          sortable: true,
        },
        {
          header: "업체코드",
          name: "vendCd",
          sortingType: "asc",
          sortable: true,
        },
        {
          header: "업체명",
          name: "vendNm",
          sortingType: "asc",
          sortable: true,
        },
        {
          header: "현재재고",
          name: "lotCnt",
        },
        {
          header: "단위",
          name: "rscUnit",
        },
        {
          header: "안전재고",
          name: "safRtc",
        },
      ],
    });

    var isValid = true;

    $.ajax({
      url: "rscCOrdrList",
      method: "GET",
      dataType: "JSON",
      success: function (result) {
        grid.resetData(result);
        for (res in result) {
          var lotCnt = result[res].lotCnt;
          if (lotCnt == null || lotCnt == "" || lotCnt == 0) {
            result[res].lotCnt = 0;
          }
          var safRtc = grid.getValue(res, "safRtc");
          var safRtcValue = parseFloat(
            safRtc.replace(/[^0-9.-]/g, "").replace(/(\.*)\./g, "$1")
          );
          if (lotCnt < safRtcValue) {
            grid.addRowClassName(res, "cell-red");
          }
        }
      },
    });

    $("#grid").mouseleave((ev) => {
      grid.finishEditing();
    });

    $("#grid2").mouseleave((ev) => {
      grid2.finishEditing();
    });

    grid.on("dblclick", (ev) => {
      var rscCd = grid.getValue(ev.rowKey, "rscCd");
      var rscNm = grid.getValue(ev.rowKey, "rscNm");
      var vendCd = grid.getValue(ev.rowKey, "vendCd");
      var vendNm = grid.getValue(ev.rowKey, "vendNm");
      var lotCnt = grid.getValue(ev.rowKey, "lotCnt");
      var rscUnit = grid.getValue(ev.rowKey, "rscUnit");
      if (lotCnt == 0 || lotCnt == null || lotCnt == "") {
        lotCnt = 0;
      }
      var safRtc = grid.getValue(ev.rowKey, "safRtc");

      var rscCd2 = grid2.getColumnValues("rscCd");
      var vendCd2 = grid2.getColumnValues("vendCd");

      var isValid = true;
      for (i = 0; i < rscCd2.length; i++) {
        if (rscCd2[i] == rscCd) {
          Swal.fire({
            icon: "error",
            title: "동일 항목의 발주가 진행중입니다.",
            text: "",
          });

          isValid = false;
          return false;
        } else if (vendCd2[i] != vendCd) {
          Swal.fire({
            icon: "error",
            title: "동일 업체의 발주만 가능합니다.",
            text: "",
          });

          isValid = false;
          return false;
        }
      }

      grid2.appendRow({
        rscCd: rscCd,
        rscNm: rscNm,
        vendCd: vendCd,
        vendNm: vendNm,
        lotCnt: lotCnt,
        rscUnit: rscUnit,
        safRtc: safRtc,
      });

      $.ajax({
        url: "MaterialDetail",
        method: "POST",
        data: {
          rscCd: rscCd,
        },
        success: function (result) {},
      });

      let ordrSCnt = format;
      $.ajax({
        url: "materialOrderCd",
        method: "POST",
        data: {
          ordrSCnt: ordrSCnt,
        },
        success: function (result) {
          index = result[0].ordrSCnt;

          function makeCd() {
            var reCd =
              "ORD" + ordrSCnt + String(Number(index) + 1).padStart(3, "0");
            return reCd;
          }
          code = makeCd();
          for (let i = 0; i < grid2.getRowCount(); i++) {
            grid2.setValue(i, "ordrCd", code);
          }
        },
      });
    });

    const grid2 = new tui.Grid({
      el: document.getElementById("grid2"),
      bodyHeight: 200,
      rowHeight: 35,
      rowHeaders: ["checkbox"],
      header: {
        height: 40,
      },
      columns: [
        {
          header: "자재코드",
          align: "center",
          name: "rscCd",
        },
        {
          header: "자재명",
          align: "left",
          name: "rscNm",
        },
        {
          header: "업체코드",
          align: "center",
          name: "vendCd",
        },
        {
          header: "업체명",
          align: "center",
          name: "vendNm",
        },
        {
          header: "발주코드",
          align: "center",
          name: "ordrCd",
        },
        {
          header: "발주수량",
          align: "right",
          name: "ordrCnt",
          editor: "text",
        },
        {
          header: "현재재고",
          align: "right",
          name: "lotCnt",
        },
        {
          header: "단위",
          align: "right",
          name: "rscUnit",
        },
        {
          header: "안전재고",
          align: "right",
          name: "safRtc",
        },
        {
          header: "예상재고",
          align: "right",
          name: "allStc",
        },
        {
          header: "납기요청일",
          align: "center",
          name: "paprdCmndDt",
          formatter: function (data) {
            let dateVal = "";
            if (data.value != null) {
              dateVal = dateChange(data.value);
            }
            return dateVal;
          },
          editor: {
            type: "datePicker",
            options: {
              format: "yyyy-MM-dd",
            },
          },
        },
      ],
    });

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

    $("#SearchBtn").on("click", function () {
      let rscNm = $("#rscNm").val();
      $.ajax({
        url: "materalSearch",
        method: "POST",
        data: {
          rscNm: rscNm,
        },
        success: function (result) {
          grid.resetData(result);
        },
      });
    });

    grid.on("editingFinish", function (ev) {
      var lotCnt = grid2.getValue(ev.rowKey, "lotCnt");
      var safRtc = grid2.getValue(ev.rowKey, "safRtc");
      var isValid = true;

      if (Number(lotCnt) < Number(safRtc)) {
        grid.addRowClassName(ev.rowKey);
      }
      if (Number(lotCnt) > Number(safRtc)) {
        grid.removeRowClassName(ev.rowKey);
      }
    });

    grid2.on("editingFinish", function (ev) {
      var ordrCnt = grid2.getValue(ev.rowKey, "ordrCnt");
      var lotCnt = grid2.getValue(ev.rowKey, "lotCnt");
      var safRtc = grid2.getValue(ev.rowKey, "safRtc");
      var safRtcValue = parseFloat(
        safRtc.replace(/[^0-9.-]/g, "").replace(/(\.*)\./g, "$1")
      );
      var isValid = true;

      ordrCnt = Number(ordrCnt);
      lotCnt = Number(lotCnt);

      var allStc = ordrCnt + lotCnt;

      grid2.setValue(ev.rowKey, "allStc", allStc);
      if (allStc < safRtcValue) {
        grid2.addRowClassName(ev.rowKey, "cell-red");
      }

      if (allStc >= safRtcValue) {
        grid2.removeRowClassName(ev.rowKey, "addClass");
      }
    });

    grid2.on("editingFinish", function (ev) {
      var ordrCnt = grid2.getValue(ev.rowKey, "ordrCnt");
      var lotCnt = grid2.getValue(ev.rowKey, "lotCnt");
      var safRtc = grid2.getValue(ev.rowKey, "safRtc");
      var safRtcValue = parseFloat(
        safRtc.replace(/[^0-9.-]/g, "").replace(/(\.*)\./g, "$1")
      );
      var isValid = true;

      ordrCnt = Number(ordrCnt);
      lotCnt = Number(lotCnt);

      var allStc = ordrCnt + lotCnt;

      grid2.setValue(ev.rowKey, "allStc", allStc);
      if (allStc > safRtcValue) {
        grid2.addRowClassName(ev.rowKey, "cell-green");
      }
    });

    $("#minusBtn").on("click", function (ev) {
      var data = grid2.getCheckedRows();
      var isValid = true;

      if (data.length == null || data.length == 0) {
        Swal.fire({
          icon: "error",
          title: "체크된 발주 목록이 없습니다.",
          text: "",
        });

        isValid = false;
        return false;
      }
      grid2.removeCheckedRows();
      Swal.fire({
        icon: "success",
        title: "정상적으로 삭제되었습니다.",
        text: "",
      });
    });

    $("#saveBtn").click((ev) => {
      var data = grid2.getCheckedRows();
      var isValid = true;

      if (data.length == null || data.length == 0) {
        Swal.fire({
          icon: "error",
          title: "체크된 발주 목록이 없습니다.",
          text: "",
        });

        isValid = false;
        return false;
      }

      for (i = 0; i < data.length; i++) {
        if (
          data[i].ordrCnt == null ||
          data[i].ordrCnt == "0" ||
          data[i].ordrCnt == "" ||
          data[i].paprdCmndDt == null ||
          data[i].paprdCmndDt == "0" ||
          data[i].paprdCmndDt == ""
        ) {
          Swal.fire({
            icon: "error",
            title: "발주신청 내역 내 공란이 존재합니다.",
            text: "",
          });
          isValid = false;
          return false;
        } else {
          $.ajax({
            url: "materialOrderInsert",
            method: "POST",
            data: JSON.stringify(data),
            contentType: "application/json",
          }).done(function (result) {
            Swal.fire({
              icon: "success",
              title: "발주 신청이 완료되었습니다.",
              text: "",
            });

            grid2.removeCheckedRows();
            grid2.uncheckAll();
          });
        }
      }
    });
  </script>
</div>
