var isInternetExplorer = navigator.appName.indexOf("Microsoft") != -1;
var klugeForTopTheme = 0;

//************************************************************************************
// Used for the loan app.
//************************************************************************************
function openEditUser(a_sPage){
	var pageURL = a_sPage;
	var params = "width=610";
	params += ",height=675";
	params += ",toolbar=false";
	params += ",location=false";
	params += ",status=yes";
	params += ",menubar=false";
	params += ",resizable=yes";
	window.open(pageURL,"Edit",params);
}

//************************************************************************************
//NEW FLASH RESIZE TEST -- added by Robert Smith 5/11/06
//************************************************************************************

function setFlashWidth(divid, newW){
	document.getElementById(divid).style.width = newW+"px";
}
function setFlashHeight(divid, newH,flashID,divHeight){
	resizeFlash(flashID, null, newH);
	var tempHeight = newH+"px";
	document.getElementById(divid).style.height = tempHeight;
}
function setFlashSize(divid, newW, newH){
	setFlashWidth(divid, newW);
	setFlashHeight(divid, newH);
}
function canResizeFlash(){
	var ua = navigator.userAgent.toLowerCase();
	var opera = ua.indexOf("opera");
	if( document.getElementById ){
		if(opera == -1) return true;
		else if(parseInt(ua.substr(opera+6, 1)) >= 7) return true;
	}
	return false;
}

function setFlashHeightIncFrame(divid,newH,flashID){
	resizeFlash(flashID,null,newH);
	document.getElementById(divid).style.height = newH+"px";
	resizeGrid();
}
function setFlashWidthHeight(divid, newW, newH,flashID,divHeight){
	handleSetFlashWidthHeight(divid,newW,newH,flashID);
}
function setFlashWidthHeightIncFrame(divid,newW,newH,flashID){
	handleSetFlashWidthHeight(divid,newW,newH,flashID);
	resizeGrid();
}
function handleSetFlashWidthHeight(divid,newW,newH,flashID){
	var flashElement = document.getElementById(divid);
	var moveRight = newW - flashElement.offsetWidth;

	resizeFlash(flashID, newW, newH);
	flashElement.style.width = newW+"px";
	flashElement.style.height = newH+"px";

	var element = parent.document.getElementById("topNavFlash");
	if (element != undefined){
		if (moveRight < 0){moveRight = 0;}
		element.style.paddingLeft = 0 + moveRight+"px";
		if (screen.width >=1024 && (element.offsetWidth - parent.document.body.offsetWidth + 30) > 0){
			top.resizeBy(element.offsetWidth - parent.document.body.offsetWidth + 30);
		}
	}
}


//************************************************************************************
// RESIZE FLASH OBJECT
//************************************************************************************
function resizeFlash(flashID, newWidth, newHeight){
 	if(document.getElementById(flashID) != undefined){
 		var obj = document.getElementById(flashID); 
 	}else{
 		var obj = document.getElementById(flashID + '2'); 
 	}
 	if(newWidth != undefined ){obj.width = newWidth;}
 	if(newHeight != undefined){obj.height = newHeight;}
 	if(window.parent.document.getElementById('gridFrame') != undefined){
 		window.parent.resizeFrame(newHeight + 40);
 	}
}

function resizeSWFNested(objectTagName, embedTagName, newWidth, newHeight){
	
	if (objectTagName == "topNav"){
		if ('function' == typeof chatNotifyFinalAdjustment){
			chatNotifyFinalAdjustment(newHeight - 230);
		}
	}
	
	var obj = {};
	
	if(document.getElementById(objectTagName)){
		obj = document.getElementById(objectTagName);
	}else if(document.getElementById(embedTagName)){
		obj = document.getElementById(embedTagName);
	}

	if(obj){
		if(hasValue(newWidth)){obj.width = newWidth;}
	 	if(hasValue(newHeight) && ((newHeight > 650 && obj == document.getElementById("leftNav")) || obj != document.getElementById("leftNav"))){
			obj.height = newHeight;
		}
	}
}

function hasValue(v){
	return v != undefined && v != "" && v != null && v != "null";
}

//  Define global variables
var timerID = null;
var timerOn = false;
var timecount = 1000;

//  Change this to the time delay that you desire
var what = null;
var newbrowser = true;
var check = false;

//  The function flashPopupInit() determines for us what browser version that we are dealing with and assigns a values to the variables what, layerRef, styleSwitch and visibleVar, which we will use in our layer visibility toggling functions. We also assign the Boolean value ?true? to the check variable.
function flashPopupInit(){
	if (document.layers){
		what = "ns4";
	}else if(document.all){
		what = "ie4";
	}else if(document.getElementById){
		what="dom1";
	}else{
		what = "none";
		newbrowser = false;
	}
	check = true;
}

 
//  Toggles the layer visibility on 
function showLayer(layerName, yPos, divYStart, leftPos){
	if(check){
		if (what == "none"){
			return;
		}else if (what == "dom1"){
			if (document.getElementById("leftNav") != undefined){
				flashID = document.getElementById("leftNav");
				oMozE = flashID.parentNode.parentNode.parentNode.parentNode;
			} else {
				flashID = document.getElementById("leftNav2");
				oMozE = flashID.parentNode.parentNode.parentNode.parentNode;
			}
			
			var myOffset;
			if (flashID.parentNode.parentNode.parentNode.parentNode.parentNode.offsetLeft == 0){
				myOffset = flashID.parentNode.parentNode.offsetLeft;
			} else {
				myOffset = flashID.parentNode.parentNode.parentNode.parentNode.parentNode.offsetLeft;
			}
			document.getElementById(layerName).style.visibility = "visible";
			document.getElementById(layerName).style.left = myOffset + leftPos + "px";
			document.getElementById(layerName).style.top = oMozE.offsetTop + divYStart + yPos + "px";
		}else{
			var oElement = document.all.flashNav;
			var tempLayerRef = document.all[layerName];
			tempLayerRef.style.visibility = "visible";
			tempLayerRef.style.left = oElement.offsetLeft + leftPos + "px";
			tempLayerRef.style.top = oElement.offsetTop + divYStart + yPos + "px";
		}
	}else{
		return;
	}
}

