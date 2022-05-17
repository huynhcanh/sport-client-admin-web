<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title><dec:title default="Trang quản trị" /></title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Main CSS-->
	<link rel="stylesheet" type="text/css" href="/admin/doc/css/main.css">
	<!-- Font-icon css-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
	<!-- or -->
	<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
	<script src="/sweetalert/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<link rel="stylesheet" type="text/css"
		  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script type="text/javascript" src="/admin/ckeditor/ckeditor.js"></script>
	<script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
	<script>

        function readURL(input, thumbimage) {
            if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#thumbimage").attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
            else { // Sử dụng cho IE
                $("#thumbimage").attr('src', input.value);

            }
            $("#thumbimage").show();
            $('.filename').text($("#uploadfile").val());
            $('.Choicefile').css('background', '#14142B');
            $('.Choicefile').css('cursor', 'default');
            $(".removeimg").show();
            $(".Choicefile").unbind('click');

        }
        $(document).ready(function () {
            $(".Choicefile").bind('click', function () {
                $("#uploadfile").click();

            });
            $(".removeimg").click(function () {
                $("#thumbimage").attr('src', '').hide();
                $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                $(".removeimg").hide();
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();
                });
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'pointer');
                $(".filename").text("");
            });
        })
	</script>
</head>
<body class="app sidebar-mini rtl">
	<%@ include file="/common/admin/style.jsp" %>
	<!-- Navbar-->
	<%@ include file="/common/admin/navbar.jsp" %>
	<dec:body/>

<!-- Essential javascripts for application to work-->
<script src="/admin/doc/js/jquery-3.2.1.min.js"></script>
<script src="/admin/doc/js/popper.min.js"></script>
<script src="/admin/doc/js/bootstrap.min.js"></script>
<script src="/admin/doc/js/main.js"></script>
<script src="/admin/doc/js/plugins/pace.min.js"></script>
<%--twbsPagination--%>
<script src="/paging/jquery.twbsPagination.js" type="text/javascript"></script>
</body>
</html>