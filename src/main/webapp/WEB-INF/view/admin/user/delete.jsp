<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Delete User ${id}</title>
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
            <form:form action="/admin/user/delete" method="get" class="container mt-5" modelAttribute="Users1">
                <div class="row">
                    <div class="col-md-6 col-12 mx-auto">
                        <div class="d-flex justify-content-between">
                            <h3>Delete User ${id}</h3>
                        </div>

                        <hr />
                        <div class="alert alert-danger" role="alert">
                            Are you want delete this user ${id} ?
                        </div>
                        <form:form action="">
                            <button class="btn btn-danger">Confirm</button>
                        </form:form>

                        </form>
                    </div>
                </div>
            </form:form>
        </body>

        </html>