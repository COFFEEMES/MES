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
          기초 코드 관리
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
            <a class="nav-link" href="matManage">자재 관리</a>
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
            <a class="nav-link" href="receiveList"
              >입고 관리</a
            >
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
            <a class="nav-link" href="${pageContext.request.contextPath }/mkrPlan">생산계획서 작성</a>
            <a class="nav-link" href="layout-sidenav-light.html"
              >Light Sidenav</a
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
            <a class="nav-link" href="layout-static.html">Static Navigation</a>
            <a class="nav-link" href="layout-sidenav-light.html"
              >Light Sidenav</a
            >
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
