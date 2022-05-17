<%@ page import="com.laptrinhjavaweb.constant.PagingConstant" %>
<%@ page import="static com.laptrinhjavaweb.constant.PagingConstant.LIMIT_USER" %>
<%@ page import="static com.laptrinhjavaweb.constant.SystemConstant.BASE_API" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Thêm người dùng | Quản trị Admin</title>
</head>
<body>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">Danh sách người dùng</li>
            <li class="breadcrumb-item">Thêm người dùng</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo mới người dùng</h3>
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#exampleModalCenter"><b><i
                                    class="fas fa-folder-plus"></i> Tạo chức vụ mới</b></a>
                        </div>
                    </div>
                    <form id="formSubmitAdd" class="row" enctype="multipart/form-data">
                        <div class="form-group col-md-4">
                            <label class="control-label">Địa chỉ email</label>
                            <input name="email" class="form-control" type="text" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Họ và tên</label>
                            <input name="name" class="form-control" type="text" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Mật khẩu</label>
                            <input name="password" class="form-control" type="password" required>
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Số điện thoại</label>
                            <input name="phone" class="form-control" type="number" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="exampleSelect1" class="control-label">Chức vụ</label>
                            <select name="roleCode" class="form-control" id="exampleSelect1">
                                <%--<option>-- Chọn chức vụ --</option>--%>
                                <c:forEach var="role" items="${userPage.roles}">
                                    <option value="${role.code}">${role.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Ảnh người dùng</label>
                            <div id="myfileupload">
                                <input  type="file" id="uploadfile" name="image"
                                        accept="image/png, image/jpg, image/jpeg" onchange="readURL(this);" />
                            </div>
                            <div id="thumbbox">
                                <img height="300" width="300" alt="Thumb image" id="thumbimage" style="display: none" />
                                <a class="removeimg" href="javascript:"></a>
                            </div>
                            <div id="boxchoice">
                                <a href="javascript:" class="Choicefile"><i class='bx bx-upload'></i></a>
                                <p style="clear:both"></p>
                            </div>
                        </div>
                        <button id="btnAddUser" style="margin-left: 13px;" class="btn btn-save" type="button">Lưu lại</button>
                        <a class="ml-2 btn btn-cancel" href="/quan-tri/danh-sach-nguoi-dung?trang=1&soNguoiDung=<%=LIMIT_USER%>">Hủy bỏ</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>


<!--MODAL-->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Tạo chức vụ mới</h5>
              </span>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="control-label">Nhập tên chức vụ mới</label>
                        <input class="form-control" type="text" required>
                    </div>
                </div>
                <BR>
                <button class="btn btn-save" type="button">Lưu lại</button>
                <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                <BR>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--MODAL-->

<script>
    $('#btnAddUser').click(function (e) {
        e.preventDefault();
        var obj =$("#formSubmitAdd");
        var formData=new FormData();
        $.each($(obj).find("input[type='file']"), function (i,tag) { // tag là 1 <input>
           $.each($(tag)[0].files, function (i, file) { // $(tag)[0] là 1 <input> (=tag)
               formData.append(tag.name, file);
           });
        });

        var userRequest = {};
        var params = $(obj).serializeArray();
        $.each(params, function (i, v) {
            userRequest[""+v.name+""] = v.value;
        });
        formData.append("userRequest", JSON.stringify(userRequest));

         addUser(formData);
    });
    function addUser(data) {
        $.ajax({
            url: '<%=BASE_API%>/api/user',
            type: 'POST',
            processData: false,
            contentType: false,
            data: data,
            enctype: 'multipart/form-data',
            success: function (result) {
                swal("Thêm người dùng!", "Bạn đã thêm thành công!", "success");
            },
            error: function (error) {
                swal("Lổi! Thử lại sau");
            }
        });
    }
</script>
</body>
</html>