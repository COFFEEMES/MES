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

<div>
<div class = jaje>
  <h1 class="mt-4">자재 발주</h1>
  <ul class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 자재관리</li>
    <li class="breadcrumb-item active">> 자재발주조회</li>
  </ul>
  </div>
  <div id="codeSearch">
  <span>발주신청일</span> <input type="date" id="frDt" name="frDt"> ~ <input type="date" id="toDt" name="toDt">
  <button style="margin-bottom:3px" class="btn btn-primary" id="rscSearchBtn"><i class="fas fa-search"></i></button>
  <table class="table">
  <thead>
			<tr>
				<th>발주코드</th>
				<th>거래처코드</th>
				<th>발주신청일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${materialOrderList }" var="material">
				<tr>
					<td>
					<td>${material.ordrCd }</td>
					<td>${material.vendCd }</td>
					<td><fmt:formatDate value="${material.ordrReqDt }" pattern="yyyy-MM-dd"/></td>			
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>



