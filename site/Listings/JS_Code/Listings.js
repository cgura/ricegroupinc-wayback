// This is here and at the top because it is accessed from other files.
var $container = $("body.Image.View #oDataPanelGrid");

function resizeMe(arg, clearHeight) {
	// Attempts to call resizeMe which exists in the parent window. If there is
	// no parent window, that means it's not in an iframe so it doesn't need to
	// do anything.

	if (typeof (clearHeight) === 'undefined') {
		clearHeight = false;
	}

	try {
		parent.resizeMe(arg, clearHeight);
	} catch (ignore) {}
}


function ToggleMoreSearchOptions(obj, IsIDX) {
	//IsIDX is set by the server so it's either "True" or "False" (string) and not a js boolean.
	if (IsIDX === "False") {
		//coming from listingsgrid.aspx
		$("#oInternalMoreSearchOptions").toggle();

		//coming from listingssearch.aspx
		$("#oForSale").toggle();
		$("#oForSaleAdvanced").toggle();

		// Only toggle simple search options if it is not IDX. If it is IDX we 
		// want to show the more search options in addition to the simple
		// search options.
		$("#pnlInternalSimpleSearchOptions").toggle();
	} else {
		$("#oIDXMoreSearchOptions").toggle();
	}

	if ($(obj).text() === "More Search Options ") {
		$(obj).text("Fewer Search Options ");
		$(obj).append($("<i/>", {
			"class": "fa fa-caret-up"
		}));
	} else {
		$(obj).text("More Search Options ");
		$(obj).append($("<i/>", {
			"class": "fa fa-caret-down"
		}));
	}
	resizeMe('gridFrame');
}


function handleListingsDisplay(locations) {
	var curListings = document.getElementById("hdnPinLocations").value;
	if (curListings !== locations) {
		document.getElementById("hdnPinLocations").value = locations;
		// __doPostBack("upDataPanel", "");
	}
}



function showLoader(val) {
	if (val === "ListingGrid") {
		__doPostBack("showGrid", "Grid View");
	} else if (val === "PhotoGrid") {
		__doPostBack("showGrid", "Image View");
	} else if (val === "ListingsFavorites") {
		__doPostBack("showGrid", "Show Favorite");
	} else if (val === "ListingsMapContainer") {
		if (document.getElementById("ListingsMapContainer").style.display === "none") {
			document.getElementById("ListingsMapContainer").style.display = "block";
			// if a map already exists we need it to not recreate one..
			// TODO: need a test to determine if map already exists
			// createMap();

		} else {
			document.getElementById("ListingsMapContainer").style.display = "none";
		}
		resizeMe('gridFrame');
	}
}


function processText(objID) {
	document.getElementById(objID).style.display = 'block';
	document.getElementById('a' + objID).style.display = 'none';
}


function AddToFav(obj, event, ListID) {
	if (loggedInName) {
		var ListingStruct = {
			ListingID: ListID
		};

		$.ajax({
			type: "POST",
			url: "/Listings/ListingsGrid.aspx/AddToFavorites",
			data: JSON.stringify(ListingStruct),
			contentType: "application/json; charset=utf-8",
			traditional: true,
			dataType: "json",
			success: function (data) {
				var info, newTable, newFavoritesRow;

				info = data.d;
				$(obj).text("Favorite!").removeClass('btn-link btn-primary').addClass('btn-success').blur();
				newFavoritesRow = "<tr><td>" + info.AddressLink + "</td><td>" + info.Bed + "</td><td>" + info.Bath + "</td><td>" + info.SqFt + "</td><td>" + info.MLSID + "</td></tr>";

				if ($("#gvFavorites").length) {
					// favorites table already exists
					console.log(document.getElementById('gvFavorites').innerText);
					console.log(info.MLSID);
					if (document.getElementById('gvFavorites').innerText.indexOf(info.MLSID) < 0) {
						$('#gvFavorites').append(newFavoritesRow);
					}
				} else {
					// this must be their first favorite as no favorites table exists
					newTable = $("<table/>", {
						"class": "table",
						"cellspacing": "0",
						"rules": "all",
						"border": "1",
						id: "gvFavorites",
						"style": "border-collapse:collapse"
					});
					newTable.append("<tr><th>Address</th><th>Bed</th><th>Bath</th><th>SqFt</th><th>MLS ID</th></tr>");
					newTable.append(newFavoritesRow);
					$("#pnlFavorites .modal-body").append(newTable);
				}
			},
			error: function (msg) {
				console.log(JSON.stringify(msg));
			}
		});
	} else {
	    window.parent.document.body.scrollTop = 0;
	    window.top.document.body.scrollTop = 0;
		// user is not logged in, show the sign in/create account dialog
		$("#pnlRegister").modal("toggle");
	}
}


function SaveSearch() {
	document.getElementById("hdnSavedSearchName").value = document.getElementById("tbSaveSearchName").value;
	document.getElementById("hdnSavedSearchEmailAlerts").value = document.getElementById("cboEmailAlerts").checked;
	return false;
}


function savedSearchItemClick(ClientSearchID) {
	document.getElementById("hdnClientSearchID").value = ClientSearchID;
	__doPostBack("", "");
}

function animate_bg(ele, from, to) {
	ele.children('td').css("background-color", "rgba(93, 178, 0, " + (from += from > to ? -1 : 1) / 10 + ")");
	if (from != to)
		setTimeout(function () { animate_bg(ele, from, to) }, 20);
}

