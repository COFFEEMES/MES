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
  <h1 class="mt-4">자재LOT조회</h1>
  <ul class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 자재관리</li>
    <li class="breadcrumb-item active">> 자재LOT재고조회</li>
  </ul>
  </div>
  <div id="codeSearch"><span>자재명</span> <input />
   <button style="margin-bottom:3px" class="btn btn-primary" id="rscSearchBtn"><i class="fas fa-search"></i></button>
<table class="table">
		<thead>
			<tr>
				<th>LOT번호</th>
				<th>자재코드</th>
				<th>검사코드</th>
				<th>발주번호</th>
				<th>입고코드</th>
				<th>LOT수량</th>
				<th>유통기한</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${materialLOTList }" var="material">
				<tr>
					<td>${material.rscLotCd }</td>
					<td>${material.rscCd }</td>
					<td>${material.rscInspCd }</td>
					<td>${material.ordrCd }</td>
					<td>${material.istCd }</td>
					<td>${material.lotCnt }</td>
					<td><fmt:formatDate value="${material.expDt }" pattern="yyyy-MM-dd"/></td>			
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>


