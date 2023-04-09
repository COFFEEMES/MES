<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<style>
		uploadResult {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr;
		}

		.image {
			display: block;
			width: 100%;
		}

		.image-label {
			position: relative;
			bottom: 22px;
			left: 5px;
			color: white;
			text-shadow: 2px 2px 2px black;
		}

		.c_btn {
			color: #fff;
			font-size: 13px;
			background: #333;
			border: none;
			padding: 6px;
			border-radius: 4px
		}

		.c_btn:hover {
			background: #555;
		}

		.linelist {
			display: inline-block;
			margin-top: 0px;
		}

		#grid {
			width: 100%
		}

		label {
			width: 100px;
			float: left;
		}

		.tui-grid-cell.addClass {
			background-color: rgba(255, 0, 0, 0.3);
		}
	</style>
</head>

<body>


	<!-- 본문내용 -->
		<div class="container-fluid px-4">
			<h1 class="mt-4">자재발주</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href=""><i class="fas fa-home"></i></a></li>
				<li class="breadcrumb-item">> 자재관리</li>
				<li class="breadcrumb-item active">> 자재발주조회</li>
			</ol>

			<div class="card mb-4">
				<div class="card-body">

					<tr>
						<th>발주신청일</th>
						<td><input class="form-control" type="date" id="frDt" name="frDt" style="width: 150px"> ~</td>
						<td><input class="form-control" type="date" id="toDt" name="toDt" style="width: 150px"></td>
						<button class="btn btn-primary" id="rscSearchBtn" style="margin-bottom: 3px;"><i class="fas fa-search"></i></button>
														
					</tr>


					<br><br>
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
					<td><fmt:formatDate value="${material.ordrReqDt }" pattern="yyyy-MM-dd"/></td>			
				</tr>
			</c:forEach>
		</tbody>
	</table>
					</div>
				</div>
			</div>
			

  </div>

</body>



