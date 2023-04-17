<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>

#container {
	width: 98%;
	margin: 0 auto;
}

.col {
	width: 100%
}

.linelist {
	display : inline-block;
	float: right;
	margin: 0 20px 20px 0;
}
#lineb{
	display : inline-block;
}

#pDate #planDate {
	float: left;
}

.tui-datepicker {
	z-index: 99;
}
label {
	width : 150px;
	
}
.tui-grid-cell.not-allow-row {background-color : red}
</style>
</head>

<body>
	<!-- 본문내용 -->
	<!-- 헤더부분 -->
	<div class="container-fluid px-4">
		<h1 class="mt-4">생산계획</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="home.do"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 생산관리</li>
			<li class="breadcrumb-item active">> 생산계획</li>
		</ol>
	</div>
	<!-- 헤더부분 -->
	<div id="container">
		<div class="card mb-4">
			<div class="card-body">
				<div id="lineb">
				<div id="pDate">
					<label>작성일자</label> <input type="date"
						id="tui-date-picker-target" name="tui-date-picker-target"
						class="form-control" style="width: 150px">
				</div>
				<br>
				<div id="planDate">
					<label>생산계획일자</label> 
					<input type="date"	id="ex-start" name="tui-date-picker-target"	class="form-control tragetDate" style="width: 150px">
					- <input type="date" id="ex-end" name="tui-date-picker-target"	class="form-control tragetDate" style="width: 150px">
				</div>
				</div>
				<div class="linelist">
					<button id="clearBtn" class="btn btn-primary" form="">
						<i class="fas fa-file"></i> 초기화
					</button>
					<button data-bs-toggle="modal" class="btn btn-primary"
						id="modalBtn" data-bs-target="#exampleModal">
						<i class="fas fa-search"></i> 주문서
					</button>
				
					<button class="btn btn-primary" id="osBtn">
						<i class="fas fa-save"></i> 저장
					</button>
				</div>
				
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-body">
				<div id="grid"></div>
			</div>
		</div>
		<br>
		<div class="card mb-4">
			<div class="card-body">
				<div class="d-flex flex-row justify-content-between">
					<div id="grid2" style="width: 1000px;">제품</div>
					<div id="grid3" style="width: 500px;">제품공정확인</div>
				</div>
			</div>
		</div>
		<br>
		<div class="card mb-4">
			<div class="card-body">
				<div class="d-flex flex-row justify-content-between">
					<div id="grid4" style="width: 1000px;">사용가능자재</div>
					<div id="grid5" style="width: 500px;">자재확인</div>
				</div>
			</div>
		</div>


		<div id="tui-date-picker-container" style="margin-top: -1px;"></div>
		<br>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">주문서 조회</h5>
					<br> <br>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<br>
				<div style="margin-left : 30px;">미계획 주문서</div>
				<div id="modGrid" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" id="confirmBtn" class="btn btn-primary"
						data-bs-dismiss="modal">확인</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script src="resources/js/plan.js"></script>
</body>
