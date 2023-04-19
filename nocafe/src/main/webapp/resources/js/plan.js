/**
 * 생산계획 js
 */

// 	    ↓↓↓↓↓bom 으로 가져온 공정
let bom;
let planDt = $("#tui-date-picker-target").val();
//		↓↓↓↓↓오늘 날짜
let todayForgrid = new Date();
//         console.log(todayForgrid);
let threeMonthsLater = new Date();
threeMonthsLater.setMonth(todayForgrid.getMonth() + 3);

let today = dateChange(todayForgrid);
let after = dateChange(threeMonthsLater);

// 		↓↓↓↓↓input date에 오늘 날짜 담기
// 		↓↓↓↓↓↓↓↓ 생산기간 최대 3개월텀으로 고정
$(document).ready(function () {
  $("#tui-date-picker-target").attr("value", today);
  $("#ex-start").attr({ max: after, min: today });
  $("#ex-end").attr({ max: after, min: today });
});

// 		↓↓↓↓ grid3 그릴때 제품명,생산수량 담을 객체
class proInfo {
  constructor(name, cnt) {
    this.proNm = name;
    this.proCnt = cnt;
  }
}

// 		↓↓↓↓↓↓DB에 insert 하기위한 정보를 담을 객체
class planInfo {
  constructor(planCd, proNm, planCnt, exStart, exEnd, planDt) {
    this.planCd = planCd;
    this.proNm = proNm;
    this.planCnt = planCnt;
    this.exStart = exStart;
    this.exEnd = exEnd;
    this.planDt = planDt;
  }
}

// 		↓↓↓↓↓↓DB 주문정보에 update하기 위한 객체
class orderInfo {
  constructor(orderNo, planCd) {
    this.orderNo = orderNo;
    this.planCd = planCd;
  }
}

let proNmListAry = new Array(); //계획 정보 담아 줄 배열
let orderListAry = new Array(); //주문정보 담아 줄 배열
let containorAry = new Array(); //grid3에 뿌려줄 제품이름, 주문수량 포함 객체 넣어줄 배열
// 	   	↓↓↓↓계획코드 담을 변수
let code;

// 		↓↓↓↓↓↓초기화
$("#clearBtn").on("click", function () {
  grid.clear();
  grid2.clear();
  grid3.clear();
  grid4.clear();
  grid5.clear();
});

const gridData = [];
// 		↓↓↓↓↓수정가능한 컬럼 모듈 그리드 상단 더블클릭시 활성화 시킬 예정이었.
const options = {
  el: document.getElementById("grid"),
  data: gridData,
  scrollX: false,
  scrollY: false,
  columns: [
    {
      header: "업체명",
      name: "vendNm",
      align: "center",
    },
    {
      header: "주문번호",
      name: "orderNo",
      align: "center",
      editor: {
        type: "text",
      },
    },
    {
      header: "납기 일자",
      name: "parrdDt",
      align: "center",
      formatter: function (data) {
        return dateChange(data.value);
      },
    },
  ],
};

// 		↓↓↓↓ 주문서 버튼 클릭
$(modalBtn).on("click", function (e) {
  // 			↓↓↓↓ 버튼 누르면 배열 초기화
  orderListAry = new Array();

  // 					↓↓↓↓ 생산미계획 주문서정보 모달창으로 조회
  $.ajax({
    url: "orderListModal",
    method: "GET",
    dataType: "JSON",
    success: function (res) {
      if (res == null) {
        alert("정보가 없습니다.");
      }
      // 						↓↓↓↓모달창 리셋
      modGrid.resetData(res);
      setTimeout(() => modGrid.refreshLayout(), 300);
      // 						console.log(res[0].orderNo);
    },
    error: function (err) {
      console.log(err);
    },
  });
});

//	↓↓↓↓↓↓모달 확인 버튼 클릭시 화면에 뿌려주는 동작
$("#confirmBtn").on("click", function (e) {
  let oderInfo = modGrid.getCheckedRows();
  grid.resetData(oderInfo);

  let checked = modGrid.getCheckedRows();
  // 			console.log (checked)
  // 			↓↓↓↓↓↓체크 한 행의 주문번호 담기
  for (let i = 0; i < checked.length; i++) {
    orderListAry[i] = checked[i].orderNo;
  }

  // 			console.log(orderListAry);
  // 			↓↓↓↓↓↓주문 번호로 주문정보디테일 받아오기
  $.ajax({
    url: "getOrderPro",
    method: "POST",
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(orderListAry),
    success: function (res) {
      // 					console.log(res);
      // 					↓↓↓↓ 주문수량과 생산수량 동일하게 넣어주기
      for (let i = 0; i < res.length; i++) {
        res[i].proCnt = res[i].orderCnt;
      }
      // 					↓↓↓↓두번째 그리드에 받은 정보 뿌리기
      grid2.resetData(res);
    },
    error: function (err) {
      console.log(err);
    },
  });
});

