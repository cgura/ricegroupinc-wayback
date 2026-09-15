
<!DOCTYPE html>

<html>
<head id="Head1"><title>
	Listings Search
</title><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1"><link href="/css/bootstrap-3.1.1/bootstrap.css" rel="Stylesheet" /><link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" /><link id="xsThemeCSS" rel="stylesheet" type="text/css" /><link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" /><link href="/listings/styles/listing_grid_styles.css?version=101013112014" rel="stylesheet" type="text/css" /><link href="styles/XSitesIDXUI.css" rel="stylesheet" type="text/css" />

	
	<style type="text/css">

	 .input-group .form-control {
		  position: relative;
		  z-index: 1 !important;
		  float: left;
		  width: 100%;
		  margin-bottom: 0;
	   }
		
		.js-protect-the-map {
			position: absolute;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(255,255,255,0.1);
		}
			
		.searchfieldplaceholder {
			margin-right: 15px;
			margin-left: 5px;
			margin-bottom: 15px;
			padding: 0 0 0 0;
		}

		.MultiDisplayBox_ddDiv {
			width: auto !important;
			height: 300px !important;
		}

		.MultiDisplayBox_ItemStyle {
			display: block;
			min-height: 20px;
			margin-top: 0;
			margin-bottom: 10px;
			padding-left: 20px;
			vertical-align: middle;
		}

		.MultiDisplayBox_ItemStyle input[type="checkbox"] {
			float: left;
			margin-left: -20px;
		}

		.MultiDisplayBox_ItemStyle label {
			display: inline;
			margin-bottom: 0;
			font-weight: normal;
			cursor: pointer;
		}

		.ui-helper-hidden {
			display: none;
		}

		.ui-helper-hidden-accessible {
			border: 0;
			clip: rect(0 0 0 0);
			height: 1px;
			margin: -1px;
			overflow: hidden;
			padding: 0;
			position: absolute;
			width: 1px;
		}

		#details-popup-frame {
			position: absolute;
			z-index: 100000;
			background: #fff;
		}

		#HomeRanger {
			margin-bottom: 8px;
			border-radius: 0px;
			border:0;
		}
		
		#HomeRangerTitle {
			font-size: 14px;
			font-weight: 900;
			text-align: center;
			padding:0px;
			background-color:transparent;
			box-shadow:none;
		}

		#HomeRangerTitle i {
			margin-right: 8px;
			background-color:none;
		}

		#HomeRangerContent {
			font-weight: 500;
			font-size: 16px;
			padding-left: 12px;
			padding-top: 4px;
			padding-right: 12px;
			padding-bottom: 8px;
		}

		#HomeRangerContent ul {
			padding-left: 30px;
			list-style: none;
			margin-bottom: 8px;
			font-weight: normal;
			font-size: 12px;
		}

		#HomeRangerContent li {
			margin-bottom: 11px;
		}

		#HomeRangerContent li:before {
			font-family: 'FontAwesome';
			font-size: 18px;
			content: '\f00c';
			margin: 5px 5px 0 -25px;
			color: #fff;
		}

		#btnSaveSearch {
			color: #ffffff;
			font-weight: normal;
			font-size: 14px;
		}

		@media (min-width: 992px) {
			.border-dashed-right {
				border-right:1px dashed #fff;
			}
		}
		@media (min-width: 1200px) {
			.border-dashed-right {
				border-right:1px dashed #fff;
			}
		}

	</style>


	<script type="text/javascript">
		var szFileName = "HomePage.x";
		var ListingsGridTypeShow = "Image View";

		//IDX Redirect
		function setNewPageIDX(url) {
			top.location.href = (url);
		}

		function setScreenSize() {
			document.getElementById('hdnScreenWidth').value = screen.width;
			document.getElementById('hdnScreenHeight').value = screen.height;
		}

		function setCriteriaForSavedSearch() {
			var nMinPrice = 0;
			var nMaxPrice = 999999999;
			var strQueryString;
			var hiddenPolyData = document.getElementById("txtEncodedPolyData");
			var beds = document.getElementById('ddlSearchBeds');
			var baths = document.getElementById('ddlSearchBaths');
			var propertyType = document.getElementById('ddlSearchPropertyType');
			var SqFtDD = document.getElementById('ddlSqFtSimpleSearch');
			var ddlSortSelection = document.getElementById('ddlSortSelection');
			var strXSIDXID = '0';
			strQueryString = "XSIDXID=" + strXSIDXID;
			strQueryString += "&SearchMode=ALLMLS";

			var strCityStateZipMLS = document.getElementById('txtSearchCityStateMLS');

			if ((hiddenPolyData != null) && (strCityStateZipMLS.value == "City, Zip, or MLS Number" || strCityStateZipMLS.value == "")) {
				if (hiddenPolyData.value.length > 0) {
					strQueryString += "&PolyData=" + hiddenPolyData.value;
				}
				else {
					alert('Please enter a City, Zip or MLS Number');
					return false;
				}
			}

			var strMinPrice = document.getElementById('txtSearchPriceMin').value;
			var strMaxPrice = document.getElementById('txtSearchPriceMax').value;

			if (propertyType.selectedIndex != -1) {
				strQueryString += "&PropertyType=" + propertyType.options[propertyType.selectedIndex].value;
			}
			if (beds.options[beds.selectedIndex].value != "Beds") {
				strQueryString += "&Beds=" + beds.options[beds.selectedIndex].value;
			}
			if (baths.options[baths.selectedIndex].value != "Baths") {
				strQueryString += "&Baths=" + baths.options[baths.selectedIndex].value;
			}
			if (SqFtDD.options[SqFtDD.selectedIndex].value != "SqFt") {
				strQueryString += "&SqFt=" + SqFtDD.options[SqFtDD.selectedIndex].value;
			}
			if (strMinPrice != "No Min") {
				strQueryString += "&MinSalesPrice=" + strMinPrice;
			}
			if (strMaxPrice != "No Max") {
				strQueryString += "&MaxSalesPrice=" + strMaxPrice;
			}
			//if (mdbSelections != undefined && mdbSelections.length > 0) {
			//    var newSelections = ReplaceAll(mdbSelections, " ", "");
			//    strQueryString += "&ListingDataIDs=" + newSelections;
			//}
			var strListingDataIDs = "";
			$("input[type='checkbox']").each(function () {
				var name = $(this).attr('name'); // grab name of original
				var value = $(this).attr('value'); // grab value of original
				var ischecked = $(this).is(":checked"); //check if checked
				if (name.substring(0, 3) == "mdb" && ischecked == true) {
					// ...
					var strArray;
					if (name.indexOf("$") > -1) {
						strArray = name.split("$");
					}
					if (name.indexOf(":") > -1) {
						strArray = name.split(":");
					}
					if (strListingDataIDs == "") {
						strListingDataIDs = strArray[1].replace("chk", "");
					}
					else {
						strListingDataIDs += "," + strArray[1].replace("chk", "");
					}
				}
			});
			strQueryString += "&ListingDataIDs=" + strListingDataIDs;
			if (strCityStateZipMLS.value.length > 0) {
				if (hiddenPolyData != null)
					hiddenPolyData.value = "";
				strQueryString += "&SearchAreaName=" + strCityStateZipMLS.value;
			}
			var polyVal = "";
			if (hiddenPolyData == null) {
				polyVal = "";
			}
			else {
				polyVal = hiddenPolyData.value;
			}
			var savedSearchName = $('#hdnSavedSearchName').val();
			var savedSearchEmailAlert = $('#hdnSavedSearchEmailAlerts').val();

			var searchCriteria = {
				XSIDXID: strXSIDXID,
				SearchMode: 'ALLMLS',
				PolyData: polyVal,
				PropertyType: (propertyType.selectedIndex != -1) ? propertyType.options[propertyType.selectedIndex].value : '',
				SearchBeds: (beds.options[beds.selectedIndex].value != "Beds") ? beds.options[beds.selectedIndex].value : '',
				SearchBaths: (baths.options[baths.selectedIndex].value != "Baths") ? baths.options[baths.selectedIndex].value : '',
				SqFtSimpleSearch: (SqFtDD.options[SqFtDD.selectedIndex].value != "SqFt") ? SqFtDD.options[SqFtDD.selectedIndex].value : '',
				PriceMin: (strMinPrice != "No Min") ? strMinPrice : '',
				PriceMax: (strMaxPrice != "No Max") ? strMaxPrice : '',
				ListingDataIDs: strListingDataIDs,
				CityStateMLS: strCityStateZipMLS.value,
				SortSelection: (ddlSortSelection.selectedIndex != -1) ? ddlSortSelection.options[ddlSortSelection.selectedIndex].value : '',
				SavedSearchEmailAlerts: savedSearchEmailAlert,
				SavedSearchName: savedSearchName
			};
			var postData = {
				Criteria: searchCriteria
			};
			var FavoritesModal = $('#pnlFavorites');
			var SaveSearchModal = $('#save-this-search-modal');
			var SavedSearchesPanel = $('#pnlShowSavedSearch');
			$.ajax({
				type: "POST",
				url: "/Listings/ListingsGrid.aspx/ResetDataSet",
				data: JSON.stringify(postData),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (msg) {
					//loading.remove();
					//resizeMe('gridFrame');
					//$("#hdnSearchFilter").val('');
					//HandleLoadControlData('Grid');
					LoadSavedSearches("SaveSearch", SavedSearchesPanel, SaveSearchModal, FavoritesModal)
				}
			});
		}

	    function setNewPage() {
	        var nMinPrice = 0;
	        var nMaxPrice = 999999999;
	        var strQueryString;
	        var hiddenPolyData = document.getElementById("txtEncodedPolyData");
	        var beds = document.getElementById('ddlSearchBeds');
	        var baths = document.getElementById('ddlSearchBaths');
	        var propertyType = document.getElementById('ddlSearchPropertyType');
	        var SqFtDD = document.getElementById('ddlSqFtSimpleSearch');
	        var ddlSortSelection = document.getElementById('ddlSortSelection');
	        var strXSIDXID = '0';
	        strQueryString = "XSIDXID=" + strXSIDXID;
	        strQueryString += "&SearchMode=ALLMLS";

			var strCityStateZipMLS = document.getElementById('txtSearchCityStateMLS');

			if ((hiddenPolyData != null) && (strCityStateZipMLS.value == "City, Zip, or MLS Number" || strCityStateZipMLS.value == "")) {
				if (hiddenPolyData.value.length > 0) {
					strQueryString += "&PolyData=" + hiddenPolyData.value;
				}
				else {
					alert('Please enter a City, Zip or MLS Number');
					return false;
				}
			}

			var strMinPrice = document.getElementById('txtSearchPriceMin').value;
			var strMaxPrice = document.getElementById('txtSearchPriceMax').value;

			if (propertyType.selectedIndex != -1) {
				strQueryString += "&PropertyType=" + propertyType.options[propertyType.selectedIndex].value;
			}
			if (beds.options[beds.selectedIndex].value != "Beds") {
				strQueryString += "&Beds=" + beds.options[beds.selectedIndex].value;
			}
			if (baths.options[baths.selectedIndex].value != "Baths") {
				strQueryString += "&Baths=" + baths.options[baths.selectedIndex].value;
			}
			if (SqFtDD.options[SqFtDD.selectedIndex].value != "SqFt") {
				strQueryString += "&SqFt=" + SqFtDD.options[SqFtDD.selectedIndex].value;
			}
			if (strMinPrice != "No Min") {
				strQueryString += "&MinSalesPrice=" + strMinPrice;
			}
			if (strMaxPrice != "No Max") {
				strQueryString += "&MaxSalesPrice=" + strMaxPrice;
			}
			//if (mdbSelections != undefined && mdbSelections.length > 0) {
			//    var newSelections = ReplaceAll(mdbSelections, " ", "");
			//    strQueryString += "&ListingDataIDs=" + newSelections;
			//}
			var strListingDataIDs = "";
			$("input[type='checkbox']").each(function () {
				var name = $(this).attr('name'); // grab name of original
				var value = $(this).attr('value'); // grab value of original
				var ischecked = $(this).is(":checked"); //check if checked
				if (name.substring(0, 3) == "mdb" && ischecked == true) {
					// ...
					var strArray;
					if (name.indexOf("$") > -1) {
						strArray = name.split("$");
					}
					if (name.indexOf(":") > -1) {
						strArray = name.split(":");
					}
					if (strListingDataIDs == "") {
						strListingDataIDs = strArray[1].replace("chk", "");
					}
					else {
						strListingDataIDs += "," + strArray[1].replace("chk", "");
					}
				}
			});
			strQueryString += "&ListingDataIDs=" + strListingDataIDs;
			if (strCityStateZipMLS.value.length > 0) {
				if (hiddenPolyData != null)
					hiddenPolyData.value = "";
				strQueryString += "&SearchAreaName=" + strCityStateZipMLS.value;
			}
			var polyVal = "";
			if (hiddenPolyData == null)
			{
				polyVal = "";
			}
			else
			{
				polyVal = hiddenPolyData.value;
			}
			var searchCriteria = {
				XSIDXID: strXSIDXID,
				SearchMode: 'ALLMLS',
				PolyData: polyVal,
				PropertyType: (propertyType.selectedIndex != -1) ? propertyType.options[propertyType.selectedIndex].value : '',
				SearchBeds: (beds.options[beds.selectedIndex].value != "Beds") ? beds.options[beds.selectedIndex].value : '',
				SearchBaths: (baths.options[baths.selectedIndex].value != "Baths") ? baths.options[baths.selectedIndex].value : '',
				SqFtSimpleSearch: (SqFtDD.options[SqFtDD.selectedIndex].value != "SqFt") ? SqFtDD.options[SqFtDD.selectedIndex].value : '',
				PriceMin: (strMinPrice != "No Min") ? strMinPrice : '',
				PriceMax: (strMaxPrice != "No Max") ? strMaxPrice : '',
				ListingDataIDs: strListingDataIDs,
				CityStateMLS: strCityStateZipMLS.value,
				SortSelection: (ddlSortSelection.selectedIndex != -1) ? ddlSortSelection.options[ddlSortSelection.selectedIndex].value : ''
			};
			var postData = {
				Criteria: searchCriteria
			};
			var url = ("http://" + window.location.host + "/DefaultListings?" + strQueryString);
			$("#hdnCurrentDisplayIndex").val("0");
			$('.listings-grid-ctrl-row').remove();
			$('.image-ctrl-row').remove();
			try
			{
				dataLayer.clear();
			}
			catch(err)
			{}
			$('#NoListingsReturned').hide();
			resizeMe('gridFrame');

			// A loading animation that is used in multiple places.
			var loading = $("<div/>", {
				"class": "page-loading",
				html: "<i class='fa fa-spinner fa-spin fa-lg'></i><br> "
			});
			
			// Place the loading animation after the data panel grid to signal that 
			// something is happening. We are assuming that "#oDataPanelGrid" exists.
			$("#oDataPanelGrid").before(loading);

			resizeMe('gridFrame');
			$('#ListingsMapContainer').show();
			// We must call this else the loading animation will not show up because it
			// will be out of scrolling range for the iframe.
			$.ajax({
				type: "POST",
				url: "/Listings/Controls/ApiMethods.aspx/LoadSearchResults",
				data: JSON.stringify(postData),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (msg) {
					loading.remove();
					resizeMe('gridFrame');
					$("#hdnSearchFilter").val('');
					HandleLoadControlData('Grid');
				}
			});
		}
		function ReplaceAll(Source, stringToFind, stringToReplace) {
			var temp = Source;
			var index = temp.indexOf(stringToFind);
			while (index != -1) {
				temp = temp.replace(stringToFind, stringToReplace);
				index = temp.indexOf(stringToFind);
			}
			return temp;
		}
		function setNewInternalSearchPage(url) {
			top.location.href = ("http://" + window.location.host + url)
			//top.location.href = ("http://" + window.location.host + "/DefaultListings?" + strQueryString)
		}

	</script>
	   
