<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<div class="container-fluid px-4">
	<h1 class="mt-4">공통코드관리</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="/"><i
				class="fas fa-home"></i></a></li>
		<li class="breadcrumb-item">> 기준정보관리</li>
		<li class="breadcrumb-item active">> 공통코드관리</li>
	</ol>
	<div class="row">
		<div class="card col-xl-12">
			<div class="card-body">
				<label for="" autofocus="autofocus">코드명</label> <input type="text"
					class="form-control" id="selCcd" name="sleCcd" style="width: 150px" />
				<button class="btn btn-primary" id="searchBtn">
					<i class="fas fa-search"></i> 검색
				</button>
			</div>
		</div>
	</div>
	<br /> <br />

	<div class="row">
		<div class="card col-xl-4">
			<div class="linelist" style="margin-top: 16px">
				<h3 style="width: 100px; display: inline; padding-left: 15px">
					공통 코드</h3>
				<button class="btn btn-primary" id="saveBcode"
					style="float: right; margin-left: 16px">
					<i class="fas fa-save"></i> 저장
				</button>
				<button class="btn btn-primary" id="newBcode"
					style="float: right; margin-left: 16px">
					<i class="fas fa-file"></i> 새자료
				</button>
			</div>
			<div class="card-body">
				<div id="grid"></div>
			</div>
		</div>

		<div class="col-xl-1"></div>

		<div class="card col-xl-7">
			<div class="linelist" style="margin-top: 16px">
				<h3 style="width: 100px; display: inline; padding-left: 15px">
					상세 코드</h3>
				<button class="btn btn-primary" id="saveDcode"
					style="float: right; margin-left: 16px">
					<i class="fas fa-save"></i> 저장
				</button>
				<button class="btn btn-primary" id="newDcode"
					style="float: right; margin-left: 16px">
					<i class="fas fa-file"></i> 새자료
				</button>
			</div>
			<div class="card-body">
				<div id="grid2"></div>
			</div>
		</div>
	</div>
</div>
<script language="Javascript">
   let gridData = [
     <c:forEach items="${basicCode }" var="Bcode">
       {
         basicCode : '${Bcode.basicCode}',
         basicName : '${Bcode.basicName}'
       },
     </c:forEach>
   ];

   const grid = new tui.Grid({
     el: document.getElementById('grid'),
      data: gridData,
      scrollY: false,
      bodyHeight: 500,
      rowHeaders: ['rowNum'],
      columns: [
        {
          header: '공통 코드',
          name: 'basicCode',
          align: 'center',
        },
        {
          header: '코드명',
          name: 'basicName',
          align: 'center',
        },
      ]
    });

    const grid2 = new tui.Grid({
      el: document.getElementById('grid2'),
      scrollY: false,
      bodyHeight: 500,
      rowHeaders: ['checkbox'],
      columns: [
        {
          header: '상세 코드',
          name: 'detailCode',
          align: 'center',
        },
        {
          header: '상세 코드명',
          name: 'detailName',
          align: 'center',
        },
        {
          header: '상세 코드 설명',
          name: 'detailExplain',
          align: 'center',
        },
        {
          header: '사용 여부',
          name: 'detailAvail',
          align: 'center',
        },
      ]
    });

  var rowCount = 0;
  var selectedRowKey = null;

     grid.on('click', ev => {
       var basicName = grid.getValue(ev.rowKey, 'basicName');
       var basicCode = grid.getValue(ev.rowKey, 'basicCode');
       $('#selCcd').val(basicName);

       //셀 클릭시 로우 하이라이팅
       if (selectedRowKey != ev.rowKey) {
           grid.removeRowClassName(selectedRowKey, 'highlight');
       }
       selectedRowKey = ev.rowKey;
       grid.addRowClassName(selectedRowKey, 'highlight');

    //세부코드 list 호출
    $.ajax({
          url: "getDetailCode",
          method: "POST",
          data: { basicCode: basicCode},
          success: function(data) {
              grid.resetData(data);  //그리드 적용
          },
          error: function (reject) {
            console.log(reject);
          },
    });
   });
</script>
