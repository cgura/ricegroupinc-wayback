
<!DOCTYPE html>
<!-- listings/listings.aspx -->
<script>
function resizeFrame(nHeight){
	var objIFrame = document.getElementById('gridFrame');
    objIFrame.height = nHeight;
}
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<meta http-equiv="Expires" content="-1" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		
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
							var _GUID = '2bhhi21sca2ke3j41b2iut2y';
							var _IP = '207.241.231.148';
							var _LO = '';
							var _UID = 'guest_' + _AWSAccountsID + '_' + _GUID;
							var _FromRequest = false;
							var _InChat = false;
							var _PageID = 0;
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
								foTop.addVariable("FileName", "defaultlistings.x");
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
									foSec.addVariable("FileName", "defaultlistings.x");
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
	<iframe src="/listings/ListingsGrid.aspx?popup=1&FileName=defaultlistings.x&ListID=920450" name="gridFrame" id="gridFrame" frameBorder="no" style="margin: 0; padding: 0; width: 800px; height: 400px;" scrolling="no" onload="resizeMe('gridFrame');" class="jsResizable"></iframe>
</div>




<br/><div class='tableText' style='text-align: center;'><div class='xs-site-footer-contact-info'><span class='xs-site-footer-office-phone'>Phone: <script language=javascript> document.write('(214) 808-3100');</script></span> <span class='xs-site-footer-office-fax'>Fax: <script language=javascript> document.write('(214) 291-5706');</script></span> <span class='xs-site-footer-email'>E-mail: <a href='mailto:vWB0bwPXs46KG0fCqOryGFWwr3DW9rcGUAPneeykGIU='>vWB0bwPXs46KG0fCqOryGFWwr3DW9rcGUAPneeykGIU=</a></span></div><div class='xs-site-footer-site-navigation'><a href="/ForBuyers"><span style='white-space: nowrap;'>For Buyers</span></a> | <a href="/Home"><span style='white-space: nowrap;'>Home</span></a></div><br><div class='xs-site-footer-copyright'>Copyright &copy; 2016 The Rice Group, Inc.<br>Portions Copyright &copy; 2016  a la mode, inc.<br>Another website by <a href='http://www.pipelineroi.com/' target='_blank'>PipelineROI.</a>&nbsp; | <a href='https://FairwayIndependentMortgageCorporation2.agentxsites.com/apps/alamodelogin/login.aspx'>Admin Login</a> | <a href='/TermsOfUse'>Terms of Use</a> | <a href='/SiteMap'>Site Map</a> | <a href='/ListingProperties/default.aspx'>Area Listings</a><br>All rate, payment, and area information are estimates and approximations only.</div></div><meta id='cy01' data-key="J06M" class="Crypto"/><meta id='cy02' data-key="9089" class="Crypto"/><meta id='cy03' data-key="W4CY" class="Crypto"/><meta id='cy04' data-key="ER1J" class="Crypto"/><meta id='cy05' data-key="802P" class="Crypto"/><meta id='cy06' data-key="B3W7" class="Crypto"/><meta id='cy07' data-key="OSRC" class="Crypto"/><meta id='cy08' data-key="4DPM" class="Crypto"/><meta id='cy09' data-key="TJ13" class="Crypto"/><meta id='cy10' data-key="OQ07" class="Crypto"/><meta id="cykey" data-key=""/>


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

