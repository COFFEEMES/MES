<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  #codeSearch {
    width: 95%;
    margin: 0 auto;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px 20px;
  }
  .jaje{
  padding-left: 35px;
  }
</style>


<div class = jaje>
  <h1 class="mt-4">자재입고검사조회</h1>
  <ul class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 자재관리</li>
    <li class="breadcrumb-item active">> 자재입고검사조회</li>
  </ul>
  </div>
  <div id="codeSearch">
  <p><span>검사일자</span> <input type="date"> ~ <input type="date"></p>
  <p><span>업체명</span> <input />
    <button style="margin-bottom:3px" class="btn btn-primary" id="rscSearchBtn"><i class="fas fa-search"></i></button>
</p>
  <p><span>자재명</span> <input />
    <button style="margin-bottom:3px" class="btn btn-primary" id="rscSearchBtn"><i class="fas fa-search"></i></button>
</p>
  <table class="table">
		<thead>
			<tr>
				<th>검사코드</th>
				<th>발주번호</th>
				<th>자재코드</th>
				<th>검사수량</th>
				<th>합격수량</th>
				<th>불량수량</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${materialTestList }" var="material">
				<tr>
					<td>${material.rscInspCd }</td>
					<td>${material.ordrCd }</td>
					<td>${material.rscCd }</td>		
					<td>${material.inspCnt }</td>
					<td>${material.inspPassCnt }</td>
					<td>${material.inspInspFailCnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>