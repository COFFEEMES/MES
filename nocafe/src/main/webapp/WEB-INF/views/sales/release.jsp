<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid px-4">
		<h1 class="mt-4" style="margin-left: 20px;">제품출고등록</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item" style="margin-left: 25px;"><a href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 제품출고등록</li>
		</ol>
</div>
<!-- 주문서,출고 등록 그리드 -->
<div id="cont">
	<div class="container-fluid px-4">
		<div class="card mb-4">	 
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="card mb-4" style="margin-right: 10px;">
					<div class="card-header">
						 진행중 주문서
					</div>
					<div class="card-body">
						<div id="order"></div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						 출고 등록 현황
						
					</div>
					<div class="card-body">
						<div id="release"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
<!-- 주문서,출고 등록 그리드 끝 -->

<!--모달-->
  <div class="modal fade" id="StcGridModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">완제품 재고</h5>
                    
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                	<div id="StcGrid"></div>
                </div>
                <div class="modal-footer">
                	주문수량<input type="text" id="orderCntOut" name="orderCntOut" class="form-control" style="width: 150px" disabled>
                	<input type="text" id="edctsOustCntOut" class="form-control" placeholder="출고수량 입력" style="width: 150px">
                    <button class="btn btn-primary" id="addBtn"><i class="fas fa-save"></i> 등록</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
<!--모달 끝-->
</body>
<script>
var gridCom = new tui.Grid({
	  el: document.getElementById("order"),
	  rowHeaders: ['rowNum'],
	  columns: [
	    {
	      header: "제품코드",
	      name: "proCd"
	    },
	    {
	        header: "제품명",
	        name: "proNm",
	      },
	   
	    {
	        header: "수량",
	        name: "testGood",
	     },
	  ],
	  pageOptions: {
	      useClient: true,
	      type: 'scroll',
	      perPage: 30
	   }
	});

</script>
</html>