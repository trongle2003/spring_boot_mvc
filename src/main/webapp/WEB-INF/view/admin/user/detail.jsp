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
                <title>Detail - Hỏi Dân IT</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manager Detail </h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Detail</li>
                                </ol>
                                <form method="get" class="container mt-5" modelAttribute="Users1">
                                    <div class="row">
                                        <div class="col-10 mx-auto">
                                            <table class="table table-bordered">

                                                <thead>
                                                    <div class="d-flex justify-content-between">
                                                        <h2>User ${id}</h2>
                                                    </div>
                                                    <hr>
                                                    <div class="card" style="width: 60%;">
                                                        <div class="card-header">
                                                            Information of User ${id}
                                                        </div>
                                                        <ul class="list-group list-group-flush">
                                                            <li class="list-group-item">Id: ${Users1.id}</li>
                                                            <!-- truyền giá trị thông qua modelAttribute -->
                                                            <li class="list-group-item">Email: ${Users1.email}</li>
                                                            <li class="list-group-item">FullName: ${Users1.fullName}
                                                            </li>
                                                            <li class="list-group-item">Address: ${Users1.address}</li>
                                                        </ul>
                                                    </div>
                                            </table>
                                            <a href="/admin/user" type="submit" class="btn btn-success">Back</a>
                                        </div>

                                    </div>
                                </form>
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