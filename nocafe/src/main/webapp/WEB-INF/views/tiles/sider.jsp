<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<div id="layoutSidenav_nav">
  <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
      <div class="nav">
        <a
          class="nav-link collapsed"
          href="#"
          data-bs-toggle="collapse"
          data-bs-target="#collapseBasic"
          aria-expanded="false"
          aria-controls="collapseLayouts"
        >
          <div class="sb-nav-link-icon">
            <i class="fas fa-columns"></i>
          </div>
          기준 코드 관리
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div
          class="collapse"
          id="collapseBasic"
          aria-labelledby="headingOne"
          data-bs-parent="#sidenavAccordion"
        >
          <nav class="sb-sidenav-menu-nested nav">
            <a class="nav-link" href="basicCodeManage">공통 코드 관리</a>
            <a class="nav-link" href="vendManage">거래처 관리</a>
            <a class="nav-link" href="rscManage">자재 관리</a>
            <a class="nav-link" href="bomManage">BOM 관리</a>
          </nav>
        </div>
        <a
          class="nav-link collapsed"
          href="#"
          data-bs-toggle="collapse"
          data-bs-target="#collapseSalary"
          aria-expanded="false"
          aria-controls="collapseLayouts"
        >
          <div class="sb-nav-link-icon">
            <i class="fas fa-columns"></i>
          </div>
          영업 관리
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div
          class="collapse"
          id="collapseSalary"
          aria-labelledby="headingOne"
          data-bs-parent="#sidenavAccordion"
        >
          <nav class="sb-sidenav-menu-nested nav">
            <a class="nav-link" href="orderList">주문서 관리</a>
            <a class="nav-link" href="receiveList">입고 관리</a>
            <a class="nav-link" href="releaseList">출고 관리</a>
            <a class="nav-link" href="receiveCheck">입/출고 조회</a>
            <a class="nav-link" href="lotList">완제품 LOT 관리</a>
          </nav>
        </div>
        <a
          class="nav-link collapsed"
          href="#"
          data-bs-toggle="collapse"
          data-bs-target="#collapsePro"
          aria-expanded="false"
          aria-controls="collapseLayouts"
        >
          <div class="sb-nav-link-icon">
            <i class="fas fa-columns"></i>
          </div>
          생산 관리
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div
          class="collapse"
          id="collapsePro"
          aria-labelledby="headingOne"
          data-bs-parent="#sidenavAccordion"
        >
          <nav class="sb-sidenav-menu-nested nav">
            <a
              class="nav-link"
              href="${pageContext.request.contextPath }/mkrPlan"
              >생산계획 작성</a
            >
             <a
              class="nav-link"
              href="mkDir"
              >생산지시 작성</a
            >
            <a class="nav-link" href="performance"
              >생산실적 작성</a
            >
            <a class="nav-link" href="inspection"
              >제품 품질 검사</a
            >
          </nav>
        </div>
        <a
          class="nav-link collapsed"
          href="#"
          data-bs-toggle="collapse"
          data-bs-target="#collapseMat"
          aria-expanded="false"
          aria-controls="collapseLayouts"
        >
          <div class="sb-nav-link-icon">
            <i class="fas fa-columns"></i>
          </div>
          자재 관리
          <div class="sb-sidenav-collapse-arrow">
            <i class="fas fa-angle-down"></i>
          </div>
        </a>
        <div
          class="collapse"
          id="collapseMat"
          aria-labelledby="headingOne"
          data-bs-parent="#sidenavAccordion"
        >
          <nav class="sb-sidenav-menu-nested nav">
          <a class="nav-link" href="materialOrder">자재발주관리</a>
            <a class="nav-link" href="materialOrderList">자재발주조회</a>
            <a class="nav-link" href="materialList">자재재고조회</a>
            <a class="nav-link" href="materialReceivingTest">자재입고검사</a>
            <a class="nav-link" href="inputPage">자재입고등록</a>
          </nav>
        </div>
      </div>
    </div>
    <div class="sb-sidenav-footer">
      <div class="small">Logged in as:</div>
      Start Bootstrap
    </div>
  </nav>
</div>