function savedSearchEmailAlertClick(ClientSearchID, EmailAlert) {
	// JAE: Modified to use AJAX to accomplish this, rather than reloading page.
	//document.getElementById("hdnClientSearchID").value = ClientSearchID;
	//__doPostBack("ChangeEmailAlert", ClientSearchID + "|" + EmailAlert);
	var isEnabled = false;
	if (EmailAlert == "False")
		isEnabled = true;
	var data = { SavedSearchId: ClientSearchID, Enabled: isEnabled };
	var elem = $('#EnableDisable_' + ClientSearchID);
	$.ajax({
		type: "POST",
		url: "/Listings/Controls/ApiMethods.aspx/EnableEmailNotification",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (msg) {
			if (EmailAlert == 'True') {
				elem.attr('href', 'javascript:savedSearchEmailAlertClick(' + elem.data('csid') + ', \'False\')').text('Enable');
				animate_bg(elem.parent().parent(), 10, 0);
			}
			else {
				elem.attr('href', 'javascript:savedSearchEmailAlertClick(' + elem.data('csid') + ', \'True\')').text('Disable');
				animate_bg(elem.parent().parent(), 10, 0);
			}
		}
	});

}


function submitForm() {
	__doPostBack("searchForm", "");
}


function ViewDetails(ListID, FileName) {
	try {
		$("#hdnCurrentDisplayIndex").val(1);
	} catch (ignore) {}
	document.location.href = "/Listings/ListingDetails/ListingDetail.aspx?ListID=" + ListID + "&FileName=" + FileName + "&StaffMemberID=0";
}


function showSearch(arg) {
	if (arg === 'ForSale') {
		document.forms[0].reset();
		document.getElementById("ListStatusDescType").value = "ForSale";
		document.getElementById("oForSale").style.display = "block";
		document.getElementById("oForSaleAdvanced").style.display = "none";
		document.getElementById("oForRent").style.display = "none";
	} else if (arg === 'ForRent') {
		document.forms[0].reset();
		document.getElementById("ListStatusDescType").value = "ForRent";
		document.getElementById("oForSale").style.display = "none";
		document.getElementById("oForSaleAdvanced").style.display = "none";
		document.getElementById("oForRent").style.display = "block";
	}
	resizeMe('gridFrame');
}


function handleSearchPriceMin(obj) {
	if (obj.value === "") {
		obj.value = "No Min";
	} else {
		if (obj.value === "No Min") {
			obj.value = "";
		}
	}
}


function handleSearchPriceMax(obj) {
	if (obj.value === "") {
		obj.value = "No Max";
	} else {
		if (obj.value === "No Max") {
			obj.value = "";
		}
	}
}


function handleSearchCSZM(obj) {
	if (obj.value === "") {
		obj.value = "City, Zip, or MLS Number";
	} else {
		if (obj.value === "City, Zip, or MLS Number") {
			obj.value = "";
		}
	}
}


function setSaleRental(o) {
	if (o === "ForRent") {
		document.getElementById("ListStatusDescType").value = "ForRent";
	} else {
		document.getElementById("ListStatusDescType").value = "ForSale";
	}
}


function clearfix() {
	return $("<div/>", {
		"class": "clearfix"
	});
}


function addToFavoritesLink(args) {
	var htmlClass = "add-to-favorites btn btn-link";
	var htmlString = "<i class='fa fa-star'></i> <span class='hidden-xs'>Add to Favorites</span>";

	if (args.IsFavorite !== "0") {
		htmlString = "Favorite!";
		htmlClass = "add-to-favorites btn btn-success";
	}

	return $("<button/>", {
		"type": "button",
		"class": htmlClass,
		"onclick": "AddToFav(this, event," + args.ListID + ")",
		html: htmlString
	});
}


var listingAmount = function(args) {
	var BillingCycleType = args.BillingCycleType || "";
	var Amount = args.Amount || "";
	if (args.HidePrice !== "True") {
		if ( " For Rent Lease Option Lease Purchase Leased Rented".indexOf( args.ListStatusDesc ) == -1 ) {
			BillingCycleType = "";
		} else {
			if (BillingCycleType === "No Cycle") {
				BillingCycleType = "";
			} else {
				if (BillingCycleType != "" ) {
					BillingCycleType = $("<small/>", {
						"text": " / " + BillingCycleType
					});
				}
			}
		}

		return $("<div/>", {"class": "listing-amount"}).append(Amount, BillingCycleType);
	}

	return "<!-- price is hidden -->";
}


function popOutListingDetailsButton(args) {
	// Returns a button that will open the listing details in a new window.
	return $("<button/>", {
		"type": "button",
		"title": "Open listing in new window",
		"class": "btn btn-link pull-right open-link-in-new-window",
		click: function () {
			return openDetailsNewWindow({isIDX:args.isIDX, ListID:args.ListID});
		}
	}).append($("<i/>", {"class": "fa fa-external-link"}));
}