</head>
<body class="Image View" onload="setScreenSize()">
	<form name="form1" method="post" action="ListingsGrid.aspx?popup=1&amp;" id="form1">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__LASTFOCUS" id="__LASTFOCUS" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="LprIbyajA/k0ZUohp5+TGd9E6EjAZANt/szFWmRM5OJK/sO+dM+7rzH0ur37UO/yTnIvqYwTXP6MDCVL2mrYnL+LwxhLwOXC52m18nsi3MhKVm/yeZEHFCwmGJeS2OHd8UpEEHEHjtn9oedK4i1JiX1BPgSmuvwWNg1aXy2So9zeNy33r/FSiCIAh9UI3VmLnrlszAL49Wa4R5H//krMZyv0bddt9o4Fa+qNXmnrH6HirjY7dOUZJ8b2g0TAdMUpEx7SZUSkdxRdZHG4L80gO7ZQvGv2XoXrNBZVkPslg2XJW8E/2SeSQ3JaqYuD3zHdjl7x4ZlDiE8c019G0rRYDRTtpR1HQ+okKC/fwfRAwUwa458ioklxcIPbGzh3z6GhWmjJsHqKlApTBV+Oe9BWhSi+FM8RIFoUQKl4rCN8qIJbxUfJQ3T8xQ2UBk7NJjriAQju0hWn6+FscD/D2BoIGe5dzV2WSJO3SLtGaMsJOH40cQGNkTyN+t9GFusRfM9wJtDjlq/GhkOHiuJ7g5AFYajknyb2Cno/AI2rUFH8pDVJcJ9PiC7lO0zgQAdTj2aZj9NU1UaN/ue8XQFDDicSlJjTaoZ0GOmhiwXXz4EdshPh/c+gAEeiQIv28Et+LhU4ewlUX9T2f7b3ODu9vi53ZmnWTJ5drwClddb/s8M72ut8+lD8FXwb3Hkr7zedpax5D01hA8MrEJMod4i3T/k98irbyNVDAUFxA1oxOo97MZClRy6nvaS5gD4aKWjzqHadpK45Y4WZNwkURvF0wrKkxTST1nW9BUOVRU7a2sp+/N5vcQfdyHOwaoXWIS5JAUNvKgpKOsGmbEOo2LJGU1/cB2RqaU0h5xc9400td67chqH6/1Dem6+ImY4uMtMbR2VQYrw+kICBjbd+9J00aAAI+3C0uLhQbf5i4ogkimtTDEWfrZQmFHbnXRgjO9E672a6ceQgMlk0KWFjCXH950rugaw/48JTu/efZ07yoxO+6HEzCDaqKGlUL1eS4wFgGhfDi/cJX9sw6f65WOztZS77+O3iASnv+/fMDZ/HZIntRN9sQWvfWZBgvv1tvguPX/qrU8zSjhOhNi1O6mMPYf5owaXgDbZIyvaYI/9ipt8OsLLcD8B2AZJkcLqW8He7NNASSwr62dsMqExGMkhxaVVVOj42q2X4ZdLZZU48eOOf97M0xHt1bcIS1CG8QOA5P7a4JEOTbo75vTZImJIuhg0r3snSf45j1nvSJU71tsZ8Iy1/eirg4KyVCowwIlXEV/CPQa9lh8pKn1rDcPzKxJYMWsnQ/igvManWvVZSF+9WqSNgiHXH5eJTFN1q8AgjUomyKagrptQENCpS/T9ekem6VJhFnhbYWc2Ey0trqfx5/Kblnv6Ka5ozi2KLmGA9ElFP8qlRMmxsRFlf+OSXkV0TW2pPR3jPl5ZXQ/YP6r5no+JRnDrf2XMx0JzBN9rNUm6xVoTKwzs2B4SFdmPYDOfpLV8lAyMAoxPlV3N+J0jjASUzXXWHtDgrmRqWqeufM/InrJH/yo7X7d23aPye+yGWnrSYTpaZilaevitFFZJ8kXsSCOVdSaZU+wysTet1M9FDUGFFmBGUVyaunaVWuP28+fZduVbni2x1HVq++8HlMM/glJJir3YRJ167Amd4+XRf2wXaNgQVatUuQyPb8tSgW4yz/eO3x5nKIztMJUtFT7cvCFgZrIBZ5G4Gx4qcYJG18csTrJd10QDGH0Bus0FBhkQJ/1IJIq4zw5o84yQZ7iI=" />

