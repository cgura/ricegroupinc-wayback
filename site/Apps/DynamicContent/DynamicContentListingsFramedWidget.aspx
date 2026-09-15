
<!doctype html>

<html>
	<head id="Head1"><title>
	Featured Properties
</title>
        
		<script language="javascript" type="text/javascript" src="/scripts/jquery-1.8.3.min.js" charset="utf-8"></script>

		<link href="/Admin/CSS/base.css" rel="stylesheet" type="text/css" /><link href="/styles.css" rel="stylesheet" type="text/css" />
		
		<style type="text/css" media="screen">
			html {
				margin: 0;
				padding: 0;
			}

			body {
				margin: 0 auto;
				padding: 0;
				font-size: 12px;
			}

			form {
				position: relative;
			}

			.ListingControl {
				margin: auto;
				position: relative;
				width: 180px;
				height: 392px;
				overflow: hidden;
			}

			.ListingControl .Title {
				color: #fff;
				font-weight: bold;
				text-align: center;
				padding: .25em;
				text-shadow: 0 0 2px rgba(0,0,0,0.5);
			}

			.ListingControl .image-count {
				font-size: .8em;
				text-align: left;
				padding: .5em;
				z-index: 110;
				position: absolute;
				visibility: hidden; /* by adam ? */
			}

			.ListingControl .listing-cycle {
				width: 180px;
				height: 333px;
			}

			.ListingControl .listing-cycle .listing-cycle-container {
				margin: 0;
				padding: 0;
				width: 180px;
				height: 333px;
			}

			.ListingControl .listing-cycle .listing-cycle-container .ListStatusDesc {
				text-align: right;
				font-size: .8em;
				padding: .5em;
			}
			
			.ListingControl .listing-cycle .listing-cycle-container .photos-container {
				position: relative;
				margin: auto;
				padding: 0;
				width: 180px;
				height: 127px;
			}
			
			.ListingControl .listing-cycle .listing-cycle-container .photos-container .photos {
				margin: 0 auto;
				padding: 0;
				width: 170px;
				height: 127px;
				text-align: center;
				overflow: hidden;
			}

			.ListingControl .listing-cycle .listing-cycle-container .photos-container .photos img {
				margin: 0;
				padding: 0;
				display: block;
				min-width: 100%;
				min-height: 100%;
				
				width: auto;
				height: auto;
			}

			.prevPhoto,
			.nextPhoto {
				text-decoration: none;
				position: absolute;
				top: 50%;
				margin-top: -1.5em;
				display: inline-block;
				border-radius: 3em;
				vertical-align: top;
				font-size: 1em;
				height: 1em;
				width: 1em;
				padding: 1em;
				text-align: center;
				z-index: 1000;
				background: #555;
				background-color:rgba(0,0,0,0.7);
				color: #fff !important;
				opacity: 0;
				filter: alpha(opacity=20);
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
				transition: all .3s linear;
			}

			.nextPhoto {
				right: -1em;
			}

			.prevPhoto {
				left: -1em;
			}
	
			.listing-cycle:hover .nextPhoto
			{
			    right: 0;
				opacity: .5;
				filter: alpha(opacity=50);
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
			}
			
			
			.listing-cycle:hover .prevPhoto 
			{
			    left: 0;
				opacity: .5;
				filter: alpha(opacity=50);
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
			}

			.nextPhoto:hover,
			.prevPhoto:hover {
				opacity: 1 !important;
				filter: alpha(opacity=100) !important;
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
			}

			.ListingControl .listing-cycle .listing-cycle-container .details {
				margin: 1em;
				position: relative;
				height: 164px;
				text-shadow: 0 1px 1px rgba(255,255,255,0.2);
			}

			.ListingControl .listing-cycle .listing-cycle-container .details .price {
				text-align: left;
				font-weight: 600;
			}
			
			.ListingControl .listing-cycle .listing-cycle-container .details .details-table tr td {
				vertical-align: top;
			}
			
			.ListingControl .listing-cycle .listing-cycle-container .details .AgentName {
				text-align: left;
				font-weight: bold;	
			}

            .ListingControl .listing-cycle .listing-cycle-container .details .MoreInfo 
            {
                position: absolute;
                bottom: 0;
                right: 0;
                left: 0;
                display: block;
                text-align: center;
                width: 100%;
                
            }
			.ListingControl .listing-cycle .listing-cycle-container .details .MoreInfo a {
				text-align: center;
				display: inline-block;
				padding: .25em;
				text-decoration: none;
			}

			.ListingControl .ListingControls {
				text-align: center;
				background: #fff;
			}

			.ListingControl .ListingControls a {
				font-size: .9em;
				text-decoration: none;
				text-align: center;
				display: block;
				padding: 1em 0;
				float: left;
				width: 50%;
				color: #000;
			}
			.ListingControl .ListingControls a:hover{
				text-decoration: underline;
			}

			.ErrorNoListingsToDisplay {
				text-align: center;
				vertical-align: middle;	
				
			}

            .ListStatusDesc, .ListingControl
            {
                color: #000;
            }

			
						/* color1 = #999999 aka "Nav Background / Foreground" */
						.ListingControl .Title { background-color: #999999;}
						.ListingControl {
							border:1px solid #999999;
						}
						
						.ListingControls {
							border-top: 1px solid #999999;
						}
						.ListingControl .Title {
							border-bottom: 1px solid #999999;
						}
					
						/* color2 = #003366 aka "Top Background" */
					
						/* color3 = #000000 aka "Background Graphic / Background" */
						
					
						/* color4 = #FFFFFF aka "Top Navigation" */
						.ListingControl .Title {
						    color: #FFFFFF;
						}
						.ListStatusDesc 
						{
						    color: #FFFFFF;
						}
						
					
						/* color5 = #FFFFFF aka "Secondary Navigation" */
						/*.ListStatusDesc, .ListingControl, .ListingControl a {
						    color: #FFFFFF;
						}*/
					
						/* color6 = #999999 Gets set to same as "Nav Background / Foreground" */
						.ListingControl {
						    background: #999999;
							background: -moz-linear-gradient(top,  #999999 -300px, #ffffff 100%);
							background: -webkit-gradient(linear, left top, left bottom, color-stop(-300px,#999999), color-stop(100%,#ffffff));
							background: -webkit-linear-gradient(top, #999999 -300px,#ffffff 100%);
							background: -o-linear-gradient(top,  #999999 -300px,#ffffff 100%);
							background: -ms-linear-gradient(top,  #999999 -300px,#ffffff 100%);
							background: linear-gradient(to bottom,  #999999 -300px,#ffffff 100%);
							filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#999999', endColorstr='#ffffff',GradientType=0 );
						}
						
					
						/* color7 = #003366 Gets set to same as "Top Background" */
					
		</style>
	</head>

	<body>
    <form method="post" action="DynamicContentListingsFramedWidget.aspx?FileName=HomePage.x" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMjExMDEyNjkzOWRkTXNa/Q3YdLZ0wnwOsAgymMuoQyIyhV97GcbAjdTt+Aw=" />
</div>

		<div class="ListingControl rounded-corners shadow">
			<div class="Title">Featured Properties</div>
			<div id="ImageCount" class="image-count"></div>
			<div class="listing-cycle">
				
						<div class="listing-cycle-container" id="listingContainer0" style="display:block" >
							<div class="ListStatusDesc">Sold</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos0">
									<script language="javascript" type="text/javascript">
								
											var oImgListing0_0 = new Image();
											oImgListing0_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/691429/1/11922288_1_thmb.jpg?nocache=1462410646";
								
										var nTotalImagesImgListing0 = 1;
									</script>
									<img id="oImgListing0">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing0', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing0', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$899,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>4 Bedrooms</td></tr>
<tr><td>&bull;</td><td>6 Full, 1 Half Bath(s)</td></tr>
<tr><td>&bull;</td><td>5467 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Plano</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=691429">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer1" style="display:none" >
							<div class="ListStatusDesc">Active</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos1">
									<script language="javascript" type="text/javascript">
								
											var oImgListing1_0 = new Image();
											oImgListing1_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/742587/1/12055022_1_thmb.jpg?nocache=1172704037";
								
										var nTotalImagesImgListing1 = 1;
									</script>
									<img id="oImgListing1">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing1', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing1', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$799,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>5 Bedrooms</td></tr>
<tr><td>&bull;</td><td>4 Full, 1 Half Bath(s)</td></tr>
<tr><td>&bull;</td><td>6345 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Plano</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=742587">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer2" style="display:none" >
							<div class="ListStatusDesc">Sold</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos2">
									<script language="javascript" type="text/javascript">
								
											var oImgListing2_0 = new Image();
											oImgListing2_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/698295/1/Front%20Elevation%20Close_thmb.jpg?nocache=132599455";
								
										var nTotalImagesImgListing2 = 1;
									</script>
									<img id="oImgListing2">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing2', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing2', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$599,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>5 Bedrooms</td></tr>
<tr><td>&bull;</td><td>5 Full Bath(s)</td></tr>
<tr><td>&bull;</td><td>6639 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Heath</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=698295">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer3" style="display:none" >
							<div class="ListStatusDesc">Active</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos3">
									<script language="javascript" type="text/javascript">
								
											var oImgListing3_0 = new Image();
											oImgListing3_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/752133/1/12077133_1_thmb.jpg?nocache=265774460";
								
										var nTotalImagesImgListing3 = 1;
									</script>
									<img id="oImgListing3">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing3', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing3', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$569,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>3 Bedrooms</td></tr>
<tr><td>&bull;</td><td>3 Full, 1 Half Bath(s)</td></tr>
<tr><td>&bull;</td><td>3175 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Plano</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=752133">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer4" style="display:none" >
							<div class="ListStatusDesc">Sold</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos4">
									<script language="javascript" type="text/javascript">
								
											var oImgListing4_0 = new Image();
											oImgListing4_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/686245/1/UPDATED%20FRONT%20ELEVATION_thmb.jpg?nocache=1465493385";
								
										var nTotalImagesImgListing4 = 1;
									</script>
									<img id="oImgListing4">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing4', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing4', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$479,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>5 Bedrooms</td></tr>
<tr><td>&bull;</td><td>3 Full, 1 Half Bath(s)</td></tr>
<tr><td>&bull;</td><td>3887 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Plano</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=686245">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer5" style="display:none" >
							<div class="ListStatusDesc">Active Contingent</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos5">
									<script language="javascript" type="text/javascript">
								
											var oImgListing5_0 = new Image();
											oImgListing5_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/738277/1/12045481_1_thmb.jpg?nocache=1024786044";
								
										var nTotalImagesImgListing5 = 1;
									</script>
									<img id="oImgListing5">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing5', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing5', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$474,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>5 Bedrooms</td></tr>
<tr><td>&bull;</td><td>4 Full, 1 Half Bath(s)</td></tr>
<tr><td>&bull;</td><td>4318 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Frisco</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=738277">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer6" style="display:none" >
							<div class="ListStatusDesc">Sold</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos6">
									<script language="javascript" type="text/javascript">
								
											var oImgListing6_0 = new Image();
											oImgListing6_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/723100/1/Kelly%20Front%20Photo_thmb.jpg?nocache=97808619";
								
										var nTotalImagesImgListing6 = 1;
									</script>
									<img id="oImgListing6">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing6', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing6', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$449,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>4 Bedrooms</td></tr>
<tr><td>&bull;</td><td>3 Full, 1 Half Bath(s)</td></tr>
<tr><td>&bull;</td><td>3333 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Plano</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=723100">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer7" style="display:none" >
							<div class="ListStatusDesc">Sold</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos7">
									<script language="javascript" type="text/javascript">
								
											var oImgListing7_0 = new Image();
											oImgListing7_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/735181/1/1310080126%20-%20New%20Front_thmb.jpg?nocache=1288966828";
								
										var nTotalImagesImgListing7 = 1;
									</script>
									<img id="oImgListing7">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing7', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing7', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$369,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>4 Bedrooms</td></tr>
<tr><td>&bull;</td><td>3 Full Bath(s)</td></tr>
<tr><td>&bull;</td><td>3339 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>McKinney</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=735181">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer8" style="display:none" >
							<div class="ListStatusDesc">Active</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos8">
									<script language="javascript" type="text/javascript">
								
											var oImgListing8_0 = new Image();
											oImgListing8_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/753746/1/12080702_1_thmb.jpg?nocache=410241678";
								
										var nTotalImagesImgListing8 = 1;
									</script>
									<img id="oImgListing8">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing8', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing8', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$219,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>4 Bedrooms</td></tr>
<tr><td>&bull;</td><td>2 Full, 1 Half Bath(s)</td></tr>
<tr><td>&bull;</td><td>2477 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Frisco</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=753746">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer9" style="display:none" >
							<div class="ListStatusDesc">Active</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos9">
									<script language="javascript" type="text/javascript">
								
											var oImgListing9_0 = new Image();
											oImgListing9_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/741874/1/12053167_1_thmb.jpg?nocache=1172448318";
								
										var nTotalImagesImgListing9 = 1;
									</script>
									<img id="oImgListing9">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing9', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing9', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$179,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>3 Bedrooms</td></tr>
<tr><td>&bull;</td><td>2 Full Bath(s)</td></tr>
<tr><td>&bull;</td><td>2064 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Carrollton</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=741874">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer10" style="display:none" >
							<div class="ListStatusDesc">Sold</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos10">
									<script language="javascript" type="text/javascript">
								
											var oImgListing10_0 = new Image();
											oImgListing10_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/743059/1/12056778_1_thmb.jpg?nocache=1127434820";
								
										var nTotalImagesImgListing10 = 1;
									</script>
									<img id="oImgListing10">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing10', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing10', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$169,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>3 Bedrooms</td></tr>
<tr><td>&bull;</td><td>2 Full Bath(s)</td></tr>
<tr><td>&bull;</td><td>1630 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>The Colony</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=743059">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer11" style="display:none" >
							<div class="ListStatusDesc">Pending</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos11">
									<script language="javascript" type="text/javascript">
								
											var oImgListing11_0 = new Image();
											oImgListing11_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/746908/1/12065270_1_thmb.jpg?nocache=886089121";
								
										var nTotalImagesImgListing11 = 1;
									</script>
									<img id="oImgListing11">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing11', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing11', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$169,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>3 Bedrooms</td></tr>
<tr><td>&bull;</td><td>2 Full Bath(s)</td></tr>
<tr><td>&bull;</td><td>2123 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>The Colony</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=746908">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer12" style="display:none" >
							<div class="ListStatusDesc">Active</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos12">
									<script language="javascript" type="text/javascript">
								
											var oImgListing12_0 = new Image();
											oImgListing12_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/705410/1/11963962_1_thmb.jpg?nocache=1259266139";
								
										var nTotalImagesImgListing12 = 1;
									</script>
									<img id="oImgListing12">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing12', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing12', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$99,900</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>3 Bedrooms</td></tr>
<tr><td>&bull;</td><td>2 Full Bath(s)</td></tr>
<tr><td>&bull;</td><td>1483 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Garland</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=705410">More Info</a></div>

							</div>
						</div>
						
						<div class="listing-cycle-container" id="listingContainer13" style="display:none" >
							<div class="ListStatusDesc">Active</div>

							<div class="photos-container">
								<div class="photos" id="listingContainerPhotos13">
									<script language="javascript" type="text/javascript">
								
											var oImgListing13_0 = new Image();
											oImgListing13_0.src = "http://www.ricegroupinc.com/XSites/ListingAssets/334435/686246/1/11868456_1_thmb.jpg?nocache=1799628561";
								
										var nTotalImagesImgListing13 = 1;
									</script>
									<img id="oImgListing13">
								</div>
								<a class="prevPhoto" href="JavaScript:prevPhoto( 'oImgListing13', '1', true )">&#9664;</a>
								<a class="nextPhoto" href="JavaScript:nextPhoto( 'oImgListing13', '1', true )">&#9654;</a>
						
							</div>

							<div class="details">
								<div class="price">$2,150</div>

								<table class="details-table">
									<tr><td>&bull;</td><td>1600 Sq ft. (MOL)</td></tr>
<tr><td>&bull;</td><td>Carrollton</td></tr>

								</table>
										<div class="AgentName">Agent: Brent Rice, SFR</div>
<div class="MoreInfo"><a target="_parent" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=686246">More Info</a></div>

							</div>
						</div>
						
			</div>

			<div class="ListingControls">
				<a id="prevListing" href="JavaScript:prev()">Prev Listing</a>
				<a id="nextListing" href="JavaScript:next()">Next Listing</a>
				<div class="clearfix"></div>
			</div>

		</div> 
	

		<script language="javascript" type="text/javascript">

		

			var nCurrentListingIndex = 0;
			var nTotalListingCount = 14;
			var nCurrentImageIndex = 0;
			var nCurrentImageCountTotalAutomated = 0;
			var currentTimer = null; 

			if (!String.prototype.trim) {
				String.prototype.trim = function() {
					return this.replace(/^\s+|\s+$/g, '');
				};
			}

			var slideshow;
			var photosSlideShow;
			$(document).ready(function () {
				nCurrentImageIndex = -1;
				if ( nTotalListingCount > 0 ) {
					showFirstPhoto();
				}
			});

			function prev() {
				window.clearTimeout( currentTimer );
				document.getElementById( "listingContainer" + nCurrentListingIndex ).style.display = "none";
/*
				nCurrentListingIndex --;
				if ( nCurrentListingIndex < 0 ) {
					nCurrentListingIndex = ( nTotalListingCount - 1 );
				}
				document.getElementById( "listingContainer" + nCurrentListingIndex ).style.display = "block";
				nCurrentImageIndex = -1;

				var count = eval( "nTotalImagesImgListing" + nCurrentListingIndex );
				nextPhoto( "oImgListing" + nCurrentListingIndex, count, true );
*/
				$( "#listingContainer" + nCurrentListingIndex ).fadeOut( 500, function() {
					$( this ).css( "display", "none" );

					nCurrentListingIndex --;
					if ( nCurrentListingIndex < 0 ) {
						nCurrentListingIndex = ( nTotalListingCount - 1 );
					}
					// document.getElementById( "listingContainer" + nCurrentListingIndex ).style.display = "block";
					$( "#listingContainer" + nCurrentListingIndex ).fadeIn( 300, function() {  
						$( this ).css( "display", "block" );

						var count = eval( "nTotalImagesImgListing" + nCurrentListingIndex );
						// console.log( "next() - count: ", count );
						nextPhoto( "oImgListing" + nCurrentListingIndex, count, true );

					} );


				} );


			}

			function next() {
				window.clearTimeout( currentTimer );
				nCurrentImageIndex = 0;
				// document.getElementById( "listingContainer" + nCurrentListingIndex ).style.display = "none";
				$( "#listingContainer" + nCurrentListingIndex ).fadeOut( 500, function() {
					$( this ).css( "display", "none" );

					nCurrentListingIndex ++;
					if ( nCurrentListingIndex == nTotalListingCount ) {
						nCurrentListingIndex = 0;
					}
					// document.getElementById( "listingContainer" + nCurrentListingIndex ).style.display = "block";
					$( "#listingContainer" + nCurrentListingIndex ).fadeIn( 300, function() {  
						$( this ).css( "display", "block" );

						var count = eval( "nTotalImagesImgListing" + nCurrentListingIndex );
						// console.log( "next() - count: ", count );
						nextPhoto( "oImgListing" + nCurrentListingIndex, count, true );

					} );

				} );
			}

			function prevPhoto( src, nImageCount, isButtonClick ) {
				window.clearTimeout( currentTimer );
				if ( isButtonClick ) 
					nCurrentImageCountTotalAutomated = 0;
				else { 
					nCurrentImageCountTotalAutomated ++;
					//console.log( "nCurrentImageCountTotalAutomated > nImageCount: ", nCurrentImageCountTotalAutomated, ">", nImageCount );
					if ( nCurrentImageCountTotalAutomated > nImageCount )
					 next();
				}

				nCurrentImageIndex --;
				if ( nCurrentImageIndex < 0 ) 
					nCurrentImageIndex = ( nImageCount - 1 );
				
				var img = document.getElementById( src );
				try {
					img.src = eval( src + "_" + nCurrentImageIndex ).src;
					currentTimer = window.setTimeout( "prevPhoto( '" + src + "', " + nImageCount + ", false )", 6000 );
				}
				catch( e ) {
					img.src = "/graphics/NoPhoto.png";
					currentTimer = window.setTimeout( "prevPhoto( '" + src + "', " + nImageCount + ", false )", 6000 );
				}
			}

			function nextPhoto( src, nImageCount, isButtonClick ) {
				window.clearTimeout( currentTimer );
				if ( isButtonClick ) 
					nCurrentImageCountTotalAutomated = 0;
				else { 
					nCurrentImageCountTotalAutomated ++;
					if ( nCurrentImageCountTotalAutomated >= nImageCount )
					 next();
				}

				// console.log( "nCurrentImageCountTotalAutomated: ", nCurrentImageCountTotalAutomated, "   - nImageCount: ", nImageCount );

				nCurrentImageIndex ++;
				if ( nCurrentImageIndex > ( nImageCount - 1 ) ) 
					nCurrentImageIndex = 0;

				var img = document.getElementById( src );
				try {
					img.src = eval( src + "_" + nCurrentImageIndex ).src;
					currentTimer = window.setTimeout( "nextPhoto( '" + src + "', " + nImageCount + ", false )", 6000 );
				}
				catch( e ) {
					//console.log( "Error: ", e.message  );
					img.src = "/graphics/NoPhoto.png";
					currentTimer = window.setTimeout( "nextPhoto( '" + src + "', " + nImageCount + ", false )", 6000 );
				}
			}


			function showFirstPhoto() {
				window.clearTimeout( currentTimer );
				nCurrentImageIndex = 0;

				nextPhoto( "oImgListing0", 1, true );
			}


			var nTotalCountNewNameConflictProof = 0;
			var nCurrentCount = 0;
			var lastImage = "";
			var bSkipToNext = false; 
			var szLastImage = "";
			var nTotalCount = 1;
			var bIsFirst = true; 

		
	
		</script>
        
      

    </form>
</body>
</html>
