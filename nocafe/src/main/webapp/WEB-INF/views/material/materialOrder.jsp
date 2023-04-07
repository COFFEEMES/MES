<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" 
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" /> 
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>


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

	<div class="container-fluid px-4">
		<h1 class="mt-4">자재발주</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재발주관리</li>
		</ol>

		<div class="card mb-4">
			<div class="card-body">

				<tr>
					<th>자재명</th>
					<td><input class="form-control" type="text" id="rscNm"
						name="rscNm" style="width: 150px"></td>
					<th>업체명</th>
					<td><input class="form-control" type="text" id="vendNm"
						name="vendNm" style="width: 150px"></td>
					<button style="margin-bottom: 3px" class="btn btn-primary"
						id="rscSearchBtn">
						<i class="fas fa-search"></i>
					</button>
					&nbsp&nbsp
					<br>
					<br>
					<div>자재목록
					
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
			</div>
		</div>

		<div class="card mb-4">
			<div class="card-body">

				<div id="grid2">
					자재발주<br>
				</div>
				<br>
				<br>
				<div class="linelist" style="float: right;">
					<button class="btn btn-primary" id="minusBtn">
						<i class="fas fa-minus"></i> 삭제
					</button>
					<button class="btn btn-primary" id="saveBtn">
						<i class="fas fa-save"></i> 등록
					</button>
				</div>

			</div>
		</div>



</body>