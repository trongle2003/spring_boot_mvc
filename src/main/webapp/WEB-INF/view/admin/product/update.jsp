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
                        const orgImage = "${newProduct.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#avatarPreview").attr("src", orgImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }
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
                                <form:form action="/admin/product/update" method="post" class="container mt-5"
                                    modelAttribute="Products1" enctype="multipart/form-data">
                                    <c:set var="errorName">
                                        <form:errors path="name" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorPrice">
                                        <form:errors path="price" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorDetailDesc">
                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorShortDesc">
                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="errorQuantity">
                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                    </c:set>

                                    <div class="row">
                                        <h3>Update product ${id}</h3>
                                        <hr />
                                        <div class="mb-3 col-12 col-md-6" style="display: none;">
                                            <div class="mb-3">
                                                <label class="form-label">Id: </label>
                                                <form:input type="text" class="form-control" path="id" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Name: </label>
                                                <form:input type="text"
                                                    class="form-control is-invalid ${not empty errorName ? 'is-invalid':''} "
                                                    path="name" />
                                                ${errorName}
                                                <form:errors part="name" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Price: </label>
                                                <form:input type="text"
                                                    class="form-control is-invalid ${not empty errorPrice ? 'is-invalid':''}"
                                                    path="price" />
                                                ${errorPrice}
                                                <form:errors part="price" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Detail description: </label>
                                                <form:input type="text"
                                                    class="form-control is-invalid ${not empty errorDetailDesc ? 'is-invalid':''}"
                                                    path="detailDesc" />
                                                ${errorDetailDesc}
                                                <form:errors part="detailDesc" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-12 col-md-6">

                                            <div class="mb-3">
                                                <label class="form-label">Short description: </label>
                                                <form:input type="text"
                                                    class="form-control is-invalid ${not empty errorShortDesc ? 'is-invalid':''}"
                                                    path="shortDesc" />
                                                ${errorShortDesc}
                                                <form:errors part="shortDesc" cssClass="invalid-feedback" />
                                            </div>
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Quantity: </label>
                                                <form:input type="quantity"
                                                    class="form-control is-invalid ${not empty errorQuantity ? 'is-invalid':''}"
                                                    path="quantity" />
                                                ${errorQuantity}
                                                <form:errors part="quantity" cssClass="invalid-feedback" />
                                            </div>
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label">Factory: </label>
                                            <form:select class="form-select" path="factory">
                                                <form:option value="Apple">Apple</form:option>
                                                <form:option value="Acer">Acer</form:option>
                                                <form:option value="Asus">Asus</form:option>
                                                <form:option value="Dell">Dell</form:option>
                                                <form:option value="Lenovo">Lenovo</form:option>
                                                <form:option value="HP">HP</form:option>
                                                <form:option value="Microsoft">Microsoft</form:option>
                                                <form:option value="MSI">MSI</form:option>
                                                <form:option value="Razer">Razer</form:option>
                                                <form:option value="Toshiba">Toshiba</form:option>
                                                <form:option value="Sony">Sony</form:option>
                                            </form:select>
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label class="form-label">Target: </label>
                                            <form:select class="form-select" path="target">
                                                <form:option value="GAMING">Gaming</form:option>
                                                <form:option value="SINHVIEN-VANPHONG">Văn phòng</form:option>
                                                <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa</form:option>
                                                <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                <form:option value="Dev">Dev</form:option>
                                            </form:select>
                                        </div>

                                        <div class="mb-3 col-12 col-md-6">
                                            <label for="avatarFile" class="form-label">Image: </label>
                                            <input class="form-control" type="file" id="avatarFile" name="demoFile"
                                                accept=".png,.jpg,.jpeg" />
                                        </div>

                                        <div class="col-12 mb-3">
                                            <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                id="avatarPreview" />
                                        </div>
                                        <img src="/images/product/${Products1.image}" alt="Product Image">

                                        <div class="col-12 mb-5">
                                            <button type="submit" class="btn btn-warning">Update</button>
                                        </div>

                                    </div>
                            </div>

                            </form:form>
                    </div>
                    </main>

                </div>
                <jsp:include page="../layout/footer.jsp" />
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>