function listingAddressAnchor(args) {
	// Constructs and returns HTML that contains the listing address and a link to the details.
	var isIDX = args.isIDX;

	var anchorWrapper = $("<div/>", {
		"class": "listing-address-anchor"
	});

	// isIDX comes in half the time as a string. we want to convert it back to
	// a boolean so it doesn't break our strict comparison operators
	// Something is calling listingAddressAnchor and passing isIDX as 'True'. - Travis

	if (typeof isIDX == "string") {
		if (isIDX === "true" || isIDX === "True" || isIDX === "'True'" || isIDX == "'true'") {
			isIDX = true;
		} else {
			isIDX = false;
		}
	}

	var htmlString = "<span class='listing-address1-address2'>" + args.Address1 + " " + args.Address2 + "</span> <small class='listing-city-state-zip'>" + args.City + ", " + args.State + " " + args.ZipCode + "</small>";

	if (args.HideDisplayAddress === "True") {
		htmlString = "<span class='listing-address1-address2'>View Details</span>";
	}

	var theAnchor = $("<a/>", {
		"target": "_parent",
		"href": "/defaultlistings.x?IDX="+((isIDX)?"1":"0")+"&ListID=" + args.ListID,
		"html": htmlString,
		click: function(e) {
			if (is_touch_device) {
				e.preventDefault();
				return openDetailsNewWindow({isIDX:isIDX, ListID:args.ListID});
			} else {
				pushURLToIframe(this.href, args.ListID);
				e.preventDefault();
			};
			
		}
	}).appendTo(anchorWrapper);

	return anchorWrapper;
}


/*function listingBedBathSQFT(Bedrooms, FullBathrooms, PartialBathrooms, SqFt) {*/
function listingBedBathSQFT(Bedrooms, FullBathrooms, HalfBaths, QuarterBaths, ThreeQuarterBaths, SqFt) {
	var bedBathSQFTString, elementWrapper;
	bedBathSQFTString = "";

	if (Bedrooms >= 1) {
		bedBathSQFTString += Math.round(Bedrooms);
		if (Bedrooms > 1){
			bedBathSQFTString += " beds ";
		} else {
			bedBathSQFTString += " bed ";
		}
		
	}
	
	if(FullBathrooms > 0)
	{
		bedBathSQFTString += FullBathrooms + " full baths ";
	}
		
	if(ThreeQuarterBaths > 0)
	{
		bedBathSQFTString += ThreeQuarterBaths + " 3/4 baths ";
	}
		
	if(HalfBaths > 0)
	{
		bedBathSQFTString += HalfBaths + " 1/2 baths ";
	}
	
	if(QuarterBaths > 0)
	{
		bedBathSQFTString += QuarterBaths + " 1/4 baths ";
	}
	
/*
	if (FullBathrooms >= 1 || PartialBathrooms >= 1) {
		if (Bedrooms >= 1) {
			bedBathSQFTString += " | ";
		}

		if (FullBathrooms >= 1) {
			bedBathSQFTString += Math.round(FullBathrooms);
			if (FullBathrooms > 1) {
				bedBathSQFTString += " full baths";
			} else {
				bedBathSQFTString += " full bath";
			}
		}

		if (PartialBathrooms >= 1) {
			if (FullBathrooms >= 1) {
				bedBathSQFTString += ", ";
			}
			bedBathSQFTString += Math.round(PartialBathrooms);
			if (PartialBathrooms > 1) {
				bedBathSQFTString += " partial baths ";
			} else {
				bedBathSQFTString += " partial bath ";
			}
		}
	}
	
		if (PartialBathrooms >= 1 || FullBathrooms >= 1) {
*/
	if (SqFt !== "0.00") {
		if (FullBathrooms >= 1 || ThreeQuarterBaths >= 1 || HalfBaths >= 1 || QuarterBaths >= 0) {
			bedBathSQFTString += " | ";
		}
		bedBathSQFTString += Math.round(SqFt);
		bedBathSQFTString += " sqft ";
	}

	elementWrapper = $("<small/>", {
		"class": "listing-bed-bath-sqft",
		html: bedBathSQFTString
	});
	return elementWrapper;
}


function listingShortDescription(ShortDesc, ListID, isIDX) {
	var shortDescriptionDiv, moreAnchor;

	if (ShortDesc !== "") {
		shortDescriptionDiv = $("<div/>", {
			"class": "listing-short-desc-modified",
		});

		shortDescription = $("<span/>", {
			html: ShortDesc + " "
		}).appendTo(shortDescriptionDiv);

		moreAnchor = $("<a/>", {
			href: "/defaultlistings.x?IDX="+((isIDX)?"1":"0")+"&ListID=" + ListID,
			target: "_parent",
			text: "(See More...)",
			click: function(e) {
				if (is_touch_device) {
				e.preventDefault();
				return openDetailsNewWindow({isIDX:isIDX, ListID:ListID});
			} else {
				pushURLToIframe(this.href, ListID);
				e.preventDefault();
			};
		}
		}).appendTo(shortDescriptionDiv);
	}
	return shortDescriptionDiv;
}


function listingIDXInfo(IDXLogo_Small, AWSRListingOfficeName) {
	var IDXInfo, IDXLogo, officeName;

	IDXInfo = $("<small/>", {
		"class": "text-muted"
	});

	IDXLogo = $("<img/>", {
	    src: "http://idx.proiidx.com/" + IDXLogo_Small,
		"class": "pull-right"
	});
	IDXLogo.appendTo(IDXInfo);

	officeName = $("<span/>", {
		text: "Offered by: " + AWSRListingOfficeName,
		"class": "pull-left"
	});
	officeName.appendTo(IDXInfo);

	IDXInfo.append(clearfix());

	return IDXInfo;
}

// if it is a touch device we want to do a couple things
var is_touch_device = 'ontouchstart' in document.documentElement;
if (is_touch_device) {
	$("body").addClass('touch-device');
} else {
	$("body").addClass('no-touch-device');
}

