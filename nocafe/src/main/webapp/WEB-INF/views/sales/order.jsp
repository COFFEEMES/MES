<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>주문서 관리</title>
   <style>
	.c_btn {
   color: #fff;
   font-size: 13px;
   background: #333;
   border: none;
   padding: 6px;
   border-radius: 4px
}
</style>
</head>
<body>

	<div class="container-fluid px-4">
		<h1 class="mt-4">주문서관리</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 주문서 관리</li>
		</ol>
		
		<div class="card mb-4">
      		<div id="cont" style="padding-bottom:0px">
       			<div class="col">
                    <div class="card-body">
						<div class="linelist" style="float:right;margin-bottom: 13px;">
					   		<button class="btn btn-primary" id="ordrBtn"><i class="fas fa-search"></i> 조회</button>
					   		<button class="btn btn-primary" id="ReBtn"><i class="fas fa-file"></i> 초기화</button>
					   </div>
					   <form name="searchFrm" id="searchFrm">
					   <table class="table" style="vertical-align : middle;">
					   	<colgroup>
					   		<col style="width: 150px;">
                     		<col>
	                     	<col style="width: 150px;">
	                     	<col>
	                     	<col style="width: 150px;">
	                     	<col>
					   	</colgroup>
					   	<tbody>
					   		<tr>
					   			<th>거래처명</th>
					   			<td style="width:150px;">
					   				<input type="text" class="form-control" id="vendNm" name="vendNm" style="width:150px;">
					   			</td>
					   			<td>
                            		<button type="button" class="btn btn-primary" id="openCompany" data-bs-toggle="modal" data-bs-target="#comModal"><i class="fas fa-search"></i></button>	
					   			</td>
					   			<th></th>
					   			<td></td>
					   			<th></th>
					   			<td></td>	
					   		</tr>
					   		<tr>
					   			<th style="border-bottom-width:0px;">주문일자</th>
					   			<td style="border-bottom-width:0px;" colspan="3">
					   				<input type="date" id="start" name="start" class="form-control" style="width:150px; display: inline-block;"> -
					   				<input type="date" id="end" name="end" class="form-control" style="width:150px; display: inline-block;"> 
					   			</td>
					   		</tr>
					   	</tbody>
					   </table>
                     </form>
                  </div>
               </div>
           </div>
      </div>
      	<button class="btn btn-primary" id="addBtn"><i class="fas fa-plus"></i> 추가</button>
	    <button class="btn btn-primary" id="okBtn"><i class="fas fa-save"></i> 저장</button>
	    <button class="btn btn-primary" id="delBtn"><i class="fas fa-minus"></i> 삭제</button>
   		<div id="grid" class="card mb-4"></div> 
	</div>
</html>