<script type="text/javascript">
<!--
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
// -->
</script>



<script src="/ScriptResource.axd?d=vJc-5_MNrKV0gKHxhQVIA_j2BAEeWNZQghc0jUmNryLyjfKyTTKpN7Ln5waq_w7rZhOI6DWT1r-VON8RyK0W79bFAbXjFiYFdn1zR-xye1Ipt9YkrwguUHn4z51Gkulh0&amp;t=23c9c237" type="text/javascript"></script>
<script src="/Listings/JS_Code/MultiDisplayBox.js" type="text/javascript"></script>
<script src="/Listings/JS_Code/search.js" type="text/javascript"></script>
<script src="/Listings/JS_Code/jquery.tools.min.142.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
var PageMethods = function() {
PageMethods.initializeBase(this);
this._timeout = 0;
this._userContext = null;
this._succeeded = null;
this._failed = null;
}
PageMethods.prototype = {
_get_path:function() {
 var p = this.get_path();
 if (p) return p;
 else return PageMethods._staticInstance.get_path();},
ResetDataSet:function(Criteria,succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'ResetDataSet',false,{Criteria:Criteria},succeededCallback,failedCallback,userContext); },
LoadControlData:function(ImageWidth,ImageHeight,IsRent,SearchString,SortSelection,ListingsGridTypeShow,CurrentDisplayIndex,EnableFavorites,HighLightFeaturedListings,EnableMap,ListingsDisplayCount,_bIsIDX,succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'LoadControlData',false,{ImageWidth:ImageWidth,ImageHeight:ImageHeight,IsRent:IsRent,SearchString:SearchString,SortSelection:SortSelection,ListingsGridTypeShow:ListingsGridTypeShow,CurrentDisplayIndex:CurrentDisplayIndex,EnableFavorites:EnableFavorites,HighLightFeaturedListings:HighLightFeaturedListings,EnableMap:EnableMap,ListingsDisplayCount:ListingsDisplayCount,_bIsIDX:_bIsIDX},succeededCallback,failedCallback,userContext); },
AddToFavorites:function(ListingID,succeededCallback, failedCallback, userContext) {
return this._invoke(this._get_path(), 'AddToFavorites',false,{ListingID:ListingID},succeededCallback,failedCallback,userContext); }}
PageMethods.registerClass('PageMethods',Sys.Net.WebServiceProxy);
PageMethods._staticInstance = new PageMethods();
PageMethods.set_path = function(value) { PageMethods._staticInstance.set_path(value); }
PageMethods.get_path = function() { return PageMethods._staticInstance.get_path(); }
PageMethods.set_timeout = function(value) { PageMethods._staticInstance.set_timeout(value); }
PageMethods.get_timeout = function() { return PageMethods._staticInstance.get_timeout(); }
PageMethods.set_defaultUserContext = function(value) { PageMethods._staticInstance.set_defaultUserContext(value); }
PageMethods.get_defaultUserContext = function() { return PageMethods._staticInstance.get_defaultUserContext(); }
PageMethods.set_defaultSucceededCallback = function(value) { PageMethods._staticInstance.set_defaultSucceededCallback(value); }
PageMethods.get_defaultSucceededCallback = function() { return PageMethods._staticInstance.get_defaultSucceededCallback(); }
PageMethods.set_defaultFailedCallback = function(value) { PageMethods._staticInstance.set_defaultFailedCallback(value); }
PageMethods.get_defaultFailedCallback = function() { return PageMethods._staticInstance.get_defaultFailedCallback(); }
PageMethods.set_enableJsonp = function(value) { PageMethods._staticInstance.set_enableJsonp(value); }
PageMethods.get_enableJsonp = function() { return PageMethods._staticInstance.get_enableJsonp(); }
PageMethods.set_jsonpCallbackParameter = function(value) { PageMethods._staticInstance.set_jsonpCallbackParameter(value); }
PageMethods.get_jsonpCallbackParameter = function() { return PageMethods._staticInstance.get_jsonpCallbackParameter(); }
PageMethods.set_path("ListingsGrid.aspx");
PageMethods.ResetDataSet= function(Criteria,onSuccess,onFailed,userContext) {PageMethods._staticInstance.ResetDataSet(Criteria,onSuccess,onFailed,userContext); }
PageMethods.LoadControlData= function(ImageWidth,ImageHeight,IsRent,SearchString,SortSelection,ListingsGridTypeShow,CurrentDisplayIndex,EnableFavorites,HighLightFeaturedListings,EnableMap,ListingsDisplayCount,_bIsIDX,onSuccess,onFailed,userContext) {PageMethods._staticInstance.LoadControlData(ImageWidth,ImageHeight,IsRent,SearchString,SortSelection,ListingsGridTypeShow,CurrentDisplayIndex,EnableFavorites,HighLightFeaturedListings,EnableMap,ListingsDisplayCount,_bIsIDX,onSuccess,onFailed,userContext); }
PageMethods.AddToFavorites= function(ListingID,onSuccess,onFailed,userContext) {PageMethods._staticInstance.AddToFavorites(ListingID,onSuccess,onFailed,userContext); }
var gtc = Sys.Net.WebServiceProxy._generateTypedConstructor;
Type.registerNamespace('Listings');
if (typeof(Listings.SearchCriteria) === 'undefined') {
Listings.SearchCriteria=gtc("Listings.SearchCriteria");
Listings.SearchCriteria.registerClass('Listings.SearchCriteria');
}
if (typeof(Listings.ReturnData) === 'undefined') {
Listings.ReturnData=gtc("Listings.ReturnData");
Listings.ReturnData.registerClass('Listings.ReturnData');
}
if (typeof(Listings.ListFavData) === 'undefined') {
Listings.ListFavData=gtc("Listings.ListFavData");
Listings.ListFavData.registerClass('Listings.ListFavData');
}
// -->
</script>

