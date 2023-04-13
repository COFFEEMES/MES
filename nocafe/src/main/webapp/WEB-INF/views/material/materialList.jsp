<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>

<style>
tr {
	height: 50px;
}

</style>
</head>

<body>
	<div class="container-fluid px-4">
		<h1 class="mt-4">자재재고조회</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i
					class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 자재관리</li>
			<li class="breadcrumb-item active">> 자재재고조회</li>
		</ol>
		<div class="card">
            <div class="card-body">
                <div style="display: inline-block; margin: auto 0; float: right">
                    <button class="btn btn-primary" id="schBtn"><i class="fas fa-search"></i> 조회</button>
                    <button class="btn btn-primary" id="reloadBtn"><i class="fas fa-file"></i> 새자료</button>
                    <button class="btn btn-primary" id="excelBtn"><i class="fas fa-file-excel"></i> 엑셀</button>
                </div>
                <form id="schParam">
                    <table style="vertical-align : middle;">
                        <colgroup>
                            <col style="width: 100px;">
                        </colgroup>
                        <tbody>
                       
                        <tr>
                            <th>
                                <label for="rscNm"><b>자재명</b></label>
                            </th>
                            <td>
                                <input id="rscNm" style="width: 300px;" type="text" placeholder="검색버튼을 이용하세요"
                                       class="form-control" required readonly>
                                <input id="rscCd" type="hidden" name="rscCd">
                                <button id="rscModBtn" type="button" class="btn btn-primary"><i
                                        class="fas fa-search"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <br>
        <div class="card">
            <div class="card-body">
                <div id="grid">
                </div>
            </div>
        </div>
    </div>

    <script>
    const gridData = [
        <c:forEach items="${selectMaterialLOTList }" var="material">
          {	  rscCd : '${material.rscCd}',
        	  rscNm : '${material.rscNm}',
        	  rscTyp : '${material.rscTyp}',
        	  rscSpec : '${material.rscSpec}',
        	  rscUnit : '${material.rscUnit}',
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
                header: '자재구분',
                name: 'rscTyp',
                sortingType: 'asc',
                sortable: true
            },
            {
                header: '규격',
                name: 'rscSpec'
            },
            {
                header: '단위',
                name: 'rscUnit'
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

    </script>
    