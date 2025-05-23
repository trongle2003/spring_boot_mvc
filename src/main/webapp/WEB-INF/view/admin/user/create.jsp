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
                <title>Create - Hỏi Dân IT</title>
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
                                <h1 class="mt-4">Manager Create </h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Create</li>
                                </ol>
                                <form:form action="create" method="post" class="mt-5" modelAttribute="newUser"
                                    enctype="multipart/form-data">
                                    <div class="row">
                                        <h3>Create a user</h3>
                                        <hr />
                                        <div class="mb-3 col-12 col-md-6" style="display: none;">
                                            <div class="mb-3">
                                                <label class="form-label">Id: </label>
                                                <form:input type="text" class="form-control" path="id"
                                                    disabled="true" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <c:set var="errorEmail">
                                                <form:errors path="email" cssClass="invalid-feedback" />
                                            </c:set>
                                            <div class="mb-3">
                                                <label class="form-label">Email: </label>
                                                <form:input type="text"
                                                    class="form-control is-invalid ${not empty errorEmail ? 'is-invalid':''} "
                                                    path="email" />
                                                ${errorEmail}
                                                <form:errors part="email" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <c:set var="errorFullname">
                                                <form:errors path="fullName" cssClass="invalid-feedback" />
                                            </c:set>
                                            <div class="mb-3">
                                                <label class="form-label">Fullname: </label>
                                                <form:input type="text"
                                                    class="form-control is-invalid ${not empty errorFullname ? 'is-invalid':''} "
                                                    path="fullName" />
                                                ${errorFullname}
                                                <form:errors part="fullName" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <c:set var="errorPassword">
                                                <form:errors path="password" cssClass="invalid-feedback" />
                                            </c:set>
                                            <div class="mb-3">
                                                <label class="form-label">Password: </label>
                                                <form:input type="password"
                                                    class="form-control is-invalid ${not empty errorPassword ? 'is-invalid':''}"
                                                    path="password" />
                                                ${errorPassword}
                                                <form:errors part="password" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Address: </label>
                                                <form:input type="text" class="form-control" path="address" />
                                            </div>
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Phone: </label>
                                                <form:input type="text" class="form-control" path="phone" />
                                            </div>
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label">Role: </label>
                                            <form:select class="form-select" path="role.name">
                                                <!--role name lấy trường name trong đối tương role vì admin và user chỉ là chuỗi nên không thể lấy ra 1 đối tượng-->
                                                <form:option value="ADMIN">ADMIN</form:option>
                                                <form:option value="USER">USER</form:option>
                                            </form:select>
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label for="avatarFile" class="form-label">Avatar: </label>
                                            <input class="form-control" type="file" id="avatarFile" name="demoFile"
                                                accept=".png,.jpg,.jpeg" />
                                        </div>

                                        <div class="col-12 mb-3">
                                            <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                id="avatarPreview" />
                                        </div>
                                        <div class="col-12 mb-5">
                                            <button type="submit" class="btn btn-primary">Create</button>
                                        </div>
                                    </div>
                            </div>
                            </form:form>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>