function pushURLToIframe(URL, ListID) {

	this.URL = URL || "";
	this.ListID = ListID || "";

	// All modern browsers have this.
	if (history.pushState && !is_touch_device) {
		// The only way this would get here is if the browser is an antique because
		// the is_touch_device is handled before it even gets here.

		// toss up a loading screen
		var newBackground = $("<div/>", {
			"id": "listing-details-background",
			"html": "<br><br>Loading..."
		}).css({
			"background": "rgba(255,255,255,0.9)",
			"text-align": "center",
			"width": "100%",
			"height": "100%",
			"position": "fixed",
			"top": "0",
			"left": "0"
		}).appendTo(top.$("body"));

		// create a new iframe, place it in the top window's body, it will stretch to fill the entire screen.
		var newIframe = $("<iframe/>", {
			"src": this.URL,
			"id": "listing-details-frame",
			"frameBorder": "none"
		}).css({
			"width": "100%",
			"height": "100%",
			"position": "fixed",
			"top": "0",
			"left": "0",
			"z-index": "100",
		}).appendTo(top.$("body"));


		// get rid of the double scroll bars
		top.$("html, body").css("overflow", "hidden");

		// set the top window's address to the iframes current url, allows user to copy the url and share.
		top.window.history.pushState(null, null, this.URL);

		// when user clicks 'back' or uses the "back to search" link, remove the iframe and the background 'loading' screen. put the main windows scroll bars back.
		top.window.addEventListener("popstate", function(e){
			top.$("#listing-details-frame, #listing-details-background").remove();
			top.$("html, body").css("overflow", "");
		});

	} else {
		// Browser is most likely IE9 - IE6 (doesn't support pushstate) OR a touch enabled device. open the link in a popup window.
		var IsIDX = "False";
		if ($("#hdnIsIDX").length){
			IsIDX = $("#hdnIsIDX").val();
		}
		return openDetailsNewWindow({IsIDX:IsIDX, ListID:ListID});
	}
}

var openDetailsNewWindow = function(args) {
	var url = "/Listings/ListingDetails/ListingDetail.aspx?IDX=" + ( args.IsIDX == "True" || args.isIDX == true ? '1' : '0' ) +"&ListID="+args.ListID;
	var newTitle = "ListingDetails"+args.ListID;
	var options = "'resizeable=yes, scrollbars=yes, width=700, height="+(window.screen.height-200)+", top=10'";
	return window.open(url, newTitle, options, false);
};

function listingImage(args) {
	// Constructs and returns html for the listing's main image.

	var ListID = args.ListID;
	var newImage =  args.newImage;
	var FeaturedListing = args.FeaturedListing;
	var ListStatusDesc = args.ListStatusDesc;
	var HighLightFeaturedListings = args.HighLightFeaturedListings;
	var isIDX = args.isIDX;

	var htmlElement = $("<a/>", {
		"target": "_parent",
		"href": "/defaultlistings.x?IDX="+((isIDX)?"1":"0")+"&ListID=" + ListID,
		click: function (e) {
			if (is_touch_device) {
				e.preventDefault();
				return openDetailsNewWindow({isIDX:isIDX, ListID:ListID});
			} else {
				pushURLToIframe(this.href, ListID);
				e.preventDefault();
			};
		}
	}).append(newImage);


	if (ListStatusDesc === "Sold" || ListStatusDesc === "Rented" || ListStatusDesc === "Leased") {
		listingIsSold = $("<div/>", {
			"class": "listing-banner listing-banner-status-" + ListStatusDesc,
			"text": ListStatusDesc
		}).appendTo(htmlElement);
	} else {
		// If it's not sold, rented, or leased, we'll show the featured
		// banner because Sold, Rented, and Leased take priority.
		if (FeaturedListing === "True" && HighLightFeaturedListings === true) {
			var featListing = $("<div/>", {
				"class": "listing-banner listing-is-featured",
				"text": "Featured"
			}).appendTo(htmlElement);
		}
	}
	return htmlElement;
}


function listingMLSNumber(MLSNumber, HideMLSNumber) {
	// As long as HideMLSNumber isn't True, Return a en element containing the mls number
	if (HideMLSNumber === "False") {
		return $("<small/>", {
			"class": "mls-number",
			"text": "MLS #: " + MLSNumber
		});
	}
	return "";
}


function listingTypeStatus(ListTypeDesc, ListStatusDesc) {
	// experimenting with a constructor "class" type function instead of a normal function that returns values here. -TM
	var ListTypeDesc = ListTypeDesc || "";
	var ListStatusDesc = ListStatusDesc || "";

	var htmlString = "";

	if (ListTypeDesc !== "") {
		htmlString += ListTypeDesc;
	}

	if (ListStatusDesc !== "") {
		if (ListTypeDesc !== "") {
			htmlString += " | ";
		}
		htmlString += ListStatusDesc;
	}

	return $("<small/>", {
		"class": "type-and-description",
		"text": htmlString
	});
}


