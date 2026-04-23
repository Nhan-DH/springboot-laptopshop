(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);
    // add active class to header 
    const navElements = $("#navbarCollapse");
    const currentPath = window.location.pathname;
    navElements.find("a.nav-link").each(function () {
        const linkPath = $(this).attr("href");
        if (linkPath === currentPath) {
            $(this).addClass("active");
        } else {
            $(this).removeClass("active");
        }
    });


    // Fixed Navbar + Back to top (single scroll listener to avoid scroll lag)
    let scrollTicking = false;
    let backToTopVisible = false;
    $(window).on('scroll', function () {
        if (scrollTicking) {
            return;
        }
        scrollTicking = true;
        window.requestAnimationFrame(function () {
            const scrollTop = $(window).scrollTop();

            if ($(window).width() < 992) {
                $('.fixed-top').toggleClass('shadow', scrollTop > 55);
            } else {
                $('.fixed-top').toggleClass('shadow', scrollTop > 55).css('top', 0);
            }

            const shouldShowBackToTop = scrollTop > 300;
            if (shouldShowBackToTop !== backToTopVisible) {
                backToTopVisible = shouldShowBackToTop;
                if (shouldShowBackToTop) {
                    $('.back-to-top').stop(true, true).fadeIn(120);
                } else {
                    $('.back-to-top').stop(true, true).fadeOut(120);
                }
            }

            scrollTicking = false;
        });
    });

    $('.back-to-top').on('click', function () {
        if ('scrollBehavior' in document.documentElement.style) {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        } else {
            $('html, body').stop(true, true).animate({ scrollTop: 0 }, 350);
        }
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").each(function () {
        const $carousel = $(this);
        const itemCount = $carousel.children().length;

        $carousel.owlCarousel({
            autoplay: true,
            smartSpeed: 1500,
            center: false,
            dots: true,
            loop: itemCount > 4,
            margin: 25,
            nav: true,
            navText: [
                '<i class="bi bi-arrow-left"></i>',
                '<i class="bi bi-arrow-right"></i>'
            ],
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 1
                },
                768: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            }
        });
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })
    });



    // Product Quantity
    $('.quantity button').on('click', function () {
        let change = 0;
        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
            change = 1;
        } else {
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
                change = -1;
            } else {
                newVal = 1;
            }
        }
        const input = button.parent().parent().find('input');
        input.val(newVal);
        //set form index
        const index = input.attr('data-cart-detail-index');
        const el = document.getElementById(`cartDetails${index}.quantity`);
        $(el).val(newVal);


        const price = input.data('cart-detail-price');
        const cartDetailId = input.data('cart-detail-id');
        const newPriceElement = $(`p[data-cart-detail-id="${cartDetailId}"]`);
        if (newPriceElement) {
            const newPrice = +price * newVal;
            newPriceElement.text(newPrice.toFixed(2) + '$');
        }
        //update total price
        const totalPriceElement = $(`p[data-cart-total-price]`);
        if (totalPriceElement && totalPriceElement.length) {
            const currentTotalPrice = totalPriceElement.first().attr("data-cart-total-price");
            let newTotal = +currentTotalPrice + change * price;
            change = 0;
            totalPriceElement.each(function () {
                $(this).attr("data-cart-total-price", newTotal);
                $(this).text(newTotal.toFixed(2) + '$');
            });
        }
    });
    //////////////////handle add to cart button on homepage
    function isLogin() {
        const navElements = $("#navbarCollapse");
        const childLogin = navElements.find('a.a-login');
        if (childLogin.length > 0) {
            return false;
        }
        return true;
    }

    $('.btnAddToCartHomepage').click(function (event) {
        event.preventDefault();
        if (!isLogin()) {
            $.toast({
                heading: 'Error',
                text: 'You need to login to add products to cart.',
                position: 'top-right',
                icon: 'error'
            });
            return;
        }
        const productId = $(this).attr('data-product-id');
        const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");
        const quantity = $("#cartDetails0\\.quantity").val() || 1; // default quantity is 1

        $.ajax({
            url: `${window.location.origin}/api/add-product-to-cart`,
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            }
            , type: 'POST'
            , data: JSON.stringify({
                productId: productId,
                quantity: quantity
            })
            , contentType: 'application/json'
            , success: function (response) {
                const sum = +response;
                //update cart
                $("#sumCart").text(sum);
                $.toast({
                    heading: 'Success',
                    text: 'Product added to cart successfully.',
                    position: 'top-right',
                    icon: 'success'
                });

            }
        });
    });

    // Handle add to cart button on product detail and related products (AJAX)
    $('.btnAddToCart').click(function (event) {
        event.preventDefault();
        if (!isLogin()) {
            $.toast({
                heading: 'Error',
                text: 'You need to login to add products to cart.',
                position: 'top-right',
                icon: 'error'
            });
            return;
        }
        const productId = $(this).attr('data-product-id');
        const token = $("meta[name='_csrf']").attr("content");
        const header = $("meta[name='_csrf_header']").attr("content");

        // Get quantity from input field if available, otherwise default to 1
        let quantity = 1;
        const quantityInput = $("#cartDetails0\\.quantity");
        if (quantityInput.length > 0) {
            quantity = parseInt(quantityInput.val()) || 1;
        }

        $.ajax({
            url: `${window.location.origin}/api/add-product-to-cart`,
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            }
            , type: 'POST'
            , data: JSON.stringify({
                productId: productId,
                quantity: quantity
            })
            , contentType: 'application/json'
            , success: function (response) {
                const sum = +response;
                //update cart
                $("#sumCart").text(sum);
                $.toast({
                    heading: 'Success',
                    text: 'Product added to cart successfully.',
                    position: 'top-right',
                    icon: 'success'
                });

            }
            , error: function (error) {
                $.toast({
                    heading: 'Error',
                    text: 'Failed to add product to cart. Please try again.',
                    position: 'top-right',
                    icon: 'error'
                });
            }
        });
    });

    function restoreFilterStateFromUrl() {
        const params = new URLSearchParams(window.location.search);

        const factoryValues = (params.get('factory') || '').split(',').filter(Boolean);
        const targetValues = (params.get('target') || '').split(',').filter(Boolean);
        const priceValues = (params.get('price') || '').split(',').filter(Boolean);
        const sortValue = params.get('sort') || 'nothing';

        $('#factoryFilter input[type="checkbox"]').each(function () {
            $(this).prop('checked', factoryValues.includes($(this).val()));
        });

        $('#targetFilter input[type="checkbox"]').each(function () {
            $(this).prop('checked', targetValues.includes($(this).val()));
        });

        $('#priceFilter input[type="checkbox"]').each(function () {
            $(this).prop('checked', priceValues.includes($(this).val()));
        });

        $('input[name="sort"]').prop('checked', false);
        $('input[name="sort"][value="' + sortValue + '"]').prop('checked', true);
    }

    restoreFilterStateFromUrl();

    // handle filter button click
    $('#btnFilter').click(function (event) {
        event.preventDefault();
        // Filter logic would go here
        let factoryArr = [];
        let targetArr = [];
        let priceArr = [];

        //factorty filter
        $('#factoryFilter input[type="checkbox"]:checked').each(function () {
            factoryArr.push($(this).val());
        });
        //target filter
        $('#targetFilter input[type="checkbox"]:checked').each(function () {
            targetArr.push($(this).val());
        }
        );
        //price filter
        $('#priceFilter input[type="checkbox"]:checked').each(function () {
            priceArr.push($(this).val());
        });


        //sort order 
        let sortValue = $('input[name="sort"]:checked').val();

        const urlCurrent = new URL(window.location.href);
        const searchParams = urlCurrent.searchParams;

        //add orr update query paramaeters
        searchParams.set('page', '1');
        searchParams.set('sort', sortValue);
        if (factoryArr.length > 0) {
            searchParams.set('factory', factoryArr.join(','));
        } else {
            searchParams.delete('factory');
        }

        if (targetArr.length > 0) {
            searchParams.set('target', targetArr.join(','));
        } else {
            searchParams.delete('target');
        }
        if (priceArr.length > 0) {
            searchParams.set('price', priceArr.join(','));
        } else {
            searchParams.delete('price');
        }

        //upfate url
        window.location.href = urlCurrent.toString();
        //logic khi an filter button thi casc check box van giu nguyen trang thai checked hay unchecked

    });

    // Homepage live search suggestions
    const homepageSearchInput = $('#homepageSearchInput');
    const homepageSearchSuggestions = $('#homepageSearchSuggestions');
    let searchDebounceTimer = null;
    let searchXhr = null;

    function hideSuggestions() {
        homepageSearchSuggestions.hide().empty();
    }

    function renderSuggestions(items) {
        if (!items || items.length === 0) {
            hideSuggestions();
            return;
        }

        const html = items.map(function (item) {
            return '<a href="/client/product/' + item.id
                + '" class="list-group-item list-group-item-action">'
                + item.name + '</a>';
        }).join('');

        homepageSearchSuggestions.html(html).show();
    }

    homepageSearchInput.on('input', function () {
        const keyword = $(this).val().trim();
        clearTimeout(searchDebounceTimer);

        if (keyword.length < 2) {
            hideSuggestions();
            return;
        }

        searchDebounceTimer = setTimeout(function () {
            if (searchXhr) {
                searchXhr.abort();
            }

            searchXhr = $.ajax({
                url: '/client/api/products/suggestions',
                type: 'GET',
                data: { keyword: keyword },
                success: function (response) {
                    renderSuggestions(response);
                },
                error: function () {
                    hideSuggestions();
                }
            });
        }, 220);
    });

    $(document).on('click', function (event) {
        const inSearchArea = $(event.target).closest('#homepageSearchInput, #homepageSearchSuggestions').length > 0;
        if (!inSearchArea) {
            hideSuggestions();
        }
    });


})(jQuery);

