<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>No Capain No Gain</title>
    <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
    <link
      rel="stylesheet"
      href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
    <link
      rel="stylesheet"
      href="https://uicdn.toast.com/grid/latest/tui-grid.css"
    />
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <link
      href="${pageContext.request.contextPath }/resources/css/styles.css"
      rel="stylesheet"
    />
  </head>
  <body class="sb-nav-fixed">
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
    <div id="layoutSidenav">
      <tiles:insertAttribute name="sider"></tiles:insertAttribute>

      <div id="layoutSidenav_content">
        <main>
          <tiles:insertAttribute name="main"></tiles:insertAttribute>
        </main>
        <footer class="py-4 bg-light mt-auto">
          <tiles:insertAttribute name="footer"></tiles:insertAttribute>
        </footer>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
  </body>
</html>
