<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<head>
	<meta charset="UTF-8">
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
						<th>원자재명</th>
						<td><input class="form-control" type="text" id="rscNm" name="rscNm" style="width: 150px"></td>
						<th>업체명</th>
						<td><input class="form-control" type="text" id="vendNm" name="vendNm" style="width: 150px"></td>
						<button style="margin-bottom:3px" class="btn btn-primary" id="rscSearchBtn"><i
								class="fas fa-search"></i></button>
						&nbsp&nbsp


					<br><br>
					<div id="grid">자재목록</div>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-body">

					<div class="linelist" style="float: right;">
						<button class="btn btn-primary" id="minusBtn"><i class="fas fa-minus"></i> 삭제</button>
						<button class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 발주</button>
						<br> <br>
					</div>

					<br><br>
					
					<div id="grid2">자재발주<br></div>
				</div>
			</div>



			<script>

				// 상단 그리드 출력 
const gridData = [
        <c:forEach items="${materialLOTList }" var="material">
          {	  rscCd : '${material.rscCd}',
        	  rscNm : '${material.rscNm}',
        	  vendCd : '${material.vendCd}',
        	  lotCnt : '${material.lotCnt}',
        	  safRtc : '${material.safRtc}'
          },
        </c:forEach>
      ];
    
    const grid = new tui.Grid({
        el: document.getElementById('grid'),
        bodyHeight: 450,
        data: gridData,
        rowHeaders: ["rowNum"],
        columns: [
            {
                header: '자재코드',
                name: 'rscCd',
                sortingType: 'asc',
                sortable: true
            },
            {
                header: '자재명',
                name: 'rscNm',
                sortingType: 'asc',
                sortable: true
            },
            {
                header: '거래처코드',
                name: 'vendCd',
                sortingType: 'asc',
                sortable: true
            },
            {
                header: '현재재고',
                name: 'lotCnt'
            },
            {
            	header: '안전재고',
            	name: 'safRtc'
            }
        ]
    });






				const grid2 = new tui.Grid({
					el: document.getElementById('grid2'),
					bodyHeight: 200,
					rowHeight: 35,
					rowHeaders: ['checkbox'],
					header: {
						height: 40
					},
					columns: [{
						header: '자재코드',
						align: 'center',
						name: 'rscCd'
					}, {
						header: '자재명',
						align: 'left',
						name: 'rscNm'
					}, {
						header: '업체코드',
						align: 'center',
						name: 'vendCd'
					}, {
						header: '업체명',
						align: 'left',
						name: 'vendNm'
					}, {
						header: '발주코드',
						align: 'center',
						name: 'ordrCd'
					}, {
						header: '발주수량',
						align: 'right',
						name: 'ordrCnt',
						editor: 'text'
					}, {
						header: '현재재고',
						align: 'right',
						name: 'rscStc'
					}, {
						header: '안전재고',
						align: 'right',
						name: 'safStc'
					}, {
						header: '예상재고량',
						align: 'right',
						name: 'allStc'
					}, {
						header: '납기요청일',
						align: 'center',
						name: 'paprdCmndDt',
						editor: {
							type: 'datePicker',
							options: {
								datetimeFormat: "yyyy-MM-dd"
							}
						}
					}],
				});

			</script>

</body>
