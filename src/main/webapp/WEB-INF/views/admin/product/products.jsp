<%@ page import="com.laptrinhjavaweb.constant.PagingConstant" %>
<%@ page import="static com.laptrinhjavaweb.constant.PagingConstant.LIMIT_PRODUCT_SIZE" %>
<%@ page import="static com.laptrinhjavaweb.constant.SystemConstant.BASE_API" %>
<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Danh sách sản phẩm | Quản trị Admin</title>
</head>

<body>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="/quan-tri/them-san-pham" title="Thêm"><i class="fas fa-plus"></i>
                                Tạo mới sản phẩm</a>
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
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Giá bán</th>
                            <th>Giảm giá</th>
                            <th>Giá hiện tại</th>
                            <th>Mô tả</th>
                            <th>Size</th>
                            <th>Số lượng</th>
                            <th>Danh mục</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${productPage.productSizes}" var="item">
                                <tr id="trProductSize${item.id}">
                                    <td width="10"><input type="checkbox" name="check1" value="${item.id}"></td>
                                    <td>${item.product.name}</td>
                                    <td><img src="<%=BASE_API%>/image/product/${item.product.images.get(0).image}" alt="" width="100px;"></td>
                                    <td>${item.product.unitPrice}$</td>
                                    <td><span class="badge bg-success">${item.product.discount}%</span></td>
                                    <td>${item.product.salePrice}$</td>
                                    <td>${item.product.description}</td>
                                    <td>${item.size.value}</td>
                                    <td>${item.quantity}</td>
                                    <td>${item.product.category.value}</td>
                                    <td>
                                        <button class="btn btn-primary btn-sm edit" type="button" onclick="openFormUpdate(${item.id})" title="Sửa" id="show-emp" data-toggle="modal"
                                                data-target="#ModalUP"><i class="fas fa-edit"></i></button>
                                    </td>
                                    <!--Update-->
                                    <div style="z-index: 2;" class="modal fade" id="ModalUP${item.id}"tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                         data-keyboard="false">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group  col-md-12">
                                                          <span class="thong-tin-thanh-toan">
                                                            <h5>Chỉnh sửa thông tin sản phẩm</h5>
                                                          </span>
                                                        </div>
                                                    </div>
                                                    <form id="formSubmitUpdate${item.id}">
                                                        <input type="hidden" value="${item.id}" name="id"/>
                                                        <div class="row">
                                                            <div class="form-group col-md-4">
                                                                <label class="control-label">Tên sản phẩm</label>
                                                                <input name="name" class="form-control" type="text" required value="${item.product.name}">
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label class="control-label">Giá bán</label>
                                                                <input name="unitPrice" class="form-control" type="number" value="${item.product.unitPrice}">
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label class="control-label">Giảm giá</label>
                                                                <input name="discount" class="form-control" type="number" value="${item.product.discount}">
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label class="control-label">Mô tả</label>
                                                                <input name="description" class="form-control" type="text" required value="${item.product.description}">
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label class="control-label">Size</label>
                                                                <select name="sizeCode" class="form-control" id="exampleSelec1">
                                                                    <c:forEach var="size" items="${productPage.sizes}">
                                                                        <option value="${size.code}"
                                                                                <c:if test="${size.code == item.size.code}"> selected="selected"</c:if>>
                                                                                ${size.value}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="form-group  col-md-4">
                                                                <label class="control-label">Số lượng</label>
                                                                <input name="quantity" class="form-control" type="number" required value="${item.quantity}">
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label class="control-label">Danh mục</label>
                                                                <select name="categoryCode" class="form-control" id="exampleSelec2">
                                                                    <c:forEach var="category" items="${productPage.categories}">
                                                                        <option value="${category.code}"
                                                                                <c:if test="${category.code == item.product.category.code}"> selected="selected"</c:if>>
                                                                                ${category.value}</option>
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
                    <form id="formSubmit" action="/quan-tri/danh-sach-san-pham" method="get">
                        <input type="hidden" value="" id="page" name="trang"/>
                        <input type="hidden" value="" id="limit" name="soSanPham"/>
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
            swal("Bạn chưa chọn sản phẩm để xóa");
        }else{
            swal({
                title: "Xóa sản phẩm",
                text: "Bạn có muốn xóa sản phẩm này",
                icon: "warning",
                buttons: true,
                dangerMode: true
            }).then((willDelete)=>{
                if (willDelete) {
                    console.log(ids);
                    deleteProductSize(ids);
                }
            });
        }
    }
    function deleteProductSize(data) {
        $.ajax({
            url: '<%=BASE_API%>/api/productsizes',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                data.forEach(function removeProductSizeDiv(id) {
                    document.getElementById("trProductSize"+id).remove();
                });
                swal("Xóa sản phẩm!", "Bạn đã xóa thành công!", "success");
            },
            error: function (error) {
                swal("Đã xảy ra lỗi! Hãy thử lại sau!");
            }
        });
    }
    //update
    function updateProductSize(data) {
        $.ajax({
            url: '<%=BASE_API%>/api/productsize',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                swal("Cập nhật sản phẩm!", "Bạn đã cập nhật thành công!\n\n Đang tải lại trang...", "success");
                setTimeout(() => window.location.href = "/quan-tri/danh-sach-san-pham?trang="+currentPage+"&soSanPham=<%=LIMIT_PRODUCT_SIZE%>",2000);
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
        updateProductSize(data);
        //console.log(data);
    }
    //Modal
    function openFormUpdate(id){
        $("#ModalUP"+id).modal({ backdrop: false, keyboard: false });
        console.log(id);
    }
    //paging
    var totalPages = ${productPage.pagingModel.totalPage};
    var currentPage = ${productPage.pagingModel.page};
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: <%=PagingConstant.VISIBLE_PAGES%>,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#limit').val(<%=PagingConstant.LIMIT_PRODUCT%>);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        });
    });
</script>
</body>
</html>