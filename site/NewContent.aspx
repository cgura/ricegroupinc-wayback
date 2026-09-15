
<!doctype html>

<html>
	<head>
		
	
	<title>Request Reports</title>
	<meta charset="utf-8" />
    <meta name="headerInfo" content="NewContent">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta id="head_head_metaDesc" name="description" content="Select the pages that you would like receive a preview for."></meta>
	<meta id="head_head_metaKey" name="keywords" content=""></meta>

    

	<style type="text/css" media="screen">
		img { 
			max-width: 100%;
			height: auto;
		}
		.nopadding {
			padding: 0 !important;
			margin: 0 !important;
		}
		.xs-page-form 
		{
			padding: 0;
			margin: 0;
		}
	</style>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="Stylesheet" />
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<link id="xsThemeCSS" href="/CSS/Provided_Themes/base/theme.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/scripts/global.js"></script>

	<script type="text/javascript">
		var drawWidgets = function () {
			$('[data-xswidget]').each(function () {
				var loadTo = $(this);
				var loading = $("<i/>", {
					"class": "xs-loading-dyn-content fa fa-spinner fa-spin"
				}).appendTo(loadTo);

				loadTo.addClass("");
				var widg = loadTo.attr("data-xswidget");
				var urlString = "/controls/controlviewer.aspx?control=" + widg;

				$.ajax({
					url: urlString,
					type: "GET",
					dataType: "html",
					success: function (res) {
						if (loadTo.is("div")) {
							loadTo.html(res);
						} else {
							//not a div, possibly a ul or something that cant have the form.
							loadTo.html($(res).find("div.main-ajax-content").html());
						}
						
					},
					error: function () {
						loadTo.find("i.xs-loading-dyn-content").remove();
						loadTo.text("Error Loading..");
					}
				});
			});
		}
		
		

		function resizeMe(id, clearHeight) {
			// listings pages such as "our homes" calls me
			var theFrame = document.getElementById(id);
			if (clearHeight) {
				theFrame.height = 0;
			}
			var theBody = (theFrame.contentWindow.document.body || theFrame.contentDocument.body)
			var newHeight = Math.max(theBody.scrollHeight, theBody.offsetHeight, theBody.clientHeight);
			theFrame.height = (newHeight + "px");
		}

		

		$(document).ready(function () {
			drawWidgets();
			// this shows and hides the dropdown menus.
			$("li.dropdown").mouseenter(function () {
				clearTimeout($(this).data('timeoutId'));
				$(this).addClass("open");
			}).mouseleave(function () {
				var theElement = $(this), timeoutId = setTimeout(function () {
					theElement.removeClass("open");
				}, 250);
				theElement.data("timeoutId", timeoutId);
			});


			

		});
	</script>
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700|Roboto:400,500,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lovers+Quarrel" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Miss+Fajardose" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css"> 
<link rel='stylesheet' href='./css/font-awesome.min.css'/> 
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-------- METRO 2 HEADER FILE ---------------------
In TA use:
Full Screen and Base 
Color #1: Primary Shade: #044F98
Color #2: Primary Shade: #20385B
Link Color: #4c5b7c
Complimentary Grey/Black: #555 
Fonts: Header - Roboto - Body - Open Sans
------------------------------------------------------------------>

<style>

.r-font {
    font-family: 'Miss Fajardose', cursive;
}

@media (max-width: 1199px) {
    .navbar-header {
        float: none;
        background-color: #044F98;
    }
    .navbar-left,.navbar-right {
        float: none !important;
    }
    .navbar-toggle {
        display: block;
        background-color: #044F98;
    }
    .navbar-collapse {
        border-top: 0px solid transparent;
        box-shadow: inset 0 1px 0 rgba(255,255,255,0.1);
    }
    .navbar-fixed-top {
        top: 0;
        border-width: 0 0 1px;
    }
    .navbar-collapse.collapse {
        display: none!important;
    }
    .navbar-nav {
        float: none!important;
        margin-top: 0px;
    }
    .navbar-nav>li {
        float: none;
    }
    .navbar-nav>li>a {
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .collapse.in{
        display:block !important;
    }
    .navbar-nav .open .dropdown-menu {
        position: static;
        float: none;
        width: auto;
        margin-top: 0;
        background-color: #222;
        border: 0;
        box-shadow: none;
        color: #FFF;
    }
    .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:hover {
        background-color: #044F98;
        color: #FFF;
    }
    .navbar-inverse .navbar-nav .open .dropdown-menu > li > a {
    color: #FFF;
}
}


/********************************/
/*          Custom Theme Code       */
/********************************/

.col-md-4.img-across > h1 {
    line-height: 3.1;
    text-align: center;
}

.img-thumbnail{
    background-color: #044F98;
    border: 0px;
    padding: 1px;
}

.pull-right {
    display: none;
}
.navbar {
margin-bottom: 0px;
}
.navbar-inverse .navbar-nav > ul > li:hover:after{
   border: 2px solid #044F98;
   bottom: 0;
   content: "";
   left: 0;
   position: absolute;
   width: 100%;
}

/********************************/
/*       Fade Carousel       */
/********************************/

.fade-carousel {
    position: relative;
    height: 100%;
}

.fade-carousel .carousel-inner .item {
    height: 75vh;
}

.fade-carousel .carousel-indicators > li {
    margin: 0 2px;
    background-color: #044F98;
    border-color: #044F98;
    opacity: .8;
}

.fade-carousel .carousel-indicators > li.active {
    width: 10px;
    height: 10px;
    opacity: 1;
}

/********************************/
/*            Overlay           */
/********************************/
.overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 2;
    background-color: rgba(0, 0, 0, 0.28);
    opacity: .7;
}

/********************************/
/*          Hero Headers        */
/********************************/

.hero {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 30;
    color: #FFF;
    text-align: center;
    -webkit-transform: translate3d(-50%, -50%, 0);
    -moz-transform: translate3d(-50%, -50%, 0);
    -ms-transform: translate3d(-50%, -50%, 0);
    -o-transform: translate3d(-50%, -50%, 0);
    transform: translate3d(-50%, -50%, 0);
}
.hero h1 {
    font-size: 7vh;
    font-weight: 400;
    margin: 10px;
    padding: 0;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 1);
}
.hero h3 {
    font-size: 3.5vh;
    font-weight: 400;
    text-transform: capitalize;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 1);
}
.fade-carousel .carousel-inner .item .hero {
    opacity: 0;
    -webkit-transition: 2s all ease-in-out .1s;
    -moz-transition: 2s all ease-in-out .1s;
    -ms-transition: 2s all ease-in-out .1s;
    -o-transition: 2s all ease-in-out .1s;
    transition: 2s all ease-in-out .1s;
}

.fade-carousel .carousel-inner .item.active .hero {
    opacity: 1;
    -webkit-transition: 2s all ease-in-out .1s;
    -moz-transition: 2s all ease-in-out .1s;
    -ms-transition: 2s all ease-in-out .1s;
    -o-transition: 2s all ease-in-out .1s;
    transition: 2s all ease-in-out .1s;
}

/********************************/
/*          Custom Buttons      */
/********************************/

.btn.btn-lg {
    padding: 10px 40px;
}

/********************************/
/*       Slides backgrounds     */
/********************************/

.fade-carousel .slides .slide-1,
.fade-carousel .slides .slide-2,
.fade-carousel .slides .slide-3,
.fade-carousel .slides .slide-4,
.fade-carousel .slides .slide-5,
.fade-carousel .slides .slide-6 {
    height: 150vh;
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
    max-width:100%;
    max-height:100%;
}