// 		↓↓↓↓↓모달 grid
const modGrid = new tui.Grid({
  el: document.getElementById("modGrid"),
  rowHeaders: ["checkbox"],
  scrollX: false,
  scrollY: true,
  bodyHeight: 400,
  columns: [
    {
      header: "주문번호",
      name: "orderNo",
    },
    {
      header: "주문일자",
      name: "orderDt",
      formatter: function (data) {
        return dateChange(data.value);
      },
    },
    {
      header: "납기일자",
      name: "parrdDt",
      formatter: function (data) {
        return dateChange(data.value);
      },
    },
  ],
});

//  	↓↓↓↓↓계획서 개요 grid
const gridFormat = {
  el: document.getElementById("grid"),
  data: gridData,
  scrollX: false,
  scrollY: false,
  columns: [
    {
      header: "업체명",
      name: "vendNm",
      align: "center",
    },
    {
      header: "주문 일자",
      name: "orderDt",
      align: "center",
      formatter: function (data) {
        return dateChange(data.value);
      },
    },
    {
      header: "납기 일자",
      name: "parrdDt",
      align: "center",
      formatter: function (data) {
        return dateChange(data.value);
      },
    },
  ],
};
let grid = new tui.Grid(gridFormat);

// 		↓↓↓↓↓↓ 제품별 주문수량 생산수량
const gridData2 = [];
const grid2 = new tui.Grid({
  el: document.getElementById("grid2"),
  data: gridData2,
  scrollX: false,
  scrollY: true,
  bodyHeight: 243,
  columns: [
    {
      header: "제품명",
      name: "proNm",
      align: "center",
    },
    {
      header: "주문 수량",
      name: "orderCnt",
      align: "right",
    },

    {
      header: "생산 수량",
      name: "proCnt",
      align: "right",
      editor: {
        type: "text",
      },
    },
    {
      header: "재고량",
      name: "stockCnt",
      align: "right",
    },
  ],
  onGridUpdated(ev) {
    // 				기본값
    let gridData = grid2.getData();
    // 				↓↓↓↓
    getPrcs(gridData[0].proNm);
    // 				↓↓↓↓grid3에 제품의 공정과 공정별 불량류 표시
    mkgrid3();
  },
});

// 		↓↓↓↓grid2바탕으로 제품별 공정, 불량률 출력grid
const gridData3 = [];
const grid3 = new tui.Grid({
  el: document.getElementById("grid3"),
  data: gridData3,
  scrollX: false,
  scrollY: true,
  bodyHeight: 243,
  rowHeaders: ["rowNum"],
  columns: [
    {
      header: "공정이름",
      name: "prcsNm",
      align: "center",
    },
    {
      header: "자재이름",
      name: "rscNm",
      align: "center",
    },

    {
      header: "불량률",
      name: "inferPct",
      align: "right",
    },
  ],
});

