<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jstl/core_rt"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
      tbody > tr {
        counter-increment: aaa;
      }

      tbody > tr > td:first-child:before {
        content: counter(aaa) " ";
      }


      tbody {
        background-color: #ccc;
      }
    </style>
  </head>

  <body>
    <div class="container-fluid px-4">
      <h1 class="mt-4">자재발주</h1>
      <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item">
          <a href="/"><i class="fas fa-home"></i></a>
        </li>
        <li class="breadcrumb-item">> 자재관리</li>
        <li class="breadcrumb-item active">> 자재발주관리</li>
      </ol>
      <div class="card mb-4">
        <div class="card-body">
          <div>
            <h3>자재목록</h3>
            <table class="table">
              <thead>
                <tr>
                  <th>no.</th>
                  <th>LOT번호</th>
                  <th>검사코드</th>
                  <th>발주번호</th>
                  <th>입고코드</th>
                  <th>LOT수량</th>
                  <th>유통기한</th>
                  <th>자재코드</th>
                  <th>안전재고</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${materialList }" var="material">
                  <tr>
                    <td></td>
                    <td>${material.rscLotCd }</td>
                    <td>${material.rscInspCd }</td>
                    <td>${material.ordrCd }</td>
                    <td>${material.istCd }</td>
                    <td>${material.lotCnt }</td>
                    <td>
                      <fmt:formatDate
                        value="${material.expDt }"
                        pattern="yyyy-MM-dd"
                      />
                    </td>
                    <td>${material.rscCd }</td>
                    <td>${material.safRtc }</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="card mb-4">
        <div class="card-body">
          <div class="linelist" style="float: right">
            <button class="btn btn-primary" id="minusBtn">
              <i class="fas fa-minus"></i> 삭제
            </button>
            <button class="btn btn-primary" id="saveBtn">
              <i class="fas fa-save"></i> 발주
            </button>
          </div>
          <div>
            <h3>자재발주</h3>
            <br />
            <table class="table">
              <thead>
                <tr>
                  <th>자재코드</th>
                  <th>자재명</th>
                  <th>거래처코드</th>
                  <th>발주코드</th>
                  <th>발주수량</th>
                  <th>현재재고</th>
                  <th>안전재고</th>
                  <th>납기요청일</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${materialOrderList }" var="material">
                  <tr>
                    <td>${material.rscCd }</td>
                    <td>${material.rscNm }</td>
                    <td>${material.vendCd }</td>
                    <td>${material.ordrCd }</td>
                    <td>${material.ordrCnt }</td>
                    <td>${material.paprdCmndDt }</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
