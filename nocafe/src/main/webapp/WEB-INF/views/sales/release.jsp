<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  </head>
  <body>
    <div class="container-fluid px-4">
      <h1 class="mt-4" style="margin-left: 20px">제품출고등록</h1>
      <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item" style="margin-left: 25px">
          <a href="/"><i class="fas fa-home"></i></a>
        </li>
        <li class="breadcrumb-item">> 영업관리</li>
        <li class="breadcrumb-item active">> 제품출고등록</li>
      </ol>
    </div>
    <div style="display: flex">
      <div style="flex: 2">
        <div class="container-fluid px-4">
          <div class="col-md-8">
            <div class="card mb-4" style="width:900px; height:700px;">
              <div class="card-header">진행중 주문서</div>
              <div class="card-body">
                <div id="order"></div>
              </div>
            </div>
          </div>
        </div>
      </div>

        <div style="flex: 1">
          <div class="col-md-4">
            <div class="card mb-4" style="width:900px; height:700px;">
              <div class="card-header">출고 등록 현황</div>
              <div class="card-body">
                <div id="release"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--모달-->
    <div
      class="modal fade"
      id="comModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">완제품 재고</h5>

            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div id="invenGrid"></div>
          </div>
          <div class="modal-footer">
            주문일자<input
              type="text"
              id="orderDt"
              name="orderDt"
              class="form-control"
              style="width: 150px"
              disabled
            />
            거래처<input
              type="text"
              id="vend"
              name="vend"
              class="form-control"
              style="width: 150px"
              disabled
            />
            주문수량<input
              type="text"
              id="orderCntOut"
              name="orderCntOut"
              class="form-control"
              style="width: 150px"
              disabled
            />
              출고된수량<input
              type="text"
              id="sum"
              name="sum"
              class="form-control"
              style="width: 150px"
              disabled
            />
            <input
              type="text"
              id="cnt"
              class="form-control"
              placeholder="출고수량 입력"
              style="width: 150px"
            />
            <button class="btn btn-primary" id="addBtn">
              <i class="fas fa-save"></i> 등록
            </button>
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
              id="closeBtn"
            >
              닫기
            </button>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
    let orderDetailNo = ""; //주문상세코드
    let orderNo = ""; //주문번호

    //진행중 주문서
    var gridPro = new tui.Grid({
      el: document.getElementById("order"),
      scrollX: false,
      scrollY: true,
      bodyHeight: 600,
      rowHeaders: ["rowNum"],
      columns: [
        {
          header: "주문번호",
          name: "orderNo",
        },
        {
          header: "주문상세번호",
          name: "orderDetailNo",
        },

        {
          header: "거래처",
          name: "vendNm",
        },
        {
          header: "제품명",
          name: "proNm",
        },
        {
          header: "주문수량",
          name: "orderCnt",
        },
        {
          header: "납기일자",
          name: "parrdDt",
          formatter: function (data) {
            return dateChange(data.value);
          },
        },
        {
          header: "주문일자",
          name: "orderDt",
          formatter: function (data) {
            return dateChange(data.value);
          },
        },
        {
          header: "출고된수량",
          name: "sum",
          hidden: true,
        },
        
      ],
    
    });
    gridPro.on("click", (ev) => {
      $("#comModal").modal("show");
      //console.log(gridPro.getData()[ev.rowKey].proNm);
      $.ajax({
        url: "getInven",
        method: "post",
        data: { proNm: gridPro.getData()[ev.rowKey].proNm },
        success: function (data) {
          setTimeout(function () {
            gridInven.refreshLayout();
          }, 0);
          gridInven.resetData(data); //그리드 적용

          document.getElementById("orderDt").value = dateChange(
            gridPro.getData()[ev.rowKey].orderDt
          );
          document.getElementById("vend").value =
            gridPro.getData()[ev.rowKey].vendNm;
          
          document.getElementById("orderCntOut").value =
            gridPro.getData()[ev.rowKey].orderCnt;
            
          document.getElementById("sum").value =
          gridPro.getData()[ev.rowKey].sum; //정보출력  
            

          orderDetailNo = gridPro.getData()[ev.rowKey].orderDetailNo; //주문상세코드
          orderNo = gridPro.getData()[ev.rowKey].orderNo; //주문코드
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    });

    //출고현황
    var gridRe = new tui.Grid({
      el: document.getElementById("release"),
      scrollX: false,
      scrollY: true,
      bodyHeight: 600,
      rowHeaders: ["rowNum"],
      columns: [
        {
          header: "제품코드",
          name: "proCd",
        },
        {
          header: "완제품LOT번호",
          name: "proLotNo",
        },

        {
          header: "출고일자",
          name: "proOustDt",
          formatter: function (data) {
              return dateChange(data.value);
            },
        },
        {
          header: "출고수량",
          name: "proOustCnt",
        },
      ],
    });

    //페이지뜨자마자 진행 중 주문서 조회
    window.onload = load;

    function load() {
      $.ajax({
        url: "getOrder",
        method: "get",
        success: function (data) {
          gridPro.resetData(data);
        },
        error: function (reject) {
          console.log(reject);
        },
      });

      $.ajax({
        url: "getOust",
        method: "get",
        success: function (data) {
          gridRe.resetData(data);
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }

    //모달창
    var gridInven = new tui.Grid({
      el: document.getElementById("invenGrid"),
      scrollX: false,
      scrollY: true,
      bodyHeight: 243,
      rowHeaders: ["checkbox"],
      columns: [
        {
          header: "완제품LOT번호",
          name: "proLotNo",
        },

        {
          header: "제품명",
          name: "proNm",
        },
        {
          header: "완제품재고량",
          name: "lotCnt",
        },
        {
          header: "제조일자",
          name: "proWdt",
          formatter: function (data) {
            return dateChange(data.value);
          },
        },
        {
          header: "유통기한",
          name: "proExp",
          formatter: function (data) {
            return dateChange(data.value);
          },
        },
      ],
      pageOptions: {
        useClient: true,
        type: "scroll",
        perPage: 30,
      },
    });

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

    //등록버튼 누르면
    document.getElementById("addBtn").addEventListener("click", reAdd);
    function reAdd() {
      let orderCnt = document.getElementById("cnt").value; //주문수량

      if (gridInven.getCheckedRows().length == 0) {
        Swal.fire({
          icon: "error",
          title: "출고할 제품을 선택해주세요",
        });
        return;
      } else if (orderCnt == "") {
        Swal.fire({
          icon: "error",
          title: "출고수량을 입력해주세요",
        });
        return;
      }

      let proLotNo = gridInven.getCheckedRows()[0].proLotNo; //LOT번호
      let proNm = gridInven.getCheckedRows()[0].proNm; //제품명

      $.ajax({
        url: "reAdd",
        method: "post",
        data: {
          orderCnt: orderCnt,
          proLotNo: proLotNo,
          proNm: proNm,
          orderDetailNo: orderDetailNo,
          orderNo: orderNo,
        },
        success: function (data) {
          //console.log(data);
          $("#comModal").modal("hide");
          load();
          document.getElementById("cnt").value="";
          Swal.fire({
            icon: "success",
            title: "출고 등록 되었습니다",
            //text: '값을 조회 후 사용가능합니다.',
          });
        },
        error: function (reject) {
          console.log(reject);
        },
      });
    }
    
    //닫기버튼 누르면 초기화
    document.getElementById("closeBtn").addEventListener("click", function() {
    	document.getElementById("cnt").value="";	
    	
    	});
  </script>
</html>
