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
  <span>업체명</span> <input />
  <input type="button" value="조회"/>
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
			<c:forEach items="${materialOrder }" var="material">
				<tr>
					<td>${material.rsc_cd }</td>
					<td>${material.rsc_nm }</td>
					<td>${material.rsc_typ }</td>
					<td>${material.rsc_spec }</td>
					<td>${material.rsc_unit }</td>
					<td>${material.saf_rtc }</td>
					<td>${material.vend_cd }</td>		
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<br>
	  <div class="codeSearch">
	  <p>자재발주</p>
<table class="table" >
		<thead>
			<tr>
				<th>자재코드</th>
				<th>자재명</th>
				<th>업체코드</th>
				<th>업체명</th>
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
					<td>${material.ordr_cd }</td>
					<td>${material.rsc_cd }</td>
					<td>${material.ordr_cnt }</td>
					<td>${material.rmn_cnt }</td>
					<td>${material.rsc_unit }</td>
					<td>${material.saf_rtc }</td>
					<td>${material.vend_cd }</td>		
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</div>