<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="4D9FB9B8" />
<input type="hidden" name="__VIEWSTATEENCRYPTED" id="__VIEWSTATEENCRYPTED" value="" />
<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="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" />
		

		<input type="hidden" name="hdnSavedSearchName" id="hdnSavedSearchName" />
		<input type="hidden" name="hdnSavedSearchEmailAlerts" id="hdnSavedSearchEmailAlerts" />
		<input type="hidden" name="hdnClientSearchID" id="hdnClientSearchID" />
		<input type="hidden" name="hdnMapData" id="hdnMapData" />
		<input type="hidden" name="minLat" id="minLat" />
		<input type="hidden" name="maxLat" id="maxLat" />
		<input type="hidden" name="minLon" id="minLon" />
		<input type="hidden" name="maxLon" id="maxLon" />
		<input type="hidden" name="hdnSearchFilter" id="hdnSearchFilter" value="[&quot;(BrokerageNotOwned \u003c\u003e 1)&quot;,&quot;ListShareType not in (2,3,4)&quot;]" />
		<input type="hidden" name="hdnDefaultSortField" id="hdnDefaultSortField" value="ListPrice" />
		<input type="hidden" name="hdnDefaultSortDir" id="hdnDefaultSortDir" value="desc" />
		<input type="hidden" name="hdnListingsGridTypeShow" id="hdnListingsGridTypeShow" value="Image View" />
		<input type="hidden" name="hdnListingsGridTypeShowSearchPostback" id="hdnListingsGridTypeShowSearchPostback" value="Image View" />
		<input type="hidden" name="hdnCurrentDisplayIndex" id="hdnCurrentDisplayIndex" value="1" />
		<input type="hidden" name="hdnEnableFavorites" id="hdnEnableFavorites" value="True" />
		<input type="hidden" name="hdnHighLightFeaturedListings" id="hdnHighLightFeaturedListings" value="False" />
		<input type="hidden" name="hdnEnableMap" id="hdnEnableMap" value="True" />
		<input type="hidden" name="hdnListingsDisplayCount" id="hdnListingsDisplayCount" value="0" />
		<input type="hidden" name="hdnIsIDX" id="hdnIsIDX" value="False" />
		<input type="hidden" name="hdnScreenWidth" id="hdnScreenWidth" />
		<input type="hidden" name="hdnScreenHeight" id="hdnScreenHeight" />
		<div id="pnlFavorites" class="modal fade">
	
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Favorites</h4>
			</div>
			<div class="modal-body">
				<div style="max-height: 500px; overflow: auto">
					<div>

	</div>
				</div>
			</div>
		</div>
	</div>

</div>

		<div id="pnlSavedSearch" class="modal fade">
	
	 <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Saved Searches</h4>
			</div>
			<div class="modal-body">
				<div id="pnlShowSavedSearch">
		
					<div>

		</div>
				
	</div>
			</div>
		</div>
	</div>

</div>
<div id="save-this-search-modal" class="modal fade" role="dialog" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">What would you like to save this search as?</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
				<label>Saved Search Name:</label>
				<input name="SavedSearchCtrl1:tbSaveSearchName" type="text" id="tbSaveSearchName" class="form-control" />
				</div>
				<div class="form-group">
				<input id="cboEmailAlerts" type="checkbox" name="SavedSearchCtrl1:cboEmailAlerts" /><label for="cboEmailAlerts"> Get e-mail notifications when new listings match this criteria</label> 
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="SaveSearch(); submitForm();">Save and Search</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>

		
		
		<div id="divResultsToolbar">
			<ul class="nav nav-pills">
				<li>
					<a href="JavaScript:showLoader( 'ListingGrid' )" id="ListingGridBtn"> <i class="fa fa-list"></i> <span class="hidden-xs">List</span></a>
				</li>
				<li>
					<a href="JavaScript:showLoader( 'PhotoGrid' )" id="PhotoGridBtn"><i class="fa fa-picture-o"></i> <span class="hidden-xs">Photo</span></a>
				</li>
				<li id="MapMenuItem">
					<a href="JavaScript:showLoader( 'ListingsMapContainer' )"><i class="fa fa-map-marker"></i> <span class="hidden-xs">Map</span></a>
				</li>
				<li id="FavMenuItem">
					
					<a href="javascript:OpenFavorites()"><i class="fa fa-star"></i> <span class="hidden-xs">Favorites</span></a>

				</li>
				<li class="pull-right">
					

<style type="text/css">
	/* This search suggest box only appears on the idx quick search widget. */
	#search_suggest_dyn {
		z-index: 1000;
	}
	#pnlRegister .tab-pane .modal-body {
		padding-top: 0;
	}
</style>



<script type="text/javascript">
	var bscss = document.createElement("link");
	bscss.href = "/css/bootstrap.min.css";
	bscss.rel = "stylesheet";
	bscss.type = "text/css";
	bscss.id = "js-added-bootstrap";
	var legacy_shield = $("<div/>", {
		"id": "xs-legacy-shield"
	});

	$(document).ready(function () {
		if ($(".xs-legacy").length) {
			$("#pnlRegister").on("show.bs.modal", function (e) {
				document.getElementsByTagName("head")[0].appendChild(bscss);
				$("body").append(legacy_shield);
			});
			$("#pnlRegister").on("hide.bs.modal", function (e) {
				if ($("#js-added-bootstrap").length || $("#xs-legacy-shield").length) {
					$("#js-added-bootstrap, #xs-legacy-shield").remove();
				}
			});
		}
		$(".xs-signup-or-signin-btn").click(function (e) {
		    $('#hdnFunction').val('');
			ShowSignIn(false);
		});
	});
</script>

<script src="/Listings/JS_Code/jquery.cookie.js" type="text/javascript"></script> 
<script src="/Listings/JS_Code/moment.min.js" type="text/javascript"></script> 
<script src="/Listings/JS_Code/ListingsCookie.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
	function ValidateLogin() {
		if (document.getElementById("txtUsername").value == "") {
			alert("Please enter your username");
			document.getElementById('txtUsername').focus();
			return false;
		}
		if (document.getElementById("txtPw").value == "") {
			alert("Please enter your password");
			document.getElementById('txtPw').focus();
			return false;
		}
	    //btnDoSignIn()
		DoSignIn();
		return false;
		//return true;
	}
	function ValidateRequiredFields() {
		var isValid = true;
		if (document.getElementById("txtRegisterFirst").value == "") {
			alert("Please enter a first name.");
			document.getElementById("txtRegisterFirst").focus();
			isValid = false;
		}
		if (document.getElementById("txtRegisterLast").value == "") {
			alert("Please enter a last name.");
			document.getElementById("txtRegisterLast").focus();
			isValid = false;
		}
		if (document.getElementById('txtRegisterPassword').value == "") {
			alert("Please enter password");
			document.getElementById("txtRegisterPassword").focus();
			isValid = false;
		}
		if (document.getElementById('txtRegisterPassword').value != document.getElementById('txtRegisterPasswordVerify').value) {
			alert("Passwords do not match");
			document.getElementById("txtRegisterPasswordVerify").focus();
			isValid = false;
		}
		if (document.getElementById("txtRegisterEmail").value == "") {
			alert("Please enter an email address.");
			document.getElementById("txtRegisterEmail").focus();
			isValid = false;
		}
		var x = document.getElementById("txtRegisterEmail").value;
		var atpos = x.indexOf("@");
		var dotpos = x.lastIndexOf(".");
		if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
			alert("Not a valid e-mail address");
			isValid = false;
		}
		if (document.getElementById("txtRegisterEmailConfirm").value == "") {
			alert("Please confirm your email address.");
			document.getElementById("txtRegisterEmailConfirm").focus();
			isValid = false;
		}
		var x = document.getElementById("txtRegisterEmailConfirm").value;
		var atpos = x.indexOf("@");
		var dotpos = x.lastIndexOf(".");
		if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
			alert("Not a valid e-mail address");
			isValid = false;
		}
		//return true;
		if (isValid) {
		    //__doPostBack("SignUp", $('#hdnFunction').val());
		    DoSignUp();
		}
		return false;
    }
    function btnDoSignOut() {
        __doPostBack("SignOut", "");
    }
    function btnDoSignIn() {
        __doPostBack("SignIn", $('#hdnFunction').val());
    }