function createNewRow(args) {
	// Constructs and returns a piece of HTML to be injected into the DOM.

	var listing = args.listing;
	var isIDX = args.isIDX;

	var panel = $("<div/>", {
		id: "listing-id-" + listing.ListID,
		"class": "image-ctrl-row panel panel-default"
	});

	var listingPhoto = $("<div/>", {
		"class": "image-ctrl-photo"
	}).append(
		listingImage({
			ListID: listing.ListID,
			newImage: args.newImage,
			FeaturedListing: listing.FeaturedListing,
			ListStatusDesc: listing.ListStatusDesc,
			HighLightFeaturedListings: args.HighLightFeaturedListings,
			isIDX: isIDX
		})
	).appendTo(panel);

	var panelBody = $("<div/>", {
		"class": "panel-body"
	}).append(
		listingAmount({
			Amount: listing.ListPrice,
			HidePrice: listing.HidePrice,
			BillingCycleType: listing.BillingCycleType,
			ListStatusDesc: listing.ListStatusDesc
		})
	).appendTo(panel);

	if (args.enableFavorites) {
		panelBody.append(
			addToFavoritesLink({
				ListID: listing.ListID,
				IsFavorite: listing.IsFavorite
			})
		);
	}
	
	panelBody.append(
		clearfix(),
		$("<hr/>"),
		popOutListingDetailsButton({
			ListID:listing.ListID,
			isIDX: isIDX
		}),
		listingAddressAnchor({
			ListID: listing.ListID,
			Address1: listing.Address1,
			Address2: listing.Address2,
			City: listing.City,
			State: listing.State,
			ZipCode: listing.ZipCode,
			HideDisplayAddress: listing.HideDisplayAddress,
			isIDX: isIDX
		}),
		listingBedBathSQFT(listing.Bedrooms, listing.FullBathrooms, listing.HalfBaths, listing.QuarterBaths, listing.ThreeQuarterBaths, listing.SqFt),
		listingMLSNumber(listing.MLSNumber, listing.HideMLSNumber),
		listingTypeStatus(listing.ListTypeDesc, listing.ListStatusDesc)
	);
//		listingBedBathSQFT(listing.Bedrooms, listing.FullBathrooms, listing.PartialBathrooms, listing.SqFt),
	// Sometimes the listing doesn't have a description so the <hr> here isn't needed.
	if (listing.ShortDesc !== "") {
		panelBody.append($("<hr/>"));
	}

	// Insert the short description. Note, the short description comes with a "see more" link.
	panelBody.append(listingShortDescription(listing.ShortDesc, listing.ListID, isIDX));

	if (isIDX) {
		// Add a faint line at bottom of the panel with IDX info in it.
		panelBody.append(listingIDXInfo(listing.IDXLogo_Small, listing.AWSRListingOfficeName));
	}


	// Finally, return the panel that is full of all info.
	return panel;
}


function createNewGridRow(args) {
	// Constructs and returns a piece of HTML to be injected into the DOM.

	var listing = args.listing;
	var isIDX = args.isIDX;

	var row = $("<div/>", {
		id: "listing-id-" + listing.ListID,
		"class": "listings-grid-ctrl-row"
	});

	var column1 = $("<div/>", {
		"class": "col-xs-3"
	}).appendTo(row);

	var column2 = $("<div/>", {
		"class": "col-xs-6"
	}).append(
		popOutListingDetailsButton({
			ListID:listing.ListID,
			isIDX: isIDX
		}),
		listingAddressAnchor({
			ListID: listing.ListID,
			Address1: listing.Address1,
			Address2: listing.Address2,
			City: listing.City,
			State: listing.State,
			ZipCode: listing.ZipCode,
			HideDisplayAddress: listing.HideDisplayAddress,
			isIDX: isIDX
		}),
		listingBedBathSQFT(listing.Bedrooms, listing.FullBathrooms, listing.HalfBaths, listing.QuarterBaths, listing.ThreeQuarterBaths, listing.SqFt),
		listingMLSNumber(listing.MLSNumber, listing.HideMLSNumber),
		listingTypeStatus(listing.ListTypeDesc, listing.ListStatusDesc)
	).appendTo(row);

		//listingBedBathSQFT(listing.Bedrooms, listing.FullBathrooms, listing.PartialBathrooms, listing.SqFt),
	var column3 = $("<div/>", {
		"class": "col-xs-3 text-right"
	}).append(
		listingAmount({
			Amount: listing.ListPrice,
			HidePrice: listing.HidePrice,
			BillingCycleType: listing.BillingCycleType,
			ListStatusDesc: listing.ListStatusDesc
		})
	).appendTo(row);

	var listingPhoto = $("<div/>", {
		"class": "listings-grid-ctrl-img"
	}).append(
		listingImage({
			ListID: listing.ListID,
			newImage: args.newImage,
			FeaturedListing: listing.FeaturedListing,
			ListStatusDesc: listing.ListStatusDesc,
			HighLightFeaturedListings: args.HighLightFeaturedListings,
			isIDX: isIDX
		})
	).appendTo(column1);

	if (args.enableFavorites) {
		column3.append(
			addToFavoritesLink({
				ListID: listing.ListID,
				IsFavorite: listing.IsFavorite
			})
		);
	}

	if (isIDX) {
		// Add a faint line a bottom of the panel with IDX info in it.
		row.append(listingIDXInfo(listing.IDXLogo_Small, listing.AWSRListingOfficeName));
	}

	row.append(clearfix());

	return row;
}


