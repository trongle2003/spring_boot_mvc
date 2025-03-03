<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page contentType="text/html; charset=UTF-8" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>LaptopShop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active">Danh sách sản phẩm</li>
                            </ol>
                            <h3 class="mb-4">Lọc sản phẩm</h3>

                            <div class="container">
                                <!-- Hàng 1: Hãng sản xuất & Mục đích sử dụng -->
                                <div class="row">
                                    <div class="col-md-6">
                                        <h5>Hãng sản xuất</h5>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="apple">
                                            <label class="form-check-label" for="apple">Apple</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="asus">
                                            <label class="form-check-label" for="asus">Asus</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="lenovo">
                                            <label class="form-check-label" for="lenovo">Lenovo</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="dell">
                                            <label class="form-check-label" for="dell">Dell</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="dell">
                                            <label class="form-check-label" for="lg">LG</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="dell">
                                            <label class="form-check-label" for="acer">Acer</label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <h5>Mục đích sử dụng</h5>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gaming">
                                            <label class="form-check-label" for="gaming">Gaming</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="student">
                                            <label class="form-check-label" for="student">Sinh viên - Văn phòng</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="design">
                                            <label class="form-check-label" for="design">Thiết kế đồ họa</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="design">
                                            <label class="form-check-label" for="design">Mỏng nhẹ</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="design">
                                            <label class="form-check-label" for="design">Doanh nhân</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Hàng 2: Mức giá & Sắp xếp -->
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <h5>Mức giá</h5>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="price1">
                                            <label class="form-check-label" for="price1">Dưới 10 triệu</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="price2">
                                            <label class="form-check-label" for="price2">Từ 10-15 triệu</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="price3">
                                            <label class="form-check-label" for="price3">Từ 15-20 triệu</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="price4">
                                            <label class="form-check-label" for="price4">Trên 20 triệu</label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <h5>Sắp xếp</h5>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sortOrder" id="asc">
                                            <label class="form-check-label" for="asc">Giá tăng dần</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sortOrder" id="desc">
                                            <label class="form-check-label" for="desc">Giá giảm dần</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sortOrder" id="nosc">
                                            <label class="form-check-label" for="nosc">Không sắp xếp</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Nút tìm kiếm -->
                                <div class="d-flex justify-content-center my-4">
                                    <a href="#"
                                        class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-50">Tìm
                                        kiếm</a>
                                </div>
                            </div>


                            <div class="col-lg-12">
                                <div class="row g-4 justify-content-center">
                                    <div class="row g-4">
                                        <c:forEach var="product" items="${Products1}">
                                            <div class="col-md-6 col-lg-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="/images/product/${product.image}"
                                                            class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                        style="top: 10px; left: 10px;">${product.target}
                                                    </div>
                                                    <div
                                                        class="p-4 border border-secondary border-top-0 rounded-bottom d-flex flex-lg-wrap justify-content-center">
                                                        <h4 style="font-size: 15px;">
                                                            <a href="/product/${product.id}">
                                                                ${product.name}
                                                            </a>
                                                        </h4>
                                                        <p class="text-center" style="font-size: 13px;">
                                                            ${product.shortDesc}
                                                        </p>

                                                        <div class="d-flex flex-lg-wrap justify-content-center">
                                                            <p style="font-size: 15px;text-align: center;width: 100%;"
                                                                class="text-dark fw-bold mb-3">
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.price}" /> VND
                                                            </p>
                                                            <form action="/add-product-to-cart/${product.id}"
                                                                method="post">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button
                                                                    class="mx-auto border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to cart
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="col-12">
                                <div class="pagination d-flex justify-content-center mt-5">
                                    <li class="page-item">
                                        <a class="${1 eq currentPage ? 'disabled page-link':'page-link'}"
                                            href="/products?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="0" end="${totalPages-1}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link':'page-link'}"
                                                href="/products?page=${loop.index + 1}">
                                                ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>

                                    <li class="page-item">
                                        <a class="${totalPages eq currentPage ? 'disabled page-link':'page-link'}"
                                            href="/products?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                    </div>
                    <!-- Fruits Shop End-->


                    <jsp:include page="../layout/footer.jsp" />



                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>