</script>

<script type="text/javascript">

	function ShowSignIn(forceSignIn) {
		$(document).ready(function () {
			if(forceSignIn=="" || forceSignIn=="undefined" || forceSignIn==null) {
				forceSignIn = false;
			}

			// if the user is forced to create an account to procede
			if(forceSignIn){
				$(".dismiss-modal").remove();
			}
			window.parent.document.body.scrollTop = 0;
			window.top.document.body.scrollTop = 0;
			$("#pnlRegister").modal('show');
		});
	}

	function HideSignIn() {
	    $(document).ready(function () {
	        $('#pnlRegister').modal('hide');
	    });
	}


    var delimiter = "&";

    function createCookie(clientID, AWSAccountID, FirstName, Email) {
        var value = "LastLogin=" + formatDate(new Date());
        value += delimiter + "XSContactID=" + clientID;
        value += delimiter + "AWSAccountID=" + AWSAccountID;
        value += delimiter + "FirstName=" + FirstName;
        value += delimiter + "Email=" + Email;
        value += delimiter + "AuthUntil=" + formatDate(moment().add('d', 14));

        $.cookie("XSitesContact", value, { expires: 365, path: "/" });
    }

    function createNewCookie(clientID, AWSAccountID, FirstName, Email) {
        var expDate = new Date();
        var value = "LastLogin=" + formatDate(new Date());
        value += delimiter + "XSContactID=" + clientID;
        value += delimiter + "AWSAccountID=" + AWSAccountID;
        value += delimiter + "FirstName=" + FirstName;
        value += delimiter + "Email=" + Email;
        expDate.setDate(expDate.getDate() + 365);
        document.cookie = "XSitesContact=" + escape(value) + ";expires=" + expDate.toGMTString();    
    }

</script>




	<script type="text/javascript">
		var loggedInName = false;
	</script>

<a href="#" id="signInLink" class="xs-signup-or-signin-btn" > Sign in</a>
<a id="userMenu" href="#" class="xs-toggle-logout-favorites-menu" data-toggle="dropdown"   style="display: none;" >Hi, <span id="logInName"></span><i class="fa fa-caret-down"></i></a>
<ul class="dropdown-menu" role="menu" aria-labelledby="logoutMenu" style="right: 0; left: auto;" id="logoutMenu">
	<li><a href="#pnlSavedSearch" data-toggle="modal">Saved Searches</a></li>
	<li><a href="#pnlFavorites" data-toggle="modal">Favorites</a></li>
	<li><a href="javascript: DoSignOut();" id="btnSignOut">Sign Out</a></li>
</ul>
<div id="pnlRegister" tabindex="-1" class="modal fade" role="dialog" aria-labelldby="registerPanel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<button type="button" class="pull-right dismiss-modal close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#RegisterSignUp" data-toggle="tab" id="create-account-tab">Sign up</a></li>
					<li><a href="#RegisterLogin" data-toggle="tab" id="sign-in-tab">Sign in</a></li>
				</ul>
			</div>
			<div class="tab-content">
				<div id="RegisterLogin" class="tab-pane">
					<div id="pnlRegisterLogin" language="javascript" onkeypress="javascript:return WebForm_FireDefaultButton(event, &#39;btnDoSignIn&#39;)">
		
						<div class="modal-body">
							<div class="form-group row">
								<label class="col-sm-4">E-mail Address:</label>
								<div class="col-sm-8">
									<input name="SignIn:txtUsername" type="text" id="txtUsername" class="form-control" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-4">Password:</label>
								<div class="col-sm-8">
									<input name="SignIn:txtPw" type="password" id="txtPw" class="form-control" />
                                    <input type="hidden" id="hdnFunction" name="hdnFunction" value="" />
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<input type="submit" name="SignIn:btnDoSignIn" value="Sign In" onclick="return ValidateLogin();" language="javascript" id="btnDoSignIn" class="btn btn-primary" />
						</div>
					
	</div>
				</div>

				<div id="RegisterSignUp" class="tab-pane active">
					<div id="pnlRegisterSignup">
		
						<div class="modal-body">
							<p>By signing into my site, you can access your favorites from any computer and get e-mail updates when new listings come in that match your recent searches.</p>
							<br>
							<div class="form-group row">
								<label class="col-sm-4">Name:</label>
								<div class="col-sm-8">
									<div class="row">
										<div class="col-xs-6">
											<input name="SignIn:txtRegisterFirst" type="text" id="txtRegisterFirst" class="form-control" placeholder="First Name" autofocus="" />
										</div>
										<div class="col-xs-6">
											<input name="SignIn:txtRegisterLast" type="text" id="txtRegisterLast" class="form-control" placeholder="Last Name" />
										</div>
									</div>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-4">E-mail Address:</label>
								<div class="col-sm-8"><input name="SignIn:txtRegisterEmail" type="text" id="txtRegisterEmail" class="form-control" /></div>
							</div>

							<div class="form-group row">
								<label class="col-sm-4">Retype E-mail:</label>
								<div class="col-sm-8">
									<input name="SignIn:txtRegisterEmailConfirm" type="text" id="txtRegisterEmailConfirm" class="form-control" />
								</div>
							</div>
                            <div class="form-group row">
								<label class="col-sm-4">Phone Number:</label>
								<div class="col-sm-8">
                                    <input name="SignIn:txtPhoneNumber" type="text" id="txtPhoneNumber" class="form-control" />
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-4">Password:</label>
								<div class="col-sm-8">
									<input name="SignIn:txtRegisterPassword" type="password" id="txtRegisterPassword" class="form-control" />
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-4">Retype Password:</label>
								<div class="col-sm-8">
									<input name="SignIn:txtRegisterPasswordVerify" type="password" id="txtRegisterPasswordVerify" class="form-control" />
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-link dismiss-modal" data-dismiss="modal">Not this time</button>
							<input type="submit" name="SignIn:btnCreateProfile" value="Continue" onclick="return ValidateRequiredFields();" language="javascript" id="btnCreateProfile" class="btn btn-primary" />
						</div>
					
	</div>
				</div>
			</div> <!-- .tab-content -->
		</div> <!-- .modal-content -->
	</div> <!-- modal-dialog -->

</div>
				</li>
				<div class="clearfix"></div>
			</ul>
		</div>

		<div id="OuterSearchDiv" class="panel panel-default panel-body search-wrapper" DefaultButton="SearchSubmitBtn">
			<div class="pull-left col-md-8 border-dashed-right">

			
	
			<div id="pnlInternalSimpleSearchOptions">
				<div class="form-group row">
					<div class="col-xs-6">
						<input name="txtSearchCityStateMLS" type="text" value="City, Zip, or MLS Number" id="txtSearchCityStateMLS" class="form-control input-sm" placeholder="City, Zip, or MLS Number" onfocus="handleSearchCSZM( this )" onblur="handleSearchCSZM( this )" />
					</div>
					<div class="col-xs-4">
						<select name="ddlSearchPropertyType" id="ddlSearchPropertyType" class="form-control input-sm">
	<option value="All Property Types">All Property Types</option>
	<option value="Residential">Residential</option>
	<option value="Senior">Senior</option>
	<option value="Townhouse">Townhouse</option>

