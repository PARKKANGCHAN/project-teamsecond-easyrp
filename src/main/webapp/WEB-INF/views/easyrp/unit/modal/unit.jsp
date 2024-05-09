<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <!-- 단위 관리 Modal START  -->
      <div class="modal-header">
         <h5 class="modal-title" id="loadWrksModalLabel">단위 목록</h5>
         <input
            type="text"
            id="modalSearch"
            class="form-control"
            placeholder="단위 코드 또는 단위명을 입력해주세요."
            style="margin-left: 10px; width: auto; flex-grow: 1"
         />
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <button type="button" class="btn btn-primary" style="width: 10rem; margin: 0.5rem" onclick="insertForm()">
         단위 등록
      </button>
      <div id="insertForm" style="display: none; margin: 0.5rem">
         <td width="150"><strong>단위명</strong></td>
         <td>
            <input type="hidden" id="unitinsertcod" class="form-control" name="cod" readonly required />
            <input
               type="text"
               id="unitinsertname"
               name="name"
               class="form-control"
               placeholder="단위 명을 입력후 등록을 눌러주세요."
               required
            />
         </td>
         <button type="button" style="margin-top: 0.5rem" id="unitinsertbtn" class="btn btn-primary">등록</button>
      </div>
      <div class="modal-body">
         <table class="table">
            <thead>
               <tr>
                  <th scope="col">단위번호</th>
                  <th scope="col">단위명</th>
                  <th scope="col">기 능</th>
               </tr>
            </thead>
            <tbody id="modalDataTableBody">
               <!-- 여기에 Ajax Body 넣어주기 -->
            </tbody>
         </table>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
      <!-- 단위 관리 Modal END  -->

      <script type="text/javascript">
         function insertForm() {
            if ($('#insertForm').css('display') == 'none') {
               $('#insertForm').css('display', 'block');
            } else $('#insertForm').css('display', 'none');
         }

         /* Ajax로 insert 기능 구현 START */
         $(document).ready(function () {
            function loadUnitData() {
               $.ajax({
                  url: 'api/get-unit',
                  method: 'GET',
                  success: function (data) {
                     let rows = '';
                     data.forEach(function (item) {
                        if (item.cod && item.deleteyn === 'N') {
                           rows +=
                              '<tr class="searchData" data-cod="' +
                              item.cod +
                              '" data-name="' +
                              item.name +
                              '">' +
                              '<td>' +
                              item.cod +
                              '</td>' +
                              '<td>' +
                              item.name +
                              '</td>' +
                              '<td>' +
                              '<div class="btn-group">' +
                              '<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">' +
                              '<i class="fa-solid fa-gear"></i>' +
                              '</button>' +
                              '<ul class="dropdown-menu">' +
                              '<li><a class="dropdown-item" href="unitupdate?cod=' +
                              item.cod +
                              '">수정</a></li>' +
                              '<li><a class="dropdown-item" href="unitdeltefn?cod=' +
                              item.cod +
                              '">삭제</a></li>' +
                              '</ul>' +
                              '</div>' +
                              '</td>' +
                              '</tr>';
                        }
                     });
                     $('#modalDataTableBody').html(rows);
                     $('#unitinsertname').val('');
                     $('#unitinsertcod').val(data[0].cod + 1);
                  },
               });
            }

            $('#unitinsertbtn').click(function () {
               let unitCod = $('#unitinsertcod').val();
               let unitName = $('#unitinsertname').val();

               if (unitCod.length == 0 || unitName.length == 0) {
                  alert('데이터가 입력되지 않았습니다.');
                  return;
               } else {
                  $.ajax({
                     url: 'unitinsertfn',
                     data: { cod: unitCod, name: unitName },
                     type: 'post',
                     success: function (data) {
                        if (data === 'complete') {
                           alert('단위가 성공적으로 등록이 되었습니다.');
                           loadUnitData();
                        }
                     },
                     error: function () {
                        alert('단위가 등록되지 않았습니다.');
                     },
                  });
               }
            });
            loadUnitData();
         });

         /* 검색기능 START */
         $('#modalSearch').on('keyup', function () {
            var searchInputValue = $(this).val().toLowerCase();
            $('.searchData').each(function () {
               var cod = $(this).data('cod').toString().toLowerCase();
               var name = $(this).data('name').toString().toLowerCase();
               $(this).toggle(cod.includes(searchInputValue) || name.includes(searchInputValue));
            });
         });
         /* 검색기능 END */
      </script>
   </body>
</html>
