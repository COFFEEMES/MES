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

	<div class="container-fluid px-4">
		<h1 class="mt-4">자재발주</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재발주조회</li>
		</ol>

		<div class="card mb-4">
			<div class="card-body">
				<div class="card-body">

				<tr>
					<th>업체명</th>
					<td><input class="form-control" type="text" id="vendNm"
						name="vendNm" style="width: 150px"></td>
					<button style="margin-bottom: 3px" class="btn btn-primary"
						id="rscSearchBtn">
						<i class="fas fa-search"></i>
					</button>

					&nbsp&nbsp
				</tr>


				<br> <br>
				<div id="grid"></div>
			</div>
		</div>



		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">자재발주내역조회</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<label style="margin-top: 5px">발주코드</label> <input
							class="form-control" type="text" id="ordrCd" name="ordrCd"
							style="width: 180px; margin-bottom: 10px" readonly />
						<div class="linelist" style="float: right;">

							<button type="button" class="btn btn-primary" id="saveBtn">
								<i class="fas fa-save"></i> 수정
							</button>
							<button id="excelBtn" name="excelBtn" type="button"
								class="btn btn-primary">
								<i class="fas fa-download"></i> 엑셀
							</button>
						</div>
						<div id="grid2"></div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
			const gridData = [
		        <c:forEach items="${materialOrderList }" var="material">
		          {	  ordrCd :  '${material.ordrCd}',
		        	  vendCd :  '${material.vendCd}',
		        	  vendNm : 	'${material.vendNm}',
		        	  ordrReqDt : '${material.ordrReqDt}'
		          },
		        </c:forEach>
		      ];

				const grid = new tui.Grid({
					el: document.getElementById('grid'),
					scrollX: false,
					bodyHeight: 450,
					rowHeight: 35,
					data: gridData,
					rowHeaders: ['rowNum'],
					header: {
						height: 40
					},
					columns: [{
						header: '발주코드',
						align: 'center',
						name: 'ordrCd'
					}, {
						header: '업체코드',
						align: 'center',
						name: 'vendCd'
					}, {
						header: '업체명',
						align: 'center',
						name: 'vendNm'
					}, {
						header: '발주신청일',
						align: 'center',
						name: 'ordrReqDt',
						formatter: function(data) {
							return dateChange(data.value);
						}
				    }]
				});

				
				$('#rscSearchBtn').on('click', function () {
					let vendNm = $('#vendNm').val()
					$.ajax({
						url: "materalOrderSearch",
						method: 'POST',
						data: {
							vendNm: vendNm
						},
						success: function (result) {
							grid.resetData(result);
					}
				})
			})
			
					grid.on('dblclick', ev => {
					var ordrCd = grid.getValue(ev.rowKey, 'ordrCd')
					var vendCd = grid.getValue(ev.rowKey, 'vendCd')
					var vendNm = grid.getValue(ev.rowKey, 'vendNm')
					$.ajax({
						url: "orderDetailList",
						method: 'Post',
						dataType: 'JSON',
						data: {
							ordrCd: ordrCd,
							vendCd: vendCd,
							vendNm: vendNm
						},
						success: function (result) {
							grid2.resetData(result)
							for (var all of result) {
								var rscStc = all.rscStc
								if (rscStc == null || rscStc == 0 || rscStc == '') {
									rscStc = 0;
								}
								var allStc = Number(all.ordrCnt) + Number(all.rscStc)
								grid2.setValue(all.rowKey, 'allStc', allStc)
								grid2.setValue(all.rowKey, 'rscStc', rscStc)
								$('#ordrCd').val(ordrCd)
							}
							$('#exampleModal').modal('show');
							setTimeout(function() {
								grid2.refreshLayout()	
							},300);
							
							
						}
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
						align: 'center',
						name: 'rscNm'
					}, {
						header: '업체코드',
						align: 'center',
						name: 'vendCd'
					}, {
						header: '업체명',
						align: 'center',
						name: 'vendNm'
					}, {
						header: '발주코드',
						align: 'center',
						name: 'ordrCd'
					}, {
						header: '발주수량',
						align: 'center',
						name: 'ordrCnt',
						editor: 'text'
					}, {
						header: '현재재고',
						align: 'center',
						name: 'lotCnt'
					}, 
						{
						header: '단위',
						align: 'center',
						name: 'rscUnit'
						},
					{
						header: '안전재고',
						align: 'center',
						name: 'safRtc'
					}, {
						header: '납기요청일',
						align: 'center',
						name: 'paprdCmndDt',
						formatter: function(data) {
						    return dateChange(data.value);
						  }
					}],
				});



				
					$('#saveBtn').click(ev => {
					var data = grid2.getCheckedRows();
					var ordrCnt = grid2.getValue(ev.rowKey, 'ordrCnt')
					var lotCnt = grid2.getValue(ev.rowKey, 'lotCnt')
					var safRtc = grid2.getValue(ev.rowKey, 'safRtc')
					var isValid = true;
					
					ordrCnt = Number(ordrCnt);
					lotCnt = Number(lotCnt);

					var allStc = ordrCnt + lotCnt

					if (data.length == null || data.length == 0) {
						alert('체크된 발주 내역이 없습니다.');
						isValid = false;
						return false;
					}

					for (i = 0; i < data.length; i++) {
						if (Number(data[i].allStc) < Number(data[i].safRtc)) {
							alert('안전재고 이상으로 발주를 진행해주세요.');
							isValid = false;
							return false;
						}
					}



					for (i = 0; i < data.length; i++) {
						if (data[i].ordrCnt == null || data[i].ordrCnt == '0' || data[i].ordrCnt == '' || data[0].paprdCmndDt ==
							null || data[0].paprdCmndDt == '' || data[0].paprdCmndDt == '0') {
							alert('발주신청 내역 내 공란이 존재합니다.');
							isValid = false;
							return false;

						} else {
							$.ajax({
								url: 'materialOrderUpdate',
								method: 'POST',
								data: JSON.stringify(data),
								contentType: 'application/json'
							}).done(function (result) {
								grid2.uncheckAll()
							})
						}
					}
					alert('발주내역 수정이 완료되었습니다.');
				})
				
			
				
				//엑셀 그리드 다운
  				$("#excelBtn").click((ev) => {
    				const options = {
      				includeHiddenColumns: false,
      				fileName: "vend_list",
    				};
    				grid2.export("xlsx", options);
  				});
					
					
					function dateChange(date) {
					      let date1 = new Date(date);
					      let date2 =
					        date1.getFullYear() +
					        "-" +
					        (date1.getMonth() < 10
					          ? "0" + (date1.getMonth() + 1)
					          : date1.getMonth() + 1) +
					        "-" +
					        (date1.getDate() < 10 ? "0" + date1.getDate() : date1.getDate());
					      return date2;
					    };
						

			</script>

</body>