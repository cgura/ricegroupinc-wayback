/*
 * FlashObject embed
 * by Geoff Stearns (geoff@deconcept.com, http://www.deconcept.com/)
 *
 * v1.1.0 - 03-31-2005
 *
 * writes the embed code for a flash movie, includes plugin detection
 *
 * Usage:
 *
 *	myFlash = new FlashObject("path/to/swf.swf", "swfid", "width", "height", flashversion, "backgroundcolor");
 *	myFlash.write("objId");
 *
 * for best practices, see:
 *  http://blog.deconcept.com/2005/03/31/proper-flash-embedding-flashobject-best-practices/
 *
 */



var FlashObject = function(swf, id, w, h, ver, c, redirect) {
	this.swf = swf;
	this.id = id;
	this.width = w;
	this.height = h;
	this.version = ver;
	this.align = "middle";

	this.params = new Object();
	this.variables = new Object();

	if(redirect == undefined) { this.redirect = ""; } else { this.redirect = redirect; }
	this.sq = document.location.search.split("?")[1] || "";
	
	this.bypassTxt = "<p>Already have Macromedia Flash Player? <a href='?detectflash=false&"+ this.sq +"'>Click here if you have Flash Player "+ this.version +" installed</a>.</p>";
	
	if (c) this.color = this.addParam('bgcolor', c);
	this.addParam('quality', 'high'); // default to high
	this.doDetect = getQueryParamValue('detectflash');
}

var FOP = FlashObject.prototype;

FOP.addParam = function(name, value) { this.params[name] = value; }

FOP.getParams = function() { return this.params; }

FOP.getParam = function(name) { return this.params[name]; }

FOP.addVariable = function(name, value) { this.variables[name] = value; }

FOP.getVariable = function(name) { return this.variables[name]; }

FOP.getVariables = function() { return this.variables; }

FOP.getParamTags = function() {
    var paramTags = "";
    for (var param in this.getParams()) {
        paramTags += '<param name="' + param + '" value="' + this.getParam(param) + '" />';
    }
    return (paramTags == "") ? false:paramTags;
}

FOP.getHTML = function() {
    var flashHTML = "";
    if (navigator.plugins && navigator.mimeTypes.length) { // netscape plugin architecture
		//  appends '2' on the end of the ID for the resizer to work
        flashHTML += '<embed type="application/x-shockwave-flash" src="' + this.swf + '" width="' + this.width + '" height="' + this.height + '" name="' + this.id + "2" + '" id="' + this.id + "2" + '" align="' + this.align + '"';
        for (var param in this.getParams()) {
            flashHTML += ' ' + param + '="' + this.getParam(param) + '"';
        }
        if (this.getVariablePairs()) {
            flashHTML += ' flashVars="' + this.getVariablePairs() + '"';
        }
        flashHTML += '></embed>';
    } else { // PC IE
        flashHTML += '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="' + this.width + '" height="' + this.height + '" id="' + this.id + '" align="' + this.align + '">';
        flashHTML += '<param name="movie" value="' + this.swf + '" />';
        if (this.getParamTags()) {
            flashHTML += this.getParamTags();
        }
        if (this.getVariablePairs() != null) {
            flashHTML += '<param name="flashVars" value="' + this.getVariablePairs() + '" />';
        }
        flashHTML += '</object>';
    }
    return flashHTML;	
}

FOP.getVariablePairs = function() {
    var variablePairs = new Array();
    for (var name in this.getVariables()) { 
    	variablePairs.push(name + "=" + escape(this.getVariable(name))); 
    }
    return (variablePairs.length > 0) ? variablePairs.join("&"):false;
}

FOP.write = function(elementId) {
	if(detectFlash(this.version) || this.doDetect=='false') {
		if (elementId) {
			document.getElementById(elementId).innerHTML = this.getHTML();
		} else {
			document.write(this.getHTML());
		}
	} else {
		if (this.redirect != "") {
			document.location.replace(this.redirect);
		} else if (this.altTxt) {
			if (elementId) {
				document.getElementById(elementId).innerHTML = this.altTxt +""+ this.bypassTxt;
			} else {
				document.write(this.altTxt +""+ this.bypassTxt);
			}
		}
	}
	if (navigator.appName && navigator.appName.indexOf("Microsoft") != -1 && navigator.userAgent.indexOf("Windows") != -1 && navigator.userAgent.indexOf("Windows 3.1") == -1){	
		try{	
			document.all[this.id].attachEvent("fscommand", eval(this.id + "_DoFSCommand"));
		}catch(er){
		}
	}
}

/* ---- detection functions ---- */
function getFlashVersion()
{
	var playerVersion = 0;
	var d = null;
	var nav = navigator;
	var win = window;
	
	if (typeof nav.plugins != "undefined" && typeof nav.plugins["Shockwave Flash"] == "object") 
	{
		d = nav.plugins["Shockwave Flash"].description;
		if (d && !(typeof nav.mimeTypes != undefined && nav.mimeTypes["application/x-shockwave-flash"] && !nav.mimeTypes["application/x-shockwave-flash"].enabledPlugin)) 
		{ // navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin indicates whether plug-ins are enabled or disabled in Safari 3+
			d = d.replace(/^.*\s+(\S+\s+\S+$)/, "$1");
			playerVersion = parseInt(d.replace(/^(.*)\..*$/, "$1"), 10);
		}
	}
	else if (typeof win.ActiveXObject != undefined) 
	{
		var a = null, fp6Crash = false;
		try {
			a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash" + ".7");
		}
		catch(e) {
			try { 
				a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash" + ".6");
				playerVersion = 6;
				a.AllowScriptAccess = "always";	 // Introduced in fp6.0.47
			}
			catch(e) {
				if (playerVersion == 6) {
					fp6Crash = true;
				}
			}
			if (!fp6Crash) {
				try {
					a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
				}
				catch(e) {}
			}
		}
		if (!fp6Crash && a) { // a will return null when ActiveX is disabled
			try {
				d = a.GetVariable("$version");	// Will crash fp6.0.21/23/29
				if (d) {
					d = d.split(" ")[1].split(",");
					playerVersion = parseInt(d[0], 10);
				}
			}
			catch(e) {}
		}
	}
	return playerVersion;
}


/*
function getFlashVersion() {
	var flashversion = 0;
	if (navigator.plugins && navigator.mimeTypes.length) {
		var x = navigator.plugins["Shockwave Flash"];
		var d = navigator.plugins["Shockwave Flash"].description;
		if(x && x.description) {
			d = d.replace(/^.*\s+(\S+\s+\S+$)/, "$1");
			flashversion = parseInt(d.replace(/^(.*)\..*$/, "$1"), 10);
		}
	} else {
		result = false;
	    for(var i = 15; i >= 3 && result != true; i--){
   			execScript('on error resume next: result = IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.'+i+'"))','VBScript');
   			flashversion = i;
   		}
	}
	return flashversion;
}
*/

function detectFlash(ver) 
{	
	return (getFlashVersion() >= ver) ? true:false; 
}

// get value of query string param
function getQueryParamValue(param) {
	var q = document.location.search || document.location.href.split("#")[1];
	if (q) {
		var detectIndex = q.indexOf(param +"=");
		var endIndex = (q.indexOf("&", detectIndex) > -1) ? q.indexOf("&", detectIndex) : q.length;
		if (q.length > 1 && detectIndex > -1) {
			return q.substring(q.indexOf("=", detectIndex)+1, endIndex);
		} else {
			return "";
		}
	}
}

/* add Array.push if needed */
if(Array.prototype.push == null){
	Array.prototype.push = function(item) { this[this.length] = item; return this.length; }
}


