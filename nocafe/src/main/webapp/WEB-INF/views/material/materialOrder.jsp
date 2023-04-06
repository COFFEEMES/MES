<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
  .codeSearch {
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
  <h1 class="mt-4">자재발주</h1>
  <ul class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 자재관리</li>
    <li class="breadcrumb-item active">> 자재발주관리</li>
  </ul>
 </div>
 
  <div class="codeSearch">
  <span>자재명</span> <input />
<button style="margin-bottom:3px" class="btn btn-primary" id="rscSearchBtn"><i class="fas fa-search"></i></button>
  <hr style="border: 1px solid #ccc;">
<table class="table">
		<thead>
			<tr>
				<th>자재코드</th>
				<th>자재명</th>
				<th>자재유형</th>
				<th>자재규격</th>
				<th>관리단위</th>
				<th>안전재고</th>
				<th>사용여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${materialList }" var="material">
				<tr>
					<td>${material.rscCd }</td>
					<td>${material.rscNm }</td>
					<td>${material.rscTyp }</td>
					<td>${material.rscSpec }</td>
					<td>${material.rscUnit }</td>
					<td>${material.safRtc }</td>
					<td>${material.vendCd }</td>		
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<br>
	
	<div class="card mb-4">
				<div class="card-body">

					<div class="linelist" style="float: right;">
						<button class="btn btn-primary" id="minusBtn"><i class="fas fa-minus"></i> 삭제</button>
						<button class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 발주</button>
						<br> <br>
					</div>

					<br><br>
	  <div class="codeSearch">
	  <p>자재발주</p>
<table class="table" >
		<thead>
			<tr>
				<th>발주번호</th>
				<th>자재코드</th>
				<th>발주량</th>
				<th>미입고잔량</th>
				<th>납기요청일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${materialOrderList }" var="material">
				<tr>
					<td>${material.ordrCd }</td>
					<td>${material.rscCd }</td>
					<td>${material.ordrCnt }</td>
					<td>${material.rmnCnt }</td>
					<td>${material.paprdCmndDt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</div>


