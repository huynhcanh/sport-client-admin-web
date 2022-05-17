<%@ page import="static com.laptrinhjavaweb.constant.PagingConstant.LIMIT_PRODUCT_SIZE" %>
<%@ page import="static com.laptrinhjavaweb.constant.SystemConstant.BASE_API" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Thêm sản phẩm | Quản trị Admin</title>
    <script type="text/javascript" src="/admin/ckeditor/ckeditor.js"></script>
</head>

<body>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">Danh sách sản phẩm</li>
            <li class="breadcrumb-item"><a href="#">Thêm sản phẩm</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo mới sản phẩm</h3>
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#exampleModalCenter"><i
                                    class="fas fa-folder-plus"></i> Thêm nhà cung cấp</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#adddanhmuc"><i
                                    class="fas fa-folder-plus"></i> Thêm danh mục</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#addtinhtrang"><i
                                    class="fas fa-folder-plus"></i> Thêm tình trạng</a>
                        </div>
                    </div>
                    <form id="formSubmitAdd" class="row" enctype="multipart/form-data">
                        <div class="form-group col-md-3">
                            <label class="control-label">Tên sản phẩm</label>
                            <input name="name" class="form-control" type="text">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Giá bán</label>
                            <input name="unitPrice" class="form-control" type="number" placeholder="">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Giảm giá</label>
                            <input name="discount" class="form-control" type="number" placeholder="">
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="exampleSelect1" class="control-label">Size</label>
                            <select name="sizeCode" class="form-control" id="exampleSelect1">
                                <%--<option>-- Chọn chức vụ --</option>--%>
                                <c:forEach var="size" items="${productPage.sizes}">
                                    <option value="${size.code}">${size.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group  col-md-3">
                            <label class="control-label">Số lượng</label>
                            <input name="quantity" class="form-control" type="number">
                        </div>
                        <div class="form-group col-md-3 ">
                            <label for="exampleSelect1" class="control-label">Danh mục</label>
                            <select name="categoryCode" class="form-control" id="exampleSelect1">
                                <c:forEach var="category" items="${productPage.categories}">
                                    <option value="${category.code}">${category.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">Ảnh chính sản phẩm</label>
                            <div id="myfileupload">
                                <input type="file" id="uploadfile" name="images" onchange="readURL(this);" />
                            </div>
                            <div id="thumbbox">
                                <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />
                                <a class="removeimg" href="javascript:"></a>
                            </div>
                            <div id="boxchoice">
                                <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                                <p style="clear:both"></p>
                            </div>
                        </div>
                        <%--<div class="form-group col-md-3 ">--%>
                            <%--<label class="control-label">Ảnh phụ 1</label>--%>
                            <%--<input name="images" class="form-control" type="file">--%>
                        <%--</div>--%>
                        <%--<div class="form-group col-md-3 ">--%>
                            <%--<label class="control-label">Ảnh phụ 2</label>--%>
                            <%--<input name="images" class="form-control" type="file">--%>
                        <%--</div>--%>
                        <%--<div class="form-group col-md-3 ">--%>
                            <%--<label class="control-label">Ảnh phụ 3</label>--%>
                            <%--<input name="images" class="form-control" type="file">--%>
                        <%--</div>--%>
                        <div class="form-group col-md-12">
                            <label class="control-label">Mô tả sản phẩm</label>
                            <textarea class="form-control" name="description" id="description"></textarea>
                        </div>
                        <button id="btnAddProductSize" style="margin-left: 13px;" class="btn btn-save" type="button">Lưu lại</button>
                        <a class="ml-2 btn btn-cancel" href="/quan-tri/danh-sach-san-pham?trang=1&soSanPham=<%=LIMIT_PRODUCT_SIZE%>">Hủy bỏ</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<!--MODAL CHỨC VỤ-->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới nhà cung cấp</h5>
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
<!--MODAL DANH MỤC-->
<div class="modal fade" id="adddanhmuc" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới danh mục </h5>
              </span>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="control-label">Nhập tên danh mục mới</label>
                        <input class="form-control" type="text" required>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="control-label">Danh mục sản phẩm hiện đang có</label>
                        <ul style="padding-left: 20px;">
                            <li>Bàn ăn</li>
                            <li>Bàn thông minh</li>
                            <li>Tủ</li>
                            <li>Ghế gỗ</li>
                            <li>Ghế sắt</li>
                            <li>Giường người lớn</li>
                            <li>Giường trẻ em</li>
                            <li>Bàn trang điểm</li>
                            <li>Giá đỡ</li>
                        </ul>
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
<!--MODAL TÌNH TRẠNG-->
<div class="modal fade" id="addtinhtrang" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới tình trạng</h5>
              </span>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="control-label">Nhập tình trạng mới</label>
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
    var editor = '';
    $(document).ready(function(){
        editor = CKEDITOR.replace( 'description');
    });
    $('#btnAddProductSize').click(function (e) {
        e.preventDefault();
        var obj =$("#formSubmitAdd");
        var formData=new FormData();
        $.each($(obj).find("input[type='file']"), function (i,tag) { // tag là 1 <input>
            $.each($(tag)[0].files, function (i, file) { // $(tag)[0] là 1 <input> (=tag)
                formData.append(tag.name, file);
            });
        });

        var productSizeRequest = {};
        var params = $(obj).serializeArray();
        $.each(params, function (i, v) {
            productSizeRequest[""+v.name+""] = v.value;
        });
        productSizeRequest["description"] = editor.getData();
        formData.append("productSizeRequest", JSON.stringify(productSizeRequest));

        addProductSize(formData);
    });
    function addProductSize(data) {
        $.ajax({
            url: '<%=BASE_API%>/api/productsize',
            type: 'POST',
            processData: false,
            contentType: false,
            data: data,
            enctype: 'multipart/form-data',
            success: function (result) {
                swal("Thêm sản phẩm!", "Bạn đã thêm thành công!", "success");
            },
            error: function (error) {
                swal("Đã xảy ra lỗi! Hãy thử lại sau!");
            }
        });
    }
</script>
</body>
</html>