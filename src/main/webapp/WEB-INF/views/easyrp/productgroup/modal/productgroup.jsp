<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>Insert title here</title>
   </head>
   <body>
      <!-- 제품 그룹 관리 Modal START  -->
      <div class="modal-header">
         <h5 class="modal-title" id="loadWrksModalLabel">제품 그룹 목록</h5>
         <input
            type="text"
            id="modalSearch"
            class="form-control"
            placeholder="그룹 코드 또는 제품 그룹명을 입력해주세요."
            style="margin-left: 10px; width: auto; flex-grow: 1"
         />
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <button type="button" class="btn btn-primary" style="width: 10rem; margin: 0.5rem" onclick="insertForm()">
         제품 그룹 등록
      </button>
      <div id="insertForm" style="display: none; margin: 0.5rem">
         <div><strong>제품 그룹명</strong></div>
         <div class="d-flex">
            <div class="flex-grow-1">
               <input type="hidden" id="cod" class="form-control" name="cod" readonly required />
               <input
                  type="text"
                  id="name"
                  name="name"
                  class="form-control"
                  placeholder="추가하고자 하는 제품 그룹 명을 기입해주세요."
                  required
               />
            </div>
            <div>
               <button type="button" id="insertbtn" class="btn btn-primary hynowoo-10vw">등록</button>
            </div>
         </div>
      </div>
      <div class="modal-body overflow-y-auto" style="height: 60vh">
         <table class="table">
            <thead>
               <tr>
                  <th scope="col">제품 그룹 코드</th>
                  <th scope="col">제품 그룹명</th>
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
      <!-- 제품 그룹 관리 Modal END  -->

      <script type="text/javascript">
         function insertForm() {
            if ($('#insertForm').css('display') == 'none') {
               $('#insertForm').css('display', 'block');
            } else $('#insertForm').css('display', 'none');
         }

         /* modal CRUD START */
         $(document).ready(function () {
            function loadData() {
               $.ajax({
                  url: 'api/get-productgroup',
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
                              '<li><a class="dropdown-item" href="javascript:void(0);" data-cod="' +
                              item.cod +
                              '">수정</a></li>' +
                              '<li><a class="dropdown-item delete-data" href="javascript:void(0);" data-cod="' +
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
                  error: function (xhr, status, error) {
                     alert('데이터 로드에 실패했습니다: ' + error);
                  },
               });
            }

            $('#insertbtn').click(function () {
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
                     success: function (response) {
                        if (response === 'complete') {
                           alert('단위가 성공적으로 등록이 되었습니다.');
                           loadData();
                        }
                     },
                     error: function () {
                        alert('단위가 등록되지 않았습니다.');
                     },
                  });
               }
            });

            $(document).on('click', '.delete-data', function () {
               var cod = $(this).data('cod');

               if (confirm('이 항목을 삭제하시겠습니까?')) {
                  $.ajax({
                     url: 'unitdeletefn',
                     type: 'POST',
                     data: { cod: cod },
                     success: function (response) {
                        if (response === 'complete') {
                           alert('단위가 성공적으로 삭제되었습니다.');
                           loadData();
                        } else {
                           alert('삭제가 되지 않았습니다. 다시 시도해주세요.');
                        }
                     },
                     error: function (xhr, status, error) {
                        alert('삭제에 실패했습니다: ' + error);
                     },
                  });
               }
            });

            $(document).on('click', '.update-data', function () {
               let cod = $(this).data('cod');
               let updatedName = $('#unitupdatename').val();
               if (updatedName.length === 0) {
                  alert('단위명을 입력해주세요.');
                  return;
               }

               $.ajax({
                  url: 'unitupdatefn',
                  type: 'POST',
                  data: {
                     cod: cod,
                     name: updatedName,
                  },
                  success: function (response) {
                     if (response === 'complete') {
                        alert('단위가 성공적으로 수정되었습니다.');
                        $('#updateRow').remove();
                        loadData();
                     } else {
                        alert('수정을 완료하지 못했습니다. 다시 시도해주세요.');
                     }
                  },
                  error: function (xhr, status, error) {
                     alert('수정에 실패했습니다: ' + error);
                  },
               });
            });

            function showUpdateForm(element, cod) {
               var row = $(element).closest('tr');
               var nextRow = row.next();

               if (nextRow.attr('id') === 'updateRow') {
                  nextRow.toggle();
               } else {
                  var updateFormHtml =
                     '<tr id="updateRow"><td colspan="3">' +
                     '<input type="text" name="name" id="unitupdatename" value="' +
                     row.find('td:nth-child(2)').text() +
                     '" class="form-control" placeholder="단위 명을 입력하세요." required />' +
                     '<button type="button" class="btn btn-primary update-data" data-cod="' +
                     cod +
                     '">저장</button>' +
                     '<button type="button" onclick="$(this).parent().parent().remove();" class="btn btn-secondary">취소</button>' +
                     '</td></tr>';

                  row.after(updateFormHtml);
               }
            }

            $(document).on('click', '#modalDataTableBody .dropdown-item', function () {
               let cod = $(this).data('cod');
               showUpdateForm(this, cod);
            });

            /* 검색기능 START */
            $('#modalSearch').on('keyup', function () {
               var searchInputValue = $(this).val().toLowerCase();
               $('.searchData').each(function () {
                  var cod = $(this).data('cod').toString().toLowerCase();
                  var name = $(this).data('name').toString().toLowerCase();
                  if (cod.includes(searchInputValue) || name.includes(searchInputValue)) {
                     $(this).show();
                  } else {
                     $(this).hide();
                  }
               });
            });
            /* 검색기능 END */

            loadData();
         });

         /* modal CRUD END */
      </script>
   </body>
</html>
