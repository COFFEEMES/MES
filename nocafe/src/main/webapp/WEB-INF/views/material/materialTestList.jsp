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
  <input type="button" value="조회"/></p>
  <p><span>자재명</span> <input />
  <input type="button" value="조회"/></p>
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
					<td>${material.rsc_insp_cd }</td>
					<td>${material.ordr_cd }</td>
					<td>${material.rsc_cd }</td>		
					<td>${material.insp_cnt }</td>
					<td>${material.insp_pass_cnt }</td>
					<td>${material.insp_insp_fail_cnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>