function positionChatPopup(){
	//Base this function off of an arguments array rather than actual argument names
	var layerName = arguments[0];
	var yPos = arguments[1];
	var divYStart = arguments[2];
	var leftPos = arguments[3];
	var topAdjFF;
	var leftAdjFF;
	var topAdjIE;
	var leftAdjIE;
	
	if (arguments[4] != undefined){
		topAdjFF = arguments[4];
	}
	else topAdjFF = 0;
	
	if (arguments[5] != undefined){
		leftAdjFF = arguments[5];
	}
	else leftAdjFF = 0;
	
	if (arguments[6] != undefined){
		topAdjIE = arguments[6];
	}
	else topAdjIE = 0;
	
	if (arguments[7] != undefined){
		leftAdjIE = arguments[7];
	}
	else leftAdjIE = 0;
	
	if (what == "dom1"){
		if (document.getElementById("leftNav") != undefined){
			flashID = document.getElementById("leftNav");
		} else {
			flashID = document.getElementById("leftNav2");
		}
		oMozE = flashID.parentNode.parentNode.parentNode.parentNode;
		
		var myOffset;
		if (flashID.parentNode.parentNode.parentNode.parentNode.parentNode.offsetLeft == 0){
			myOffset = flashID.parentNode.parentNode.offsetLeft;
		} else {
			myOffset = flashID.parentNode.parentNode.parentNode.parentNode.parentNode.offsetLeft;
		}
		
		document.getElementById(layerName).style.left = myOffset + leftPos + leftAdjFF + "px";
		document.getElementById(layerName).style.top = oMozE.offsetTop + divYStart + yPos + topAdjFF + klugeForTopTheme + "px";
		
	}
	else{
		var oElement = document.all.flashNav;
		var tempLayerRef = document.all[layerName];
		tempLayerRef.style.left = oElement.offsetLeft + leftPos + leftAdjIE + "px";
		tempLayerRef.style.top = oElement.offsetTop + divYStart + yPos + klugeForTopTheme + topAdjIE + "px";
	}
	
}

//  Toggles the layer visibility off 
function hideLayer(layerName){
	if(check){
		if (what == "none"){
			return;
		}else if (what == "dom1"){
			document.getElementById(layerName).style.visibility="hidden";
		}else{
			var tempLayerRef = document.all[layerName];
			if(tempLayerRef){
				tempLayerRef.style.visibility="hidden";
			}
		}
	}else{
		return;
	}
}

//  hide all
function hideAll(){
    //  Put all layers used in the nav here.
    hideLayer('flashPopupNavLeft');
}

function startTime(){
	if (timerOn == false){
		timerID = setTimeout("hideAll()", timecount);
		timerOn = true;
	}
}

function stopTime(){
	if (timerOn){
		clearTimeout(timerID);
		timerID = null;
		timerOn = false;
	}
}

flashPopupInit();

function flashWrapper(a_szLayer, a_nYPos, a_nDivYStart, a_nDivWidth){
	hideAll();
	showLayer(a_szLayer, a_nYPos, a_nDivYStart, a_nDivWidth);
	stopTime();
}

// hack for satisfactory functioning in IE. Not required for Firefox. 
function clearObjs(obj){
    var theObj = eval(obj);
    theObj.style.display = "none";
    for (var prop in theObj){
	    if (typeof(theObj[prop]) == "function"){
		    theObj[prop]=null
	    }
	}	
  }

// hack for satisfactory functioning in IE. Not required for Firefox.
function cleanup(){
	try { DoLogout(); } catch(e) {} // log out of chat
	
    __flash_unloadHandler = function(){		
		externalProbSet = true;
		if (externalProbSet) {return};
		clearObjs(explorer);
		clearObjs(flashcontent);
		if (__flash_savedUnloadHandler != null){
		    __flash_savedUnloadHandler();
		}		
    }

    if (window.onunload != __flash_unloadHandler){ 
		__flash_savedUnloadHandler = window.onunload;
		window.onunload = __flash_unloadHandler;
    }
}

function scrollToTop(){
	window.parent.scrollTo(0,0);
}

function popLeadGenFormFromChat(szFormID)
{
	var szForm = "/apps/forms/formpopup.aspx?FormPoppedUp=1&FormID=" + szFormID + "&bFromChat=True";
	if(navigator.userAgent.toLowerCase().indexOf("msie") > -1)
	{
		thewindow = window.showModalDialog(szForm, "FormModal", "dialogHeight: 590px;dialogWidth: 490px; status: 0; resizable: 1; scroll: 1;");
	}
	else
	{
		thewindow = window.open(szForm,"","toolbar=no,scrollbars=yes, resizable=yes,HEIGHT=590,WIDTH=490");
	}	
}

// hack for satisfactory functioning in IE. Not required for Firefox.
window.onbeforeunload=cleanup;

