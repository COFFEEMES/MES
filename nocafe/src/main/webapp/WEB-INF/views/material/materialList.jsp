<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>

    <style>
        tr {
            height: 50px;
        }

        .tui-grid-cell.lowStock {
            background-color: rgba(255, 0, 0, 0.3);
        }
    </style>
</head>

<body>
    <div class="container-fluid px-4">
        <h1 class="mt-4">자재재고조회</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="home.do"><i class="fas fa-home"></i></a></li>
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
                                <b>조회일자</b>
                            </th>
                            <td>
                                <div class="tui-datepicker-input tui-datetime-input tui-has-focus"
                                     style="height: 40px; border-radius: 5px;">
                                    <input type="text" id="inqDt" name="inqDt" aria-label="Date-Time"
                                           class="form-control">
                                    <span class="tui-ico-date"></span>
                                </div>
                                <div id="wrapper" style="margin-top: -1px;"></div>
                            </td>
                        </tr>
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
                <div id="grid"></div>
            </div>
        </div>
    </div>

    <!-- Modal for resource search -->
    <div class="modal fade" id="rscModal" tabindex="-1" aria-labelledby="rscModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">자재검색</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="rscSchForm">
                        <table>
                            <colgroup>
                                <col style="width: 400px;">
                                <col style="width: 10px">
                                <col style="width: 50px;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>
                                    <input type="text" id="rscNmInMod" name="rscNm" class="form-control"
                                           placeholder="자재명">
                                </td>
                                <td></td>
                                <td rowspan="2">
                                    <button id="rscSch" class="btn btn-primary" type="button" style="height: 90px;"><i
                                            class="fas fa-search"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" id="rscCdInMod" name="rscCd" class="form-control"
                                           placeholder="자재코드">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                    <br>
                    <div id="rsc-grid"></div>
                    <div style="float: right"><p>선택 : 더블클릭</p></div>
                </div>
            </div>
        </div>
    </div>