</select>
					</div>
					<div class="col-xs-2">
						<span style="display:">
							<span style="display:">
								<select name="ddlSqFtSimpleSearch" id="ddlSqFtSimpleSearch" class="form-control input-sm">
	<option value="SqFt">SqFt</option>
	<option value="1000">1,000 SqFt +</option>
	<option value="1500">1,500 SqFt +</option>
	<option value="2000">2,000 SqFt +</option>
	<option value="2500">2,500 SqFt +</option>
	<option value="3000">3,000 SqFt +</option>
	<option value="4000">4,000 SqFt +</option>
	<option value="5000">5,000 SqFt +</option>

</select>
							</span>
						</span>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="form-group row" style="display:">
					<div class="col-xs-6">
						<div class="input-group">
							<span class="input-group-addon input-sm">$</span>
							<input name="txtSearchPriceMin" type="text" value="No Min" id="txtSearchPriceMin" class="form-control input-sm" onfocus="handleSearchPriceMin( this )" onblur="handleSearchPriceMin( this )" />
							<span class="input-group-addon input-sm" style="background:transparent;border:none;">to</span>
							<span class="input-group-addon input-sm">$</span>
							<input name="txtSearchPriceMax" type="text" value="No Max" id="txtSearchPriceMax" class="form-control input-sm" onfocus="handleSearchPriceMax( this )" onblur="handleSearchPriceMax( this )" />
						</div>
					</div>
					<div class="col-xs-3">
						<select name="ddlSearchBeds" id="ddlSearchBeds" class="form-control input-sm">
	<option value="Beds">Beds</option>
	<option value="1">1+</option>
	<option value="2">2+</option>
	<option value="3">3+</option>
	<option value="4">4+</option>
	<option value="5">5+</option>

</select>
					</div>
					<div class="col-xs-3">
						<select name="ddlSearchBaths" id="ddlSearchBaths" class="form-control input-sm">
	<option value="Baths">Baths</option>
	<option value="1">1+</option>
	<option value="2">2+</option>
	<option value="3">3+</option>
	<option value="4">4+</option>
	<option value="5">5+</option>

</select>
					</div>
					<div class="clearfix"></div>
				</div>
			</div> 

			<div id="oIDXMoreSearchOptions" style="display: none;" class="form-group row">
				<div id="pnlPropertyFeaturesContentArea" class="collapsePanel">
	
					<div id="pnlMDB1" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB2" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB3" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB4" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB5" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB6" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB7" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB8" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB9" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB10" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB11" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB12" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB13" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB14" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB15" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB16" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB17" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB18" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB19" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB20" class="searchfieldplaceholder">
		
						
					
	</div>
					<div id="pnlMDB21" class="searchfieldplaceholder">
		
						
					
	</div>
					<div class="clearfix"></div>
				
</div>
				<div class="clearfix"></div>
			</div> 

			<div id="oInternalMoreSearchOptions" style="display: none;">
				<h4>Search for home by location</h4>
				<div class="form-group row">
					<div class="col-xs-8">
						<label>Location or MLS ID</label>
						<input name="txtSearchCityState" type="text" value="City, Zip, or MLS Number" id="txtSearchCityState" class="form-control input-sm" onfocus="handleSearchCSZM( this )" onblur="handleSearchCSZM( this )" />
					</div>
					<div class="col-xs-4">
						<label>Search Within</label>
						<select name="ddlSearchDistance" id="ddlSearchDistance" class="form-control input-sm">
	<option value="5">5 miles</option>
	<option value="10">10 miles</option>
	<option value="15">15 miles</option>
	<option value="20">20 miles</option>
	<option value="30">30 miles</option>

</select>
					</div>
					<div class="clearfix"></div>
				</div>
				<hr>

				<h4>Property Details</h4>
				<div class="form-group row">
					<div class="col-xs-6">
						<label>Price</label>
						<div class="input-group">
							<span class="input-group-addon input-sm">$</span>
							<input name="tbPriceMin" type="text" value="No Min" id="tbPriceMin" class="form-control input-sm" onfocus="handleSearchPriceMin( this )" onblur="handleSearchPriceMin( this )" />
							<span class="input-group-addon input-sm" style="background: transparent; border: none;">to</span>
							<span class="input-group-addon input-sm">$</span>
							<input name="tbPriceMax" type="text" value="No Max" id="tbPriceMax" class="form-control input-sm" onfocus="handleSearchPriceMax( this )" onblur="handleSearchPriceMax( this )" />
						</div>
					</div>

					<div class="col-xs-3">
						<label>Bedrooms</label>
						<div class="input-group">
							<input name="tbBedroomsMin" type="text" id="tbBedroomsMin" class="form-control input-sm" />
							<span class="input-group-addon input-sm" style="background: transparent; border: none;">to</span>
							<input name="tbBedroomsMax" type="text" id="tbBedroomsMax" class="form-control input-sm" />
						</div>
					</div>

					<div class="col-xs-3">
						<label>Bathrooms</label>
						<div class="input-group">
							<input name="tbBathroomsMin" type="text" id="tbBathroomsMin" class="form-control input-sm" />
							<span class="input-group-addon input-sm" style="background: transparent; border: none;">to</span>
							<input name="tbBathroomsMax" type="text" id="tbBathroomsMax" class="form-control input-sm" />
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="form-group row">
					<div class="col-xs-6">
						<label>Square Footage</label>
						<div class="input-group">
							<input name="tbSqFtMin" type="text" id="tbSqFtMin" class="form-control input-sm" />
							<span class="input-group-addon input-sm" style="background: transparent; border: none;">to</span>
							<input name="tbSqFtMax" type="text" id="tbSqFtMax" class="form-control input-sm" />
						</div>
					</div>
					<div class="col-xs-6">
						<label>Year Built</label>
						<div class="input-group">
							<input name="tbYearMin" type="text" id="tbYearMin" class="form-control input-sm" />
							<span class="input-group-addon input-sm" style="background: transparent; border: none;">to</span>
							<input name="tbYearMax" type="text" id="tbYearMax" class="form-control input-sm" />
						</div>
					</div>
					<div class="col-xs-4" style="display:none">
						
						<label>Lot Size</label>
						<div class="input-group-addon">
							<input name="tbLotSizeMin" type="text" id="tbLotSizeMin" class="form-control input-sm" />
							<span class="input-group-addon" style="background: transparent; border: none;">to</span>
							<input name="tbLotSizeMax" type="text" id="tbLotSizeMax" class="form-control input-sm" />
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="form-group row">
					<div class="col-xs-3">
						<label>Garage Capacity</label>
						<select name="dllGarageCapacity" id="dllGarageCapacity" class="form-control input-sm">
	<option value="-1">Any</option>
	<option value="1">1 car</option>
	<option value="2">2 car</option>
	<option value="3">3 car</option>
	<option value="4">4 car</option>
	<option value="5">5 car</option>
	<option value="6">6 car</option>
	<option value="7">7 car</option>
	<option value="8">8 car</option>
	<option value="9">9+ car</option>

</select>
					</div>

					<div class="col-xs-3">
						<label>Floors/Levels</label>
						<select name="ddlFloorLevels" id="ddlFloorLevels" class="form-control input-sm">
	<option value="-1">Any</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9+</option>

</select>
					</div>

					<div class="col-xs-6">
						<label>School District</label>
						<select name="ddlSchoolDistrict" id="ddlSchoolDistrict" class="form-control input-sm">
	<option value="Any School District">Any School District</option>
	<option value=""></option>

</select>
					</div>
					<div class="clearfix"></div>
				</div>
				<hr>

				<h4>Property Type</h4>
				<div class="form-group row">
					<div class="col-xs-12">
						<table id="cbPropertyTypes" border="0" style="width:100%;">
	<tr>
		<td><input id="cbPropertyTypes_0" type="checkbox" name="cbPropertyTypes:cbPropertyTypes_0" /><label for="cbPropertyTypes_0">All Property Types</label></td><td><input id="cbPropertyTypes_2" type="checkbox" name="cbPropertyTypes:cbPropertyTypes_2" /><label for="cbPropertyTypes_2">Senior</label></td><td><input id="cbPropertyTypes_3" type="checkbox" name="cbPropertyTypes:cbPropertyTypes_3" /><label for="cbPropertyTypes_3">Townhouse</label></td>
	</tr><tr>
		<td><input id="cbPropertyTypes_1" type="checkbox" name="cbPropertyTypes:cbPropertyTypes_1" /><label for="cbPropertyTypes_1">Residential</label></td><td></td><td></td>
	</tr>
