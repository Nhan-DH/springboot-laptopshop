<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <link rel="icon" type="image/svg+xml"
                href="data:image/svg+xml,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20viewBox%3D%220%200%20100%20100%22%20xmlns%3D%22http://www.w3.org/2000/svg%22%3E%3Crect%20width%3D%22100%22%20height%3D%22100%22%20rx%3D%2220%22%20fill%3D%22%230A0A0A%22/%3E%3Cpath%20d%3D%22M%2020%2020%20h%2030%20a%2030%2030%200%200%201%2030%2030%20a%2030%2030%200%200%201%20-30%2030%20h%20-30%20v%20-60%20z%20M%2032%2032%20v%2036%20h%2018%20a%2018%2018%200%200%200%2018%20-18%20a%2018%2018%200%200%200%20-18%20-18%20h%20-18%20z%22%20fill%3D%22%232d2d2d%22/%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%228%22%20fill%3D%22%230066FF%22/%3E%3C/svg%3E" />
            <meta charset="utf-8">
            <title>NYAN SHOP</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">
            <meta name="_csrf" content="${_csrf.token}" />
            <meta name="_csrf_header" content="${_csrf.headerName}" />
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css" />

            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                rel="stylesheet">

            <!-- Icon Font Stylesheet -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

            <!-- Libraries Stylesheet -->
            <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
            <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


            <!-- Customized Bootstrap Stylesheet -->
            <link href="/client/css/bootstrap.min.css" rel="stylesheet">

            <!-- Template Stylesheet -->
            <link href="/client/css/style.css" rel="stylesheet">

            <!-- Custom styles for equal height cards -->
            <style>
                .vesitable-item {
                    display: flex;
                    flex-direction: column;
                    height: 100%;
                    min-height: 500px;
                    font-family: 'Open Sans', sans-serif;
                    text-align: center;
                }

                .vesitable-item .vesitable-img {
                    height: 250px;
                    overflow: hidden;
                    flex-shrink: 0;
                }

                .vesitable-item .vesitable-img img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .vesitable-item .p-4 {
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                    text-align: center;
                }

                .vesitable-item h4 {
                    font-family: 'Open Sans', sans-serif !important;
                    text-align: center;
                    font-size: 18px;
                    font-weight: 700;
                    color: #212529;
                }

                .vesitable-item h4 a {
                    text-decoration: none;
                    color: inherit;
                    font-family: 'Open Sans', sans-serif !important;
                }

                .vesitable-item h4 a:hover {
                    color: #0d6efd;
                }

                .vesitable-item>.p-4>p {
                    font-family: 'Open Sans', sans-serif !important;
                    text-align: center;
                    font-size: 14px;
                    color: #6c757d;
                }

                .vesitable-item .text-dark.fs-5 {
                    font-family: 'Open Sans', sans-serif !important;
                    text-align: center;
                    font-size: 22px !important;
                    font-weight: 700 !important;
                    color: #dc3545 !important;
                }

                .vesitable-item .d-flex.justify-content-between {
                    margin-top: auto;
                    flex-direction: column;
                    align-items: center;
                }

                .vesitable-item .btnAddToCart {
                    width: 100%;
                    font-family: 'Open Sans', sans-serif;
                }

                .owl-carousel .owl-item {
                    display: flex;
                }

                .owl-carousel .owl-item .vesitable-item {
                    width: 100%;
                }

                /* Main product detail styling */
                .col-lg-6 h4 {
                    font-family: 'Open Sans', sans-serif !important;
                    font-size: 24px !important;
                    font-weight: 700 !important;
                }

                .col-lg-6 h5 {
                    font-family: 'Open Sans', sans-serif !important;
                    font-size: 22px !important;
                    font-weight: 700 !important;
                    color: #dc3545 !important;
                }

                .col-lg-6 p {
                    font-family: 'Open Sans', sans-serif !important;
                    font-size: 16px !important;
                    color: #666 !important;
                }

                /* Hide carousel navigation buttons */
                .owl-nav {
                    display: none !important;
                }
            </style>
        </head>

        <body>

            <!-- Spinner Start -->
            <div id="spinner"
                class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                <div class="spinner-grow text-primary" role="status"></div>
            </div>
            <!-- Spinner End -->


            <!-- Navbar start -->
            <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
            <!-- Navbar End -->


            <!-- Modal Search Start -->
            <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-fullscreen">
                    <div class="modal-content rounded-0">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body d-flex align-items-center">
                            <div class="input-group w-75 mx-auto d-flex">
                                <input type="search" class="form-control p-3" placeholder="keywords"
                                    aria-describedby="search-icon-1">
                                <span id="search-icon-1" class="input-group-text p-3"><i
                                        class="fa fa-search"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Search End -->

            <!-- Single Product Start -->
            <div class="container-fluid py-5 mt-5">
                <div class="container py-5">
                    <div class="row g-4 mb-5">
                        <div>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb>-item"><a href="/">Home /</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"> Product</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-12">
                            <div class="row g-4">
                                <div class="col-lg-6">
                                    <div class="border rounded">
                                        <a href="#">
                                            <img src="/images/image/${product.image}" class="img-fluid rounded"
                                                alt="${product.name}"> </a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <h4 class="fw-bold mb-3">${product.name}</h4>
                                    <p class="mb-3">Category: ${product.factory}</p>
                                    <h5 class="fw-bold mb-3">$${product.price}</h5>
                                    <div class="d-flex mb-4">
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <p class="mb-4">${product.shortDesc}</p>
                                    <p class="mb-4">${product.detailDecs}</p>
                                    <div class="input-group quantity mb-5" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control form-control-sm text-center border-0"
                                            value="1" data-cart-detail-index="0" id="cartDetails0.quantity">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <button type="button" data-product-id="${product.id}"
                                        class="btnAddToCart btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
                                        <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                    </button>

                                </div>
                                <div class="col-lg-12">
                                    <nav>
                                        <div class="nav nav-tabs mb-3">
                                            <button class="nav-link active border-white border-bottom-0" type="button"
                                                role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-about" aria-controls="nav-about"
                                                aria-selected="true">Description</button>
                                            <!-- <button class="nav-link border-white border-bottom-0" type="button"
                                                role="tab" id="nav-mission-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-mission" aria-controls="nav-mission"
                                                aria-selected="false">Reviews</button> -->
                                        </div>
                                    </nav>
                                    <!-- detail product start -->
                                    <div class="tab-content mb-5">
                                        <div class="tab-pane active" id="nav-about" role="tabpanel"
                                            aria-labelledby="nav-about-tab">
                                            <p>${product.detailDecs}</p>


                                        </div>
                                        <div class="tab-pane" id="nav-mission" role="tabpanel"
                                            aria-labelledby="nav-mission-tab">
                                            <div class="d-flex">
                                                <img src="img/avatar.jpg" class="img-fluid rounded-circle p-3"
                                                    style="width: 100px; height: 100px;" alt="">
                                                <div class="">
                                                    <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                                                    <div class="d-flex justify-content-between">
                                                        <h5>Jason Smith</h5>
                                                        <div class="d-flex mb-3">
                                                            <i class="fa fa-star text-secondary"></i>
                                                            <i class="fa fa-star text-secondary"></i>
                                                            <i class="fa fa-star text-secondary"></i>
                                                            <i class="fa fa-star text-secondary"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <p>The generated Lorem Ipsum is therefore always free from
                                                        repetition injected humour, or non-characteristic
                                                        words etc. Susp endisse ultricies nisi vel quam suscipit </p>
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <img src="img/avatar.jpg" class="img-fluid rounded-circle p-3"
                                                    style="width: 100px; height: 100px;" alt="">
                                                <div class="">
                                                    <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                                                    <div class="d-flex justify-content-between">
                                                        <h5>Sam Peters</h5>
                                                        <div class="d-flex mb-3">
                                                            <i class="fa fa-star text-secondary"></i>
                                                            <i class="fa fa-star text-secondary"></i>
                                                            <i class="fa fa-star text-secondary"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <p class="text-dark">The generated Lorem Ipsum is therefore always
                                                        free from repetition injected humour, or non-characteristic
                                                        words etc. Susp endisse ultricies nisi vel quam suscipit </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="nav-vision" role="tabpanel">
                                            <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum
                                                et tempor sit. Aliqu diam
                                                amet diam et eos labore. 3</p>
                                            <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et
                                                eos labore.
                                                Clita erat ipsum et lorem et sit</p>
                                        </div>
                                    </div>
                                    <!-- detail product end -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Related products start -->
                    <h1 class="fw-bold mb-4">Related products</h1>
                    <c:if test="${empty relatedProducts}">
                        <p class="text-muted mb-0">No related products found.</p>
                    </c:if>
                    <c:if test="${not empty relatedProducts}">
                        <div class="vesitable">
                            <div class="owl-carousel vegetable-carousel justify-content-center">
                                <c:forEach var="rp" items="${relatedProducts}">
                                    <div class="border border-primary rounded position-relative vesitable-item">
                                        <div class="vesitable-img">
                                            <a href="/client/product/${rp.id}">
                                                <img src="/images/image/${rp.image}" class="img-fluid w-100 rounded-top"
                                                    alt="${rp.name}">
                                            </a>
                                        </div>
                                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                            style="top: 10px; right: 10px;">${rp.factory}</div>
                                        <div class="p-4 pb-0 rounded-bottom">
                                            <h4><a href="/client/product/${rp.id}"
                                                    style="text-decoration: none; color: inherit;">${rp.name}</a></h4>
                                            <p>${rp.shortDesc}</p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold">$${rp.price}</p>
                                                <button type="button" data-product-id="${rp.id}"
                                                    class="btnAddToCart btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>

                    <!-- comment start -->
                    <form action="#" class="mt-5">
                        <h4 class="mb-5 fw-bold">Leave a Reply</h4>
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="border-bottom rounded">
                                    <input type="text" class="form-control border-0 me-4" placeholder="Yur Name *">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="border-bottom rounded">
                                    <input type="email" class="form-control border-0" placeholder="Your Email *">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="border-bottom rounded my-4">
                                    <textarea name="" id="" class="form-control border-0" cols="30" rows="8"
                                        placeholder="Your Review *" spellcheck="false"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="d-flex justify-content-between py-3 mb-5">
                                    <div class="d-flex align-items-center">
                                        <p class="mb-0 me-3">Please rate:</p>
                                        <div class="d-flex align-items-center" style="font-size: 12px;">
                                            <i class="fa fa-star text-muted"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <a href="#" class="btn border border-secondary text-primary rounded-pill px-4 py-3">
                                        Post Comment</a>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- comment end -->

                    <!-- <div class="vesitable">
                        <div class="owl-carousel vegetable-carousel justify-content-center">
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Vegetable</div>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4>Parsely</h4>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                        incididunt</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                                        <a href="#"
                                            class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                    </div>
                                </div>
                            </div>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="img/vegetable-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Vegetable</div>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4>Parsely</h4>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                        incididunt</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                                        <a href="#"
                                            class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                    </div>
                                </div>
                            </div>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="img/vegetable-item-3.png" class="img-fluid w-100 rounded-top bg-light"
                                        alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Vegetable</div>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4>Banana</h4>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                        incididunt</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                        <a href="#"
                                            class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                    </div>
                                </div>
                            </div>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Vegetable</div>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4>Bell Papper</h4>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                        incididunt</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                        <a href="#"
                                            class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                    </div>
                                </div>
                            </div>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Vegetable</div>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4>Potatoes</h4>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                        incididunt</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                        <a href="#"
                                            class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                    </div>
                                </div>
                            </div>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Vegetable</div>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4>Parsely</h4>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                        incididunt</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                        <a href="#"
                                            class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                    </div>
                                </div>
                            </div>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Vegetable</div>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4>Potatoes</h4>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                        incididunt</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                        <a href="#"
                                            class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                    </div>
                                </div>
                            </div>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute"
                                    style="top: 10px; right: 10px;">Vegetable</div>
                                <div class="p-4 pb-0 rounded-bottom">
                                    <h4>Parsely</h4>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te
                                        incididunt</p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                        <a href="#"
                                            class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
                                                class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <!-- Related products end -->
                </div>
            </div>
            <!-- Single Product End -->






            <!-- Footer Start -->
            <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
            <!-- Footer End -->


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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
            <!-- Template Javascript -->
            <script src="/client/js/main.js"></script>
        </body>

        </html>