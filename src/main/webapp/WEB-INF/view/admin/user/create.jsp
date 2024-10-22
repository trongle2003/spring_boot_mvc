<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create User</title>
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>

    <body>
        <form:form action="create" method="post" class="container mt-5" modelAttribute="newUser">
            <div class="row">
                <div class="col-md-6 col-12 mx-auto">
                    <h3>Create a user</h3>
                    <hr />
                    <div class="mb-3">
                        <label class="form-label">Id: </label>
                        <form:input type="text" class="form-control" path="id" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email: </label>
                        <form:input type="text" class="form-control" path="email" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fullname: </label>
                        <form:input type="text" class="form-control" path="fullName" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password: </label>
                        <form:input type="password" class="form-control" path="password" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address: </label>
                        <form:input type="text" class="form-control" path="address" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone: </label>
                        <form:input type="text" class="form-control" path="phone" />
                    </div>

                    <button type="submit" class="btn btn-primary">Create</button>
                </div>
            </div>

        </form:form>
    </body>

    </html>