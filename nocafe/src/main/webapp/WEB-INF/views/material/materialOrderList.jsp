<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>


	<!-- 본문내용 -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재발주</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href=""><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재발주조회</li>
		</ol>

		<div class="card mb-4">
			<div class="card-body">
				<tr>
					<th>발주신청일</th>
					<td><input class="form-control" type="date" id="frDt"
						name="frDt" style="width: 150px"> ~</td>
					<td><input class="form-control" type="date" id="toDt"
						name="toDt" style="width: 150px"></td>
					<button class="btn btn-primary" id="rscSearchBtn"
						style="margin-bottom: 3px;">
						<i class="fas fa-search"></i>
					</button>

				</tr>


				<br>
				<br>
				<div>
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
									<td>${material.ordrCd }</td>
									<td>${material.vendCd }</td>
									<td><fmt:formatDate value="${material.ordrReqDt }"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>


	</div>

</body>