<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>	
<%@page import="com.dev.dao.AddrDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500,700,900" rel="stylesheet">
    <script type="text/javascript" src="https://map.vworld.kr/js/webglMapInit.js.do?version=2.0&apiKey=2AC56E63-EB65-3EC3-818B-74F3582A0C2F"></script>

    <title>Elegance - Creative HTML5 Template</title>
<!--
Elegance Template
https://templatemo.com/tm-528-elegance
-->
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="css/fullpage.min.css">

    <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">

    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/templatemo-style.css">

    <link rel="stylesheet" href="css/responsive.css">

    </head>
    
    <body>
    
    <div id="video">
        <div class="preloader">
            <div class="preloader-bounce">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>

        <header id="header">
            <div class="container-fluid">
                <div class="navbar">
                    <a href="#" id="logo" title="Elegance by TemplateMo">
                        weple+ market
                    </a>
                    
                    
                    <div class="navigation-row">
                        <nav id="navigation">
                            <button type="button" class="navbar-toggle"> <i class="fa fa-bars"></i> </button>
                            <div class="nav-box navbar-collapse">



                                <ul class="navigation-menu nav navbar-nav navbars" id="nav">
                                    <li data-menuanchor="slide01" class="active"><a href="#slide01">Home</a></li>
                                    <li data-menuanchor="slide02"><a href="#slide02">Buy Area</a></li>
                                    <li data-menuanchor="slide03"><a href="#slide03">Services</a></li>
                                    <li data-menuanchor="slide04"><a href="#slide04">My Skills</a></li>
                                    <li data-menuanchor="slide05"><a href="#slide05">My Work</a></li>
                                    <li data-menuanchor="slide06"><a href="#slide06">Testimonials</a></li>
                                    <li data-menuanchor="slide07"><a href="#slide07">Contact Me</a></li>

                                </ul>
                            </div>
                        </nav>
                    </div>
                
                <ul>
                <c:if test="${userId != null }">
				<li class="menu2">Welcome &nbsp;&nbsp;<span id="welcom-login-userId">${userId }</span>
				<a class="menu2col" href="logout.do">LogOut</a></li>
				</c:if>
				<c:if test="${userId == null }">
				<li class="menu2"><a class="menu2col" href="loginForm.do">Login</a>
				<a class="menu2col" href="userInsertForm.do">SignUp</a></li>
				</c:if>
				</ul>
				</div>
            </div>
        </header>

        <video autoplay muted loop id="myVideo">
          <source src="images/video-bg.mp4" type="video/mp4">
        </video>

        <div id="fullpage" class="fullpage-default">

            <div class="section animated-row" data-section="slide01">
                <div class="section-inner">
                    <div class="welcome-box">
                        <span class="welcome-first animate" data-animate="fadeInUp">Hello, welcome to</span><br>
                        <h1 class="welcome-title animate" data-animate="fadeInUp">weple+ market</h1><br>
                        <button class="mainbt" onclick="location.href='main.do' ">GO TO SHOP</button>
                        <p></p>
                        <span class="welcome-first animate" data-animate="fadeInUp">공동 구매 플랫폼</span><br>
                        <p class="animate" data-animate="fadeInUp">Check out our market cart selection for the very best in unique or custom, handmade pieces from our party decor shops pieces from our party decor shops. Thank you.</p>
                        
                        <div class="scroll-down next-section animate data-animate="fadeInUp""><img src="images/mouse-scroll.png" alt=""><span>Scroll Down</span></div>
                    </div>
                </div>
            </div>

            <div class="section animated-row" data-section="slide02">
                <div class="section-inner">
                    <div class="about-section">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 wide-col-laptop">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="about-contentbox">
                                            <div class="animate" data-animate="fadeInUp">
                                                <span>Available area</span>
                                                <h2>공동 구매 가능 지역</h2>
                                                <p>Credits go to <strong>Unsplash</strong> and <strong>Pexels</strong> for photos and video used in this template. Vivamus tincidunt, augue rutrum convallis volutpat, massa lacus tempus leo.</p>
                                            </div>
                                            <div class="facts-list owl-carousel">
                                                <div class="item animate" data-animate="fadeInUp" onclick="vwmoveTo2(127.914481915959 , 36.444267225588 , 1000000)">
                                                    <div class="counter-box">
                                                       <span class="count-number">1212</span><br> All Area
                                                    </div>
                                                </div>
                                                <div class="item animate" data-animate="fadeInUp" onclick="vwmoveTo(126.978229106965 , 37.5665711673465 , 270)">
                                                    <div class="counter-box">
                                                        <span class="count-number">631</span><br> Seoul
                                                    </div>
                                                </div>
                                                <div class="item animate" data-animate="fadeInUp" onclick="vwmoveTo(126.43377108701 , 37.468649718031 , 4000)">
                                                    <div class="counter-box">
                                                        <span class="count-number">231</span><br> Incheon
                                                    </div>
                                                </div>
                                                <div class="item animate" data-animate="fadeInUp" onclick="vwmoveTo(127.013258919229  , 37.2985453646613 , 350)">
                                                    <div class="counter-box">
                                                        <span class="count-number">532</span><br> GyeongGi
                                                    </div>
                                                </div>
                                                <div class="item animate" data-animate="fadeInUp" onclick="vwmoveTo(128.595334593028 , 35.8664916093874 , 280)">
                                                    <div class="counter-box">
                                                        <span class="count-number">175</span><br> Deagu
                                                    </div>
                                                </div>
                                                <div class="item animate" data-animate="fadeInUp" onclick="vwmoveTo(129.350203249641 , 35.4737048996921 , 2000)">
                                                    <div class="counter-box">
                                                        <span class="count-number">89</span><br> Ulsan
                                                    </div>
                                                </div>
                                                <div class="item animate" data-animate="fadeInUp"  onclick="vwmoveTo(126.909795765774 , 35.1645575235227 , 150)">
                                                    <div class="counter-box">
                                                        <span class="count-number">78</span><br> GwanJu
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6" name="areacol">
                                        <figure class="about-img animate" data-animate="fadeInUp">
                                        <div id="vmap" style="width:900px;height:500px;left:0px;top:0px"></div>
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section animated-row" data-section="slide03">
                <div class="section-inner">
                    <div class="row justify-content-center">
                        <div class="col-md-8 wide-col-laptop">
                            <div class="title-block animate" data-animate="fadeInUp">
                                <span>Services</span>
                                <h2>What I Do?</h2>
                            </div>
                            <div class="services-section">
                                <div class="services-list owl-carousel">
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="service-box">
                                            <span class="service-icon"><i class="fa fa-bookmark" aria-hidden="true"></i></span>
                                            <h3>Bootstrap Themes</h3>
                                            <p>Nullam auctor, justo vitae accumsan ultrices, arcu ex molestie massa, eu maximus enim tortor vitae quam. </p>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="service-box">
                                            <span class="service-icon"><i class="fa fa-cloud" aria-hidden="true"></i></span>
                                            <h3>HTML5 Coding</h3>
                                            <p>Nullam auctor, justo vitae accumsan ultrices, arcu ex molestie massa, eu maximus enim tortor vitae quam. </p>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="service-box">
                                            <span class="service-icon"><i class="fa fa-desktop" aria-hidden="true"></i></span>
                                            <h3>Fully Responsive</h3>
                                            <p>Nullam auctor, justo vitae accumsan ultrices, arcu ex molestie massa, eu maximus enim tortor vitae quam. </p>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="service-box">
                                            <span class="service-icon"><i class="fa fa-mobile" aria-hidden="true"></i></span>
                                            <h3>Mobile Ready</h3>
                                            <p>Nullam auctor, justo vitae accumsan ultrices, arcu ex molestie massa, eu maximus enim tortor vitae quam. </p>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="service-box">
                                            <span class="service-icon"><i class="fa fa-comments" aria-hidden="true"></i></span>
                                            <h3>Fast Support</h3>
                                            <p>Nullam auctor, justo vitae accumsan ultrices, arcu ex molestie massa, eu maximus enim tortor vitae quam. </p>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="service-box">
                                            <span class="service-icon"><i class="fa fa-database" aria-hidden="true"></i></span>
                                            <h3>24-hour Up Time</h3>
                                            <p>Nullam auctor, justo vitae accumsan ultrices, arcu ex molestie massa, eu maximus enim tortor vitae quam. </p>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="service-box">
                                            <span class="service-icon"><i class="fa fa-bell" aria-hidden="true"></i></span>
                                            <h3>Instant Upgrades</h3>
                                            <p>Nullam auctor, justo vitae accumsan ultrices, arcu ex molestie massa, eu maximus enim tortor vitae quam. </p>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="service-box">
                                            <span class="service-icon"><i class="fa fa-camera" aria-hidden="true"></i></span>
                                            <h3>Always Monitoring</h3>
                                            <p>Nullam auctor, justo vitae accumsan ultrices, arcu ex molestie massa, eu maximus enim tortor vitae quam. </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section animated-row" data-section="slide04">
                <div class="section-inner">
                    <div class="row justify-content-center">
                        <div class="col-md-7 wide-col-laptop">
                            <div class="title-block animate" data-animate="fadeInUp">
                                <span>My Skills</span>
                                <h2>What i’m good?</h2>
                            </div>
                            <div class="skills-row animate" data-animate="fadeInDown">
                                <div class="row">
                                    <div class="col-md-8 offset-md-2">   
                                        <div class="skill-item">
                                            <h6>HTML CSS</h6>
                                            <div class="skill-bar">
                                                <span>70%</span>
                                                <div class="filled-bar"></div>
                                            </div>          
                                        </div>
                                        <div class="skill-item">
                                            <h6>PSD Design</h6>
                                            <div class="skill-bar">
                                                <span>90%</span>
                                                <div class="filled-bar-2"></div>
                                            </div>          
                                        </div>
                                        <div class="skill-item">
                                            <h6>Social Media</h6>
                                            <div class="skill-bar">
                                                <span>70%</span>
                                                <div class="filled-bar"></div>
                                            </div>          
                                        </div>
                                        <div class="skill-item last-skill">
                                            <h6>Leadership</h6>
                                            <div class="skill-bar">
                                                <span>90%</span>
                                                <div class="filled-bar-2"></div>
                                            </div>          
                                        </div>                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section animated-row" data-section="slide06">
                <div class="section-inner">
                    <div class="row justify-content-center">
                        <div class="col-md-8 wide-col-laptop">
                            <div class="title-block animate" data-animate="fadeInUp">
                                <span>My Work</span>
                                <h2>what i’ve done?</h2>
                            </div>
                            <div class="gallery-section">
                                <div class="gallery-list owl-carousel">
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="portfolio-item">
                                            <div class="thumb">
                                                <img src="images/item-1.jpg" alt="">
                                            </div>
                                            <div class="thumb-inner animate" data-animate="fadeInUp">
                                                <h4>templatemo is the best</h4>
                                                <p>Please tell your friends about it. Templatemo is the best website to download free Bootstrap CSS templates.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="portfolio-item">
                                            <div class="thumb">
                                                <img src="images/item-2.jpg" alt="">
                                            </div>
                                            <div class="thumb-inner animate" data-animate="fadeInUp">
                                                <h4>templatemo is the best</h4>
                                                <p>Please tell your friends about it. Templatemo is the best website to download free Bootstrap themes.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="portfolio-item">
                                            <div class="thumb">
                                                <img src="images/item-3.jpg" alt="">
                                            </div>
                                            <div class="thumb-inner animate" data-animate="fadeInUp">
                                                <h4>templatemo is the best</h4>
                                                <p>Please tell your friends about it. Templatemo is the best website to download free Bootstrap layouts.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="portfolio-item">
                                            <div class="thumb">
                                                <img src="images/item-1.jpg" alt="">
                                            </div>
                                            <div class="thumb-inner animate" data-animate="fadeInUp">
                                                <h4>templatemo is the best</h4>
                                                <p>Please tell your friends about it. Templatemo is the best website to download free Bootstrap templates.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="portfolio-item">
                                            <div class="thumb">
                                                <img src="images/item-2.jpg" alt="">
                                            </div>
                                            <div class="thumb-inner animate" data-animate="fadeInUp">
                                                <h4>templatemo is the best</h4>
                                                <p>Please tell your friends about it. Templatemo is the best website to download Bootstrap CSS templates.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="portfolio-item">
                                            <div class="thumb">
                                                <img src="images/item-3.jpg" alt="">
                                            </div>
                                            <div class="thumb-inner animate" data-animate="fadeInUp">
                                                <h4>templatemo is the best</h4>
                                                <p>Please tell your friends about it. Templatemo is the best website to download free Bootstrap templates.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="portfolio-item">
                                            <div class="thumb">
                                                <img src="images/item-1.jpg" alt="">
                                            </div>
                                            <div class="thumb-inner animate" data-animate="fadeInUp">
                                                <h4>templatemo is the best</h4>
                                                <p>Please tell your friends about it. Templatemo is the best website to download free Bootstrap templates.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="portfolio-item">
                                            <div class="thumb">
                                                <img src="images/item-2.jpg" alt="">
                                            </div>
                                            <div class="thumb-inner animate" data-animate="fadeInUp">
                                                <h4>templatemo is the best</h4>
                                                <p>Please tell your friends about it. Templatemo is the best website to download free Bootstrap templates.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item animate" data-animate="fadeInUp">
                                        <div class="portfolio-item">
                                            <div class="thumb">
                                                <img src="images/item-3.jpg" alt="">
                                            </div>
                                            <div class="thumb-inner animate" data-animate="fadeInUp">
                                                <h4>templatemo is the best</h4>
                                                <p>Please tell your friends about it. Templatemo is the best website to download free Bootstrap templates.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section animated-row" data-section="slide05">
                <div class="section-inner">
                    <div class="row justify-content-center">
                        <div class="col-md-8 wide-col-laptop">
                            <div class="title-block animate" data-animate="fadeInUp">
                                <span>TESTIMONIALS</span>
                                <h2>what THEY SAY?</h2>
                            </div>
                            <div class="col-md-8 offset-md-2">
                                <div class="testimonials-section">
                                    <div class="testimonials-slider owl-carousel">
                                        <div class="item animate" data-animate="fadeInUp">
                                            <div class="testimonial-item">
                                                <div class="client-row">
                                                    <img src="images/profile-01.jpg" class="rounded-circle" alt="profile 1">
                                                </div>
                                                <div class="testimonial-content">
                                                    <h4>Sandar</h4>
                                                    <p>"Ut varius leo eu mauris lacinia, eleifend posuere urna gravida. Aenean a mattis lacus."</p>
                                                    <span>Managing Director</span>
                                                </div>                                           
                                            </div>
                                        </div>
                                        <div class="item animate" data-animate="fadeInUp">
                                            <div class="testimonial-item">
                                                <div class="client-row">
                                                    <img src="images/profile-01.jpg" class="rounded-circle" alt="profile 2">
                                                </div>
                                                <div class="testimonial-content">
                                                    <h4>Shinn</h4>
                                                    <p>"Nam iaculis, leo nec facilisis sollicitudin, dui massa tempus odio, vitae malesuada ante elit vitae eros."</p>
                                                    <span>CEO and Founder</span>
                                                </div>                                           
                                            </div>
                                        </div>
                                        <div class="item animate" data-animate="fadeInUp">
                                            <div class="testimonial-item">
                                                <div class="client-row">
                                                    <img src="images/profile-01.jpg" class="rounded-circle" alt="profile 3">
                                                </div>
                                                <div class="testimonial-content">
                                                    <h4>Marlar</h4>
                                                    <p>"Etiam efficitur, tortor facilisis finibus semper, diam magna fringilla lectus, et fringilla felis urna posuere tortor."</p>
                                                    <span>Chief Marketing Officer</span>
                                                </div>                                           
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section animated-row" data-section="slide07">
                <div class="section-inner">
                    <div class="row justify-content-center">
                        <div class="col-md-7 wide-col-laptop">
                            <div class="title-block animate" data-animate="fadeInUp">
                                <span>Contact</span>
                                <h2>Get In Touch!</h2>
                            </div>
                            <div class="contact-section">
                                <div class="row">
                                    <div class="col-md-6 animate" data-animate="fadeInUp">
                                        <div class="contact-box">
                                            <div class="contact-row">
                                                <i class="fa fa-map-marker"></i> 123 New Street Here, Wonderful City 10220
                                            </div>
                                            <div class="contact-row">
                                                <i class="fa fa-phone"></i> 090 080 0210
                                            </div>
                                            <div class="contact-row">
                                                <i class="fa fa-envelope"></i> info@company.co
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 animate" data-animate="fadeInUp">
                                        <form id="ajax-contact" method="post" action="#">
                                            <div class="input-field">
                                                <input type="text" class="form-control" name="name" id="name" required placeholder="Name">
                                            </div>
                                            <div class="input-field">
                                                <input type="email" class="form-control" name="email" id="email" required placeholder="Email">
                                            </div>
                                            <div class="input-field">
                                                <textarea class="form-control" name="message" id="message" required placeholder="Message"></textarea>
                                            </div>
                                            <button class="btn" type="submit">Submit</button>
                                        </form>
                                        <div id="form-messages" class="mt-3"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="social-icons">
            <div class="text-right">
                <ul class="social-icons">
                    <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#" title="Instagram"><i class="fa fa-behance"></i></a></li>
                </ul>
            </div>
        </div>
    </div>  

    <script src="js/jquery.js"></script>

    <script src="js/bootstrap.min.js"></script>

    <script src="js/fullpage.min.js"></script>

    <script src="js/scrolloverflow.js"></script>

    <script src="js/owl.carousel.min.js"></script>

    <script src="js/jquery.inview.min.js"></script>

    <script src="js/form.js"></script>

    <script src="js/custom.js"></script>

    <script type="text/javascript">
        //지도 생성
        let mapOptions = new vw.MapOptions(
        vw.BasemapType.GRAPHIC, //2D 전용
        "", //layersArr 미사용 옵션
        vw.DensityType.FULL, //controlsDensity 2D 전용
        vw.DensityType.BASIC, //interactionDensity 2D 전용
        false , //controlAutoArrange 2D 전용
        new vw.CameraPosition(
        new vw.CoordZ(61.914481915959 , 20.444267225588 , 124), //초기 위치 설정(경도, 위도, 높이 값)
        new vw.Direction(0, -90, 0)
        ), //home
        new vw.CameraPosition(
        new vw.CoordZ(61.914481915959 , 20.444267225588 , 30000000), //초기 위치 설정(경도, 위도, 높이 값)
        new vw.Direction(0, -90, 0)
        )// initPosition
        );
        
        let map = new vw.Map("vmap", mapOptions);/////////////

        
