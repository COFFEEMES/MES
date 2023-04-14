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
						<th>자재명</th>
						<td><input class="form-control" type="text" id="rscNm" name="rscNm" style="width: 150px"></td>
						<button style="margin-bottom:3px" class="btn btn-primary" id="SearchBtn"><i
								class="fas fa-search"></i></button>
						&nbsp&nbsp


					<br><br>
					<div id="grid"><h6>자재목록</h6></div>
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
					
					<div id="grid2"><h6>자재발주</h6></div>
				</div>
			</div>



			<script>
			let today = new Date();
			let year = today.getFullYear();
			let month = today.getMonth() + 1;
			let date = today.getDate();
			let format = year + (("00" + month.toString()).slice(-2)) + (("00" + date.toString()).slice(-2));
				
			const gridData = [
        <c:forEach items="${materialLOTList }" var="material">
          {	  rscCd :  '${material.rscCd}',
        	  rscNm :  '${material.rscNm}',
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
                header: '업체코드',
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
    var isValid = true;
    
    $('#grid').mouseleave(ev => {
        grid.finishEditing();
    })
    
    $('#grid2').mouseleave(ev => {
        grid2.finishEditing();
    })
    
    
    grid.on('dblclick', ev => {
					var rscCd = grid.getValue(ev.rowKey, 'rscCd')
					var rscNm = grid.getValue(ev.rowKey, 'rscNm')
					var vendCd = grid.getValue(ev.rowKey, 'vendCd')
					var lotCnt = grid.getValue(ev.rowKey, 'lotCnt')
					if (lotCnt==0 || lotCnt==null || lotCnt == ''){
						lotCnt =0;} 
					var safRtc = grid.getValue(ev.rowKey, 'safRtc')

					var rscCd2 = grid2.getColumnValues('rscCd');
					var vendCd2 = grid2.getColumnValues('vendCd');
    
					
					var isValid = true;
					for (i = 0; i < rscCd2.length; i++) {
						if (rscCd2[i] == rscCd) {
							alert('동일 항목의 발주가 진행중입니다.');
							isValid = false;
							return false;
						} else if (vendCd2[i] != vendCd) {
							alert('동일 업체의 발주만 가능합니다.');
							isValid = false;
							return false;
						}

					}

					grid2.appendRow({
						"rscCd": rscCd,
						"rscNm": rscNm,
						"vendCd": vendCd,
						"lotCnt": lotCnt,
						"safRtc": safRtc,
					})
    
					$.ajax({
						url: "MaterialDetail",
						method: 'POST',
						data: {
							rscCd: rscCd
						},
						success: function (result) {}
					})

	
				})
    

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
						name: 'lotCnt'
					}, {
						header: '안전재고',
						align: 'right',
						name: 'safRtc'
					}, {
						header: '납기요청일',
						align: 'center',
						name: 'paprdCmndDt',
						editor: {
							type: 'datePicker',
							options: {
								datetimeFormat: "yyyy/MM/dd"
							}
						}
					}],
				});
				
				  
				  
				  $('#SearchBtn').on('click', function () {
						let rscNm = $('#rscNm').val()
						$.ajax({
							url: "materalSearch",
							method: 'POST',
							data: {
								rscNm: rscNm,
							},
							success: function (result) {
								grid.resetData(result);
							}
						})
					})
					
				$('#minusBtn').on('click', function (ev) {
					var data = grid2.getCheckedRows();
					var isValid = true;
					
					if(data.length == null || data.length == 0){
						alert('체크된 발주 목록이 없습니다.');
						isValid = false;
						return false;
					}
					grid2.removeCheckedRows()
					alert('정상적으로 삭제되었습니다.');
				})
			</script>

</body>
