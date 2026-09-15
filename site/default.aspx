
   <!doctype html> 


<!--<form method="post" action="default.aspx" id="form1" class="xs-legacy">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTQxNDk0MDA1Mg9kFgJmD2QWBAIFD2QWAmYPZBYEZg8WAh4EVGV4dAXKFDxkaXYgY2xhc3M9Y29udGFpbmVyPjxwIHN0eWxlPSJURVhULUFMSUdOOiBjZW50ZXIiIGFsaWduPSJjZW50ZXIiPjxzdHJvbmc+PGZvbnQgc2l6ZT0iMiI+PC9mb250Pjwvc3Ryb25nPjwvcD4NCjxwIHN0eWxlPSJURVhULUFMSUdOOiBjZW50ZXIiIGFsaWduPSJjZW50ZXIiPjxiIHN0eWxlPSJmb250LXNpemU6IHNtYWxsOyI+PGZvbnQgc3R5bGU9IkZPTlQtU0laRTogMTZweCI+PC9mb250PjwvYj48Zm9udD48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAyMHB4OyI+PGI+T1VSIExJU1RJTkdTIEFSRSBTRUxMSU5HIEZBU1QhPC9iPjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxOHB4OyBsaW5lLWhlaWdodDogMjUuNzE0Mjg2ODA0MTk5MnB4OyI+PGI+PGJyPjwvYj48L3NwYW4+PC9mb250Pjxmb250IGNvbG9yPSIjZmYwMDAwIiBzdHlsZT0iZm9udC1zaXplOiAyMnB4OyI+PGI+V0UgTkVFRCBNT1JFITwvYj48L2ZvbnQ+PGJyPjxicj48YiBzdHlsZT0iZm9udC1zaXplOiBzbWFsbDsiPjxpbWcgc3R5bGU9IldJRFRIOiAzODRweDsgSEVJR0hUOiA4OXB4IiBzcmM9Imh0dHA6Ly9mYWlyd2F5aW5kZXBlbmRlbnRtb3J0Z2FnZWNvcnBvcmF0aW9uMi5hZ2VudHhzaXRlcy5jb20veFNpdGVzL0FnZW50cy9GYWlyd2F5SW5kZXBlbmRlbnRNb3J0Z2FnZUNvcnBvcmF0aW9uMi9Db250ZW50L1VwbG9hZGVkRmlsZXMvNjc1ODJfMC5qcGciIHdpZHRoPSIzODMiIGhlaWdodD0iMTcyIj48L2I+PC9wPg0KPHAgc3R5bGU9IlRFWFQtQUxJR046IGNlbnRlciIgYWxpZ249ImNlbnRlciI+PGZvbnQgc2l6ZT0iMiI+PGZvbnQgc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xkOyBmb250LXNpemU6IDE0cHg7Ij5Db21tZXJjaWFsJm5ic3A7JmFtcDsgUmVzaWRlbnRpYWwgUmVhbCBFc3RhdGUgU3BlY2lhbGlzdHM8YnI+PGJyPjwvZm9udD48Zm9udCBzdHlsZT0iZm9udC1zaXplOiAxOHB4OyIgY29sb3I9IiMwMDAwMDAiPjxiPkNPTlRSQUNUT1IgT0YgVEhFIFlFQVI8YnI+PGZvbnQgc3R5bGU9ImZvbnQtc2l6ZTogMTRweDsiPihBbmdpZSdzIExpc3QgLSBSZWFsIEVzdGF0ZSBBZ2VudCBDYXRlZ29yeSk8L2ZvbnQ+PC9iPjwvZm9udD48L2ZvbnQ+PC9wPg0KPHA+VGhlIFJpY2UgR3JvdTxmb250IHN0eWxlPSJGT05ULVNJWkU6IDE0cHgiPnAsIEluYy4gaXMgYSB0b3AgcmVjb21tZW5kZWQgcmVhbCBlc3RhdGUgYWdlbmN5IHNwZWNpYWxpemluZyBpbiBhIHdpZGUgYXJyYXkgb2YgY29tbWVyY2lhbCA8Zm9udCBzdHlsZT0iRk9OVC1TSVpFOiAxNHB4Ij5pbnZlc3RtZW50PC9mb250PiBhbmQgcmVzaWRlbnRpYWwgcmVhbCBlc3RhdGUgc2VydmljZXMuIEJhc2VkIGluIERhbGxhcywgVGV4YXMsIG91ciA8Zm9udCBzdHlsZT0iRk9OVC1TSVpFOiAxNHB4Ij5wcmluY2lwYWxzPC9mb250PiBwb3NzZXNzIG92ZXIgNzAgeWVhcnMgb2YgY29tYmluZWQgcHJhY3RpY2UgaW4gYnJvPC9mb250PmtlcmFnZSwgY29uc3VsdGluZywgbGVhc2luZyBhbmQgbWFuYWdlbWVudC4gPC9wPg0KPHA+V2Ugcm91dGluZWx5IGFzc2lzdCB3aXRoIGFjcXVpc2l0aW9ucyBhbmQvb3IgZGlzcG9zaXRpb25zLCBsZWFzaW5nIGFuYWx5c2VzLCBsZWFzZSB2ZXJzdXMgYnV5IGRlY2lzaW9ucywgdGVuYW50IHJlcHJlc2VudGF0aW9uIGFuZCBwcm9wZXJ0eSBtYW5hZ2VtZW50LiBBcyBvdXIgY2xpZW50LCB5b3VyIGludGVyZXN0cyB3aWxsIGFsd2F5cyBiZSBwbGFjZWQgYWhlYWQgb2Ygb3VyIG93bi4gPC9wPg0KPHA+V2Ugd2VsY29tZSB5b3UgdG8gZXZhbHVhdGUgdGhlIHNjb3BlIG9mIHNlcnZpY2VzIHRoYXQgd2UgcHJvdmlkZSBhbmQgdGhlICJwcml2YXRlIGNsaWVudCIgbGV2ZWwgb2YgcGVyc29uYWwgYXR0ZW50aW9uIHRoYXQgeW91IGNhbiBleHBlY3QuIDwvcD4NCjxwPlBsZWFzZSBjb250YWN0IEJyZW50IFJpY2UgYXQgKDIxNCkgODA4LTMxMDAgb3ImbmJzcDtMYXJyeSBSaWNlIGF0ICg0NjkpJm5ic3A7MjE2LTcwNzAgb3IgYnkgZW1haWwgdG8mbmJzcDs8YSBocmVmPSJtYWlsdG86YnJlbnRAcmljZWdyb3VwaW5jLmNvbSI+YnJlbnRAcmljZWdyb3VwaW5jLmNvbTwvYT4uPC9wPg0KPHAgY2xhc3M9ImNvbnRlbnR0ZXh0Ij5UaGUgUmljZSBHcm91cCwgSW5jLiB0ZWFtIGNhbiBwYXJ0bmVyIHdpdGggeW91LiBXZSBlbWJyYWNlIHRoZSBjb252ZW5pZW5jZSBvZiB0ZWNobm9sb2d5IHdpdGhvdXQgbG9zaW5nIHRoZSBwZXJzb25hbCB0b3VjaC4gWW91J2xsIGxvdmUgdGhlIHJlc291cmNlcyBhdmFpbGFibGUgb24gb3VyIHdlYiBzaXRlLCB0aGUgZWxlY3Ryb25pYyBzaWduYXR1cmUgY2FwYWJpbGl0eSBhbmQgdGhlIGUtbWFpbCBub3RpZmljYXRpb25zLCBidXQgdGhlc2UgZG8gbm90IHJlcGxhY2UgdGhlIHRpbWUgd2Ugc3BlbmQgd2l0aCB5b3UsIHNlcnZpbmcgYXMgeW91ciBwZXJzb25hbCBndWlkZSB0aHJvdWdoIHRoaXMgZXhjaXRpbmcgcHJvY2Vzcy4gPC9wPg0KPHAgY2xhc3M9ImNvbnRlbnR0ZXh0Ij5QLlMuIElmIHlvdSdyZSBub3QgcmVhZHkgdG8gbWVldCBpbiBwZXJzb24sIHBsZWFzZSB0b3VyIHRocm91Z2ggb3VyIHdlYiBzaXRlLiBXZSBhcmUgc3VyZSB5b3UnbGwgZmluZCB0aGUgcmVzb3VyY2VzIGhlcmUgdXNlZnVsIGFuZCBoZWxwZnVsLiBFbmpveSEgPC9wPjwvZGl2PmQCAg9kFgJmD2QWDAIBDw8WAh4HVmlzaWJsZWdkFgICAQ8WAh4EaHJlZgUkaHR0cDovL3d3dy5mYWNlYm9vay5jb20vcmljZWdyb3VwaW5jZAIDDw8WAh8BZ2QWAgIBDxYCHwIFI2h0dHA6Ly93d3cudHdpdHRlci5jb20vcmljZWdyb3VwaW5jZAIFDw8WAh8BaGRkAgcPDxYCHwFnZBYCAgEPFgIfAgUkaHR0cDovL3d3dy5saW5rZWRpbi5jb20vaW4vYnJlbnRyaWNlZAIJDw8WAh8BaGRkAgsPDxYCHwFoZGQCCA9kFgJmD2QWBAICDxYCHwAFkg48YnIvPjxkaXYgY2xhc3M9J3RhYmxlVGV4dCcgc3R5bGU9J3RleHQtYWxpZ246IGNlbnRlcjsnPjxkaXYgY2xhc3M9J3hzLXNpdGUtZm9vdGVyLWNvbnRhY3QtaW5mbyc+PHNwYW4gY2xhc3M9J3hzLXNpdGUtZm9vdGVyLW9mZmljZS1waG9uZSc+UGhvbmU6IDxzY3JpcHQgbGFuZ3VhZ2U9amF2YXNjcmlwdD4gZG9jdW1lbnQud3JpdGUoJygyMTQpIDgwOC0zMTAwJyk7PC9zY3JpcHQ+PC9zcGFuPiA8c3BhbiBjbGFzcz0neHMtc2l0ZS1mb290ZXItb2ZmaWNlLWZheCc+RmF4OiA8c2NyaXB0IGxhbmd1YWdlPWphdmFzY3JpcHQ+IGRvY3VtZW50LndyaXRlKCcoMjE0KSAyOTEtNTcwNicpOzwvc2NyaXB0Pjwvc3Bhbj4gPHNwYW4gY2xhc3M9J3hzLXNpdGUtZm9vdGVyLWVtYWlsJz5FLW1haWw6IDxhIGhyZWY9J21haWx0bzorV2srelZWVmcvRFBNNy9Yb3FvamdGWW9JRHMvNTEvYlhPTFVrc0EyUzhVPSc+K1drK3pWVlZnL0RQTTcvWG9xb2pnRllvSURzLzUxL2JYT0xVa3NBMlM4VT08L2E+PC9zcGFuPjwvZGl2PjxkaXYgY2xhc3M9J3hzLXNpdGUtZm9vdGVyLXNpdGUtbmF2aWdhdGlvbic+PGEgaHJlZj0iL0ZvckJ1eWVycyI+PHNwYW4gc3R5bGU9J3doaXRlLXNwYWNlOiBub3dyYXA7Jz5Gb3IgQnV5ZXJzPC9zcGFuPjwvYT4gfCA8YSBocmVmPSIvSG9tZSI+PHNwYW4gc3R5bGU9J3doaXRlLXNwYWNlOiBub3dyYXA7Jz5Ib21lPC9zcGFuPjwvYT48L2Rpdj48YnI+PGRpdiBjbGFzcz0neHMtc2l0ZS1mb290ZXItY29weXJpZ2h0Jz5Db3B5cmlnaHQgJmNvcHk7IDIwMTYgVGhlIFJpY2UgR3JvdXAsIEluYy48YnI+UG9ydGlvbnMgQ29weXJpZ2h0ICZjb3B5OyAyMDE2ICBQaXBlbGluZSBST0ksIGluYy48YnI+QW5vdGhlciB3ZWJzaXRlIGJ5IDxhIGhyZWY9J2h0dHA6Ly93d3cucGlwZWxpbmVyb2kuY29tLycgdGFyZ2V0PSdfYmxhbmsnPlBpcGVsaW5lUk9JLjwvYT4mbmJzcDsgfCA8YSBocmVmPSdodHRwczovL0ZhaXJ3YXlJbmRlcGVuZGVudE1vcnRnYWdlQ29ycG9yYXRpb24yLnByb2l3ZWJzaXRlcy5jb20vYXBwcy9hbGFtb2RlbG9naW4vbG9naW4uYXNweCc+QWRtaW4gTG9naW48L2E+IHwgPGEgaHJlZj0nL1Rlcm1zT2ZVc2UnPlRlcm1zIG9mIFVzZTwvYT4gfCA8YSBocmVmPScvU2l0ZU1hcCc+U2l0ZSBNYXA8L2E+IHwgPGEgaHJlZj0nL0xpc3RpbmdQcm9wZXJ0aWVzL2RlZmF1bHQuYXNweCc+QXJlYSBMaXN0aW5nczwvYT48YnI+QWxsIHJhdGUsIHBheW1lbnQsIGFuZCBhcmVhIGluZm9ybWF0aW9uIGFyZSBlc3RpbWF0ZXMgYW5kIGFwcHJveGltYXRpb25zIG9ubHkuPC9kaXY+PC9kaXY+PG1ldGEgaWQ9J2N5MDEnIGRhdGEta2V5PSJOSkdKIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9J2N5MDInIGRhdGEta2V5PSJJRkhMIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9J2N5MDMnIGRhdGEta2V5PSIzRTNFIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9J2N5MDQnIGRhdGEta2V5PSJSWFZQIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9J2N5MDUnIGRhdGEta2V5PSJSV0FIIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9J2N5MDYnIGRhdGEta2V5PSI3VVBVIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9J2N5MDcnIGRhdGEta2V5PSI4TkdEIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9J2N5MDgnIGRhdGEta2V5PSJZREJXIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9J2N5MDknIGRhdGEta2V5PSJPR0NYIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9J2N5MTAnIGRhdGEta2V5PSJXMlVGIiBjbGFzcz0iQ3J5cHRvIi8+PG1ldGEgaWQ9ImN5a2V5IiBkYXRhLWtleT0iIi8+ZAIGDw8WAh8BaGRkZD0Sj9GCBtoRiDt1DSPQSR8yLcoNtkop2S18v0brEab6" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="CA0B0334" />
</div>-->
    
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Texas Commercial/Residential Real Estate Transaction Management – The Rice Group, Inc. - Homepage</title>
		<meta http-equiv="Expires" content="-1" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta name="keywords" content="Dallas, Fort Worth, Plano, Frisco, Colleyville, Southlake, Grapevine, McKinney, Prosper, Celina, Gunter, Denton, North Texas, TX, Texas, real estate,  kings ridge, kings ridge plano, kingsridge, kings lake, shoal creek, kings gate, listings, home buying, home selling, Realtor, homes for sale, real estate agent, broker, relocation, land, residential, property, house, properties, multiple listing service, mls, moving, brent, rice, metroplex, brent rice, mavericks, mortgage, collin county, denton county, dallas county, colleyville, southlake, grapevine, estates, tarrant county, starr county, rio grande city, apartment, apartments, complex, project, san roberto, weatherford, benbrook, leasing, management, lease administration, lease audit, CAM reconciliation, reimbursements, common area maintenance, property taxes, insurance, landlord, retail, office, industrial, self storage, mobile home park, RV park, trailer park, hotel, motel, hospitality" />
		<meta name="description" content="Texas Commercial/Residential Real Estate Transaction Management – The Rice Group, Inc. - Homepage" />
		
		<link rel="stylesheet" type="text/css" href="/Styles.css" />
		<link rel="stylesheet" type="text/css" href="/templates/themes/poolhouse/styleSheet.css" />
		<script type="text/javascript" src="/scripts/flashobject.js"></script>
		<script type="text/javascript" src="/scripts/themeScripts.js"></script>
		<script type="text/javascript" SRC="/scripts/flashPopup.js"></script>
	
		<!-- chat includes -->
		<script src="/chat/js/Ajax4SoapBox.js" type="text/javascript" ></script>
        <script src="/chat/js/Ajax4SoapBoxMethods.js" type="text/javascript" ></script>
        <script src="/chat/js/chat.js" type="text/javascript" ></script>
        <script src="/chat/js/yahoo.js" type="text/javascript" ></script>
        <script src="/chat/js/event.js" type="text/javascript" ></script>
        <script src="/chat/js/connection.js" type="text/javascript" ></script>
        <style>
			body
				{
					background-color: #ABABAC;
				}
        </style>
	</head>
	
	<body background="" topmargin="0" leftmargin="0">
		
		<div id="flashPopupNavLeft" style="position:absolute; width:5px; height:5px; z-index:999; left: -200px; top: 200px; visibility: visible;" onMouseOver="stopTime();" onMouseOut="startTime();">
			<!-- alt content goes here, renders when the user doesn't have the proper flash file -->
		</div>
		<div id="flashPopupChat" style="position:absolute; width:5px; height:5px; z-index:999; left:200px; top: 200px; visibility: hidden;">
		</div>
		
		<table cellpadding=0 cellspacing=0 width=100%>
			<tr>
				<td>
					<table id="flashNav" width="759" border="0" bordercolor="yellow" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" background="/templates/themes/poolhouse/images/background.gif" style="margin:auto;">
						<tr> 
							<td class="top" colspan="3">
								<div id="topFlashNav"><!-- needs flash plugin --></div>
							</td>
						</tr>
						<tr>
							<td width="156" valign="top" bgcolor="#003366">
								<div id="leftFlashNav"><!-- needs flash plugin --></div>
							</td>
							
							<script type="text/javascript">
							// initialize chat vars
							var _AWSAccountsID = 731003;
							var _Server = 'im.alamode.com';
							var _GUID = 'fbwntl4pgbnc555pilhyheka';
							var _IP = '207.241.229.48';
							var _LO = '';
							var _UID = 'guest_' + _AWSAccountsID + '_' + _GUID;
							var _FromRequest = false;
							var _InChat = false;
							var _PageID = 77028073;
							var _ChatDomain = 'http://chat.agentxsites.com';
							
							//Other Page Vars
							var dtDate = new Date();
							var szPageGuid = dtDate.getUTCMilliseconds().toString();
							var objSecNav;
							var objChatNotification;

							function LoadChatNotification(){						
								var foChatNotification = new FlashObject("/templates/ChatNotification.swf", "chatNotification", "245", "138", 8, "#FFFFFF");
								foChatNotification.addParam("scale", "noscale");
								foChatNotification.addParam("salign", "lt");
								foChatNotification.addParam("menu", "false");
								foChatNotification.addVariable("host", "www.ricegroupinc.com");
								foChatNotification.addVariable("accountID", "731003");
								foChatNotification.write("flashPopupChat");
								
								if (document.getElementById("chatNotification") != undefined){
									objChatNotification = document.getElementById("chatNotification");
								}
								else {
									objChatNotification = document.getElementById("chatNotification2");
								}	
							}			
								// <![CDATA[
								var foTop = new FlashObject("/templates/themes/FamilyBasic/TopNav.swf", "topNav", "759", "162", 8, "#FFFFFF", "/XSitesBasic/HTMLSite.aspx");
								foTop.addVariable("host", "www.ricegroupinc.com");
								foTop.addVariable("AWSAccountsID", "731003");
								foTop.addVariable("sitename", "/xSites/Agents/FairwayIndependentMortgageCorporation2/");
								foTop.addVariable("ChosenLanguage", "English");
								foTop.addVariable("FileName", "homepage.x");
								foTop.addVariable("IsMaster", "True");
								foTop.addVariable("lcGuid", szPageGuid);
								foTop.addVariable("OS", BrowserDetect.OS);
								foTop.addParam("wmode", "transparent");
								foTop.addParam("scale", "noscale");
								foTop.addParam("allowScriptAccess", "sameDomain");
								foTop.addParam("salign", "lt");
								foTop.addParam("menu", "false");
								foTop.write("topFlashNav");

								function loadLeftNav(){
									var foSec = new FlashObject("/templates/themes/FamilyBasic/LeftNav.swf", "leftNav", "156", "650", 8, "#FFFFFF");
									foSec.addVariable("host", "www.ricegroupinc.com");
									foSec.addVariable("AWSAccountsID", "731003");
									foSec.addVariable("sitename", "/xSites/Agents/FairwayIndependentMortgageCorporation2/");
									foSec.addVariable("ChosenLanguage", "English");
									foSec.addVariable("lcGuid", szPageGuid);
									foSec.addVariable("OS", BrowserDetect.OS);
									foSec.addVariable("FileName", "homepage.x");
									foSec.addParam("scale", "noscale");
									foSec.addParam("allowScriptAccess", "sameDomain");
									foSec.addParam("salign", "lt");
									foSec.addParam("menu", "false");
									foSec.write("leftFlashNav");
								
									if (document.getElementById("leftNav") != undefined){
										objSecNav = document.getElementById("leftNav");
									}
									else if (document.getElementById("leftNav2") != undefined){
										objSecNav = document.getElementById("leftNav2");
									}
								}
								
								var foDiv = new FlashObject("/templates/themes/nestedNav/style1.swf", "popupSwf", "200", "25", 8, "#FFFFFF");
								foDiv.addVariable("host", "www.ricegroupinc.com");
								foDiv.addVariable("AWSAccountsID", "731003");
								foDiv.addVariable("sitename", "/xSites/Agents/FairwayIndependentMortgageCorporation2/");
								foDiv.addVariable("ChosenLanguage", "English");
								foDiv.addVariable("lcGuid", szPageGuid);
								foDiv.addVariable("OS", BrowserDetect.OS);
								foDiv.addParam("scale", "noscale");
								foDiv.addParam("salign", "lt");
								foDiv.addParam("menu", "false");
								foDiv.write("flashPopupNavLeft");

								function getChatAvailability()
								{
									DoLogin();
								}	
								// ]]>
							</script>
							
							<td>&nbsp;&nbsp;</td>
							<td width="603" valign="top" bgcolor="#FFFFFF">
								<font size=1><br></font>
							
    
    
    <script type="text/javascript" src="/scripts/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/scripts/bootstrap.min.js"></script>
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
		$(document).ready(function () {
			drawWidgets();
		});
	</script>
    
    
    
    <div id="divContent" class="xs-default-aspx xs-legacy">
        
		
        
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
                <div class=container><p style="TEXT-ALIGN: center" align="center"><strong><font size="2"></font></strong></p>