// 		↓↓↓↓grid2의 제품 생산용 자재 출력 grid
const gridData4 = [];
const grid4 = new tui.Grid({
  el: document.getElementById("grid4"),
  data: gridData4,
  scrollX: false,
  scrollY: true,
  bodyHeight: 243,
  columns: [
    {
      header: "자재명",
      name: "rscNm",
      align: "center",
    },
    {
      header: "재고량",
      name: "lotCnt",
      align: "center",
    },
    {
      header: "예상사용량",
      name: "exCnt",
      align: "center",
    },
  ],
  onGridUpdated(ev) {
    // 				↓↓↓↓↓↓grid2와 연동되서 바뀌면 grid5의 값도 변화
    let gridData = grid4.getData();
    let cnt = 0;

    gridData.forEach((row) => {
      let lotCnt = Number(row.lotCnt);
      let exCnt = Number(row.exCnt);
      // 					↓↓↓↓자재부족 할 시 붉은색으로 표시
      if (lotCnt < exCnt) {
        grid4.addRowClassName(row.rowKey, "not-allow-row");
        if (cnt == 0) {
          lessLot = row.rscNm;
        } else {
          lessLot += ",";
          lessLot += row.rscNm;
          console.log(lessLot);
        }
        cnt++;
        // 						console.log(cnt)
        // 						console.log(lessLot)
      } else {
        grid4.removeRowClassName(row.rowKey, "not-allow-row");
      }
    });
    // 				grid5가 존재하면 불량률도 수정되야 한다
    if (grid5.getData().length > 0) {
      mkCal();
    }
  },
});
// 		↓↓↓↓ 상세 자재LOT단위로 출력grid
const gridData5 = [];
const grid5 = new tui.Grid({
  el: document.getElementById("grid5"),
  data: gridData5,
  scrollX: false,
  scrollY: true,
  bodyHeight: 243,
  columns: [
    {
      header: "자재명",
      name: "rscNm",
      align: "center",
    },
    {
      header: "자재 LOT",
      name: "rscLotCd",
      align: "center",
    },
    {
      header: "사용가능 수량",
      name: "lotCnt",
      align: "center",
    },
    {
      header: "예상사용량",
      name: "exCnt",
      align: "center",
    },
  ],
  summary: {
    height: 40,
    position: "bottom", // or 'top'
    columnContent: {
      lotCnt: {
        template: function (valueMap) {
          return `합계 : ${valueMap.sum}`;
        },
      },
      exCnt: {
        template: function (valueMap) {
          return `합계: ${valueMap.sum}`;
        },
      },
    },
  },
});

// 		↓↓↓↓grid2 행 더블클릭시 행에 맞게 grid3 출력
grid2.on("dblclick", (ev) => {
  console.log(ev);
  if (ev.rowKey == null) {
    Swal.fire({
      icon: "error",
      title: "값이 없습니다.",
      text: "값을 조회 후 사용가능합니다.",
    });
  }
  console.log(ev.rowKey);
  if (ev.rowKey === undefined) {
    return;
  }
  let proNm = grid2.getData()[ev.rowKey].proNm;
  getPrcs(proNm);
});

// 		↓↓↓↓grid4 행 더블클릭시 grid5에 필요자재 LOT단위로 출력
grid4.on("dblclick", (ev) => {
  console.log(ev);
  if (ev.rowKey == null) {
    Swal.fire({
      icon: "error",
      title: "값이 없습니다.",
      text: "값을 조회 후 사용가능합니다.",
    });
  }
  console.log(ev.rowKey);
  let rscNm = grid4.getData()[ev.rowKey].rscNm;
  console.log(rscNm);

  $.ajax({
    url: "getRscLot",
    method: "POST",
    data: { rscNm: rscNm },
    success: function (result) {
      console.log(result);

      let gridData = grid2.getData();

      $.ajax({
        url: "getProNm",
        method: "POST",
        data: { rscNm: rscNm },
        success: function (res) {
          let exCnt = 0;

          grid5.resetData(result);
          mkCal();
        },
      });
    },
    error: function (err) {
      console.log(err);
    },
  });
});

// 		↓↓↓↓↓↓↓날짜 포맷 적용함수
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

// 		    ↓↓↓↓↓↓↓제품 공정 받아오는 Ajax
function getPrcs(data) {
  $.ajax({
    url: "getBom",
    method: "GET",
    data: { proNm: data },
    success: function (result) {
      console.log(result);
      bom = result;

      $.ajax({
        url: "getInfer",
        method: "GET",
        data: { proNm: data },
        success: function (res) {
          console.log(res);

          for (let i = 0; i < bom.length; i++) {
            bom[i].inferPct = res[i].inferPct;
          }
          console.log(bom);
          grid3.resetData(bom);
        },
      });
    },
    error: function (err) {
      console.log(err);
    },
  });
}
function getPlanCd(data) {
  //	 			↓↓↓↓↓ 계획번호 생성
  $.ajax({
    url: "getPlanCd",
    method: "GET",
    data: { planDt: data },
    success: function (result) {
      code = result.planCd;
      console.log(code);
    },
    error: function (err) {
      console.log(err);
    },
  });
}

// 		    필요자재와 사용가능 자재 불러오기
function getRscInfo(data) {
  console.log(data);
  $.ajax({
    url: "getRscStock",
    method: "POST",
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(data),
    success: function (result) {
      console.log(result);

      grid4.resetData(result);
    },
    error: function (err) {
      console.log(err);
    },
  });
}
// 		    grid4그리기
function mkgrid3() {
  let gridData = grid2.getData();
  // 				필요자재 출력
  let con;
  for (let i = 0; i < gridData.length; i++) {
    con = new proInfo(gridData[i].proNm, gridData[i].proCnt);
    containorAry[i] = con;
  }
  getRscInfo(containorAry);
}

