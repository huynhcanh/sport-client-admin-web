<%@ page import="com.laptrinhjavaweb.constant.PagingConstant" %>
<%@ page import="static com.laptrinhjavaweb.constant.PagingConstant.LIMIT_USER" %>
<%@ page import="static com.laptrinhjavaweb.constant.PagingConstant.VISIBLE_PAGES" %>
<%@ page import="static com.laptrinhjavaweb.constant.SystemConstant.BASE_API" %>
<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<c:url var="deleteUserApi" value=""/>--%>
<%--<c:url var="userApi" value=""/>--%>
<%--<c:url var="userUrl" value=""/>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách người dùng | Quản trị Admin</title>
</head>

<body>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách người dùng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">

                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="/quan-tri/them-nguoi-dung" title="Thêm"><i class="fas fa-plus"></i>
                                Tạo mới người dùng</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nhập" onclick="myFunction(this)"><i
                                    class="fas fa-file-upload"></i> Tải từ file</a>
                        </div>

                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                    class="fas fa-print"></i> In dữ liệu</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file js-textareacopybtn" type="button" title="Sao chép"><i
                                    class="fas fa-copy"></i> Sao chép</a>
                        </div>

                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm pdf-file" type="button" title="In" onclick="myFunction(this)"><i
                                    class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="warningBeforeDelete()"><i
                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                           id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th >Email</th>
                            <th width="150">Họ và tên</th>
                            <th width="150">Mật khẩu</th>
                            <th width="20">Avatar</th>
                            <th>SĐT</th>
                            <th>Chức vụ</th>
                            <th width="100">Chỉnh sửa</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${userPage.users}">
                                <tr id="trUser${item.id}">
                                    <td width="10"><input type="checkbox" name="check1" value="${item.id}"></td>
                                    <td>${item.email}</td>
                                    <td>${item.name}</td>
                                    <td>${item.password}</td>
                                    <td><img class="img-card-person" src="<%=BASE_API%>/image/user/${item.image}" alt=""></td>
                                    <td>${item.phone}</td>
                                    <td>${item.role.value}</td>
                                    <td class="table-td-center">
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" onclick="openFormUpdate(${item.id})"
                                                data-toggle="modal" data-target="#ModalUP"><i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                    <!--Update-->
                                    <div style="z-index: 2;" class="modal fade" id="ModalUP${item.id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                         data-keyboard="false">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group  col-md-12">
                                                          <span class="thong-tin-thanh-toan">
                                                            <h5>Chỉnh sửa thông tin người dùng</h5>
                                                          </span>
                                                        </div>
                                                    </div>
                                                    <form id="formSubmitUpdate${item.id}">
                                                        <input type="hidden" value="${item.id}" name="id"/>
                                                        <div class="row">
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Email</label>
                                                                <input name="email" class="form-control" type="text" required value="${item.email}">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Họ và tên</label>
                                                                <input name="name" class="form-control" type="text" required value="${item.name}">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Mật khẩu</label>
                                                                <input name="password" class="form-control" type="text" required value="${item.password}">
                                                            </div>
                                                            <div class="form-group  col-md-6">
                                                                <label class="control-label">Số điện thoại</label>
                                                                <input name="phone" class="form-control" type="number" required value="${item.phone}">
                                                            </div>
                                                            <div class="form-group  col-md-6">
                                                                <label for="exampleSelect1" class="control-label">Chức vụ</label>
                                                                <select name="roleCode" class="form-control" id="exampleSelect1">
                                                                    <c:forEach var="role" items="${userPage.roles}">
                                                                    <option value="${role.code}"
                                                                            <c:if test="${role.code == item.role.code}"> selected="selected"</c:if>>
                                                                            ${role.value}</option>
                                                                </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        </br>
                                                        <button class="btn btn-save" type="button" onclick="update(${item.id})">Lưu lại</button>
                                                        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                                    </form>
                                                    <BR>
                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Update-->
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <ul class="pagination" id="pagination" style="z-index: 1;"></ul>
                    <form id="formSubmit" action="/quan-tri/danh-sach-nguoi-dung" method="get">
                        <input type="hidden" value="" id="page" name="trang"/>
                        <input type="hidden" value="" id="limit" name="soNguoiDung"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<script>

    //delete
    let ids=null;
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
        let selectedIds = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        ids=selectedIds;
    });
    function warningBeforeDelete() {
        ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        if(ids.length == 0){
            swal("Bạn chưa chọn người dùng để xóa");
        }else{
            swal({
                title: "Xóa người dùng",
                text: "Bạn có muốn xóa người dùng này",
                icon: "warning",
                buttons: true,
                dangerMode: true
            }).then((willDelete)=>{
                if (willDelete) {
                    console.log(ids);
                    deleteUser(ids);
                }
            });
        }
    }
    function deleteUser(data) {
        $.ajax({
            url: '<%=BASE_API%>/api/users',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                data.forEach(function removeUserDiv(id) {
                    document.getElementById("trUser"+id).remove();
                });
                swal("Xóa người dùng!", "Bạn đã xóa thành công!", "success");
            },
            error: function (error) {
                swal("Đã xảy ra lỗi! Hãy thử lại sau!");
            }
        });
    }
    //update
    function updateUser(data) {
        $.ajax({
            url: '<%=BASE_API%>/api/user',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                swal("Cập nhật người dùng!", "Bạn đã cập nhật thành công!\n\n Đang tải lại trang...", "success");
                setTimeout(() => window.location.href = "/quan-tri/danh-sach-nguoi-dung?trang="+currentPage+"&soNguoiDung=<%=LIMIT_USER%>",2000);
            },
            error: function (error) {
                swal("Đã xảy ra lỗi! Hãy thử lại sau!");
            }
        });
    }
    function update(id) {
        var data = {};
        var formData = $('#formSubmitUpdate'+id).serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        updateUser(data);
        console.log(data);
    }
    //Modal
    function openFormUpdate(id){
        $("#ModalUP"+id).modal({ backdrop: false, keyboard: false });
        console.log(id);
    }
    //paging
    var totalPages = ${userPage.pagingModel.totalPage};
    var currentPage = ${userPage.pagingModel.page};
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: <%=VISIBLE_PAGES%>,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#limit').val(<%=LIMIT_USER%>);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        });
    });
</script>
</body>

</html>