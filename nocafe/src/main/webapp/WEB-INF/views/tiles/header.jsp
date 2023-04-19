<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
  <!-- Navbar Brand-->
  <a class="navbar-brand ps-3">No Cafein No gain</a>
  <!-- Sidebar Toggle-->
  <button
    class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
    id="sidebarToggle"
    href="#!"
  >
    <i class="fas fa-bars"></i>
  </button>
  <!-- Navbar Search-->
  <form
    class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"
  ></form>
  <!-- Navbar-->
  <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a
        class="nav-link dropdown-toggle"
        id="navbarDropdown"
        href="#"
        role="button"
        data-bs-toggle="dropdown"
        aria-expanded="false"
        ><i class="fas fa-user fa-fw"></i
      ></a>
      <ul
        class="dropdown-menu dropdown-menu-end"
        aria-labelledby="navbarDropdown"
      >
        <li><a class="dropdown-item" href="#!">사원 정보 조회/수정</a></li>
        <li><hr class="dropdown-divider" /></li>
        <li><a class="dropdown-item" href="#!">로그아웃</a></li>
      </ul>
    </li>
  </ul>
</nav>
<script>
  window.addEventListener("DOMContentLoaded", (event) => {
    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector("#sidebarToggle");
    if (sidebarToggle) {
      // Uncomment Below to persist sidebar toggle between refreshes
      // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
      //     document.body.classList.toggle('sb-sidenav-toggled');
      // }
      sidebarToggle.addEventListener("click", (event) => {
        event.preventDefault();
        document.body.classList.toggle("sb-sidenav-toggled");
        localStorage.setItem(
          "sb|sidebar-toggle",
          document.body.classList.contains("sb-sidenav-toggled")
        );
      });
    }
  });
</script>
