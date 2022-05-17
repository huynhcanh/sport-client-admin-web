<%@ page import="static com.laptrinhjavaweb.constant.SystemConstant.BASE_API" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Đăng nhập</title>
</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="/admin/images/team.jpg" alt="IMG">
            </div>
            <!--=====TIÊU ĐỀ======-->
            <div class="login100-form validate-form">
                    <span class="login100-form-title">
                        <b>ĐĂNG NHẬP</b>
                    </span>
                <c:if test="${param.incorrectAccount != null}">
                    <div class="alert alert-danger">
                     Tài khoản hoặc mật khẩu không đúng
               </div>
                </c:if>
                <c:if test="${param.accessDenied != null}">
                    <div class="alert alert-danger">
                     Từ chối truy cập
               </div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success">
                     Đăng xuất thành công
               </div>
                </c:if>
                <!--=====FORM INPUT TÀI KHOẢN VÀ PASSWORD======-->
                <form id="formSubmit" method="post">
                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" placeholder="Email" name="email" id="email">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100"><i class='bx bx-user'></i></span>
                    </div>
                    <div class="wrap-input100 validate-input">
                        <input autocomplete="off" class="input100" type="password" placeholder="Mật khẩu" name="password" id="password-field">
                        <span toggle="#password-field" class="bx fa-fw bx-hide field-icon click-eye"></span>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100"><i class='bx bx-key'></i></span>
                    </div>

                    <!--=====ĐĂNG NHẬP======-->
                    <div class="container-login100-form-btn">
                        <input type="button" value="Đăng nhập" id="btnLogin" />
                    </div>
                    <!--=====LINK TÌM MẬT KHẨU======-->
                    <div class="text-right p-t-12">
                        <a class="txt2" href="/quen-mat-khau">Bạn quên mật khẩu?</a>
                    </div>
                </form>
                <!--=====FOOTER======-->
                <%@ include file="/common/admin/footer.jsp" %>
            </div>
        </div>
    </div>
</div>
<script src="/admin/vendor/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    //show - hide mật khẩu
    function myFunction() {
        var x = document.getElementById("myInput");
        if (x.type === "password") {
            x.type = "text"
        } else {
            x.type = "password";
        }
    }
    $(".click-eye").click(function () {
        $(this).toggleClass("bx-show bx-hide");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });

    $('#btnLogin').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        console.log(JSON.stringify(data));
        var url = '<%=BASE_API%>/api/user/login';
        console.log(url);
        $.ajax({
            url: url,
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href ="/quan-tri/trang-chu";
            },
            error: function (error) {
                window.location.href ="/dang-nhap?incorrectAccount";
            }
        });
    });
</script>
</body>
</html>