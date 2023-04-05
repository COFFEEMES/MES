<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<!-- 	Modal -->
	<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">주문서 조회</h5>
						<br> <br>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<br>
					<div id="modGrid" class="modal-body">
					</div>
					<div class="modal-footer">
						<button type="button" id="confirmBtn" class="btn btn-primary"
							data-bs-dismiss="modal">확인</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
<script>
	
		const grid = new tui.Grid({
			el : document.getElementById('modGrid'),
			rowHeaders : [ 'checkbox' ],
			columns : [ {
				header : '주문번호',
				name : 'oderNo'
			}, {
				header : '납기일자',
				name : 'parrdDt'
			}, {
				header : '제품번호',
				name : 'proCd'
			} ],
			data : [{
				oderNo : 'Beautiful Lies',
				parrdDt : 'Birdy',
				proCd : 'Pop'
			}]
		});

		console.log(grid.getData());
// 		grid.resetData(data); // Call API of instance's public method

// 		Grid.applyTheme('striped'); // Call API of static method

</script>