</table>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<hr>
			</div> 

			<div class="form-group row">
				<div class="col-xs-4">
					<div style="display:">
						<select name="ddlSortSelection" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ddlSortSelection\&#39;,\&#39;\&#39;)&#39;, 0)" language="javascript" id="ddlSortSelection" class="form-control input-sm">
	<option selected="selected" value="ListPrice:desc">Price: High to Low</option>
	<option value="ListPrice:asc">Price: Low to High</option>
	<option value="SqFt:desc">SF: High to Low</option>
	<option value="SqFt:asc">SF: Low to High</option>
	<option value="MLSNumber:desc">MLS ID: High to Low</option>
	<option value="MLSNumber:asc">MLS ID: Low to High</option>
	<option value="ListStatusDesc:asc">Status: Ascending</option>
	<option value="ListStatusDesc:desc">Status: Descending</option>
	<option value="City:asc">City: Ascending</option>
	<option value="City:desc">City: Descending</option>
	<option value="County:asc">County: Ascending</option>
	<option value="County:desc">County: Descending</option>

</select>
					</div>
				</div>

				<div class="col-xs-5">
					<div style="display:">
						<div style="display:">
							<select name="ddlListStatusDesc" id="ddlListStatusDesc" class="form-control input-sm">
	<option value="Any Status">Any Status</option>
	<option value="Closed">Closed</option>
	<option value="For Rent">For Rent</option>
	<option value="For Sale">For Sale</option>
	<option value="Rented">Rented</option>
	<option value="Sample Listing">Sample Listing</option>
	<option value="Sold">Sold</option>

</select>
						</div>
					</div>
				</div>

				<div class="col-xs-3">
					<!--<div class="input-group">-->
						
							<button title="Search Listings" type="submit" onclick="submitForm()" class="btn btn-primary btn-block btn-sm" id="Button1"><i class="fa fa-search"></i> Search</button>
						
						<!--<span class="input-group-btn">
							<ul class="dropdown-menu" role="menu" aria-labelledby="savedSearchDropdownMenu" style="right:0;left:auto;">
								<li>
									<a href="#save-this-search-modal" data-toggle="modal">
										<i class="fa fa-star"></i>
										Save This Search
									</a>
								</li>
							</ul>
						
							<button type="button" data-toggle="dropdown" class="btn btn-primary btn-sm toggle-dropdownmenu">
								<i class="fa fa-caret-down"></i>
							</button>
						</span>-->
					<!--</div>-->
				</div>
				<div class="clearfix"></div>
			</div>

				<div style="display:block" class="form-group row">
					<div style="display:block" class="col-md-3">
							<button class="btn btn-link btn-sm" type="button" onclick="ToggleMoreSearchOptions(this, 'False');">More Search Options <i class="fa fa-caret-down"></i></button>

					
					</div>
				</div>

			</div>
			<div class="pull-left col-md-4" style="display:block">
				<div id="HomeRanger" class="panel panel-default" style="display:">
					<div id="HomeRangerTitle" class="panel-heading"><i class="fa fa-home"></i>
						Saved Searches
					</div>
					<div id="HomeRangerContent" class="panel-body">
						<ul>
							<li>Price change and new listings alerts</li>
							<li>Return and view this search later</li>
							<li>Save a list of your favorite properties</li>
						</ul>
						<a id="btnSaveSearch" href="javascript:OpenSaveSearch();" class="btn btn-primary btn-block btn-sm" ><i class="fa fa-star"></i> Save This Search</a>
					</div>
				</div>

			</div>


		</div> 

		<div>
			
			<div id="ListingsMapContainer" style="position:relative;" class="col-md-12">
				
<style type="text/css">
	.map {
		position: relative;
		height: 300px;
		margin: auto;
	}
</style>

<div id="oListingsMap" class="map-container">
	<script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"></script>
	<div class="form-group">
		<div id='mapDiv' class="map" ></div>
		<input type="hidden" name="ListingsMap1:hidStrLoc" id="hidStrLoc" />
		<input type="hidden" name="ListingsMap1:txtEncodedPolyData" id="txtEncodedPolyData" />
		<input type="hidden" name="ListingsMap1:minLat" id="minLat" />
		<input type="hidden" name="ListingsMap1:maxLat" id="maxLat" />
		<input type="hidden" name="ListingsMap1:minLon" id="minLon" />
		<input type="hidden" name="ListingsMap1:maxLon" id="maxLon" />
	</div>
	
	<div class="form-group">
		<button id="Map_SeeMoreListings" type="button" onclick="HandleLoadControlData( &#39;Grid&#39; )" class="btn btn-primary btn-block">See More Listings</button>
		<div id="Map_SeeMoreListingsMaxReached" style="display:none"></div>
	</div>
</div>

<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-470315-12']);
	_gaq.push(['_trackPageview']);

	(function () {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
	})();

	var map = null, infobox, dataLayer;

	function displayInfobox(e) {
		var newTitle = e.target.infoBoxTitle;
		var newDescription = e.target.infoBoxDescription;

		infobox.setLocation(e.target.getLocation());
		infobox.setOptions({
			title: newTitle,
			description: newDescription,
			visible: true
		});
	}

	function hideInfobox(e) {
		if (e.targetType == 'pushpin') {
			infobox.setLocation(e.target.getLocation());
			infobox.setOptions({visible: false});
		}
	}

	function gotodetails(e) {
		if (e.targetType == 'pushpin') {
		// __doPostBack("Pin_Click", e.target._id);
		}
	}

	function wheelCallback(e) {
		// window.scrollBy(0,-5*e.mouseWheelChange);
		return false;
	}

	var polygonPoints = new Array();
	var polyline;
	var color;
	var vfillColor;

	function createMap() {
		var strTitleText = "";
		var mapOptions = {
			credentials: "Agwjc7BjlqYywX0q2rXsC4B9LS-hY3oPRXjfg24LlpYkScnIOkLnZ67tE4oKuPYE",
			zoom: 13,
			enableSearchLogo: false,
			enableClickableLogo: false,
			labelOverlay: Microsoft.Maps.LabelOverlay.hidden
		};

		map = new Microsoft.Maps.Map(document.getElementById("mapDiv"), mapOptions);
		Microsoft.Maps.Events.addHandler(map, "mousewheel", function(e){
			e.handled = true;
			return true;
		});

		Microsoft.Maps.Events.addHandler(map, "viewchangeend", onview);
		Microsoft.Maps.Events.addHandler(map, "attachmapviewchange", wheelCallback);

		//PolyData
		polygonPoints = decodeLine(document.getElementById("txtEncodedPolyData").value);
		if (polygonPoints != null) {
			if (polygonPoints.length > 1) {
				if (polygonPoints[0].latitude != polygonPoints[polygonPoints.length - 1].latitude && polygonPoints[0].longitude != polygonPoints[polygonPoints.length - 1].longitude) {
					var p2 = new Microsoft.Maps.Location(polygonPoints[0].latitude, polygonPoints[0].longitude);
					polygonPoints.push(p2);
				}
			}
		}

		color = new Microsoft.Maps.Color(120, 35, 252, 35);
		vfillColor = new Microsoft.Maps.Color(80, 35, 252, .5);
		polyline = new Microsoft.Maps.Polygon(polygonPoints, { strokeColor: color, fillColor: vfillColor, strokeThickness: 4 });

		dataLayer = new Microsoft.Maps.EntityCollection();
		dataLayer.clear();
		map.entities.push(dataLayer);

		var infoboxLayer = new Microsoft.Maps.EntityCollection();
		infoboxLayer.clear();
		map.entities.push(infoboxLayer);

		infobox = new Microsoft.Maps.Infobox(new Microsoft.Maps.Location(0, 0), { visible: false, height: 160, width: 300, offset: new Microsoft.Maps.Point(0, 5) });
		infoboxLayer.push(infobox);

		if (polyline != null) {
			map.entities.push(polyline);
	}	
	}

	//createMap();

	var visiblePinLocations = [];

	function onview(){
		var map = this.target; //reference to the Map object from which it came
		var bounds = map.getBounds();
		visiblePinLocations = [];
		for ( var i = 0; i < dataLayer.getLength(); i ++ ) {
			var loc = dataLayer.get( i ).getLocation()
			if ( bounds.contains( loc ) )
			{
				visiblePinLocations.push( loc );
			}
		}
		try { 
			handleListingsDisplay( visiblePinLocations );
		}
		catch( ex ) { }
	}

	function decodeLine(encoded) {
		var len = encoded.length;
		var index = 0;
		var array = [];
		var lat = 0;
		var lng = 0;
		var bFirst = true;
		var fLat;
		var fLon;

		try {
			while (index < len) {
				var b;
				var shift = 0;
				var result = 0;
				do {
					b = encoded.charCodeAt(index++) - 63;
					result |= (b & 0x1f) << shift;
					shift += 5;
				} while (b >= 0x20);
				var dlat = ((result & 1) ? ~(result >> 1) : (result >> 1));
				lat += dlat;

				shift = 0;
				result = 0;
				do {
					b = encoded.charCodeAt(index++) - 63;
					result |= (b & 0x1f) << shift;
					shift += 5;
				} while (b >= 0x20);
				var dlng = ((result & 1) ? ~(result >> 1) : (result >> 1));
				lng += dlng;
				if (bFirst) {
					fLat = (lat * 1e-5);
					fLon = (lng * 1e-5);
					bFirst = false;
				}
				array.push(new Microsoft.Maps.Location((lat * 1e-5), (lng * 1e-5)));
			}
		} catch (ex) {
			alert(ex.Message);
			//error in encoding.
		}
		return array;
	}
