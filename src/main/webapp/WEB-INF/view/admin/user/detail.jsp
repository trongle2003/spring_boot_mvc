<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User Detail ${id}</title>
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
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
                                        <li class="list-group-item">FullName: ${Users1.fullName}</li>
                                        <li class="list-group-item">Address: ${Users1.address}</li>
                                    </ul>
                                </div>
                        </table>
                        <a href="/admin/user" type="submit" class="btn btn-success">Back</a>
                    </div>

                </div>
            </form>
        </body>



        </html>