function vwmoveTo(x, y, z) {
    var movePo = new vw.CoordZ(x, y, z);
    var mPosi = new vw.CameraPosition(movePo, new vw.Direction(50, -17, 0));
    map.moveTo(mPosi);
}
function vwmoveTo2(x, y, z) {
    var movePo = new vw.CoordZ(x, y, z);
    var mPosi = new vw.CameraPosition(movePo, new vw.Direction(0, -90, 0));
    map.moveTo(mPosi);
    setPoint();
}
/* begin -------- 맵 초기화 코드 --------- */
function vwmap() {
    var mapOptions = new vw.MapOptions(
        vw.BasemapType.GRAPHIC,
        "",
        vw.DensityType.FULL,
        vw.DensityType.BASIC,
        false,
        new vw.CameraPosition(new vw.CoordZ(126.921883, 37.524370, 482400), new vw.Direction(0, -90, 0)),
        new vw.CameraPosition(new vw.CoordZ(126.921883, 37.524370, 2982400), new vw.Direction(0, -90, 0))
    );

    map = new vw.Map("vmap", mapOptions);
}
function flyHome() {
    if ( map != null ) {
        vw.NavigationZoom.initHome();
        console.log("이동 :");
    }
}

var pop;
  var pointGroup;
  
  function setPoint() {  

    pointGroup = new vw.geom.ShapeGroups("testgroups");
    // 1. 이미지 일괄지정.
    pointGroup.setImage("https://map.vworld.kr/images/v2map/spotmarker.png");
    
    var point1Coord = new vw.Coord(126.909795765774 , 35.1645575235227);
    var pt1 = new vw.geom.Point(point1Coord);
    pt1.setId("test1");
    pt1.setName("광주 공동구매 x건 판매중");
    pt1.setFont("나눔고딕");
    pt1.setFontSize(20);
    
    
    var point2Coord = new vw.Coord(128.595334593028 , 35.8664916093874);
    var pt2 = new vw.geom.Point(point2Coord);
    pt2.setId("test2");
    pt2.setName("대구 공동구매 x건 판매중");
    pt2.setFont("나눔고딕");
    pt2.setFontSize(20);
    pt2.create();
    
    var point3Coord = new vw.Coord(126.978229106965 , 37.5665711673465);
    var pt3 = new vw.geom.Point(point3Coord);
    pt3.setId("test3");
    pt3.setName("서울 공동구매 x건 판매중");
    pt3.setFont("나눔고딕");
    pt3.setFontSize(20);
    pt3.create();
    
    var point4Coord = new vw.Coord(126.43377108701 , 37.468649718031);
    var pt4 = new vw.geom.Point(point4Coord);
    pt4.setId("test4");
    pt4.setName("인천 공동구매 x건 판매중");
    pt4.setFont("나눔고딕");
    pt4.setFontSize(20);
    pt4.create();
    
    var point5Coord = new vw.Coord(127.013258919229  , 37.2985453646613);
    var pt5 = new vw.geom.Point(point5Coord);
    pt5.setId("test5");
    pt5.setName("경기 공동구매 x건 판매중");
    pt5.setFont("나눔고딕");
    pt5.setFontSize(20);
    pt5.create();

    var point6Coord = new vw.Coord(129.350203249641 , 35.4737048996921);
    var pt6 = new vw.geom.Point(point6Coord);
    pt6.setId("test6");
    pt6.setName("울산 공동구매 x건 판매중");
    pt6.setFont("나눔고딕");
    pt6.setFontSize(20);
    pt6.create();


    // 이벤트 처리 함수이며, 파라미터로 클릭시 window 픽셀, ecef좌표, cartographic좌표(실제경위도), 객체정보를 인수로 받는다.
    var eventHandler = function(windowPosition, ecefPosition, cartographic, featureInfo) {
        
      
      //console.log("property :" , windowPosition, ecefPosition, cartographic, featureInfo);
      //if ( featureInfo != null ) {
        // featureInfo 와 Point객체와는 다름.
        // Point 객체를 가져올 경우 featureInfo.groupId로 가져옴.(그룹별 아이디라기 보다는 개별아이디.)

        var htmlt;
        var id = featureInfo.groupId;
        console.log(id)
        var pointObj = map.getObjectById( id );
        console.log("pointObj :" , pointObj);

        if (id == 'test1') {
            htmlt = '광주<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test2') {
            htmlt = '대구<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test3') {
            htmlt = '서울<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test4') {
            htmlt = '인천<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test5') {
            htmlt = '경기<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test6') {
            htmlt = '울산<br> 공동구매 판매 상품 현황';
        }
        console.log(htmlt);

        
        
        // 텍스트문구(HTML)
        //var html = '동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세<br>';
        //html += '무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세~~';
        
        // 제목 title
        var titlet = pointObj.getName();
        //_id, _container, _title, _html, _width, _height, _x, _y
        // 식별아이디, 탑재컨테이너, 제목, html, 레이어가로길이, 레이어세로길이, 클릭 이벤트X, 클릭 이벤트Y
        pop = new vw.Popup("pop01", "vmap", titlet, htmlt, 450, 200, windowPosition.x, windowPosition.y);
        pop.create();
      //}      
    }
    /* pt1.addEventListener(eventHandler);
    pt2.addEventListener(eventHandler);
    pt3.addEventListener(eventHandler);
    pt4.addEventListener(eventHandler);
    pt5.addEventListener(eventHandler); */
    
    pointGroup.addEventListener(eventHandler);
    
    pointGroup.add(pt1);
    pointGroup.add(pt2);
    pointGroup.add(pt3);
    pointGroup.add(pt4);
    pointGroup.add(pt5);
    pointGroup.add(pt6);

    
    pointGroup.show();
  }
  
  // 일괄 마커 숨김
  function hideGroup() {
    pointGroup.hide();
  }
  
  // 일괄마커 표시
  function showGroup() {
    pointGroup.show();
  }
  
  function getObject() {
    var obj = pointGroup.getById("test2");
    console.log("obj : " , obj);
    obj.redraw();
  }
    
  // 마커 이벤트 제거방법.
  function removeEvent() {
     var _obj = map.getObjectById("test1");    
     if ( _obj != null ) {
        _obj.removeEventListener();
     }
  }
  
  // 마커 문구 수정 및 기타 수정.
  function redraw() {
      // 아이디로 객체를 찾는다.
      // 모든 그래픽 객체는 redraw() 메서드가 구현되어 있습니다.
      //test4
      var pt4 = map.getObjectById("test4");
      //console.log("pt4 :" , pt4);
      if ( pt4 != null ) {
        var point4Coord = new vw.Coord(126.971883, 37.527370);

        pt4.setCoord(point4Coord);
        //pt4.setImage("http://localhost:8082/images/v2map/spotmarker.png");
        pt4.setName("2차원 포인트4");
        pt4.setFont("궁서");
        pt4.setFontSize(25);
        pt4.redraw();  
      }
    }
  
  function redraw2() {
    var pt3 = map.getObjectById("test3");
    if ( pt3 != null ) {
      var point3Coord = new vw.Coord(126.945883, 37.524370);
      
      pt3.setName("2차원 포인트3-1");
      pt3.setFont("나눔고딕");
      pt3.setFontSize(15);
      pt3.redraw();
    }
  }
  
  /**
   vw.geom.ShapeGroups 메서드
   contructor : new vw.geom.ShapeGroups(아이디);  식별자
   setId(_id) : ShapeGroups id설정
   getId() : ShapeGroups id 반환
   setOption(_opt) : ShapeGroups 일괄 옵션 설정.  Polyline, MutilPolyline, Polygon, MultiPolygon 등.
   getOption() : ShapeGroups 옵션 반환.
   addEventListener(evtListener) : ShapeGroups 일괄 이벤트리스너 설정    
   removeEventListener() : ShapeGroups 일괄 이벤트리스너 삭제      
   setImage( _image ) :  ShapeGroups 일괄 이미지 설정
   getImage() : ShapeGroups 일괄 이미지 반환    
   add( _item ) : 도형객체 추가.      
   getById( _id ) : 아이디로 도형객체 반환
   removeById(_id) : 아이디로 도형객체 삭제      
   removeByObj(_obj) : 객체로 도형객체 삭제.
   show() : 도형 일괄 출력.
   showById(_id) : 아이디로 도형 검색 후 출력.
   hide() : 도형 일괄 숨김
   hideById(_id) : 아이디로 도형 검색 후 숨김.
  */


    

    
 </script>
    
    


  </body>
</html>