function HandleLoadControlData(ListType) {
	// Builds up search criteria data that is ajax posted to a url to retrieve 
	// listings results.


	// Disable the 'See More Listings' button if it exists so while this is
	// loading the user doesn't click it multiple times.
	if ($("#SeeMoreListings").length){
		$("#SeeMoreListings").addClass("disabled");
	};


	// A loading animation that is used in multiple places.
	var loading = $("<div/>", {
		"class": "page-loading",
		html: "<i class='fa fa-spinner fa-spin fa-lg'></i><br> "
	});


	// Place the loading animation after the data panel grid to signal that 
	// something is happening. We are assuming that "#oDataPanelGrid" exists.
	$("#oDataPanelGrid").after(loading);


	// We must call this else the loading animation will not show up because it
	// will be out of scrolling range for the iframe.
	resizeMe('gridFrame');


	// This is a string that is passed to the url we post to. It contains the 
	// search details.
	var doSearchFilterJSON = ("\'" + $("#hdnSearchFilter").val() + "\'") || "\'[\"(BrokerageNotOwned \u003c\u003e 1)\", \"ListShareType not in (2,3,4)\"]\'";


	// A string that is passed to the url we post to. It will further filter
	// the results.
	var doSearchString = ("\'" + $("#ddlSortSelection").val() + "\'") || "'ListPrice:desc'";


	// This field will always exist, but it won't always have a value.
	if ( $("#hdnDefaultSortField").val() != "" ){
		doSearchString = "\'" + $("#hdnDefaultSortField").val() + "\:" + $("#hdnDefaultSortDir").val()  + "\'";
	}


	// When 25 listings are showing, this will be 24. We use this to know where
	// to start when user clicks "See more listings".
	var CurrentDisplayIndex = ("\'" + $("#hdnCurrentDisplayIndex").val() + "\'") || "'1'";


	// This will be "Grid View" or "Image View".
	var ListingsGridTypeShow = ("\'" + $("#hdnListingsGridTypeShow").val() + "\'") || "'Grid View'";


	// Determines whether or not we want to show the "add to favorites" buttons.
	var EnableFavorites = ("\'" + $("#hdnEnableFavorites").val() + "\'") || "'True'";


	// Determines whether or not to put the "FEATURED" banner on top of the
	// listing's image.
	var HighLightFeaturedListings = ("\'" + $("#hdnHighLightFeaturedListings").val() + "\'") || "'True'";


	// They must specify to show the map or else it will be hidden.
	var EnableMap = ("\'" + $("#hdnEnableMap").val() + "\'") || "'False'";


	// We don't know what this does, probably deprecated.
	var ListingsDisplayCount = ("\'" + $("#hdnListingsDisplayCount").val() + "\'") || "'0'";


	// We handle things differently when it's "IsIDX".
	var IsIDX = ("\'" + $("#hdnIsIDX").val() + "\'") || "'False'";


	// A big long string of search criteria.
	var ajaxData = "{ ImageWidth: 362, ImageHeight: 0, IsRent: 0, "
					+ " SearchString: " + doSearchFilterJSON
					+ ", SortSelection: " + doSearchString
					+ ", ListingsGridTypeShow: " + ListingsGridTypeShow
					+ ", CurrentDisplayIndex: " + CurrentDisplayIndex
					+ ", EnableFavorites:" + EnableFavorites
					+ ", HighLightFeaturedListings:" + HighLightFeaturedListings
					+ ", EnableMap:" + EnableMap
					+ ", ListingsDisplayCount:" + ListingsDisplayCount
					+ ", _bIsIDX:" + IsIDX + " }";


	// Finally, post everything we know to the ListingsGrid.aspx.
	$.ajax({
		type: "POST",
		url: "ListingsGrid.aspx/LoadControlData",
		data: ajaxData,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (data) {
			var info = data.d;
			
			// Update our index so we know for the next ajax post where to start.
			$("#hdnCurrentDisplayIndex").val(info.CurrentDisplayIndex);
			if (info.TotalCount <= 0) {
				$('#NoListingsReturned').show();
				$('#oDataPanelGrid').height('0px');
			}
			

			// Make sure there are results to work on before proceding.
			if (info.RowData !== null && info.RowData.length > 0) {
				var total = info.RowData.length; 
				var mapLocations = []; // Keep track of all pins on the map.
				var loadedImagesCount = 0; // Keep track of count of images that have been loaded.
				var newRows = []; // This only holds rows or snippets of html for the Image view.

				$.each(info.RowData, function (index, val) {
					var pin, viewRect;

					var loadStatus = $("<span/>", {
						text: ". "
					}).appendTo(loading);

					var actualImagePath = val.ListImagePhysicalPath || "/graphics/no_photos_available.jpg";

					var listingLoadImage = $("<img/>", {
						src: actualImagePath,
						onerror: "this.src='/graphics/no_photos_available.jpg'; this.rel='Error'"
					});

					var args = {
						listing: val,
						newImage: listingLoadImage,
						enableFavorites: info.EnableFavorites,
						isIDX: info.IsIDX,
						HighLightFeaturedListings: info.HighLightFeaturedListings
					}

					if (info.GridType === "Image View") {
						var newRow = createNewRow(args);
						newRows.push(newRow);

						$container.masonry('addItems', newRow);

						listingLoadImage.bind("load error", function () {
							loadedImagesCount += 1;
							if (loadedImagesCount === total) {
								// This means that all images have loaded and the request is basically done.
								$container.append(newRows);
								$container.masonry('layout');
								loading.remove();
								if ( $("#SeeMoreListings").length ){
									$("#SeeMoreListings").removeClass("disabled");
								};
								resizeMe('gridFrame');
							} else {
								// As the images load, remove the dot for each one.
								loadStatus.remove();
							}
						});
						
					} else {
						// This used to be if ("grid view") but that was too strict..

						// Unlike "Image View", we don't push each row to newRows.
						// We inject it straight into the DOM. This is because
						// we use masonry and it relies on all of the images 
						// being loaded before doing it's thing.
						$("#oDataPanelGrid").append(createNewGridRow(args));

						if (index === total - 1) {
							// Only remove the loading icon and resize the frame on the last loop.
							if ( $("#SeeMoreListings").length ){
								$("#SeeMoreListings").removeClass("disabled");
							};
							loading.remove();
							resizeMe('gridFrame');
						}
					}

					// Finally, add a pin to the map for this [each] listing result.
					if (info.EnableMap) {
						$('#ListingsMapContainer').show();
						if (val.Latitude !== "0" && val.Longitude !== "0") {
							mapLocations.push(new Microsoft.Maps.Location(val.Latitude, val.Longitude));
							pin = new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(val.Latitude, val.Longitude), {
								width: 50,
								height: 40,
								icon: '/images/pin_blue.png',
								id: val.AWSRListingID
							});
							pin.infoBoxTitle = $(listingAddressAnchor({
								ListID: val.ListID,
								Address1: val.Address1,
								Address2: val.Address2,
								City: val.City,
								State: val.State,
								ZipCode: val.ZipCode,
								HideDisplayAddress: val.HideDisplayAddress,
								isIDX: IsIDX
							})).html();
							pin.infoBoxDescription = "<div class=\'col-xs-6\' style=\'overflow\:hidden\;\'><img style=\'width\: 100\%\;\' src=\'" + val.ListImagePhysicalPath + "\'\/></div>" + "<div class=\'col-xs-6\'>" + val.ListPrice + "<br>";
							pin.infoBoxDescription += $(listingBedBathSQFT(val.Bedrooms, val.FullBathrooms, 0, 0, 0, val.SqFt)).html();
							pin.infoBoxDescription += "<\/div><div class=\'clearfix\'></div>";
							Microsoft.Maps.Events.addHandler(pin, 'click', displayInfobox);
							dataLayer.push(pin);
							viewRect = Microsoft.Maps.LocationRect.fromLocations(mapLocations);
							map.setView({ bounds: viewRect });
							//console.log('Set map', viewRect);
						}
					}
				});
//pin.infoBoxDescription += $(listingBedBathSQFT(val.Bedrooms, val.FullBathrooms, val.PartialBathrooms, val.SqFt)).html();
				// If there are more listings to see, display the "See more" button.
				if (info.TotalCount > 0) {
					try {
						if (info.TotalCount > info.CurrentDisplayIndex) {
							$("#SeeMoreListings").show();
							$("#SeeMoreListingsMaxReached").hide();
							$("#SeeMoreListings").html(
								"Click here to see more listings."
							);

							try {
								$("#Map_SeeMoreListings").show();
								$("#Map_SeeMoreListingsMaxReached").hide();

								$("#Map_SeeMoreListings").html(szMessageText);
							} catch (ignore) {
								//nothing...
							}

						} else {
							$("#SeeMoreListings").hide();
							$("#SeeMoreListingsMaxReached").show();
							$("#SeeMoreListingsMaxReached").html(info.CurrentDisplayIndex + " listings displayed out of " + info.TotalCount + " results returned. <br> Not seeing what you want?  Adjust your search criteria or contact an agent.");

							try {
								$("#Map_SeeMoreListings").hide();

								$("#Map_SeeMoreListingsMaxReached").show();

								$("#Map_SeeMoreListingsMaxReached").html(szMessageText);
							} catch (ignore) {
								//nothing...
							}
						}
					} catch (ignore) {
						// This could fail if one of the divs with formentioned ID's doesn't exist.
					}
				} else {
					$("#SeeMoreListings").hide();
					$("#SeeMoreListingsMaxReached").hide();
				}
			} else {
				// Reached when (info.RowData !== null && info.RowData.length > 0) === false.
				$("#SeeMoreListings").hide();
				$("#ListingsMapContainer").hide();
				loading.remove();
				$("#NoListingsReturned").show();
				$("#SeeMoreListings").hide();
				$("#SeeMoreListingsMaxReached").hide();
			}
			resizeMe('gridFrame');
		},
		error: function (msg) {
			var errorMsg, errorDiv;
			errorMsg = "The request has been cancelled: <br>" + JSON.stringify(msg);
			errorDiv = $("<div/>", {
				"class": "alert alert-danger",
				html: errorMsg
			});

			$("#oDataPanelGrid").after(errorDiv);
			loading.remove();
			resizeMe('gridFrame');
		}
	});
}