// 		    grid5 예상사용량 그리기
function mkCal() {
  let exCnt = 0;
  let gridData = grid4.getData();
  let grData = grid5.getData();
  for (let i = 0; i < gridData.length; i++) {
    for (let j = 0; j < grData.length; j++) {
      if (gridData[i].rscNm == grData[j].rscNm) {
        exCnt = parseInt(gridData[i].exCnt);
        console.log(exCnt);
      }
    }
  }
  let rowCnt = 0;
  console.log(grData);
  while (rowCnt < grData.length) {
    if (rowCnt != 0) {
      exCnt -= grData[rowCnt].lotCnt;
    }
    if (exCnt < 0) {
      exCnt = 0;
    }
    grData[rowCnt].exCnt = exCnt;
    rowCnt++;
    console.log(grData);
  }
  grid5.resetData(grData);
}

// 			grid2의 내용을 수정했을때 예외처리
let modData = 0;
grid2.on("editingStart", (e) => {
  console.log(e);
  modData = grid2.getRow(e.rowKey).proCnt;
  console.log(modData);
});
$("#grid2").on("keyup", function (key) {
  let gridData = grid2.getData();
  let lessLot = null;
  if (key.keyCode == 13) {
    gridData.forEach((row) => {
      console.log(row);
      let orderCnt = Number(row.orderCnt);
      let proCnt = Number(row.proCnt);
      if (isNaN(proCnt)) {
        setTimeout(() => {
          Swal.fire({
            icon: "error",
            title: "입력경고!",
            text: "숫자만 입력 가능합니다!",
          });
          console.log(row.rowKey);
          grid2.setValue(row.rowKey, "proCnt", modData);
        });
      }

      if (orderCnt > proCnt) {
        lessLot = row.proNm;
        grid2.addRowClassName(row.rowKey, "not-allow-row");
        setTimeout(
          () =>
            Swal.fire({
              icon: "error",
              title: "수량 경고!",
              text:
                lessLot +
                "주문수량보다 생산수량이 적을 수는 없습니다. 생산수량을 수정해주세요",
            }),
          10
        );
        grid2.setValue(row.rowKey, "proCnt", modData);
      } else {
        grid2.removeRowClassName(row.rowKey, "not-allow-row");
      }
      mkgrid3();
    });
  }
});

$("#osBtn").on("click", function () {
  let startDt = $("#ex-start").val();
  let endDt = $("#ex-end").val();
  planDt = $("#tui-date-picker-target").val();
  let orderNm = new Array();
  if (startDt == "" || endDt == "") {
    Swal.fire({
      icon: "error",
      title: "데이터 없음!",
      text: "생산계획일자를 지정해 주세요!",
    });
    return;
  }

  let moData = modGrid.getData();
  let data = grid2.getData();
  console.log(data);
  let resCnt = 0;
  $.ajax({
    url: "getPlanCd",
    method: "GET",
    data: { planDt: planDt },
    success: function (result) {
      code = result.planCd;
      for (let i = 0; i < data.length; i++) {
        proNmListAry[i] = new planInfo(
          code,
          data[i].proNm,
          data[i].proCnt,
          startDt,
          endDt,
          planDt
        );
      }

      for (let i = 0; i < orderListAry.length; i++) {
        console.log(orderListAry[i]);
        orderNm[i] = new orderInfo(orderListAry[i], code);
      }
      console.log(proNmListAry);

      $.ajax({
        url: "mkPlan",
        method: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(proNmListAry),
        success: function (res) {
          resCnt += res;
          console.log(res);
          console.log(orderNm);
          $.ajax({
            url: "updateOrder",
            method: "post",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(orderNm),
            success: function (res2) {
              resCnt += res2;

              console.log(resCnt);
              if (resCnt != proNmListAry.length + orderNm.length + 1) {
                Swal.fire({
                  icon: "error",
                  title: "저장실패!",
                  text: "선택 데이터와 입력된 데이터의 값이 다릅니다 확인해 주세요!",
                });
              } else if (resCnt == proNmListAry.length + orderNm.length + 1) {
                Swal.fire({
                  icon: "success",
                  title: "저장!",
                  text: "데이터가 성공적으로 저장되었습니다!",
                });
                grid.clear();
                grid2.clear();
                grid3.clear();
                grid4.clear();
                grid5.clear();
              }
            },
          });
        },
        error: function (err) {
          console.log(err);
        },
      });
    },
    error: function (err) {
      console.log(err);
    },
  });
});
