<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Update - Hỏi Dân IT</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manager Update </h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Update</li>
                                </ol>
                                <form:form action="/admin/user/update" method="post" class="container mt-5"
                                    modelAttribute="Users1" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update user ${id}</h3>
                                            <hr />
                                            <div class="mb-3" style="display: none">
                                                <label class="form-label">Id: </label>
                                                <form:input type="text" class="form-control" path="id" />
                                                <!-- giá trị được chuyền qua biến path -->
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Email: </label>
                                                <form:input type="text" class="form-control" path="email"
                                                    disabled="true" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Fullname: </label>
                                                <form:input type="text" class="form-control" path="fullName" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Address: </label>
                                                <form:input type="text" class="form-control" path="address" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Phone: </label>
                                                <form:input type="text" class="form-control" path="phone" />
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Role: </label>
                                                <form:select class="form-select" path="role.name">
                                                    <!--role name lấy trường name trong đối tương role vì admin và user chỉ là chuỗi nên không thể lấy ra 1 đối tượng-->
                                                    <form:option value="ADMIN">ADMIN</form:option>
                                                    <form:option value="USER">USER</form:option>
                                                </form:select>
                                            </div>

                                            <div class="mb-3">
                                                <label for="avatarFile" class="form-label">Avatar: </label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    name="demoFile" accept=".png,.jpg,.jpeg" />
                                            </div>

                                            <div class="mb-3">
                                                <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                    id="avatarPreview" />
                                            </div>

                                            <button type="submit" class="btn btn-warning">Update</button>
                                            <!--btn btn-primary là thuộc tính đổi màu button của bootstrap -->
                                        </div>
                                    </div>

                                </form:form>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>