function ShowMDB(ctl) {
	document.getElementById(ctl).style.display = "block";
}

// Ensure that resizeMe is called when the window is resized.
$(window).resize(function () {
	setTimeout(function () {
		resizeMe('gridFrame');
	}, 1000);
});

function OpenFavorites() {
	console.log('OpenFavorites', loggedInName, $('#pnlFavorites'));
	if (loggedInName) {
		$('#pnlFavorites').modal('toggle');
	}
	else {
	    $('#hdnFunction').val('Favorites');
	    window.parent.document.body.scrollTop = 0;
	    window.top.document.body.scrollTop = 0;
		$("#pnlRegister").modal("toggle");
	}
}

function OpenSaveSearch() {
	console.log('OpenSaveSearch', loggedInName, $('#save-this-search-modal'));

	if (loggedInName) {
		$('#save-this-search-modal').modal('toggle');
	}
	else {
	    $('#hdnFunction').val('SaveSearch');
	    window.parent.document.body.scrollTop = 0;
	    window.top.document.body.scrollTop = 0;
		$("#pnlRegister").modal("toggle");
	}
}

function LoadSavedSearches(func, elem, SaveSearchModal, FavoritesModal) {
	var data = {};
	$.ajax({
		type: "POST",
		url: "/Listings/Controls/ApiMethods.aspx/LoadSavedSearches",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (msg) {
			var result = JSON.parse(msg.d);
			var newDiv = '<div><table class="table table-condensed" cellspacing="0" rules="all" border="1" id="gvSavedSearch" style="width:100%;border-collapse:collapse;">';
			newDiv += '<tr><th scope="col">Name</th><th class="hidden-xs" scope="col">Property Type</th><th class="hidden-xs" scope="col">Price Min $</th><th class="hidden-xs" scope="col">Price Max $</th><th scope="col">Email Alert</th></tr>';
			for (var i = 0; i < result.length; i++) {
				var csId = result[i].ClientSearchID;
				var sName = result[i].SearchName;
				var lType = result[i].ListTypeDesc;
				var priceMin = '';
				var priceMax = '';
				var emailAlert = result[i].EmailAlert;
				newDiv += '<tr><td><a href="javascript:savedSearchItemClick(' + csId + ')">' + sName + '</a></td>';
				newDiv += '<td class="hidden-xs">' + lType + '</td>';
				newDiv += '<td class="hidden-xs">' + priceMin + '</td>';
				newDiv += '<td class="hidden-xs">' + priceMax + '</td>';
				if (emailAlert) {
					newDiv += '<td><a id="EnableDisable_' + csId + '" data-csid="' + csId + '" href="javascript:savedSearchEmailAlertClick(' + csId + ', \'True\')">Disable</a></td>'
				}
				else {
					newDiv += '<td><a id="EnableDisable_' + csId + '" data-csid="' + csId + '" href="javascript:savedSearchEmailAlertClick(' + csId + ', \'False\')">Enable</a></td>'
				}
				newDiv += '</tr>';
			}
			newDiv += '</table></div>';
			elem.html(newDiv);
			if (func == "SaveSearch")
				SaveSearchModal.modal('toggle');
			else if (func == "Favorites")
				FavoritesModal.modal('toggle');
		}
	});
}