<p style="TEXT-ALIGN: center" align="center"><b style="font-size: small;"><font style="FONT-SIZE: 16px"></font></b><font><span style="font-size: 20px;"><b>OUR LISTINGS ARE SELLING FAST!</b></span><span style="font-size: 18px; line-height: 25.7142868041992px;"><b><br></b></span></font><font color="#ff0000" style="font-size: 22px;"><b>WE NEED MORE!</b></font><br><br><b style="font-size: small;"><img style="WIDTH: 384px; HEIGHT: 89px" src="http://fairwayindependentmortgagecorporation2.agentxsites.com/xSites/Agents/FairwayIndependentMortgageCorporation2/Content/UploadedFiles/67582_0.jpg" width="383" height="172"></b></p>
<p style="TEXT-ALIGN: center" align="center"><font size="2"><font style="font-weight: bold; font-size: 14px;">Commercial&nbsp;&amp; Residential Real Estate Specialists<br><br></font><font style="font-size: 18px;" color="#000000"><b>CONTRACTOR OF THE YEAR<br><font style="font-size: 14px;">(Angie's List - Real Estate Agent Category)</font></b></font></font></p>
<p>The Rice Grou<font style="FONT-SIZE: 14px">p, Inc. is a top recommended real estate agency specializing in a wide array of commercial <font style="FONT-SIZE: 14px">investment</font> and residential real estate services. Based in Dallas, Texas, our <font style="FONT-SIZE: 14px">principals</font> possess over 70 years of combined practice in bro</font>kerage, consulting, leasing and management. </p>
<p>We routinely assist with acquisitions and/or dispositions, leasing analyses, lease versus buy decisions, tenant representation and property management. As our client, your interests will always be placed ahead of our own. </p>
<p>We welcome you to evaluate the scope of services that we provide and the "private client" level of personal attention that you can expect. </p>
<p>Please contact Brent Rice at (214) 808-3100 or&nbsp;Larry Rice at (469)&nbsp;216-7070 or by email to&nbsp;<a href="mailto:brent@ricegroupinc.com">brent@ricegroupinc.com</a>.</p>
<p class="contenttext">The Rice Group, Inc. team can partner with you. We embrace the convenience of technology without losing the personal touch. You'll love the resources available on our web site, the electronic signature capability and the e-mail notifications, but these do not replace the time we spend with you, serving as your personal guide through this exciting process. </p>
<p class="contenttext">P.S. If you're not ready to meet in person, please tour through our web site. We are sure you'll find the resources here useful and helpful. Enjoy! </p></div>
                
            </div>
        </td>
    
        
            <td class="xs-dynamic-content">
                <div class="xs-dynamic-content-inner" >
                    
                    

<div class="panel panel-default xs-dynamic-widget xs-dynamic-social-media-sites">
	<div class="panel-heading">
		<h4 class="panel-title">Connect With Me</h4>
	</div>
	<div class="panel-body">
		<div>
			<div id="ctl01_ctl00_pnlFacebook" class="xs-social-icon col-xs-4">
	
				<div class="row text-center">
					<a href="http://www.facebook.com/ricegroupinc" id="ctl01_ctl00_aFaceBook" target="_blank">
						<img title="Facebook" border="0" src="/Apps/DynamicContentAdmin/Images/FaceBook_56.png">
					</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			
</div>
			<div id="ctl01_ctl00_pnlTwitter" class="xs-social-icon col-xs-4">
	
				<div class="row text-center">
					<a href="http://www.twitter.com/ricegroupinc" id="ctl01_ctl00_aTwitter" target="_blank">
						<img title="Twitter" border="0" src="/Apps/DynamicContentAdmin/Images/Twitter_56.png">
					</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			
</div>
			
			<div id="ctl01_ctl00_pnlLinkedIn" class="xs-social-icon col-xs-4">
	
				<div class="row text-center">
					<a href="http://www.linkedin.com/in/brentrice" id="ctl01_ctl00_aLinkedIn" target="_blank">
						<img title="LinkedIn" border="0" src="/Apps/DynamicContentAdmin/Images/LinkedIn_56.png">
					</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			
</div>
			
			
			<div class="clearfix"></div>
		</div>
		
	</div>
</div>

<style type="text/css">
	/* adding .xs-legacy ensures that the styles will only apply to legacy templates and xsites. */
	
				.xs-legacy .xs-dynamic-content-listings-widget {
					border:1px solid #999999;
				}
			
				.xs-legacy .xs-dynamic-content-listings-widget .panel-heading .panel-title {
					color: #FFFFFF;
				}
			
				.xs-legacy .xs-dynamic-content-listings-widget {
					background: #999999;
					background: -moz-linear-gradient(top,  #999999 -300px, #ffffff 100%);
					background: -webkit-gradient(linear, left top, left bottom, color-stop(-300px,#999999), color-stop(100%,#ffffff));
					background: -webkit-linear-gradient(top, #999999 -300px,#ffffff 100%);
					background: -o-linear-gradient(top,  #999999 -300px,#ffffff 100%);
					background: -ms-linear-gradient(top,  #999999 -300px,#ffffff 100%);
					background: linear-gradient(to bottom,  #999999 -300px,#ffffff 100%);
					filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#999999', endColorstr='#ffffff',GradientType=0 );
				}
			

	.xs-legacy .xs-dynamic-content-listings-widget {
		border-radius: 4px;
	}

	.xs-legacy .xs-dynamic-content-listings-widget .panel-heading {
		padding: 5px;
	}

	.xs-legacy .xs-dynamic-content-listings-widget .panel-heading .panel-title {
		text-shadow: 1px 1px 1px rgba(0,0,0,0.5);
		margin: 0;
		padding: 5px;
	}

	.xs-legacy .xs-dynamic-content-listings-widget .listing-cycle {
		padding: 0 5px 0 5px;
	}

	.xs-dynamic-content-listings-widget .photos-container {
		position: relative;
		height: 130px;
		overflow: hidden;
		margin-bottom: 10px;
		text-align: center;
	}
	
	.xs-legacy .xs-dynamic-content-listings-widget .photos-container {
		height: 114px;
	}
	

	.xs-dynamic-content-listings-widget .photos-container .photos img {
		max-height: 100%;
	}

	.xs-dynamic-content-listings-widget .photos-container .prevPhoto,
	.xs-dynamic-content-listings-widget .photos-container .nextPhoto 
	{
		background: #fff;
		background: rgba(255,255,255,.5);
		opacity: 0;
		text-decoration: none;
		display: inline-block;
		padding: 55px 5px;
		position: absolute;
		top: 0;
		height: 100%;
		font-size: 10px;
		transition: .5s;
	}

	.xs-dynamic-content-listings-widget .photos-container .prevPhoto {
		left: 0;
	}

	.xs-dynamic-content-listings-widget .photos-container .nextPhoto {
		right: 0;
	}

	.xs-dynamic-content-listings-widget .photos-container:hover .prevPhoto,
	.xs-dynamic-content-listings-widget .photos-container:hover .nextPhoto {
		opacity: 1;
	}

	.xs-legacy .xs-dynamic-content-listings-widget .panel-footer {
		margin-top: 10px;
		border-top: 1px solid;
		text-align: center;
	}

	.xs-legacy .xs-dynamic-content-listings-widget .panel-footer .col-xs-6 
	{
		width: 48%;
		display:inline-block;
	}
	.xs-legacy .xs-dynamic-content-listings-widget .panel-footer .col-xs-6 a 
	{
		padding: 5px;
		display: inline-block;
	}
</style>
<!--[if gte IE 10]>
	<style type="text/css">
		.xs-legacy .xs-include-idx-quick-search {
			filter: none;
		}
	</style>
<![endif]-->
<div class="panel panel-default xs-dynamic-widget xs-dynamic-content-listings-widget">
	<div class="panel-heading">
		<h4 class="panel-title">Featured Properties</h4>
	</div>
	<div class="panel-body">
		<div id="ImageCount" class="image-count"></div>
		<div class="listing-cycle">

					<div class="xs-listing-cycle-container" id="listingContainer0" style="display:block;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing0_0 = new Image();
										oImgListing0_0.src = "/XSites/ListingAssets/334435/777204/1/12134768_1_thmb.jpg?nocache=1568622153";

								var nTotalImagesImgListing0 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos0">
								<img id="oImgListing0" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$929,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>3 Full, 1 Half Bath(s)</li><li>4696 Sq ft. (MOL)</li><li>Frisco</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=777204">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer1" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing1_0 = new Image();
										oImgListing1_0.src = "/XSites/ListingAssets/334435/691429/1/11922288_1_thmb.jpg?nocache=666150376";

								var nTotalImagesImgListing1 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos1">
								<img id="oImgListing1" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$899,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>6 Full, 1 Half Bath(s)</li><li>5467 Sq ft. (MOL)</li><li>Plano</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=691429">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer2" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing2_0 = new Image();
										oImgListing2_0.src = "/XSites/ListingAssets/334435/973441/1/13476991_1_thmb.jpg?nocache=903521202";

								var nTotalImagesImgListing2 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos2">
								<img id="oImgListing2" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Active</span><strong class="pull-left">$819,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>5 Bedrooms</li><li>4 Full, 1 Half Bath(s)</li><li>4314 Sq ft. (MOL)</li><li>Plano</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=973441">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer3" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing3_0 = new Image();
										oImgListing3_0.src = "/XSites/ListingAssets/334435/698295/1/Front%20Elevation%20Close_thmb.jpg?nocache=1920157218";

								var nTotalImagesImgListing3 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos3">
								<img id="oImgListing3" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$599,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>5 Full Bath(s)</li><li>6639 Sq ft. (MOL)</li><li>Heath</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=698295">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer4" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing4_0 = new Image();
										oImgListing4_0.src = "/XSites/ListingAssets/334435/939250/1/13383299_1_thmb.jpg?nocache=723291572";

								var nTotalImagesImgListing4 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos4">
								<img id="oImgListing4" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Active</span><strong class="pull-left">$539,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>5 Bedrooms</li><li>4 Full, 1 Half Bath(s)</li><li>4804 Sq ft. (MOL)</li><li>Carrollton</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=939250">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer5" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing5_0 = new Image();
										oImgListing5_0.src = "/XSites/ListingAssets/334435/686247/1/11831744_1_thmb.jpg?nocache=1811261664";

								var nTotalImagesImgListing5 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos5">
								<img id="oImgListing5" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$495,000</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>3408 Sq ft. (MOL)</li><li>Hurst</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=686247">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer6" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing6_0 = new Image();
										oImgListing6_0.src = "/XSites/ListingAssets/334435/965794/1/13455676_1_thmb.jpg?nocache=686374997";

								var nTotalImagesImgListing6 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos6">
								<img id="oImgListing6" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Active</span><strong class="pull-left">$484,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>5 Bedrooms</li><li>3 Full, 1 Half Bath(s)</li><li>4169 Sq ft. (MOL)</li><li>Plano</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=965794">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer7" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing7_0 = new Image();
										oImgListing7_0.src = "/XSites/ListingAssets/334435/928259/1/13353559_1_thmb.jpg?nocache=1099060550";

								var nTotalImagesImgListing7 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos7">
								<img id="oImgListing7" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$309,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>5 Bedrooms</li><li>4 Full Bath(s)</li><li>3519 Sq ft. (MOL)</li><li>Plano</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=928259">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer8" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing8_0 = new Image();
										oImgListing8_0.src = "/XSites/ListingAssets/334435/967704/1/13461528_1_thmb.jpg?nocache=63884900";

								var nTotalImagesImgListing8 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos8">
								<img id="oImgListing8" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Pending</span><strong class="pull-left">$299,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>3 Bedrooms</li><li>2 Full Bath(s)</li><li>2259 Sq ft. (MOL)</li><li>Plano</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=967704">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer9" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing9_0 = new Image();
										oImgListing9_0.src = "/XSites/ListingAssets/334435/901193/1/FullSizeRender_1_thmb.jpg?nocache=46726772";

								var nTotalImagesImgListing9 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos9">
								<img id="oImgListing9" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$275,000</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>3 Full, 1 Half Bath(s)</li><li>3444 Sq ft. (MOL)</li><li>Lubbock</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=901193">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer10" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing10_0 = new Image();
										oImgListing10_0.src = "/XSites/ListingAssets/334435/938522/1/13376755_1_thmb.jpg?nocache=189288676";

								var nTotalImagesImgListing10 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos10">
								<img id="oImgListing10" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$259,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>3 Bedrooms</li><li>2 Full Bath(s)</li><li>1835 Sq ft. (MOL)</li><li>Plano</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=938522">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer11" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing11_0 = new Image();
										oImgListing11_0.src = "/XSites/ListingAssets/334435/947249/1/IMG_0188_thmb.jpg?nocache=1890263736";

								var nTotalImagesImgListing11 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos11">
								<img id="oImgListing11" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$259,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>3 Bedrooms</li><li>2 Full, 1 Half Bath(s)</li><li>2263 Sq ft. (MOL)</li><li>Plano</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=947249">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer12" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing12_0 = new Image();
										oImgListing12_0.src = "/XSites/ListingAssets/334435/947044/1/13402177_1_thmb.jpg?nocache=1610338122";

								var nTotalImagesImgListing12 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos12">
								<img id="oImgListing12" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$229,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>3 Bedrooms</li><li>2 Full Bath(s)</li><li>1748 Sq ft. (MOL)</li><li>Lewisville</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=947044">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer13" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing13_0 = new Image();
										oImgListing13_0.src = "/XSites/ListingAssets/334435/929518/1/13356850_1_thmb.jpg?nocache=851133963";

								var nTotalImagesImgListing13 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos13">
								<img id="oImgListing13" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Sold</span><strong class="pull-left">$149,900</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>3 Bedrooms</li><li>2 Full Bath(s)</li><li>1654 Sq ft. (MOL)</li><li>Fort Worth</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=929518">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer14" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing14_0 = new Image();
										oImgListing14_0.src = "/XSites/ListingAssets/334435/938698/1/13381923_1_thmb.jpg?nocache=1475381254";

								var nTotalImagesImgListing14 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos14">
								<img id="oImgListing14" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Leased</span><strong class="pull-left">$1,650</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>4 Bedrooms</li><li>2 Full Bath(s)</li><li>1636 Sq ft. (MOL)</li><li>Plano</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=938698">More Info</a></div>
						</div>
					</div>

					<div class="xs-listing-cycle-container" id="listingContainer15" style="display:none;" >

						<div class="photos-container text-center">
							<script type="text/javascript">

										var oImgListing15_0 = new Image();
										oImgListing15_0.src = "/XSites/ListingAssets/334435/950335/1/IMG_0373_thmb.jpg?nocache=1062062694";

								var nTotalImagesImgListing15 = 1;
							</script>
							<div class="photos" id="listingContainerPhotos15">
								<img id="oImgListing15" src="">
							</div>

						</div>
						<div class="price-status-container">
<span class="badge pull-right">Draft</span><strong class="pull-left">$1</strong>

							<div class="clearfix"></div>
						</div>
						<div>
							<ul style="padding-left:20px;">
<li>Dallas</li>
							</ul>
						</div>
						<div>
<div class="text-center"><a target="_blank" href="/listings/listings.aspx?FileName=defaultlistings.x&ListID=950335">More Info</a></div>
						</div>
					</div>

		</div>
	</div>

		<div class="panel-footer">
			<div class="row">
				<span class="col-xs-6 text-center">
					<a id="prevListing" href="JavaScript:prev()">Prev Listing</a>
				</span>
				<span class="col-xs-6 text-center">
					<a id="nextListing" href="JavaScript:next()">Next Listing</a>
				</span>
			</div>
		</div>

</div>


<script type="text/javascript">

		var nCurrentListingIndex = 0;
		var nTotalListingCount = 16;
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

			$( "#listingContainer" + nCurrentListingIndex ).fadeOut( 500, function() {
				$( this ).css( "display", "none" );
				nCurrentListingIndex --;
				if ( nCurrentListingIndex < 0 ) {
					nCurrentListingIndex = ( nTotalListingCount - 1 );
				}
				$( "#listingContainer" + nCurrentListingIndex ).fadeIn( 300, function() {
					$( this ).css( "display", "block" );
					var count = eval( "nTotalImagesImgListing" + nCurrentListingIndex );
					nextPhoto( "oImgListing" + nCurrentListingIndex, count, true );
				} );
			} );
		}

		function next() {
			window.clearTimeout( currentTimer );
			nCurrentImageIndex = 0;
			$( "#listingContainer" + nCurrentListingIndex ).fadeOut( 500, function() {
				$( this ).css( "display", "none" );
				nCurrentListingIndex ++;
				if ( nCurrentListingIndex == nTotalListingCount ) {
					nCurrentListingIndex = 0;
				}
				$( "#listingContainer" + nCurrentListingIndex ).fadeIn( 300, function() {
					$( this ).css( "display", "block" );
					var count = eval( "nTotalImagesImgListing" + nCurrentListingIndex );
					nextPhoto( "oImgListing" + nCurrentListingIndex, count, true );
				});
			});
		}

		function prevPhoto( src, nImageCount, isButtonClick ) {
			window.clearTimeout( currentTimer );
			if ( isButtonClick ) {
				nCurrentImageCountTotalAutomated = 0;
			} else { 
				nCurrentImageCountTotalAutomated ++;
				if ( nCurrentImageCountTotalAutomated > nImageCount ) {
					next();
				}
			}
			nCurrentImageIndex --;
			if ( nCurrentImageIndex < 0 ) {
				nCurrentImageIndex = ( nImageCount - 1 );
			}
			var img = document.getElementById( src );
			try {
				img.src = eval( src + "_" + nCurrentImageIndex ).src;
				currentTimer = window.setTimeout( "prevPhoto( '" + src + "', " + nImageCount + ", false )", 6000 );
			} catch( e ) {
				img.src = "/graphics/NoPhoto.png";
				currentTimer = window.setTimeout( "prevPhoto( '" + src + "', " + nImageCount + ", false )", 6000 );
			}
		}

		function nextPhoto( src, nImageCount, isButtonClick ) {
			window.clearTimeout( currentTimer );
			if ( isButtonClick ) {
				nCurrentImageCountTotalAutomated = 0;
			} else {
				nCurrentImageCountTotalAutomated ++;
				if ( nCurrentImageCountTotalAutomated >= nImageCount ) {
					next();
				}
			}

			nCurrentImageIndex ++;

			if ( nCurrentImageIndex > ( nImageCount - 1 ) ) {
				nCurrentImageIndex = 0;
			}

			var img = document.getElementById( src );

			try {
				img.src = eval( src + "_" + nCurrentImageIndex ).src;
				currentTimer = window.setTimeout( "nextPhoto( '" + src + "', " + nImageCount + ", false )", 6000 );
			} catch( e ) {
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
                </div>
            </td>
        
    </tr>
</table><div style="width:100%;height:30px;"></div>
<script language="JavaScript" type="text/JavaScript" src="/Admin/JS/WizardV1.js"></script>

<script>
	function resizeMe(id, clearHeight) {
		var theFrame = document.getElementById(id);
		if (clearHeight) {
			theFrame.style.height = "0px";
		}
		var theBody = (theFrame.contentWindow.document.body || theFrame.contentDocument.body)
		var newHeight = Math.max(theBody.scrollHeight, theBody.offsetHeight, theBody.clientHeight);
		theFrame.style.height = newHeight + "px";

		//address an issue for mobile devices overflowing the iframe out of it's parent.
		// we are assuming the padding on .inner is 1em or 30px
		theFrame.style.width = (theFrame.parentNode.offsetWidth - 30) + "px";
	}
</script>

<div class="inner">
	<iframe src="/listings/ListingsGrid.aspx?popup=1&" name="gridFrame" id="gridFrame" frameBorder="no" style="margin: 0; padding: 0; width: 800px; height: 400px;" scrolling="no" onload="resizeMe('gridFrame');" class="jsResizable"></iframe>
</div>

        <div>
            
        </div>

        
    </div>

    <div id="divIDXSearch" style="display:none;" >
        <iframe id="frameIDXSearch" style="width:100%; height:1300px;" marginwidth="0" marginheight="0" frameborder="0"></iframe>
        <div>
            
        </div>

              
    </div> 
    
    <div>

<br/><div class='tableText' style='text-align: center;'><div class='xs-site-footer-contact-info'><span class='xs-site-footer-office-phone'>Phone: <script language=javascript> document.write('(214) 808-3100');</script></span> <span class='xs-site-footer-office-fax'>Fax: <script language=javascript> document.write('(214) 291-5706');</script></span> <span class='xs-site-footer-email'>E-mail: <a href='mailto:+Wk+zVVVg/DPM7/XoqojgFYoIDs/51/bXOLUksA2S8U='>+Wk+zVVVg/DPM7/XoqojgFYoIDs/51/bXOLUksA2S8U=</a></span></div><div class='xs-site-footer-site-navigation'><a href="/ForBuyers"><span style='white-space: nowrap;'>For Buyers</span></a> | <a href="/Home"><span style='white-space: nowrap;'>Home</span></a></div><br><div class='xs-site-footer-copyright'>Copyright &copy; 2016 The Rice Group, Inc.<br>Portions Copyright &copy; 2016  Pipeline ROI, inc.<br>Another website by <a href='http://www.pipelineroi.com/' target='_blank'>PipelineROI.</a>&nbsp; | <a href='https://FairwayIndependentMortgageCorporation2.proiwebsites.com/apps/alamodelogin/login.aspx'>Admin Login</a> | <a href='/TermsOfUse'>Terms of Use</a> | <a href='/SiteMap'>Site Map</a> | <a href='/ListingProperties/default.aspx'>Area Listings</a><br>All rate, payment, and area information are estimates and approximations only.</div></div><meta id='cy01' data-key="NJGJ" class="Crypto"/><meta id='cy02' data-key="IFHL" class="Crypto"/><meta id='cy03' data-key="3E3E" class="Crypto"/><meta id='cy04' data-key="RXVP" class="Crypto"/><meta id='cy05' data-key="RWAH" class="Crypto"/><meta id='cy06' data-key="7UPU" class="Crypto"/><meta id='cy07' data-key="8NGD" class="Crypto"/><meta id='cy08' data-key="YDBW" class="Crypto"/><meta id='cy09' data-key="OGCX" class="Crypto"/><meta id='cy10' data-key="W2UF" class="Crypto"/><meta id="cykey" data-key=""/>


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

</div>

						        <div align="center" class="tableText">
						            <table border="0" cellpadding="0" cellspacing="0" width="95%">
							            <tr>
								            <td>
									            
								            </td>
							            </tr>
						            </table>
						        </div>
		                    </td>
	                    </tr>
                    </table>
                    <table width="758" border="0" cellspacing="0" cellpadding="0" style="margin:auto;">
                        <tr> 
	                        <td><img src="/templates/themes/poolhouse/images/bottom.gif" width="758" height="1"></td>
	                    </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>


<script language="javascript">
    try {
        getFCMap();
    }
    catch (ex) { }
    function showPage(url) {
        document.getElementById('divContent').style.display = "none";
        document.getElementById('divIDXSearch').style.display = "block";
        var frameVar = document.getElementById('frameIDXSearch')
        frameVar.style.display = "block";
        frameVar.src = url;
    }
//    function setNewPage() {
//        var nMinPrice = 0;
//        var nMaxPrice = 999999999;
//        var strQueryString;

//        var searchPopup = document.getElementById('mpeSearch');
//        if (searchPopup != null) {
//            searchPopup.Show();
//        }

//        var strCityStateZipMLS = document.getElementById('txtCityStateZipMLS');

//        var strMinPrice = document.getElementById('txtMinPrice').value;
//        var strMaxPrice = document.getElementById('txtMaxPrice').value;


//        if (strCityStateZipMLS.value.length > 0) {
//            var strAgentMLSID = '0395896';
//            var strOfficeMLSID = 'RICE01C';
//            var beds = document.getElementById('DDBeds');
//            var baths = document.getElementById('DDBaths');
//            var propertyType = document.getElementById('ddListType');
//            var strXSIDXID = '17307';
//            strQueryString = "XSIDXID=" + strXSIDXID;
//            strQueryString += "&SearchMode=ALLMLS";
//            strQueryString += "&MLSAgentID=" + strAgentMLSID;
//            strQueryString += "&MLSOfficeID=" + strOfficeMLSID;
//            strQueryString += "&PropertyType=" + propertyType.options[propertyType.selectedIndex].value;
//            strQueryString += "&Beds=" + 0;
//            strQueryString += "&Baths=" + 0;
//            strQueryString += "&MinSalesPrice=" + nMinPrice;
//            strQueryString += "&MaxSalesPrice=" + nMaxPrice;
//            strQueryString += "&SearchAreaName=" + strCityStateZipMLS.value;
//            var path = 'http://localhost/XSitesIDX/SearchRedirect.aspx?';
//            var redirectPath = "http://" + window.location.host + "/IDXLoader.aspx?";
//            showPage(path + strQueryString);
//        }
//        else {
//            alert('Please enter a City, Zip or MLS Number');
//        }
//    }
</script>

<!--</form>-->