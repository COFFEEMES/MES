<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>

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
                                <div
                                     style="height: 40px; width: 200px; border-radius: 5px;">
                                    <input type="date" id="inqDt" name="inqDt"
                                           class="form-control">
                                   
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
                </div>
            </div>
        </div>
    </div>

    <script>
        window.addEventListener('load', function () {
            getRscListInit();
            getRscStcList();
        });


    const grid = new tui.Grid({
        el: document.getElementById('grid'),
        bodyHeight: 450,
        scrollX: false,
        scrollY: true,
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
            	header: '현재재고',
            	name: 'lotCnt',
            	sortingType: 'asc',
                sortable: true
            },
            {
                header: '단위',
                name: 'rscUnit'
            },
            {
                header: '안전재고',
                name: 'safRtc'
            }
        ]
    });

    let gridOption = {
            row: {
                hover: {background: 'rgba(19,78,94,0.2)'}
            }
        }
        tui.Grid.applyTheme('default', gridOption);

        let rscGrid = new tui.Grid({
            el: document.getElementById('rsc-grid'),
            bodyHeight: 300,
            scrollX: false,
            scrollY: true,
            columns: [
                {
                    header: '자재코드',
                    name: 'rscCd'
                },
                {
                    header: '자재명',
                    name: 'rscNm'
                },
                {
                    header: '단위',
                    name: 'rscUnit'
                }
            ]
        })

  
        let rModal;
        rscModBtn.addEventListener('click', function () {
            rModal = new bootstrap.Modal(document.getElementById('rscModal'), {})
            rModal.show('rscModal');
        })

        let rscModal = document.getElementById('rscModal');
        rscModal.addEventListener('shown.bs.modal', e => {
            rscGrid.refreshLayout();
        })

        let rscSch = document.getElementById('rscSch');
        rscSch.addEventListener('click', function () {
            let data = new FormData(rscSchForm);
            let url = 'getResources'

            fetch(url, {
                method: 'POST',
                body: data
            }).then(res => res.json()).then(res => {
                rscGrid.innerHTML = '';
                rscGrid.resetData(res);
            })
        });

        rscGrid.on('dblclick', e => {
            let rowInfo = rscGrid.getRow(e.rowKey)
            rscNm.value = rowInfo.rscCd + ' - ' + rowInfo.rscNm;
            rscCd.value = rowInfo.rscCd;
            rModal.hide(rscModal);
        })

        function getRscListInit() {
            let url = 'getResources'
            fetch(url).then(res => res.json())
                .then(res => rscGrid.resetData(res))
        }

        let schBtn = document.getElementById('schBtn');
        schBtn.addEventListener('click', getRscStcList);

        function getRscStcList() {
            let url = 'getRscStcList'
            let data = new FormData(schParam)
            fetch(url, {
                method: 'POST',
                body: data
            }).then(res => res.json()).then(res => {
                grid.resetData(res)
            })
        }

        reloadBtn.addEventListener('click', e => {
            location.reload();
        })


        grid.on('onGridUpdated', function (ev) {
            let rowCnt = grid.getRowCount();
            let lotCnt = grid.getColumnValues('lotCnt')
            let safRtc = grid.getColumnValues('safRtc')

            for (let i = 0; i < rowCnt; i++) {
                if(safRtc[i] > lotCnt[i]) {
                    grid.addRowClassName(i, 'lowStock')
                }
            }
        })

        let gridKey = null;
        grid.on('click', ev => {
            if (gridKey != ev.rowKey) {
                grid.removeRowClassName(gridKey, 'highlight');
            }
            gridKey = ev.rowKey
            grid.addRowClassName(gridKey, 'highlight')
        });
        
        
    </script>
</body>
