<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Update User</title>
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
            <form:form action="/admin/user/update" method="get" class="container mt-5" modelAttribute="Users1">
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
                            <form:input type="text" class="form-control" path="email" disabled="true" />
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

                        <button type="submit" class="btn btn-warning">Update</button>
                        <!--btn btn-primary là thuộc tính đổi màu button của bootstrap -->
                    </div>
                </div>

            </form:form>
        </body>

        </html>