function DoSignIn() {

	var data = {
		UserName: $('#txtUsername').val(),
		Password: $('#txtPw').val(),
		Func: $('#hdnFunction').val()
	};
	var SignInName = $('#logInName');
	var SignInLink = $('#signInLink');
	var UserMenu = $('#userMenu');
	var SignInModal = $('#pnlRegister');
	var FavoritesModal = $('#pnlFavorites');
	var SaveSearchModal = $('#save-this-search-modal');
	var SavedSearchesPanel = $('#pnlShowSavedSearch');
	console.log(data);
	$.ajax({
		type: "POST",
		url: "/Listings/Controls/ApiMethods.aspx/SignIn",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (msg) {
			console.log(msg);
			var result = JSON.parse(msg.d)
			if (result.success) {
				SignInModal.modal('hide');
				SignInLink.hide();
				SignInName.text(result.loggedInName)
				loggedInName = result.loggedInName;
				UserMenu.show();
				LoadSavedSearches(result.func, SavedSearchesPanel, SaveSearchModal, FavoritesModal);
			}
			else {
				alert(result.error);
			}
		}
	});
}

function DoSignUp() {
	var emailField = document.getElementById("txtRegisterEmail");
	var phoneField = document.getElementById("txtPhoneNumber");
	console.log(emailField, phoneField);
	var data = {
		FirstName: $('#txtRegisterFirst').val(),
		LastName: $('#txtRegisterLast').val(),
		Email: $(emailField).val(),
		PhoneNumber: $(phoneField).val(),
		Password: $('#txtRegisterPassword').val(),
		Func: $('#hdnFunction').val()
	};
	var SignInName = $('#logInName');
	var SignInLink = $('#signInLink');
	var UserMenu = $('#userMenu');
	var SignInModal = $('#pnlRegister');
	var FavoritesModal = $('#pnlFavorites');
	var SaveSearchModal = $('#save-this-search-modal');
	var SavedSearchesPanel = $('#pnlShowSavedSearch');
	console.log(data);
	$.ajax({
		type: "POST",
		url: "/Listings/Controls/ApiMethods.aspx/SignUp",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (msg) {
			console.log(msg);
			var result = JSON.parse(msg.d)
			if (result.success) {
				SignInModal.modal('hide');
				SignInLink.hide();
				SignInName.text(result.loggedInName)
				loggedInName = result.loggedInName;
				UserMenu.show();
				LoadSavedSearches(result.func, SavedSearchesPanel, SaveSearchModal, FavoritesModal);
			}
			else {
				alert(result.error);
			}
		}
	});
}

function DoSignOut() {
	var data = {};
	deleteCookie();
	loggedInName = false;
	var SignInName = $('#logInName');
	var SignInLink = $('#signInLink');
	var UserMenu = $('#userMenu');
	var SavedSearchesPanel = $('#pnlShowSavedSearch');
	$('#pnlFavorites').modal('hide');
	$('#save-this-search-modal').modal('hide');
	var SavedSearchesPanel = $('#pnlShowSavedSearch');
	$.ajax({
		type: "POST",
		url: "/Listings/Controls/ApiMethods.aspx/SignOut",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (msg) {
			SignInName.text('');
			UserMenu.hide();
			SignInLink.show();
			SavedSearchesPanel.html('<div />');
		}
	});
}