</script>

				<!-- here to prevent accidental panning instead of scrolling espcecially on mobile devices, -tm -->
				<div class="js-protect-the-map"></div>
			</div>
			<div class="clearfix"></div>
			<!-- #ListingsMapContainer -->
			<div id="sortAlpha">

</div>

			

			<div id="oDataPanelGrid">
				<div class="image-ctrl-row"></div>
				<div class="gutter-spacer"></div>
			</div>

			<div>
				<button id="SeeMoreListings" type="button" onclick="HandleLoadControlData( &#39;Grid&#39; )" class="btn btn-primary btn-block">See More Listings</button>
				<div id="SeeMoreListingsMaxReached" style="display:none"></div>
			</div>

			<div id="NoListingsReturned" style="display:none" class="alert alert-warning">
				<strong>I'm Sorry...</strong> 
				<br> No properties that match the given criteria were found. Try broadening your requirements or reducing the number of parameters for your search.
			</div>
			
<br />
<br />
<div class="text-center col-sm-8 col-sm-offset-2">
	<div>
		
	</div>
	
	<span id="lblFooter" class="text-muted"></span>
	<span id="lblLastUpdated" class="text-info"></span>
</div>
<br />
<br />

		</div>

		<input type="hidden" name="hdnPinLocations" id="hdnPinLocations" />

		<a id="LinkButton1" href="javascript:__doPostBack(&#39;LinkButton1&#39;,&#39;&#39;)" style="display: none">LinkButton</a>

	
<script src="/WebResource.axd?d=GS5cG5ZlWvNtgcyrGJ7NTaU0vISu0XFTU2cRX8U1LBJBZEtRWrCZUNERf11mSSxIaYDHDBKsSCFpOqGvmeM79SpBFpxj95pHf9T-MlDZDcs1&amp;t=635328605200000000" type="text/javascript"></script>
</form>

	
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="/Listings/JS_Code/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/Listings/JS_Code/MultiDisplayBox.js"></script>
	<script type="text/javascript" src="/scripts/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="/Listings/JS_Code/Listings.js"></script>
	<script type="text/javascript">
		try {
			try {
				$("#hidStrLoc").val($("#hdnMapData").val());
				createMap();
			} catch (ignore) { }
		} catch (ex) {
			alert(ex);
		}
	</script>
	<script src="/Listings/JS_Code/jquery.cookie.js" type="text/javascript"></script> 
	<script src="/Listings/JS_Code/moment.min.js" type="text/javascript"></script> 
	<script src="/Listings/JS_Code/ListingsCookie.js" type="text/javascript"></script>

	<script type="text/javascript">
		try {
			var themeCSSPath = $(window.parent.document).find("link#xsThemeCSS").attr("href");
			$("#xsThemeCSS").attr("href", themeCSSPath);
		} catch (ignore) {
			// must be a legacy template.
		}

		function createCookie(name, value, days) {
			if (days) {
				var date = new Date();
				date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
				var expires = "; expires=" + date.toGMTString();
			}
			else var expires = "";
			document.cookie = name + "=" + value + expires + "; path=/";
		}

		function HideSavedSearch()
		{
			$('#save-this-search-modal').modal('hide');
		}

		function readCookie(name) {
			var nameEQ = name + "=";
			var ca = document.cookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ') c = c.substring(1, c.length);
				if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
			}
			return null;
		}

		var IsIDX;
		
			IsIDX = false;
		

		$(document).ready(function () {
			if (ListingsGridTypeShow == "Image View") {
				$container.masonry({
					gutter: ".gutter-spacer",
					columnWidth: ".image-ctrl-row",
					isInitLayout: false
				});
			};

			$( "#txtSearchCityStateMLS" ).keypress(function( event ) {
				if ( event.which == 13 ) {
					event.preventDefault();
					if(IsIDX)
					{
						setNewPage();
					}
					else
					{
						submitForm();
					}
				}
			});

			$('#save-this-search-modal').on('shown.bs.modal', function () {
				window.parent.document.body.scrollTop = 0;
			});
			//$('#oDataPanelGrid').height('0px');
			HandleLoadControlData('Grid');
			resizeMe('gridFrame');

			$("#txtSearchPriceMin").keyup(function () {
				if ($("#txtSearchPriceMin").val() != "No Min") {
					$("#tbPriceMin").val($("#txtSearchPriceMin").val());
				}
			});
			$("#txtSearchPriceMax").keyup(function () {
				if ($("#txtSearchPriceMax").val() != "No Max") {
					$("#tbPriceMax").val($("#txtSearchPriceMax").val());
				}
			});
			$("#tbPriceMin").keyup(function () {
				if ($("#tbPriceMin").val() != "No Min") {
					$("#txtSearchPriceMin").val($("#tbPriceMin").val());
				}
			});
			$("#tbPriceMax").keyup(function () {
				if ($("#tbPriceMax").val() != "No Max") {
					$("#txtSearchPriceMax").val($("#tbPriceMax").val());
				}
			});

			$("#ddlSearchBeds").change(function () {
				if ($("#ddlSearchBeds").text() != "Beds") {
					$("#tbBedroomsMin").val($("#ddlSearchBeds option:selected").val());
					$("#tbBedroomsMax").val("");
				}
			});

			$("#ddlSearchBaths").change(function () {
				if ($("#ddlSearchBaths").text() != "Baths") {
					$("#tbBathroomsMin").val($("#ddlSearchBaths option:selected").val());
					$("#tbBathroomsMax").val("");
				}
			});

			$("#ddlSqFtSimpleSearch").change(function () {
				if ($("#ddlSqFtSimpleSearch").text() != "SqFt") {
					$("#tbSqFtMin").val($("#ddlSqFtSimpleSearch option:selected").val());
					$("#tbSqFtMax").val("");
				}
			});


			$("#tbBedroomsMin").keyup(function () {
				$("#ddlSearchBeds option").each(function () {
					if ($(this).val() == $("#tbBedroomsMin").val()) {
						$(this).attr('selected', 'selected');
					}
				});
			});

			$("#tbBathroomsMin").keyup(function () {
				$("#ddlSearchBaths option").each(function () {
					if ($(this).val() == $("#tbBathroomsMin").val()) {
						$(this).attr('selected', 'selected');
					}
				});
			});

			$("#tbSqFtMin").keyup(function () {
				$("#ddlSqFtSimpleSearch option").each(function () {
					if ($(this).val() == $("#tbSqFtMin").val()) {
						$(this).attr('selected', 'selected');
					}
				});
			});

			
		});

		$(function () {
			var availableCSMLS = [ '75007','75023','75024','75032','75034','75063','75077','75093','75287','76054','79423','Carrollton','Dallas','Frisco','Heath','Hurst','Irving','Lewisville','Lubbock','Plano'];
			$("#txtSearchCityStateMLS").autocomplete({
				source: availableCSMLS
			});
			$("#txtSearchCityState").autocomplete({
				source: availableCSMLS
			});
		});
			// This helps to prevent unintentional panning on the bing map. They must first click on the map to be able to start panning.
			$(".js-protect-the-map").click(function () {
				$(this).remove();
			})
	</script>
</body>
</html>
