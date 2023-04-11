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
		<h1 class="mt-4">제품입고관리</h1>                                                         
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="/"><i class="fas fa-home"></i></a></li>
			<li class="breadcrumb-item">> 영업관리</li>
			<li class="breadcrumb-item active">> 제품입고관리</li>
		</ol>
		
		<div class="card mb-4">
      <div id="cont" style="padding-bottom:0px">
            <div class="col">
				<div class="card-body">
				<div class="mb-4">
                           
                                           
                        </div>
				<div class="linelist" style="float:right;">
                          <!--  <button type="button" class="btn btn-primary" id="dtSearchBtn"><i class="fas fa-search"></i> 조회</button> -->
                           <button type="button" class="btn btn-primary" id="saveBtn"><i class="fas fa-save"></i> 등록</button>
                           <button class="btn btn-primary" id="ReBtn"><i class="fas fa-file"></i> 초기화</button>
                       </div> 
                     <form name="IstSearchFrm" id="IstSearchFrm">
                    <!--  <label for="edctsIstDt" class="form-label">제품 입고일자</label> 
                           <input type="date" id="edctsIstDtStart" name="edctsIstDtStart" class="form-control" style="width:150px;margin-left: 5px;"> - <input type="date" id="edctsIstDtEnd" name="edctsIstDtEnd" class="form-control" style="width:150px;"> -->
                     <table class="table" style="vertical-align : middle;">
                     <colgroup>
                     	<col style="width: 150px;">
                     	<col>
                     	<col style="width: 150px;">
                     	<col>
                     	<col style="width: 150px;">
                     	<col>
                     	<col style="width: 150px;">
                     	<col>
                     </colgroup>
                     <tbody>
                     <tr>
                      <th for="edctsIstDt" class="form-label">제품검사일자</th> 
                          <td><input type="date" id="edctsIstDtStart" name="edctsIstDtStart" class="form-control" style="width:150px;margin-left: 5px;"> - <input type="date" id="edctsIstDtEnd" name="edctsIstDtEnd" class="form-control" style="width:150px;"></td>
                     	<th></th>
                     	<td></td>
                     	<th></th>
                     	<td></td>
                     	<th></th>
                     	<td></td>
                     	<th></th>
                     	<td></td>
                     	<th></th>
                     	<td></td>
                     	</tr>
                     	<tr>
                     		<th>검사완료제품</th>
                     		<td><input type="text" class="form-control" id="edctsLotNo" name="edctsLotNo" style="width:150px" readonly>
                     			<!-- 모달버튼 -->
    							<button type="button" class="btn btn-primary" id="lotSearchBtn" data-bs-toggle="modal" data-bs-target="#lotModal"><i class="fas fa-search"></i></button>	
    						</td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
                     	</tr>
<!--                      	<tr>
                     		<th>검사수량</th>
                     		<td><input type="text" class="form-control" id="inspCnt" name="inspCnt" style="width:150px;margin-left: 3px;" readonly></td>
                     		<th>제품 입고수량</th>
                     		<td><input type="text" class="form-control" id="edctsIstCnt" name="edctsIstCnt" style="width:150px;margin-left: 0px;"></td>                     		                     		
                     		<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
    						<th></th>
    						<td></td>
                     	</tr> -->
                     </tbody>
                       </div>
                       </table>
                      
                     </form>
                  </div>
            </div>
		
      </div>
    </div>
      <div id="grid" class="card mb-4"></div>
      
   </div>
      <!-- 검사완료 제품 모달 -->
		<div class="modal fade" id="lotModal" tabindex="-1" aria-labelledby="elLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">xampleModa
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="lotModalLabel">검사완료 제품</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div id="lotNoGrid"></div>
		      </div>
		      <div class="modal-footer">
		      <button type="button" id="confirmBtn" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		      <button type="button" id="cancleLotBtn" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div> <!-- 모달 div끝 -->
		
		<div id="complete"  style="margin: 30px;"></div>
</body>
<script>
//조회 그리드
var gridCom = new tui.Grid({
  el: document.getElementById("complete"),

  columns: [
    {
      header: "입고번호",
      name: "proIstNo"
    },
    {
      header: "LOT번호",
      name: "proLotNo",
      editor: 'text',
    },
    {
        header: "제품명",
        name: "proNm",
      },
   
    {
      header: "입고수량",
      name: "proIstCnt",
    },
    {
        header: "입고일자",
        name: "proIstDt",
       /*  formatter: function (data) {
      	  let dateVal = '';
      	  if(data.value != null ){
      		  dateVal = dateChange(data.value);
      	  }else{
      		  dateVal = getToday();
      	  }
            return dateVal;
          },
          editor: {
              type: 'datePicker',
              options: {
                format: 'yyyy-MM-dd',
                //selectableRanges: [[todayForgrid,threeMonthsLater ]]
          	  date : getToday()
              }
            } */
      
      
      },

  ],
  bodyHeight: 300,
  pageOptions: {
      useClient: true,
      type: 'scroll',
      perPage: 30
   }
});


</script>
</html>