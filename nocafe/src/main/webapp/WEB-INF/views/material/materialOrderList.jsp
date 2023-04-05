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
  <div id="codeSearch"><span>업체명</span> <input />
  <span>발주신청일</span> <input type="date"> ~ <input type="date">
  <input type="button" value="조회" />
  <table class="table">
  <thead>
			<tr>
				<th>No.</th>
				<th>발주코드</th>
				<th>거래처코드</th>
				<th>발주신청일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${materialOrderList }" var="material">
				<tr>
					<td>${material.ordr_cd }</td>
					<td>${material.vend_cd }</td>
					<td><fmt:formatDate value="${material.ordr_req_dt }" pattern="yyyy.MM.dd"/></td>			
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>



