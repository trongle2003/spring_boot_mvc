<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Users Table</title>
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
                                    <h2>Table users</h2>
                                    <a href="/admin/user/create" type="submit" class="btn btn-primary">Create a user</a>
                                </div>
                                <hr>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Fullname</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${Users1}">
                                    <tr>
                                        <th scope="row">${user.id}</th>
                                        <td>${user.email}</td>
                                        <td>${user.fullName}</td>
                                        <td>
                                            <a href="/admin/user/${user.id}" type="submit"
                                                class="btn btn-success">View</a>
                                            <a href="/admin/user/update/${user.id}" type="submit"
                                                class="btn btn-warning">Update</a>
                                            <a href="/admin/user/delete/${user.id}" type="submit"
                                                class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>

                    </div>

                </div>
            </form>
        </body>



        </html>