.fade-carousel .slides .slide-1 {
    background-image: url(/xsites/agents/FairwayIndependentMortgageCorporation2/Content/UploadedFiles/Promoter12-1400.jpg);
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

.fade-carousel .slides .slide-2 {
    background-image: url(/xsites/agents/FairwayIndependentMortgageCorporation2/Content/UploadedFiles/Promoter20-1400.jpg);
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

.fade-carousel .slides .slide-3 {
    background-image: url(/xsites/agents/FairwayIndependentMortgageCorporation2/Content/UploadedFiles/Promoter47-1400.jpg);
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

.fade-carousel .slides .slide-4 {
    background-image: url(/xsites/agents/FairwayIndependentMortgageCorporation2/Content/UploadedFiles/Interiors3-1400.jpg);
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
.fade-carousel .slides .slide-5 {
    background-image: url(/xsites/agents/FairwayIndependentMortgageCorporation2/Content/UploadedFiles/Interiors9-1400.jpg);
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
.fade-carousel .slides .slide-6 {
    background-image: url(/xsites/agents/FairwayIndependentMortgageCorporation2/Content/UploadedFiles/Interiors17-1400.jpg);
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
/********************************/
/*          Staff Table Starts       */
/********************************/

@import url("http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css");
.panel-pricing {
    -moz-transition: all .3s ease;
    -o-transition: all .3s ease;
    -webkit-transition: all .3s ease;
}

.panel-pricing:hover {
    box-shadow: 0px 0px 30px rgba(0, 0, 0, 0.2);
}

.panel-pricing .panel-heading {
    padding: 20px 10px;
}

.panel-pricing .panel-heading .fa {
    margin-top: 10px;
    font-size: 58px;
}

.panel-pricing .list-group-item {
    color: #777777;
    border-bottom: 1px solid rgba(250, 250, 250, 0.5);
}

.panel-pricing .list-group-item:last-child {
    border-bottom-right-radius: 0px;
    border-bottom-left-radius: 0px;
}

.panel-pricing .list-group-item:first-child {
    border-top-right-radius: 0px;
    border-top-left-radius: 0px;
}

.panel-pricing .panel-body {
    background-color: #f0f0f0;
    font-size: 40px;
    color: #777777;
    padding: 20px;
    margin: 0px;
}

/********************************/
/*          Default Code       */
/********************************/
.xs-body {
    padding-top: 0px !important;
}

body {
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
    padding-top: 70px !important;
    font-size: 16px;
}

.xs-primary-content {
    padding-left: 0px;
    padding-right: 0px;
    max-width: 1200px;
    margin: 0px auto;
    background: #fff;
    margin-top: 75px;
}

.xs-site-container {
    padding: 0px;
    width: 100%;
    clear: both;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    position: relative;
    padding-left: 0;
    padding-right: 0;
}


/* Spacing for search box */

.searchwell {
    margin-top: 8px;
    padding: 1em;
}


/* Lead capture form fixer */

.xs-lead-form-viewer {
    max-width: 800px;
    margin: 1em auto;
}


/* For listings */

.floatingsearch {
    padding: 2em;
}

.xs-include-idx-quick-search {
    padding: 2em;
    background: rgba(250, 250, 250, .8);
    border-radius: 3px;
    color: #222;
}

.xs-include-idx-quick-search-heading {
    font-weight: 400;
}

.inner {
    width: 80%;
    max-width: 1440px;
    min-width: 300px;
    margin: 0 auto;
}


/********************************/
/*          Carousel Style       */
/********************************/

.carousel {
    position: relative;
    max-width: 100%;
    margin: 0px auto;
}

/********************************/
/*          Text and Link Styles       */
/********************************/

.homepage-headline {
    font-size: 5rem;
    margin-top: 0px;
}

h1,
h2,
h3,
h4,
h5,
h6,
.h1,
.h2,
.h3,
.h4,
.h5,
.h6 {
    font-family: 'Roboto Slab', serif;
    font-weight: 400;
    line-height: 1.1;
    margin-top: 10px;
    margin-bottom: 15px;
}

p {
    font-size: 16px;
}

a {
    color: #044F98;
    text-decoration: none;
}

a:hover,
a:focus {
    color: #222;
    text-decoration: underline;
}

/********************************/
/*          Image Styles      */
/********************************/

.img-responsive {
    box-shadow: 0 1px 2px rgba(0, 0, 0, .3);
    margin-top: 5px;
}

.img-headshot {
    max-width: 250px;
    margin: 0px auto;
}

.img-circle {
    display: inline-block;
    margin: 10px;
    position: relative;
    overflow: hidden;
    border-radius: 14%;
    border: 8px solid transparent;
}

.img-circle:hover {
    border: 8px solid #044F98;
    transition: all .2s ease-in-out;
}

.wrapper {
    display: inline-block;
}

.img-circle img {
    width: 250px;
}

.img-circle-heading {
    position: absolute;
    top: 22%;
    left: 0;
    width: 100%;
    background: rgba(250, 250, 250, .6);
    color: #333;
    padding: 30px 0;
    font-family: 'Roboto', sans-serif;
    font-weight: 500;
}

.img-square {
    display: inline-block;
    margin: 1em;
    position: relative;
    overflow: hidden;
    border-radius: 0;
}

.img-square:hover {
    opacity: .7;
}

.img-square img {
    width: 250px;
}

.img-square-heading {
    position: absolute;
    top: 20%;
    left: 0;
    width: 100%;
    background: rgba(255, 255, 255, 0.8);
    color: #333;
    padding: 27px 0;
    font-family: 'Roboto', sans-serif;
}


/********************************/
/*          Background Styles       */
/********************************/

.bg-center,
.bg-l-edge,
.bg-r-edge,
.bg-t-edge,
.bg-b-edge,
.bg-tl-edge,
.bg-bl-edge,
.bg-tr-edge,
.bg-br-edge,
.bg-repeat {
    -webkit-background-size: auto;
    -moz-background-size: auto;
    -o-background-size: auto;
    background-size: auto;
}

.background-white {
    background-color: #FFFFFF;
    padding-top: 20px;
    padding-bottom: 20px;
}

.background-primary {
    background-color: #222;
    color: #FFF;
    padding-top: 20px;
    padding-bottom: 20px;
}

.background-secondary {
    background-color: #FFF;
    color: #222;
    padding-top: 20px;
    padding-bottom: 20px;
}



/********************************/
/*          Menu Styles       */
/********************************/

.navbar-inverse .navbar-brand {
    color: #FFF;
}

.navbar-inverse .navbar-brand:hover,
.navbar-inverse .navbar-brand:focus {
    color: #EEE;
    background-color: transparent;
}


/* Use to hide company name while logo is show on desktop view */

a.navbar-brand.xs-company-name.xs-company-logo {
    margin: 0 10px;
    font-size: 0px;
}

a.navbar-brand.visible-xs.xs-company-name {
    display: none !important;
}

a.xs-company-name {
    line-height: 52px;
    font-size: 16px;
    margin: 0px 15px;
}
@media only screen and (min-width : 768px) {
    .navbar-inverse {
    background-color: #044F98;
    border: 0px;
    position: absolute;
    z-index: 40;
}
	}


.navbar-inverse .navbar-nav > li > a {
    color: #fff;
    font-size: 16px;
    height: 80px;
    line-height: 55px;
    font-weight: 500;
}

.navbar-right a {
    font-family: 'Roboto', sans-serif;
    text-transform: uppercase;
    font-weight: 500;
}

.navlist-container i.fa {
    padding: 10px;
}

.navbar-inverse .dropdown-menu {
    background-color: #222;
}

.dropdown-menu>li>a {
    color: #fff;
    font-weight: bold;
}

.navbar-inverse .dropdown-menu > li > a:hover,
.navbar-inverse .dropdown-menu > .active > a,
.navbar-inverse .dropdown-menu > .active > a:hover {
    background-color: #044F98;
    color: #fff;
}

.navbar-inverse .navbar-nav > li > a:hover,
.navbar-inverse .navbar-nav > li > a:focus {
    background-color: #044F98;
    color: #fff;
}

.navbar-inverse .dropdown-menu > li > a:hover,
.navbar-inverse .dropdown-menu > .active > a,
.navbar-inverse .dropdown-menu > .active > a:hover {
    background-color: #044F98;
    color: #fff;
}

.navbar-inverse .navbar-nav > .open > a,
.navbar-inverse .navbar-nav > .open > a:hover,
.navbar-inverse .navbar-nav > .open > a:focus {
    background-color: #044F98;
    color: #fff;
}

.navbar-inverse .navbar-nav .open .dropdown-menu > .active > a,
.navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:hover,
.navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:focus {
    background-color: #044F98;
    color: #fff;
}


/********************************/
/*          Well Styles       */
/********************************/

.well {
    background-color: #f8f8f8;
    border: 0px solid #eee;
    border-radius: 0;
}

/********************************/
/*          Button Styles       */
/********************************/

.btn {
    margin: 0px;
    font-size: 15px;
    border-radius: 0;
    outline: none;
}

.btn:hover {
    transition: all .2s ease-in-out;
}

.btn-default {
    margin: 0px;
    font-size: 14px;
    border-radius: 0;
    outline: none;
    padding: 4px 6px;
}

.btn.pull-right {
    margin: 0 0 5px 5px;
}

.btn-d,
.btn-d:hover,
.btn-d:focus {
    color: #FFF;
    background: rgba(0, 0, 0, .3);
}

.btn-primary {
    background: #044F98;
    border-color: #044F98;
    color: #FFFFFF;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .3);
}

.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.open .dropdown-toggle.btn-primary {
    background-color: #20385B;
    border-color: #20385B;
}

.btn-info {
    background: #044F98;
    border-color: #044F98;
    color: #FFFFFF;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .3);
}

.btn-info:hover,
.btn-info:focus,
.btn-info:active,
.btn-info.active,
.open .dropdown-toggle.btn-info {
    background-color: #20385B;
    border-color: #20385B;
}

/********SOCIAL MEDIA BUTTONS*************/
.fa-stack-2x {
    color: #FFF;
}
.fa-stack-2x:hover {
    color: #333;
}
.fa-facebook {
    color: #044F98;
}
.fa-facebook:hover {
    color: #3b5998;
}
.fa-twitter {
    color: #044F98;
}
.fa-twitter:hover {
    color: #55acee;
}
.fa-youtube {
    color: #044F98;
}
.fa-youtube:hover {
    color: #bb0000;
}
.fa-linkedin {
    color: #044F98;
}
.fa-linkedin:hover {
    color: #007bb5;
}
.fa-instagram {
    color: #044F98;
}
.fa-instagram:hover {
    color: #e95950;
}
.fa-pinterest {
    color: #044F98;
}
.fa-pinterest:hover {
    color: #cb2027;
}
.fa-snapchat {
    color: #044F98;
}
.fa-snapchat:hover {
    color: #fffc00;
}
.fa-dropbox {
    color: #044F98;
}
.fa-dropbox:hover {
    color: #007ee5;
}
.fa-yelp {
    color: #044F98;
}
.fa-yelp:hover {
    color: #c41200;
}
.fa-google-plus {
    color: #044F98;
}
.fa-google-plus:hover {
    color: #dd4b39;
}

/********************************/
/*          iFrame and Video Styles       */
/********************************/

iframe {
    border: 0;
}

video {
    max-width: 100%;
    height: auto;
}

.video-container {
    position: relative;
    padding-bottom: 56.25%;
    padding-top: 30px;
    height: 0;
    overflow: hidden;
    text-align: center;
}

.video-container iframe,
.video-container object,
.video-container embed {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}


/********************************/
/*          Panel Styles       */
/********************************/

.panel-primary {
    border-color: #044F98;
}

.panel-primary > .panel-heading {
    background-color: #044F98;
    border-color: #044F98;
}

.panel-primary > .panel-heading + .panel-collapse .panel-body {
    border-top-color: #044F98;
}

.panel-primary > .panel-footer + .panel-collapse .panel-body {
    border-bottom-color: #044F98;
}

.panel-info {
    border-color: #20385B;
}

.panel-info > .panel-heading {
    color: #fff;
    border-color: #20385B;
    background-color: #20385B;
}

.panel-info > .panel-heading + .panel-collapse .panel-body {
    border-top-color: #20385B;
}

.panel-info > .panel-footer + .panel-collapse .panel-body {
    border-bottom-color: #20385B;
}


/********************************/
/*          Dynamic Content Style       */
/********************************/

.xs-dynamic-content {
    max-width: 1400px;
    margin: 0px auto;
}


/********************************/
/*          Footer Styles       */
/********************************/

.xs-site-footer {
    min-height: 250px;
    padding-bottom: 60px;
    background: #222;
}

#stickyfooter {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 50px;
    line-height: 50px;
    text-align: center;
    background-color: #333;
    background-image: none;
    background-repeat: repeat-x;
    border-top: 1px solid #044F98;
    color: #FFF;
    font-size: 1.2em;
    font-weight: bold;
    z-index: 99999999;
    font-family: 'Roboto', sans-serif;
}

.xs-site-footer a {
    color: #FFF;
    text-decoration: none;
    font-weight: 400;
}

.xs-site-footer a:hover {
    color: #FFF;
    text-decoration: underline;
    font-weight: 400;
}

.xs-site-footer hr {
    display: none;
}

.xs-site-footer-copyright {
    color: #FFF;
    font-size: 12px;
}
.xs-footer-text {
    color: #FFF;
}

/********************************/
/*          Media Queries Adjustment       */
/********************************/

@media (max-width: 768px) {
    .primary-content {
        overflow-x: hidden;
        position: relative;
    }
    .xs-primary-content {
    margin-top: 100px;
}
    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    p {
        padding-left: 10px;
        padding-right: 10px;
    }
    .container {
        padding: 0px;
    }
    .xs-site-container {
        padding: 0px 20px;
        width: 100%;
        padding-left: 0;
        padding-right: 0;
        -webkit-background-size: auto 200%;
        -moz-background-size: auto 200%;
        -o-background-size: auto 200%;
        background-size: auto 200%;
        display: block;
    }
    .xs-site-container-lg {
        padding: 0;
    }
/*
    .xs-primary-content {
        margin: 0px auto;
        margin-top: -50px;
    }
*/
    .background-secondary {
        padding-bottom: 70px;
    }
    
    .navbar-brand {
        padding: 0px;
        height: 80px;
    }    
    img.xs-company-logo {
        height: 70px;
        margin: 5px 5px;
    }
    .navbar-inverse .navbar-nav > li > a {
    color: #fff;
    font-size: 16px;
    height: 50px;
    line-height: 35px;
    font-weight: 500;
    }
    .hero h1 {
    font-size: 5vh;
    }
    .hero h3 {
    font-size: 2vh;
    }   
}
@media (min-width: 769px) {
    .navbar-brand {
        padding: 0px;
        height: 80px;
    }
    img.xs-company-logo {
        height: 70px;
        margin: 5px 5px;
    }
    .navbar-inverse .navbar-collapse,
    .navbar-inverse .navbar-form {
        border-color: transparent;
        background: transparent;
    }
    .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:hover,
    .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:focus {
        background-color: #044F98;
        color: #fff;
    }
    .homepage-headline {
        font-size: 3rem;
    }
}
    .col-xs-2,
    .col-sm-2,
    .col-md-2,
    .col-lg-2,
    .col-xs-3,
    .col-sm-3,
    .col-md-3,
    .col-lg-3,
    .col-xs-4,
    .col-sm-4,
    .col-md-4,
    .col-lg-4,
    .col-xs-5,
    .col-sm-5,
    .col-md-5,
    .col-lg-5,
    .col-xs-6,
    .col-sm-6,
    .col-md-6,
    .col-lg-6,
    .col-xs-7,
    .col-sm-7,
    .col-md-7,
    .col-lg-7,
    .col-xs-8,
    .col-sm-8,
    .col-md-8,
    .col-lg-8,
    .col-xs-9,
    .col-sm-9,
    .col-md-9,
    .col-lg-9,
    .col-xs-10,
    .col-sm-10,
    .col-md-10,
    .col-lg-10,
    .col-xs-11,
    .col-sm-11,
    .col-md-11,
    .col-lg-11,
    .col-xs-12,
    .col-sm-12,
    .col-md-12,
    .col-lg-12 {
        margin-top: 30px;
        margin-bottom: 30px;
    }
}

</style>

	<style type="text/css">
		body {
			padding-top: 45px; /* later overwritten by js*/
		}
		.xs-dynamic-widget {
			width: 31.33%;
			margin: 1%;
			float: left;
		}
		@media(max-width: 768px) {
			.xs-dynamic-widget 
			{
				width: 98%;
				float: none;
			}
		}
		.navbar-brand.hidden-xs.xs-company-name.xs-company-logo
		{
			padding: 1px;
		}
		.navbar-brand.hidden-xs.xs-company-name.xs-company-logo img.xs-company-logo {
			max-height: 100%;
			width: auto;
		}
	</style>
	<script type="text/javascript">
		var window_resize = false;
		var abp = function () {
			$("body").css("padding-top", $(".navbar-fixed-top").outerHeight());
		};
		$(document).ready(function () {
			abp();
		});
		$(window).resize(function () {
			if (window_resize) {
				clearTimeout(window_resize);
			}
			window_resize = setTimeout(function () {
				abp();
			}, 600);
		});
	</script>

	</head>
	<body class="xs-body">
		<form method="post" action="./NewContent.aspx?FileName=RequestReports.x&amp;" id="form1" class="xs-page-form">
<input type="hidden" name="content_content_ToolkitScriptManager_HiddenField" id="content_content_ToolkitScriptManager_HiddenField" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJMjMxOTcyNDY1D2QWAmYPZBYCZg9kFgQCAQ9kFgICAQ9kFgZmDxYCHgRUZXh0BQ9SZXF1ZXN0IFJlcG9ydHNkAgEPFgIeB2NvbnRlbnQFO1NlbGVjdCB0aGUgcGFnZXMgdGhhdCB5b3Ugd291bGQgbGlrZSByZWNlaXZlIGEgcHJldmlldyBmb3IuZAICDxYCHwFlZAIDD2QWAgIBD2QWBAIND2QWAgIDD2QWAmYPZBYEAgEPZBYCZg9kFgJmD2QWAmYPZBYCZg8WAh8ABe+dATxkaXYgY2xhc3M9Y29udGFpbmVyPjxicj5CdXlpbmcgYW5kIHNlbGxpbmcgcmVhbCBlc3RhdGUgY2FuIGJlIGEgZGF1bnRpbmcgdGFzaywgd2l0aCBzbyBtdWNoIGluZm9ybWF0aW9uIHRvIGJlIGF3YXJlIG9mLiBUaGlzIHBhZ2UgaXMgZGVzaWduZWQgdG8gaGVscCBlZHVjYXRlIHlvdSBpbiBhcmVhcyBpbiB3aGljaCB5b3UgbWF5IGJlIGxlc3MgZmFtaWxpYXIuIFNpbXBseSBzZWxlY3QgdGhlIHRvcGljcyB5b3UnZCBsaWtlIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgYW5kIHdlJ2xsIHNlbmQgdGhlbSB0byB5b3UuPC9kaXY+PGJyPjxicj48dGFibGUgd2lkdGg9MTAwJSBib3JkZXI9MCBjZWxscGFkZGluZz0wIGNlbGxzcGFjaW5nPTA+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA5NSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+OSBTdGVwcyB0byBPd25pbmc8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNzQnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkFwcGx5aW5nIGZvciBhIExvYW48L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzg2MDcwMTEnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkFyZWEgSG9tZXM8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNzYnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkJpLVdlZWtseSBNb3J0Z2FnZTwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA2MSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+QnV5ZXJzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MTM0Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5CdXlpbmcgRm9yZWNsb3N1cmVzL1JFTydzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDU2Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5DbG9zaW5nIENvc3RzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDQ5Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5DbG9zaW5nIGNvc3RzIC0gSW5zLjwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA0OCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+Q2xvc2luZyBjb3N0cyAtIGxvYW5zPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9JzgyMzIxNTE1Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5DT01JTkcgU09PTiBMaXN0aW5nczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc4MjI2ODA0OCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+Q29tbWVyY2lhbDwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODEzNyc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+Q29udGluZ2VuY2llcyBpbiBDb250cmFjdHM8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwOTMnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkNyZWF0aXZlIEZpbmFuY2luZzwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA0NCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+Q3VyYiBBcHBlYWwgTGlzdDwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA4MCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+RG9jdW1lbnRpbmcgQXNzZXRzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDY0Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5FbnZpcm9ubWVudGFsIElzc3VlczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE1MCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+RXRoaWNzIGluIFJlYWwgRXN0YXRlPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDUzJz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5GaW5kIEEgSG9tZSE8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNTcnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkZpcnN0IFRpbWUgSG9tZSBCdXllcnM8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxNTQnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkZpeGVyIFVwcGVyczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE0OSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+Rmxvd2VycyBBZGQgQ3VyYiBBcHBlYWwhPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MjExNjg2Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5Gb3IgU21hbGwgQnVzaW5lc3M8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNTInPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkZyZWUgSG9tZSBWYWx1YXRpb248L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nODIzMjM3MTQnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkZSRUUgUmVzb3VyY2VzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MTQ4Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5HYXRlZCBDb21tdW5pdGllczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA1OCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+R2V0IFByZS1xdWFsaWZpZWQ8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNTAnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkdldCB0aGUgSGlnaGVzdCBQcmljZTwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA5NCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+SGVhcnQgb2YgdGhlIE1hdHRlcjwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODEyNCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+SG9saWRheSBTYXZpbmc8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxMjUnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkhvbGlkYXkgVGhlZnQ8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxNTInPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkhvbWUgQXBwcmVjaWF0aW9uPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDYwJz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5Ib21lIEJ1eWVyIENoZWNrbGlzdDwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE0Myc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+SG9tZW93bmVyIFdhcnJhbnRpZXM8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNTUnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkhvdyBFc2Nyb3cgV29ya3M8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxNTEnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkltcHJvdmVtZW50cyBUaGF0IFBheTwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA1OSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+SW5zcGVjdGlvbiBUaXBzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9JzgyMzMwNzI4Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5LaW5ncyBSaWRnZSBDTUE8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nODIzMjE4MzYnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkxhbmRsb3JkczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA0Nyc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+TGVhZCBpbiB0aGUgSG9tZTwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODEzMyc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+TGVhc2UgQW5hbHlzaXM8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwODgnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PkxlbmRlciBUeXBlczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODEzOCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+TGlzdGluZyBDb21taXNzaW9uczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA3NSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+TG9hbiBBcHAgQ2hlY2tsaXN0PC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDgzJz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5Mb2FuIFByb2dyYW1zPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDg1Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5Mb2NraW5nIGluIFJhdGVzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDk2Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5Nb2xkIGluIHRoZSBIb21lPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDc3Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5Nb3J0Z2FnZSBTYXZpbmcgVGlwczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA4NCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+TW9ydGdhZ2UgU2hvcHBpbmc8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxNDAnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0Pk5lZWQgYSBCcmlkZ2UgTG9hbj88L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwOTAnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0Pk5laWdoYm9yaG9vZCBQcmljZXM8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzc1MjU2OTgnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0Pk5ldyBDb25zdHJ1Y3Rpb248L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcyMTM3ODgnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0Pk9mZmljZSBTZWFyY2g8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcyMTA4NTEnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0Pk9mZmljZSBTcGFjZTwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE0NCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+UGx1bWJpbmcgYW5kIEZpeHR1cmVzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MTI3Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5Qcm9wZXJ0eSBNYW5hZ2VtZW50PC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MjEzNzg2Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5Qcm9wZXJ0eSBTZWFyY2g8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNDEnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlJhZG9uIEluZm9ybWF0aW9uPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDY3Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5SZWFsIEVzdGF0ZSBHbG9zc2FyeTwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE0NSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+UmVhbCB2cy4gUGVyc29uYWwgUHJvcGVydHk8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxMjgnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlJlYXNvbnMgSG9tZXMgRG9uJ3QgU2VsbDwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzUyNTY5Nyc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+UmVsb2NhdGlvbjwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODExOCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+UmVxdWVzdCBJbmR1c3RyeSBJbmZvPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9JzgyMjY4MDQ3Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5SZXNpZGVudGlhbDwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODAzOSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+UmVzdWx0cyBmb3IgWW91ITwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE0Nyc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+Um9sZSBvZiB0aGUgTUxTPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc4NjA3MDI1Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5TZWFyY2ggQXJlYSBIb21lczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA5Nyc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+U2VsbGVyIFBhaWQgQ2xvc2luZzwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA2OSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+U2VsbGVyczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE1Myc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+U2VsbGluZyBPbmUsIEJ1eWluZyBBbm90aGVyPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDUxJz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5TZWxsaW5nIHlvdXIgb3duIGhvbWU8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNDUnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlNldHRpbmcgdGhlIFNhbGVzIFByaWNlPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MjE1Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5TaG9ydCBTYWxlIEJ1eWVyPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MjE2Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5TaG9ydCBTYWxlIFNlbGxlcjwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE0Mic+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+U2hvdWxkIHlvdSBwYWludD88L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxMjknPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlNpdGUgU2VsZWN0aW9uIFNlcnZpY2VzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDQyJz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5TdGFmZiBQcm9maWxlczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA5Mic+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+U3RhZ2luZyBDaGVja2xpc3Q8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwOTEnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlN0YWdpbmcgU2VydmljZXM8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwODknPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlN0YXlpbmcgQXBwcm92ZWQ8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNDYnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlRheCBDbG9zaW5nIENvc3RzPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MTMwJz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5UZW5hbnQgUmVwcmVzZW50YXRpb248L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxMzEnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlRlbmFudCBTcGFjZSBDb25zdHJ1Y3Rpb248L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcyMTE2ODcnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlRlc3RpbW9uaWFsczwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODEzOSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+VGhlIEJhY2sgWWFyZDwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE0Nic+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+VGhlIEtpdGNoZW48L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxMzYnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PlRoZSBMaXN0aW5nIENvbnRyYWN0PC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDM4Jz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5UaXRsZSBJbmZvcm1hdGlvbjwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODEzNSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+VHlwZXMgb2YgTGlzdGluZyBDb250cmFjdHM8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxNDEnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PldoYXQncyBFYXJuZXN0IE1vbmV5PzwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODE1NSc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+V2hhdCdzIE15IFByb3BlcnR5IFdvcnRoPzwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODAzNyc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+V2h5IGFuIGluc3BlY3Rpb24/PC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDQwJz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5XaHkgQ2hvb3NlIFVzITwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODAzNic+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+V2h5IFRpdGxlIEluc3VyYW5jZT88L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgxMjYnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PldpbnRlcml6ZSB5b3VyIEhvbWU8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwODInPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PldyaXRpbmcgdGhlIE9mZmVyPC90ZD4NCjx0ciBpZD10ckl0ZW0+DQo8dGQgdmFsaWduPSd0b3AnPjxpbnB1dCBzdHlsZT0nTUFSR0lOLVJJR0hUOiAzcHgnIG5hbWU9dHh0UGFnZUlkcyB0eXBlPSdjaGVja2JveCcgdmFsdWU9Jzc3MDI4MDgxJz48L3RkPg0KPHRkIHN0eWxlPSdQQURESU5HLUJPVFRPTTogNXB4JyB2YWxpZ249J3RvcCcgYWxpZ249bGVmdD5Zb3VyIEJ1eWluZyBQb3dlcjwvdGQ+DQo8dHIgaWQ9dHJJdGVtPg0KPHRkIHZhbGlnbj0ndG9wJz48aW5wdXQgc3R5bGU9J01BUkdJTi1SSUdIVDogM3B4JyBuYW1lPXR4dFBhZ2VJZHMgdHlwZT0nY2hlY2tib3gnIHZhbHVlPSc3NzAyODA3OCc+PC90ZD4NCjx0ZCBzdHlsZT0nUEFERElORy1CT1RUT006IDVweCcgdmFsaWduPSd0b3AnIGFsaWduPWxlZnQ+WW91ciBEb3duIFBheW1lbnQ8L3RkPg0KPHRyIGlkPXRySXRlbT4NCjx0ZCB2YWxpZ249J3RvcCc+PGlucHV0IHN0eWxlPSdNQVJHSU4tUklHSFQ6IDNweCcgbmFtZT10eHRQYWdlSWRzIHR5cGU9J2NoZWNrYm94JyB2YWx1ZT0nNzcwMjgwNTQnPjwvdGQ+DQo8dGQgc3R5bGU9J1BBRERJTkctQk9UVE9NOiA1cHgnIHZhbGlnbj0ndG9wJyBhbGlnbj1sZWZ0PllvdXIgRklDTyBzY29yZTwvdGQ+DQo8L3RhYmxlPg0KZAIaDw8WAh4UVmFsaWRhdGlvbkV4cHJlc3Npb24FK1tcd1wtX10rKFwuW1x3XC1fXSspKkBbXHdcLV9dKyhcLltcd1wtX10rKStkZAIVD2QWBAICDxYCHwAF80c8ZGl2IGNsYXNzPSd4cy1mb290ZXItdGV4dCc+PHN0eWxlPg0KICAgIC5jb2wtbWQtNSwgLmNvbC1tZC03IHsNCiAgICBtYXJnaW4tdG9wOiA4cHg7DQogICAgbWFyZ2luLWJvdHRvbTogOHB4Ow0KfQ0KICAgIC5jb2wtc20tMTIgew0KICAgICAgICBtYXJnaW4tdG9wOiAwcHg7DQogICAgICAgIG1hcmdpbi1ib3R0b206IDBweDsNCiAgICB9DQo8L3N0eWxlPg0KDQo8ZGl2IGNsYXNzPSJ4cy1zaXRlLWNvbnRhaW5lciI+DQo8ZGl2IGNsYXNzPSJjb250YWluZXItZmx1aWQiPg0KICAgICAgICA8ZGl2IGNsYXNzPSJjb2wtc20tMTIgdGV4dC1jZW50ZXIiPg0KICAgICAgICAgICAgPGgxPlRoZSBSaWNlIEdyb3VwLCBJbmMuPC9oMT4NCiAgICAgICAgICAgIDxhIGNsYXNzPSJidG4gYnRuLWxnIGJ0bi1wcmltYXJ5IGhpZGRlbi1tZCBoaWRkZW4tbGciIHN0eWxlPSJjb2xvcjogI2ZmZjsiIGhyZWY9InRlbDoyMTQtODA4LTMxMDAiPiBDYWxsIFVzPC9hPiANCiAgICAgICAgICAgIDxhIGNsYXNzPSJidG4gYnRuLWxnIGJ0bi1wcmltYXJ5IGhpZGRlbi1tZCBoaWRkZW4tbGciIHN0eWxlPSJjb2xvcjogI2ZmZjsiIGhyZWY9Im1haWx0bzpicmVudEByaWNlZ3JvdXBpbmMuY29tIj4gRW1haWwgVXM8L2E+DQogICAgICAgICAgICA8ZGl2IGNsYXNzPSJoaWRkZW4teHMgaGlkZGVuLXNtIj4gDQogICAgICAgICAgICAgICAgPGkgY2xhc3M9ImZhIGZhLXBob25lIj48L2k+IDxhIGhyZWY9InRlbDoyMTQtODA4LTMxMDAiPiAoMjE0KSA4MDgtMzEwMDwvYT4gfCA8aSBjbGFzcz0iZmEgZmEtZW52ZWxvcGUiPjwvaT4gPGEgaHJlZj0ibWFpbHRvOmJyZW50QHJpY2Vncm91cGluYy5jb20iPiBicmVudEByaWNlZ3JvdXBpbmMuY29tPC9hPg0KICAgICAgICAgICAgPC9kaXY+DQogICAgICAgICAgICA8ZGl2IGNsYXNzPSJoaWRkZW4tbWQgaGlkZGVuLWxnIj48YnI+PC9kaXY+DQogICAgICAgICAgICA8YWRkcmVzcz43MDEzIE1pbGxzIEJyYW5jaCBDaXIuIHwgUGxhbm8sIFRYIDc1MDI0PC9hZGRyZXNzPiANCiAgICAgICAgICAgIA0KICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0iY29udGFpbmVyIj4NCiAgPGg0Pk1MU8KuIERJU0NMQUlNRVI8L2g0PjxwPkNsaWNrIGhlcmUgZm9yPGJyPjxhIGhyZWY9Imh0dHA6Ly93d3cudHJlYy50ZXhhcy5nb3YvZm9ybXMvaW5mb3JtYXRpb24tYWJvdXQtYnJva2VyYWdlLXNlcnZpY2VzIj5JTkZPUk1BVElPTiBBQk9VVCBCUk9LRVJBR0UgU0VSVklDRVM8L2E+PGJyPjxicj48YSBocmVmPSIjZGVtbyIgY2xhc3M9ImJ0biBidG4taW5mbyIgZGF0YS10b2dnbGU9ImNvbGxhcHNlIj5TaG93IE1vcmU8L2E+PC9wPjxkaXYgaWQ9ImRlbW8iIGNsYXNzPSJjb2xsYXBzZSI+DQogICAgwqkgMjAxNyBOb3J0aCBUZXhhcyBSZWFsIEVzdGF0ZSBJbmZvcm1hdGlvbiBTeXN0ZW1zLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuIERpc2NsYWltZXI6IEFsbCBpbmZvcm1hdGlvbiBkZWVtZWQgcmVsaWFibGUgYnV0IG5vdCBndWFyYW50ZWVkIGFuZCBzaG91bGQgYmUgaW5kZXBlbmRlbnRseSB2ZXJpZmllZC4gQWxsIHByb3BlcnRpZXMgYXJlIHN1YmplY3QgdG8gcHJpb3Igc2FsZSwgY2hhbmdlIG9yIHdpdGhkcmF3YWwuIE5laXRoZXIgbGlzdGluZyBicm9rZXIocykgbm9yIFRoZSBSaWNlIEdyb3VwLCBJbmMuIHNoYWxsIGJlIHJlc3BvbnNpYmxlIGZvciBhbnkgdHlwb2dyYXBoaWNhbCBlcnJvcnMsIG1pc2luZm9ybWF0aW9uLCBtaXNwcmludHMgYW5kIHNoYWxsIGJlIGhlbGQgdG90YWxseSBoYXJtbGVzcy4gVGhlIGRhdGFiYXNlIGluZm9ybWF0aW9uIGhlcmVpbiBpcyBwcm92aWRlZCBmcm9tIGFuZCBjb3B5cmlnaHRlZCBieSB0aGUgTm9ydGggVGV4YXMgUmVhbCBFc3RhdGUgSW5mb3JtYXRpb24gU3lzdGVtcywgSW5jLiBOVFJFSVMgZGF0YSBtYXkgbm90IGJlIHJlcHJvZHVjZWQgb3IgcmVkaXN0cmlidXRlZCBhbmQgaXMgb25seSBmb3IgcGVvcGxlIHZpZXdpbmcgdGhpcyBzaXRlLiBBbGwgaW5mb3JtYXRpb24gcHJvdmlkZWQgaXMgZGVlbWVkIHJlbGlhYmxlIGJ1dCBpcyBub3QgZ3VhcmFudGVlZCBhbmQgc2hvdWxkIGJlIGluZGVwZW5kZW50bHkgdmVyaWZpZWQuIFRoZSBhZHZlcnRpc2VtZW50cyBoZXJlaW4gYXJlIG1lcmVseSBpbmRpY2F0aW9ucyB0byBiaWQgYW5kIGFyZSBub3Qgb2ZmZXJzIHRvIHNlbGwgd2hpY2ggbWF5IGJlIGFjY2VwdGVkLiBBbGwgcHJvcGVydGllcyBhcmUgc3ViamVjdCB0byBwcmlvciBzYWxlIG9yIHdpdGhkcmF3YWwuIEFsbCByaWdodHMgYXJlIHJlc2VydmVkIGJ5IGNvcHlyaWdodC4NCiAgPC9kaXY+DQo8L2Rpdj4NCiAgICAgICAgICAgIA0KICAgIDwvZGl2Pg0KICAgIA0KIA0KICAgIA0KICAgICAgICA8ZGl2IGNsYXNzPSJjb2wtc20tMTIgdGV4dC1jZW50ZXIiPg0KICAgICAgICAgICAgPHVsIGNsYXNzPSJsaXN0LWlubGluZSI+DQogICAgICAgICAgICAgICAgPGxpPg0KICAgICAgICAgICAgICAgICAgICA8YSBocmVmPSIvL2ZhY2Vib29rLmNvbS9yaWNlZ3JvdXBpbmMiIHRhcmdldD0iX2JsYW5rIj4gDQogICAgICAgICAgICAgICAgICAgICAgICA8c3BhbiBjbGFzcz0iZmEtc3RhY2sgZmEtMngiPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxpIGNsYXNzPSJmYSBmYS1zcXVhcmUgZmEtc3RhY2stMngiPjwvaT4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aSBjbGFzcz0iZmEgZmEtZmFjZWJvb2sgZmEtc3RhY2stMXgiPjwvaT4NCiAgICAgICAgICAgICAgICAgICAgICAgIDwvc3Bhbj4gDQogICAgICAgICAgICAgICAgICAgIDwvYT4NCiAgICAgICAgICAgICAgICA8L2xpPg0KICAgICAgICAgICAgICAgIDxsaT4NCiAgICAgICAgICAgICAgICAgICAgPGEgaHJlZj0iLy93d3cudHdpdHRlci5jb20vcmljZWdyb3VwaW5jIiB0YXJnZXQ9Il9ibGFuayI+IA0KICAgICAgICAgICAgICAgICAgICAgICAgPHNwYW4gY2xhc3M9ImZhLXN0YWNrIGZhLTJ4Ij4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aSBjbGFzcz0iZmEgZmEtc3F1YXJlIGZhLXN0YWNrLTJ4Ij48L2k+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGkgY2xhc3M9ImZhIGZhLXR3aXR0ZXIgZmEtc3RhY2stMXgiPjwvaT4NCiAgICAgICAgICAgICAgICAgICAgICAgIDwvc3Bhbj4gDQogICAgICAgICAgICAgICAgICAgIDwvYT4NCiAgICAgICAgICAgICAgICA8L2xpPg0KICAgICAgICAgICAgICAgIDxsaT4NCiAgICAgICAgICAgICAgICAgICAgPGEgaHJlZj0iLy93d3cueWVscC5jb20vYml6L3RoZS1yaWNlLWdyb3VwLXBsYW5vP29zcT10aGUrcmljZStncm91cCUyQytpbmMuIiB0YXJnZXQ9Il9ibGFuayI+IA0KICAgICAgICAgICAgICAgICAgICAgICAgPHNwYW4gY2xhc3M9ImZhLXN0YWNrIGZhLTJ4Ij4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aSBjbGFzcz0iZmEgZmEtc3F1YXJlIGZhLXN0YWNrLTJ4Ij48L2k+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGkgY2xhc3M9ImZhIGZhLXllbHAgZmEtc3RhY2stMXgiPjwvaT4NCiAgICAgICAgICAgICAgICAgICAgICAgIDwvc3Bhbj4gDQogICAgICAgICAgICAgICAgICAgIDwvYT4NCiAgICAgICAgICAgICAgICA8L2xpPg0KICAgICAgICAgICAgICAgIDxsaT4NCiAgICAgICAgICAgICAgICAgICAgPGEgaHJlZj0iLy9saW5rZWRpbi5jb20vaW4vYnJlbnRyaWNlIiB0YXJnZXQ9Il9ibGFuayI+IA0KICAgICAgICAgICAgICAgICAgICAgICAgPHNwYW4gY2xhc3M9ImZhLXN0YWNrIGZhLTJ4Ij4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aSBjbGFzcz0iZmEgZmEtc3F1YXJlIGZhLXN0YWNrLTJ4Ij48L2k+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGkgY2xhc3M9ImZhIGZhLWxpbmtlZGluIGZhLXN0YWNrLTF4Ij48L2k+DQogICAgICAgICAgICAgICAgICAgICAgICA8L3NwYW4+IA0KICAgICAgICAgICAgICAgICAgICA8L2E+DQogICAgICAgICAgICAgICAgPC9saT4NCiAgICAgICAgICAgIDwvdWw+IA0KICAgICAgICA8L2Rpdj4NCiAgICA8ZGl2IGNsYXNzPSJyb3ciPg0KICAgICAgICA8ZGl2IGNsYXNzPSJjb2wtc20tMTIiPg0KICAgICAgICA8cCBzdHlsZT0idGV4dC1hbGlnbjpjZW50ZXI7Ym9yZGVyOm5vbmU7IG1hcmdpbi10b3A6MTBweDsiPg0KICAgICAgICAgICAgPGltZyBzcmM9Ii94c2l0ZXMvYWdlbnRzL0ZhaXJ3YXlJbmRlcGVuZGVudE1vcnRnYWdlQ29ycG9yYXRpb24yL0NvbnRlbnQvVXBsb2FkZWRGaWxlcy9FSE8td2hpdGUucG5nIiBzdHlsZT0id2lkdGg6IDY1cHg7IiBhbHQ9IkVITyBsb2dvIj4NCiAgICAgICAgICAgIDwhLS08aW1nIHNyYz0iIyIgc3R5bGU9Im1hcmdpbi1sZWZ0OiAyNXB4OyB3aWR0aDogMTUwcHg7IiBhbHQ9Ik1MUyBsb2dvIj4tLT4NCiAgICAgICAgPC9wPg0KICAgICAgICA8L2Rpdj4NCiAgICA8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQoNCjxkaXYgY2xhc3M9ImNvbC1zbS0xMiB0ZXh0LWNlbnRlciI+DQogIDxoND5BUkVBUyBXRSBDT1ZFUjwvaDQ+DQogIDxhIGhyZWY9IiNkZW1vMiIgY2xhc3M9ImJ0biBidG4taW5mbyIgZGF0YS10b2dnbGU9ImNvbGxhcHNlIj5TaG93IE1vcmU8L2E+DQogIDxkaXYgaWQ9ImRlbW8yIiBjbGFzcz0iY29sbGFwc2UiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogYXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogc21hbGw7Ij48c3Bhbj48c3BhbiBzdHlsZT0iIj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiKDAsIDAsIDApOyI+NzUwMDIgNzUwMTMgNzUwMjMgNzUwMjQgNzUwMjUgNzUwMzQgNzUwMzUgNzUwNjggNzUwNzAgNzUwNzQgNzUwNzUgNzUwOTMgNzUwOTggNzUyMDEgNzUyMDIgNzUyMDQgNzUyMDYgNzUyMDggNzUyMTEgNzUyMTQgNzUyMTkgNzUyMjQgNzUyMzMgNzUyMzUgNzUyNTIgNzUyODcgQWRkaXNvbiBBbGxlbiBBbm5hIEFyZ3lsZSBBcmxpbmd0b24gQXVicmV5IEF6bGUgQmFsY2ggU3ByaW5ncyBCYXJ0b252aWxsZSBCZWRmb3JkIEJlbmJyb29rIEJsdWUgUmlkZ2UgQnVybGVzb24gQ2Fycm9sbHRvbiBDZWRhciBIaWxsIENlbGluYSBDb2xsZXl2aWxsZSBDb21iaW5lIENvcHBlbGwgQ29wcGVyIENhbnlvbiBDb3JpbnRoIENyYW5kYWxsIENyb3NzIFJvYWRzIENyb3dsZXkgRGFsbGFzIERhbHdvcnRoaW5ndG9uIEdhcmRlbnMgRGVudG9uIERlc290byBEaXNoIERvdWJsZSBPYWsgRHVuY2FudmlsbGUgRWRnZWNsaWZmIFZpbGxhZ2UgRXVsZXNzIEV2ZXJtYW4gRmFpcnZpZXcgRmFybWVycyBCcmFuY2ggRmFybWVyc3ZpbGxlIEZhdGUgRmxvd2VyIE1vdW5kIEZvcmVzdCBIaWxsIEZvcm5leSBGb3J0IFdvcnRoIEZyaXNjbyBHYXJsYW5kIEdsZW5uIEhlaWdodHMgR3JhbmQgUHJhaXJpZSBHcmFwZXZpbmUgSGFsdG9tIENpdHkgSGFzbGV0IEhlYXJ0bGFuZCBIZWF0aCBIaWNrb3J5IENyZWVrIEhpZ2hsYW5kIFBhcmsgSGlnaGxhbmQgVmlsbGFnZSBIdXJzdCBIdXRjaGlucyBJcnZpbmcgSm9zZXBoaW5lIEp1c3RpbiBLYXVmbWFuIEtlbGxlciBLZW1wIEtlbm5lZGFsZSBLZXNzbGVyIFBhcmsgS3J1Z2VydmlsbGUgS3J1bSBMYWtlIERhbGxhcyBMYWtlIFdvcnRoIExha2VzaWRlIExha2V3b29kIFZpbGxhZ2UgTGFuY2FzdGVyIExhbnRhbmEgTGF2b24gTGV3aXN2aWxsZSBMaXR0bGUgRWxtIEx1Y2FzIE1hYmFuayBNYW5zZmllbGQgTWNraW5uZXkgTWNsZW5kb24gQ2hpc2hvbG0gTWVsaXNzYSBNZXNxdWl0ZSBNdXJwaHkgTmV2YWRhIE5vcnRoIFJpY2hsYW5kIEhpbGxzIE5vcnRobGFrZU9hayBMYXduIE9hayBQb2ludCBQYW50ZWdvIFBhcmtlciBQZWxpY2FuIEJheSBQaWxvdCBQb2ludCBQbGFubyBQb25kZXIgUHJpbmNldG9uIFByb3NwZXIgUHJvdmlkZW5jZSBWaWxsYWdlIFJpY2hhcmRzb24gUmljaGxhbmQgSGlsbHMgUml2ZXIgT2FrcyBSb2Fub2tlIFJvY2t3YWxsIFJvd2xldHQgUm95c2UgQ2l0eSBTYWNoc2UgU2FnaW5hdyBTYW5nZXJTYW5zb20gUGFyayBTYXZhbm5haCBTY3VycnkgU2VhZ292aWxsZSBTaGFkeSBTaG9yZXMgU2xpZGVsbCBTb3V0aGxha2UgU3QgUGF1bCBTdW5ueXZhbGUgVGFsdHkgVGVycmVsbCBUaGUgQ29sb255IFRyb3BoeSBDbHViIFVuaXZlcnNpdHkgUGFyayBXYXRhdWdhIFdlc3RsYWtlIFdlc3RvbiBXZXN0b3ZlciBIaWxscyBXaGl0ZSBTZXR0bGVtZW50IFdpbGxzIFBvaW50IFdpbG1lciBXeWxpZTwvc3Bhbj48L3NwYW4+PC9zcGFuPjwvc3Bhbj48YnI+PC9kaXY+DQo8L2Rpdj4NCjwhLS0NCjxkaXYgY2xhc3M9ImNvbnRhaW5lciI+DQogIDxoND5NTFPCriBESVNDTEFJTUVSPC9oND4NCiAgPGEgaHJlZj0iI2RlbW8iIGNsYXNzPSJidG4gYnRuLWluZm8iIGRhdGEtdG9nZ2xlPSJjb2xsYXBzZSI+U2hvdyBNb3JlPC9hPg0KICA8ZGl2IGlkPSJkZW1vIiBjbGFzcz0iY29sbGFwc2UiPg0KICAgIMKpIDIwMTcgTm9ydGggVGV4YXMgUmVhbCBFc3RhdGUgSW5mb3JtYXRpb24gU3lzdGVtcywgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLiBEaXNjbGFpbWVyOiBBbGwgaW5mb3JtYXRpb24gZGVlbWVkIHJlbGlhYmxlIGJ1dCBub3QgZ3VhcmFudGVlZCBhbmQgc2hvdWxkIGJlIGluZGVwZW5kZW50bHkgdmVyaWZpZWQuIEFsbCBwcm9wZXJ0aWVzIGFyZSBzdWJqZWN0IHRvIHByaW9yIHNhbGUsIGNoYW5nZSBvciB3aXRoZHJhd2FsLiBOZWl0aGVyIGxpc3RpbmcgYnJva2VyKHMpIG5vciBSb2dlcnMgSGVhbHkgYW5kIEFzc29jaWF0ZXMgc2hhbGwgYmUgcmVzcG9uc2libGUgZm9yIGFueSB0eXBvZ3JhcGhpY2FsIGVycm9ycywgbWlzaW5mb3JtYXRpb24sIG1pc3ByaW50cyBhbmQgc2hhbGwgYmUgaGVsZCB0b3RhbGx5IGhhcm1sZXNzLiBUaGUgZGF0YWJhc2UgaW5mb3JtYXRpb24gaGVyZWluIGlzIHByb3ZpZGVkIGZyb20gYW5kIGNvcHlyaWdodGVkIGJ5IHRoZSBOb3J0aCBUZXhhcyBSZWFsIEVzdGF0ZSBJbmZvcm1hdGlvbiBTeXN0ZW1zLCBJbmMuIE5UUkVJUyBkYXRhIG1heSBub3QgYmUgcmVwcm9kdWNlZCBvciByZWRpc3RyaWJ1dGVkIGFuZCBpcyBvbmx5IGZvciBwZW9wbGUgdmlld2luZyB0aGlzIHNpdGUuIEFsbCBpbmZvcm1hdGlvbiBwcm92aWRlZCBpcyBkZWVtZWQgcmVsaWFibGUgYnV0IGlzIG5vdCBndWFyYW50ZWVkIGFuZCBzaG91bGQgYmUgaW5kZXBlbmRlbnRseSB2ZXJpZmllZC4gVGhlIGFkdmVydGlzZW1lbnRzIGhlcmVpbiBhcmUgbWVyZWx5IGluZGljYXRpb25zIHRvIGJpZCBhbmQgYXJlIG5vdCBvZmZlcnMgdG8gc2VsbCB3aGljaCBtYXkgYmUgYWNjZXB0ZWQuIEFsbCBwcm9wZXJ0aWVzIGFyZSBzdWJqZWN0IHRvIHByaW9yIHNhbGUgb3Igd2l0aGRyYXdhbC4gQWxsIHJpZ2h0cyBhcmUgcmVzZXJ2ZWQgYnkgY29weXJpZ2h0Lg0KICA8L2Rpdj4NCjwvZGl2Pg0KLS0+DQoNCg0KPCEtLQ0KPGRpdiBjbGFzcz0iaGlkZGVuLXhzIiBpZD0ic3RpY2t5Zm9vdGVyIj5MaWtlIHRoaXMgc2l0ZT8gQ2FsbCAxLTg2Ni0zMDAtMTU1MCBhbmQgd2XigJlsbCBwZXJzb25hbGl6ZSBpdCBmb3IgeW91LiA8YSBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2siIGhyZWY9Im1haWx0bzpicmVudEByaWNlZ3JvdXBpbmMuY29tIj48YnV0dG9uIHR5cGU9ImJ1dHRvbiIgY2xhc3M9ImJ0biBidG4taW5mbyI+UmVxdWVzdCBNb3JlIEluZm8gPHNwYW4gY2xhc3M9ImdseXBoaWNvbiBnbHlwaGljb24tZWRpdCI+PC9zcGFuPjwvYnV0dG9uPjwvYT48L2Rpdj4NCg0KPGRpdiBjbGFzcz0idmlzaWJsZS14cyIgaWQ9InN0aWNreWZvb3RlciI+TGlrZSB0aGlzIHNpdGU/IDxhIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9jayIgaHJlZj0idGVsOjg2Ni0zMDAtMTU1MCI+PGJ1dHRvbiB0eXBlPSJidXR0b24iIGNsYXNzPSJidG4gYnRuLWluZm8iPlJlcXVlc3QgTW9yZSBJbmZvIDxzcGFuIGNsYXNzPSJnbHlwaGljb24gZ2x5cGhpY29uLWVkaXQiPjwvc3Bhbj48L2J1dHRvbj48L2E+PC9kaXY+DQotLT4NCg0KPHNjcmlwdD4NCiQoImEubmF2YmFyLWJyYW5kLmhpZGRlbi14cy54cy1jb21wYW55LW5hbWUueHMtY29tcGFueS1sb2dvIikucmVtb3ZlQ2xhc3MoImhpZGRlbi14cyIpOw0KPC9zY3JpcHQ+PC9kaXY+PGJyLz48ZGl2IGNsYXNzPSd0YWJsZVRleHQnIHN0eWxlPSd0ZXh0LWFsaWduOiBjZW50ZXI7Jz48ZGl2IGNsYXNzPSd4cy1zaXRlLWZvb3Rlci1jb250YWN0LWluZm8nPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSd4cy1zaXRlLWZvb3Rlci1jb3B5cmlnaHQnPlBvcnRpb25zIENvcHlyaWdodCAmY29weTsgMjAxOCAgUGlwZWxpbmUgUk9JLCBMTEM8YnI+QW5vdGhlciB3ZWJzaXRlIGJ5IDxhIGhyZWY9J2h0dHA6Ly93d3cucGlwZWxpbmVyb2kuY29tLycgdGFyZ2V0PSdfYmxhbmsnPlBpcGVsaW5lIFJPSS48L2E+Jm5ic3A7IHwgPGEgaHJlZj0naHR0cHM6Ly9GYWlyd2F5SW5kZXBlbmRlbnRNb3J0Z2FnZUNvcnBvcmF0aW9uMi5wcm9pd2Vic2l0ZXMuY29tL2FwcHMvYWxhbW9kZWxvZ2luL2xvZ2luLmFzcHgnPkFkbWluIExvZ2luPC9hPiB8IDxhIGhyZWY9Jy9UZXJtc09mVXNlJz5UZXJtcyBvZiBVc2U8L2E+IHwgPGEgaHJlZj0nL1NpdGVNYXAnPlNpdGUgTWFwPC9hPiB8IDxhIGhyZWY9Jy9MaXN0aW5nUHJvcGVydGllcy9kZWZhdWx0LmFzcHgnPkFyZWEgTGlzdGluZ3M8L2E+PGJyPkFsbCByYXRlLCBwYXltZW50LCBhbmQgYXJlYSBpbmZvcm1hdGlvbiBhcmUgZXN0aW1hdGVzIGFuZCBhcHByb3hpbWF0aW9ucyBvbmx5LjwvZGl2PjwvZGl2PjxtZXRhIGlkPSdjeTAxJyBkYXRhLWtleT0iRlJCUCIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSdjeTAyJyBkYXRhLWtleT0iNDY3VCIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSdjeTAzJyBkYXRhLWtleT0iSTk2VCIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSdjeTA0JyBkYXRhLWtleT0iWjUwQyIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSdjeTA1JyBkYXRhLWtleT0iMk1MWiIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSdjeTA2JyBkYXRhLWtleT0iR1dUVyIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSdjeTA3JyBkYXRhLWtleT0iUzJJNiIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSdjeTA4JyBkYXRhLWtleT0iNkg0MiIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSdjeTA5JyBkYXRhLWtleT0iVVpITiIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSdjeTEwJyBkYXRhLWtleT0iQUVITSIgY2xhc3M9IkNyeXB0byIvPjxtZXRhIGlkPSJjeWtleSIgZGF0YS1rZXk9IiIvPmQCBg8PFgIeB1Zpc2libGVoZGRkOFBqoqmHZtcHSJRO1ExGyuj1x7ZsWL2Ri7IGRrD0uQk=" />


<script type="text/javascript" src="/ajaxpro/prototype.ashx"></script>
<script type="text/javascript" src="/ajaxpro/core.ashx"></script>
<script type="text/javascript" src="/ajaxpro/converter.ashx"></script>
<script type="text/javascript" src="/ajaxpro/XSites.LeadGenProcessor,XSites.ashx"></script>

<script src="/ScriptResource.axd?d=L4kBa2SNaxgp9Bx33sZMYlgfrLl9liSn8HX0ZP3tCdK7GzB_OvglLwA2ydq9uZgTMri73SA0BU71ieQMjiU-tCgkd0bjh4_7-JfvoileWpHHiWIryuF_kAitVbA-efPC0&amp;t=23c9c237" type="text/javascript"></script>
<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="03F52E9C" />
<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEdAATWlaCn3BAutQR98IAmmlIq5VwDr6zGYPm4YRKDFLyxXQQzmMepzi8cPLmhi5EsND5BlCJ4RCHc7qPwBMe4Fm2wJwld2UuFFEaEn0E/Q+P3pRtuBCAxUyW9/DstcS+ocbM=" />
			
<div class="ta-layout-fullscreen">
    <header>
        <div class="xs-header">
		    <div class="xs-company-motto hidden">
			    <font color='#000000' size='26' face='Monotype Corsiva'>When Character Matters</font>

		    </div>
	    </div>
	    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		    <div class="navbar-header">
			    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#xs-navbar-collapse">
				    <span class="sr-only">Toggle Navigation</span> <span class="icon-bar"></span>
				    <span class="icon-bar"></span><span class="icon-bar"></span>
			    </button>
			    <a href="/" class="navbar-brand hidden-xs xs-company-name xs-company-logo">
				    
	<img class="xs-company-logo" src="/xSites/Agents/FairwayIndependentMortgageCorporation2/logo26487.jpg" alt="Logo">

				    
			    </a>

			    <a href="/" class="navbar-brand visible-xs xs-company-name">
				    
			    </a>
		    </div>
		    <div class="collapse navbar-collapse" id="xs-navbar-collapse">
			    <ul class="nav navbar-nav navbar-right">
				    
				    
				<li class="has-children dropdown">
					
					<a href="/Home">
						<span class="pull-left">
							Home
						</span>
						<span class="pull-right">&nbsp; <i class="fa fa-caret-down"></i></span>
						<div class="clearfix"></div>
					</a>

					<ul class="dropdown-menu">
						
								<li>
									<a href="/pressrelease2018">
										Press Release Jan. 2018
									</a>
								</li>
							
								<li>
									<a href="/StaffProfiles">
										Staff Profiles
									</a>
								</li>
							
								<li>
									<a href="/WhyChooseUs!">
										Why Choose Us!
									</a>
								</li>
							
								<li>
									<a href="/EthicsinRealEstate">
										Ethics in Real Estate
									</a>
								</li>
							
								<li>
									<a href="/Testimonials">
										Testimonials
									</a>
								</li>
							
								<li>
									<a href="/ContactUs">
										Contact Us
									</a>
								</li>
							
					</ul>
				</li>
			
				<li class="has-children dropdown">
					
					<a href="/ForBuyers">
						<span class="pull-left">
							Buyers
						</span>
						<span class="pull-right">&nbsp; <i class="fa fa-caret-down"></i></span>
						<div class="clearfix"></div>
					</a>

					<ul class="dropdown-menu">
						
								<li>
									<a href="/FirstTimeHomeBuyers">
										First Time Home Buyers
									</a>
								</li>
							
								<li>
									<a href="/SearchAreaHomes">
										Search Area Homes
									</a>
								</li>
							
								<li>
									<a href="/OurListings">
										Our Listings
									</a>
								</li>
							
					</ul>
				</li>
			
				<li>
					<a href="/SellingYourHome">
						Sellers
					</a>
				</li>
			
				<li class="has-children dropdown">
					
					<a href="/StagingServices">
						<span class="pull-left">
							Staging Services
						</span>
						<span class="pull-right">&nbsp; <i class="fa fa-caret-down"></i></span>
						<div class="clearfix"></div>
					</a>

					<ul class="dropdown-menu">
						
								<li>
									<a href="/StagingChecklist">
										Staging Checklist
									</a>
								</li>
							
					</ul>
				</li>
			
				<li class="has-children dropdown">
					
					<a href="/resources">
						<span class="pull-left">
							FREE Resources
						</span>
						<span class="pull-right">&nbsp; <i class="fa fa-caret-down"></i></span>
						<div class="clearfix"></div>
					</a>

					<ul class="dropdown-menu">
						
								<li>
									<a href="/ComingSoon">
										COMING SOON Listings
									</a>
								</li>
							
								<li>
									<a href="/KingsRidgeCMA">
										Kings Ridge CMA
									</a>
								</li>
							
								<li>
									<a href="/TheLegendsCMA">
										The Legends CMA
									</a>
								</li>
							
								<li>
									<a href="/TheCascadesCMA">
										The Cascades CMA
									</a>
								</li>
							
					</ul>
				</li>
			
				<li class="has-children dropdown">
					
					<a href="/Commercial">
						<span class="pull-left">
							Commercial
						</span>
						<span class="pull-right">&nbsp; <i class="fa fa-caret-down"></i></span>
						<div class="clearfix"></div>
					</a>

					<ul class="dropdown-menu">
						
								<li>
									<a href="/smallbusiness">
										For Small Business
									</a>
								</li>
							
								<li>
									<a href="/LeaseAnalysis">
										Lease Analysis
									</a>
								</li>
							
								<li>
									<a href="/SiteSelectionServices">
										Site Selection Services
									</a>
								</li>
							
					</ul>
				</li>
			
				<li>
					<a href="/RequestIndustryInfo">
						Request Industry Info
					</a>
				</li>
			
				<li>
					<a href="/WhatsMyPropertyWorth">
						What's My Property Worth?
					</a>
				</li>
			
				    <li>&emsp;</li>
			    </ul>
			    <div class="clearfix"></div>
		    </div>
	    </nav>
    </header>
    <section>
	    <div class="xs-primary-content">
		    <div class="col-sm-12">
			    
	
	

<script id="clientEventHandlersJS" language="javascript">
			<!--

	function btnDeselectAll_onclick() {
		for ( var x = 0; x < document.forms[ 0 ].txtPageIds.length; x++ ) {
			document.forms[ 0 ].txtPageIds[ x ].checked = false;
		}
	}

	function btnSelectAll_onclick() {
		for ( var x = 0; x < document.forms[ 0 ].txtPageIds.length; x++ )
		{
			document.forms[ 0 ].txtPageIds[ x ].checked = true;
		}
	}

	function webserviceCallBack() {
		if (event.result.value == true) {
			alert("Your information was successfully submitted.");
			document.all.txtName.value = "";
			document.all.txtEmail.value = "";
			document.all.txtPhone.value = "";
			btnDeselectAll_onclick();
		}
		else {
			alert("There was an error submitting the form.");
		}
		btnSubmit.disabled = false;
	}

	function GetPageString() {
		var szReturn = new String();
		for (var x = 0; x < document.forms[0].txtPageIds.length; x++) {
			if (document.forms[0].txtPageIds[x].checked) {
				szReturn = szReturn + document.forms[0].txtPageIds[x].value + ",";
			}
		}
		if (szReturn.length == 0) {
			szReturn = document.forms[0].txtPageIds.value + ",";
		}
		return szReturn.slice(0, szReturn.length - 1);
	}

	function Form1_onsubmit() {


		document.body.style.cursor = "wait";
		//btnSubmit.disabled=true;

		if (Page_IsValid) {
			var FormElements = "";
			for (i = 0; i < document.forms[0].elements.length; i++) {
				FormElements += document.forms[0].elements[i].id + String.fromCharCode(29) + document.forms[0].elements[i].value + String.fromCharCode(30);
			}
			FormElements = escape(FormElements);

			var iCallID = XSites.LeadGenProcessor.RequestReports(FormElements, GetPageString());

			if (iCallID.value == true) {
				alert("Your information was successfully submitted.");
				document.all.txtName.value = "";
				document.all.txtEmail.value = "";
				document.all.txtPhone.value = "";
				btnDeselectAll_onclick();
			}
			else {
				alert("There was an error submitting the form.");
			}
			//asyncronous call
		}
		else {
			//btnSubmit.disabled=false;
		}
		document.body.style.cursor = "default";
		return false;
	}
	function hasCheckedPages() {
		for (var x = 0; x < document.forms[0].txtPageIds.length; x++) {
			if (document.forms[0].txtPageIds[x].checked) {
				return true;
			}
		}
		if (document.forms[0].txtPageIds.checked) {
			return true;
		}
		return false;
	}

	function HandleSubmit() {
		if (hasCheckedPages()) {
			Form1_onsubmit();
		}
		else {
			alert('Please select a report before submitting'); 
		}
	}
			

//-->
</script>

	<table id="tblMain" cellpadding="0" cellspacing="0" width="568" border="0">
		<TR height="20">
			<TD colSpan="2">&nbsp;</TD>
		</TR>
		<TR height="20">
			<TD style="BORDER-BOTTOM: black 1px solid"><B>Real Estate Information Reports</B></TD>
			<td style="WIDTH:5px"></td>
		</TR>
		<TR vAlign="top">
			<td colspan="2">
				<table cellpadding="0" cellspacing="0" width="100%" height="100%">
					<tr valign="top">
						<TD>
							<TABLE>
								<TR valign="top">
									<TD style="HEIGHT: 176px">
<script type="text/javascript" src="/scripts/flashobject_fp8.js"></script>
<style type="text/css">
    .xs-dynamic-content-manager 
    {
        width: 100%;
        border-spacing: 0;
    }
    .xs-page-content
    {
        vertical-align: top;
    }
    .xs-page-content-inner 
    {
        padding: 5px;
    }
    
    .xs-dynamic-content
    {
        width: 192px;
        vertical-align: top;
        margin: 0;
        padding: 0;
        border: 0;
    }
    
    .xs-dynamic-content-inner
    {
        border-left: 1px solid;
        white-space: normal;
        padding: 5px;
    }
    
    .xs-dynamic-content-inner table
    {
        margin: auto;
    }
    
    .clearfix
    {
        content: ".";
        visibility: hidden;
        display: block;
        height: 0;
        clear: both;
        zoom: 1;
    }
    
    .dynamic-content-title
    {
        font-weight: bold;
        margin: 1em;
        text-align: center;
    }
    
    .dynamic-content-separator
    {
        margin: 1em 0 1em 0;
        border: none;
        border-top: 1px solid;
        height: 2px;
        display: block;
    }
    footer .clearfix
    {
        visibility: visible;
        height:auto;
    }
</style>
<table class="xs-dynamic-content-manager">
    <tr>
        <td class="xs-page-content">
            <div class="xs-page-content-inner"  >
                <div class=container><br>Buying and selling real estate can be a daunting task, with so much information to be aware of. This page is designed to help educate you in areas in which you may be less familiar. Simply select the topics you'd like more information about and we'll send them to you.</div><br><br><table width=100% border=0 cellpadding=0 cellspacing=0>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028095'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>9 Steps to Owning</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028074'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Applying for a Loan</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='78607011'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Area Homes</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028076'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Bi-Weekly Mortgage</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028061'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Buyers</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028134'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Buying Foreclosures/REO's</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028056'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Closing Costs</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028049'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Closing costs - Ins.</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028048'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Closing costs - loans</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='82321515'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>COMING SOON Listings</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='82268048'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Commercial</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028137'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Contingencies in Contracts</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028093'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Creative Financing</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028044'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Curb Appeal List</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028080'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Documenting Assets</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028064'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Environmental Issues</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028150'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Ethics in Real Estate</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028053'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Find A Home!</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028057'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>First Time Home Buyers</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028154'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Fixer Uppers</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028149'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Flowers Add Curb Appeal!</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77211686'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>For Small Business</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028052'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Free Home Valuation</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='82323714'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>FREE Resources</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028148'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Gated Communities</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028058'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Get Pre-qualified</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028050'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Get the Highest Price</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028094'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Heart of the Matter</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028124'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Holiday Saving</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028125'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Holiday Theft</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028152'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Home Appreciation</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028060'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Home Buyer Checklist</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028143'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Homeowner Warranties</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028055'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>How Escrow Works</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028151'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Improvements That Pay</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028059'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Inspection Tips</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='82330728'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Kings Ridge CMA</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='82321836'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Landlords</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028047'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Lead in the Home</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028133'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Lease Analysis</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028088'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Lender Types</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028138'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Listing Commissions</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028075'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Loan App Checklist</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028083'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Loan Programs</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028085'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Locking in Rates</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028096'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Mold in the Home</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028077'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Mortgage Saving Tips</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028084'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Mortgage Shopping</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028140'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Need a Bridge Loan?</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028090'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Neighborhood Prices</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77525698'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>New Construction</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77213788'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Office Search</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77210851'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Office Space</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028144'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Plumbing and Fixtures</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028127'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Property Management</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77213786'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Property Search</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028041'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Radon Information</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028067'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Real Estate Glossary</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028145'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Real vs. Personal Property</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028128'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Reasons Homes Don't Sell</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77525697'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Relocation</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028118'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Request Industry Info</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='82268047'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Residential</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028039'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Results for You!</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028147'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Role of the MLS</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='78607025'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Search Area Homes</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028097'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Seller Paid Closing</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028069'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Sellers</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028153'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Selling One, Buying Another</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028051'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Selling your own home</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028045'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Setting the Sales Price</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028215'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Short Sale Buyer</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028216'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Short Sale Seller</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028142'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Should you paint?</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028129'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Site Selection Services</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028042'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Staff Profiles</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028092'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Staging Checklist</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028091'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Staging Services</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028089'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Staying Approved</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028046'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Tax Closing Costs</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028130'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Tenant Representation</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028131'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Tenant Space Construction</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77211687'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Testimonials</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028139'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>The Back Yard</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028146'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>The Kitchen</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028136'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>The Listing Contract</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028038'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Title Information</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028135'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Types of Listing Contracts</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028141'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>What's Earnest Money?</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028155'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>What's My Property Worth?</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028037'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Why an inspection?</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028040'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Why Choose Us!</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028036'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Why Title Insurance?</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028126'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Winterize your Home</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028082'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Writing the Offer</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028081'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Your Buying Power</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028078'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Your Down Payment</td>
<tr id=trItem>
<td valign='top'><input style='MARGIN-RIGHT: 3px' name=txtPageIds type='checkbox' value='77028054'></td>
<td style='PADDING-BOTTOM: 5px' valign='top' align=left>Your FICO score</td>
</table>

                
            </div>
        </td>
    
        
    </tr>
</table>

									</TD>
								</TR>
								<TR>
									<TD>&nbsp;</TD>
								</TR>
								<TR>
									<TD>
										<DIV id="divPages"></DIV>
									</TD>
								</TR>
								<TR>
									<TD>&nbsp;</TD>
								</TR>
								<TR>
									<TD align="center"><INPUT language="javascript" id="btnSelectAll" style="WIDTH: 106px; HEIGHT: 24px" onclick="return btnSelectAll_onclick()"
											type="button" value="Select All"> &nbsp;<INPUT language="javascript" id="btnDeselectAll" style="WIDTH: 106px; HEIGHT: 24px" onclick="return btnDeselectAll_onclick()"
											type="button" value="Deselect All">
									</TD>
								</TR>
							</TABLE>
						</TD>
						<TD align="center">
							<TABLE cellSpacing="0" cellPadding="0" height="100%" width="100%">
								<TR>
									<TD align="right"><img src="/graphics/reports.jpg"></TD>
								</TR>
								<TR>
									<TD><B>Send reports to:</B></TD>
								</TR>
								<TR>
									<TD align="center" style="BORDER-TOP: silver 1px solid; BORDER-LEFT: silver 1px solid">
										<table width="100%" cellpadding="0" cellspacing="0">
											<TBODY>
												<tr style="HEIGHT:7px">
													<td></td>
												</tr>
												<tr>
													<td>
														&nbsp;&nbsp;&nbsp;&nbsp;<span id="lblName"><font color="Gray">Name:</font></span>
														<span id="Label2"><font color="Red">*</font></span>
														<br>
														&nbsp;&nbsp;&nbsp;&nbsp;<input name="ctl00$ctl00$content$content$ctl00$txtName" type="text" id="txtName" />
													</td>
												</tr>
												<tr>
													<td>
														&nbsp;&nbsp;&nbsp;&nbsp;<span id="lblEmail"><font color="Gray">E-Mail:</font></span>
														<span id="Label3"><font color="Red">*</font></span>
														<br>
														&nbsp;&nbsp;&nbsp;&nbsp;<input name="ctl00$ctl00$content$content$ctl00$txtEmail" type="text" id="txtEmail" />
													</td>
												</tr>
												<TR>
													<td>
														&nbsp;&nbsp;&nbsp;&nbsp;<span id="lblPhone"><font color="Gray">Phone:</font></span>
														<br>
														&nbsp;&nbsp;&nbsp;&nbsp;<input name="ctl00$ctl00$content$content$ctl00$txtPhone" type="text" id="txtPhone" />
													</td>
												</TR>
												<tr style="HEIGHT:10px">
													<td></td>
												</tr>
											</TBODY>
										</table>
									</TD>
								</TR>
								<TR>
									<TD style="BORDER-LEFT: silver 1px solid">
										&nbsp;&nbsp;&nbsp;&nbsp;<INPUT id="btnSubmit" type="button" onclick="HandleSubmit()" value="Send Reports" name="btnSubmit"> 
										<INPUT id="webservice" style="DISPLAY: none; Z-INDEX: 101; LEFT: 40px; BEHAVIOR: url('/Behaviors/webservice.htc'); WIDTH: 24px; POSITION: absolute; TOP: 1968px; HEIGHT: 22px"
											onresult="webserviceCallBack()">
									</TD>
								</TR>
								<TR valign="top" style="HEIGHT: 100%">
									<TD align="center" style="BORDER-LEFT: silver 1px solid">
										<span id="Label5"><font color="Red">*</font></span>
										<span id="Label1"><font color="Gray">Indicates a required field</font></span></TD>
								</TR>
							</TABLE>
						</TD>
					</tr>
				</table>
			</td>
		</TR>
	</table>
	<INPUT id="Hidden1" type="hidden" value="Request Reports" name="FormTitle">
	


		    </div>
		    <div class="clearfix"></div>
	    </div>
	
	    <div class="xs-dynamic-content">
		    
	

		    <div class="clearfix"></div>
	    </div>
    </section>	
	<footer class="xs-site-footer panel-footer">
		<div class="xs-profile-picture hidden">
			
		</div>
		<div class="xs-language-choices text-center">
			
    
    
    <style type="text/css">
        .language-choices-separator 
        {
            display: none;
        }
    </style>

		</div>
		<hr>
		

<div class='xs-footer-text'><style>
    .col-md-5, .col-md-7 {
    margin-top: 8px;
    margin-bottom: 8px;
}
    .col-sm-12 {
        margin-top: 0px;
        margin-bottom: 0px;
    }
</style>

<div class="xs-site-container">
<div class="container-fluid">
        <div class="col-sm-12 text-center">
            <h1>The Rice Group, Inc.</h1>
            <a class="btn btn-lg btn-primary hidden-md hidden-lg" style="color: #fff;" href="tel:214-808-3100"> Call Us</a> 
            <a class="btn btn-lg btn-primary hidden-md hidden-lg" style="color: #fff;" href="mailto:brent@ricegroupinc.com"> Email Us</a>
            <div class="hidden-xs hidden-sm"> 
                <i class="fa fa-phone"></i> <a href="tel:214-808-3100"> (214) 808-3100</a> | <i class="fa fa-envelope"></i> <a href="mailto:brent@ricegroupinc.com"> brent@ricegroupinc.com</a>
            </div>
            <div class="hidden-md hidden-lg"><br></div>
            <address>7013 Mills Branch Cir. | Plano, TX 75024</address> 
            
               <div class="container">
  <h4>MLS® DISCLAIMER</h4><p>Click here for<br><a href="http://www.trec.texas.gov/forms/information-about-brokerage-services">INFORMATION ABOUT BROKERAGE SERVICES</a><br><br><a href="#demo" class="btn btn-info" data-toggle="collapse">Show More</a></p><div id="demo" class="collapse">
    © 2017 North Texas Real Estate Information Systems, Inc. All rights reserved. Disclaimer: All information deemed reliable but not guaranteed and should be independently verified. All properties are subject to prior sale, change or withdrawal. Neither listing broker(s) nor The Rice Group, Inc. shall be responsible for any typographical errors, misinformation, misprints and shall be held totally harmless. The database information herein is provided from and copyrighted by the North Texas Real Estate Information Systems, Inc. NTREIS data may not be reproduced or redistributed and is only for people viewing this site. All information provided is deemed reliable but is not guaranteed and should be independently verified. The advertisements herein are merely indications to bid and are not offers to sell which may be accepted. All properties are subject to prior sale or withdrawal. All rights are reserved by copyright.
  </div>
</div>
            
    </div>
    
 
    
        <div class="col-sm-12 text-center">
            <ul class="list-inline">
                <li>
                    <a href="//facebook.com/ricegroupinc" target="_blank"> 
                        <span class="fa-stack fa-2x">
                            <i class="fa fa-square fa-stack-2x"></i>
                            <i class="fa fa-facebook fa-stack-1x"></i>
                        </span> 
                    </a>
                </li>
                <li>
                    <a href="//www.twitter.com/ricegroupinc" target="_blank"> 
                        <span class="fa-stack fa-2x">
                            <i class="fa fa-square fa-stack-2x"></i>
                            <i class="fa fa-twitter fa-stack-1x"></i>
                        </span> 
                    </a>
                </li>
                <li>
                    <a href="//www.yelp.com/biz/the-rice-group-plano?osq=the+rice+group%2C+inc." target="_blank"> 
                        <span class="fa-stack fa-2x">
                            <i class="fa fa-square fa-stack-2x"></i>
                            <i class="fa fa-yelp fa-stack-1x"></i>
                        </span> 
                    </a>
                </li>
                <li>
                    <a href="//linkedin.com/in/brentrice" target="_blank"> 
                        <span class="fa-stack fa-2x">
                            <i class="fa fa-square fa-stack-2x"></i>
                            <i class="fa fa-linkedin fa-stack-1x"></i>
                        </span> 
                    </a>
                </li>
            </ul> 
        </div>
    <div class="row">
        <div class="col-sm-12">
        <p style="text-align:center;border:none; margin-top:10px;">
            <img src="/xsites/agents/FairwayIndependentMortgageCorporation2/Content/UploadedFiles/EHO-white.png" style="width: 65px;" alt="EHO logo">
            <!--<img src="#" style="margin-left: 25px; width: 150px;" alt="MLS logo">-->
        </p>
        </div>
    </div>
</div>
</div>

<div class="col-sm-12 text-center">
  <h4>AREAS WE COVER</h4>
  <a href="#demo2" class="btn btn-info" data-toggle="collapse">Show More</a>
  <div id="demo2" class="collapse"><span style="font-family: arial, sans-serif; font-size: small;"><span><span style=""><span style="background-color: rgb(0, 0, 0);">75002 75013 75023 75024 75025 75034 75035 75068 75070 75074 75075 75093 75098 75201 75202 75204 75206 75208 75211 75214 75219 75224 75233 75235 75252 75287 Addison Allen Anna Argyle Arlington Aubrey Azle Balch Springs Bartonville Bedford Benbrook Blue Ridge Burleson Carrollton Cedar Hill Celina Colleyville Combine Coppell Copper Canyon Corinth Crandall Cross Roads Crowley Dallas Dalworthington Gardens Denton Desoto Dish Double Oak Duncanville Edgecliff Village Euless Everman Fairview Farmers Branch Farmersville Fate Flower Mound Forest Hill Forney Fort Worth Frisco Garland Glenn Heights Grand Prairie Grapevine Haltom City Haslet Heartland Heath Hickory Creek Highland Park Highland Village Hurst Hutchins Irving Josephine Justin Kaufman Keller Kemp Kennedale Kessler Park Krugerville Krum Lake Dallas Lake Worth Lakeside Lakewood Village Lancaster Lantana Lavon Lewisville Little Elm Lucas Mabank Mansfield Mckinney Mclendon Chisholm Melissa Mesquite Murphy Nevada North Richland Hills NorthlakeOak Lawn Oak Point Pantego Parker Pelican Bay Pilot Point Plano Ponder Princeton Prosper Providence Village Richardson Richland Hills River Oaks Roanoke Rockwall Rowlett Royse City Sachse Saginaw SangerSansom Park Savannah Scurry Seagoville Shady Shores Slidell Southlake St Paul Sunnyvale Talty Terrell The Colony Trophy Club University Park Watauga Westlake Weston Westover Hills White Settlement Wills Point Wilmer Wylie</span></span></span></span><br></div>
</div>
<!--
<div class="container">
  <h4>MLS® DISCLAIMER</h4>
  <a href="#demo" class="btn btn-info" data-toggle="collapse">Show More</a>
  <div id="demo" class="collapse">
    © 2017 North Texas Real Estate Information Systems, Inc. All rights reserved. Disclaimer: All information deemed reliable but not guaranteed and should be independently verified. All properties are subject to prior sale, change or withdrawal. Neither listing broker(s) nor Rogers Healy and Associates shall be responsible for any typographical errors, misinformation, misprints and shall be held totally harmless. The database information herein is provided from and copyrighted by the North Texas Real Estate Information Systems, Inc. NTREIS data may not be reproduced or redistributed and is only for people viewing this site. All information provided is deemed reliable but is not guaranteed and should be independently verified. The advertisements herein are merely indications to bid and are not offers to sell which may be accepted. All properties are subject to prior sale or withdrawal. All rights are reserved by copyright.
  </div>
</div>
-->


<!--
<div class="hidden-xs" id="stickyfooter">Like this site? Call 1-866-300-1550 and we’ll personalize it for you. <a style="display:inline-block" href="mailto:brent@ricegroupinc.com"><button type="button" class="btn btn-info">Request More Info <span class="glyphicon glyphicon-edit"></span></button></a></div>

<div class="visible-xs" id="stickyfooter">Like this site? <a style="display:inline-block" href="tel:866-300-1550"><button type="button" class="btn btn-info">Request More Info <span class="glyphicon glyphicon-edit"></span></button></a></div>
-->

<script>
$("a.navbar-brand.hidden-xs.xs-company-name.xs-company-logo").removeClass("hidden-xs");
</script></div><br/><div class='tableText' style='text-align: center;'><div class='xs-site-footer-contact-info'></div><br><div class='xs-site-footer-copyright'>Portions Copyright &copy; 2018  Pipeline ROI, LLC<br>Another website by <a href='http://www.pipelineroi.com/' target='_blank'>Pipeline ROI.</a>&nbsp; | <a href='https://FairwayIndependentMortgageCorporation2.proiwebsites.com/apps/alamodelogin/login.aspx'>Admin Login</a> | <a href='/TermsOfUse'>Terms of Use</a> | <a href='/SiteMap'>Site Map</a> | <a href='/ListingProperties/default.aspx'>Area Listings</a><br>All rate, payment, and area information are estimates and approximations only.</div></div><meta id='cy01' data-key="FRBP" class="Crypto"/><meta id='cy02' data-key="467T" class="Crypto"/><meta id='cy03' data-key="I96T" class="Crypto"/><meta id='cy04' data-key="Z50C" class="Crypto"/><meta id='cy05' data-key="2MLZ" class="Crypto"/><meta id='cy06' data-key="GWTW" class="Crypto"/><meta id='cy07' data-key="S2I6" class="Crypto"/><meta id='cy08' data-key="6H42" class="Crypto"/><meta id='cy09' data-key="UZHN" class="Crypto"/><meta id='cy10' data-key="AEHM" class="Crypto"/><meta id="cykey" data-key=""/>


<script src="/scripts/decrypt.min.js" type="text/javascript"></script>
            <script type="text/javascript">

                // Check to see this is a page with encryption


                function validateEmail(email) {
                    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                    return re.test(email); 
                }


                document.addEventListener("DOMContentLoaded", function () {
                    CheckForJquery();
                    function CheckForJquery() {
                        if (!window.jQuery) {
                            var jq = document.createElement('script');
                            jq.type = 'text/javascript';
                            jq.src = '/scripts/jquery-1.8.3.min.js';
                            document.getElementsByTagName('head')[0].appendChild(jq);
                            window.setTimeout(CheckForJquery,1000);
                            
                        } else {


                            $.ajax({
                                type: "POST",
                                url: "/scripts/key.aspx",
                                data: "",
                                dataType: "text",
                                success: function(data) {
                                    if (document.getElementById("cykey") != null) {

                                        var Correctkeys = data.split(','),
                                            MetaKeys = document.querySelectorAll('.crypto'),
                                            ValidKey = document.getElementById("cykey"),
                                            TempKey = "",
                                            s = "",
                                            keyname = "";

                                        // iterate through the meta tags containing the randomized encrypted key pieces
                                        for (var i = 0; i < Correctkeys.length; i++) {

                                            keyname = Correctkeys[i];
                                            TempKey = document.getElementById(keyname);
                                            s = ValidKey.getAttribute("data-key");
                                            if (TempKey != null) {
                                                var newkey = s.concat(TempKey.getAttribute('data-key'));
                                                ValidKey.setAttribute('data-key', newkey);
                                            }
                                        }
                                        decrypt();

                                    }
                                }
                            })
                        }
                    }

                });

            </script>


	</footer>
</div>

			
		</form>

		
		<script src="/scripts/doubletaptogo.min.js"></script>
		<script>
			$('li.dropdown').doubleTapToGo();
		</script>
	</body>
</html>