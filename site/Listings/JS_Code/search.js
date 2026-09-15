//Global vars
var mlsid = null;
var aSliderMinValues = null;
var aSliderMaxValues = null;
var aSliderSQFTValues = null;
var aSliderYearValues = null;
var map = null;
var selected = -1;
var currPin = null;

//Keystroke Values
var KEYUP = 38;
var KEYDOWN = 40;
var KEYENTER = 13;
var KEYTAB = 9;

//functions
/* Sets MLS ID used on client-side*/
function setid(id) {
    mlsid = id;
}

function testBrowser() {
    //if safari, break out
//    var bSafari = $.browser.safari;
//    if (bSafari) {
//        if (top.location != location) {
//            top.location.href = document.location.href;
//        }
//    }
}

//set the java functions to each of the slider events On Page Load
function pageLoad(sender, e) {
    var slider = $find('sliderMinPrice');
    if (slider != null) {
        slider.add_valueChanged(sliderMinPriceChanged);
        //Set Min Price slider
        sliderMinPriceChanged();
    }
    var slider = $find('sliderMaxPrice');
    if (slider != null) {
        slider.add_valueChanged(sliderMaxPriceChanged);
        //Set Max Price slider
        sliderMaxPriceChanged();        
    }
    var slider = $find('sliderSQFT');
    if (slider != null) {
        slider.add_valueChanged(sliderSQFTChanged);
        //Set SqFt slider
        sliderSQFTChanged();        
    }
    var slider = $find('sliderYear');
    if (slider != null) {
        slider.add_valueChanged(sliderYearChanged);
        //Set Year Built slider
        sliderYearChanged();                        
    }
}

function sliderYearChanged() {
    var slider = $find('sliderYear');
    var lbl = $get('lblyear');
    var val = slider.get_Value();
    var valBox = $get('txtYearValue');
    if (val == slider.get_Minimum()){
        lbl.innerHTML = "Any";
				if(aSliderYearValues != null)
				{
	        valBox.value = aSliderYearValues[val];
	      }
    }else {
				if(aSliderYearValues != null)
				{
	        lbl.innerHTML = aSliderYearValues[val]+"+";
	        valBox.value = aSliderYearValues[val];
	      }
    }
}

function sliderSQFTChanged() {
	try
	{
    var slider = $find('sliderSQFT');
    var lbl = $get('lblsqft');
    var val = slider.get_Value();
    var valBox = $get('txtSqFtValue');
    lbl.innerHTML = aSliderSQFTValues[val]+"+";
    valBox.value = aSliderSQFTValues[val];
    if (val == slider.get_Minimum()){
				if(aSliderSQFTValues != null)
				{
	        lbl.innerHTML = "Any";
	        valBox.value = aSliderSQFTValues[val];
	      }
    }else {
				if(aSliderSQFTValues != null)
				{
	        lbl.innerHTML = aSliderSQFTValues[val]+"+";
	        valBox.value = aSliderSQFTValues[val];
	      }
    }
	}
	catch(ex)
	{}
}


function sliderMinPriceChanged() {
    var slider = $find('sliderMinPrice');
    var slidermax = $find('sliderMaxPrice');
    var lbl = $get('lblMinPrice');
    var val = slider.get_Value();
    var valBox = $get('txtMinPriceValue');
    lbl.innerHTML = formatCurrency(aSliderMinValues[val], "No Min", true, aSliderMinValues[slider.get_Minimum()]);
    valBox.value = aSliderMinValues[val];
    if(slider.get_Value() >= slidermax.get_Value()){
        slidermax.set_Value(slider.get_Value()+1);
    }      
}

function sliderMaxPriceChanged() {
    var slider = $find('sliderMaxPrice');
    var slidermin = $find('sliderMinPrice');
    var lbl = $get('lblMaxPrice');
    var val = slider.get_Value();
    var valBox = $get('txtMaxPriceValue');
    lbl.innerHTML = formatCurrency(aSliderMaxValues[val], "No Max", false, aSliderMaxValues[slider.get_Maximum()]);
    valBox.value = aSliderMaxValues[val];
    if(slider.get_Value() <= slidermin.get_Value()){
        slidermin.set_Value(slider.get_Value()-1);
    }
}

function formatCurrency(num, lbldefault, bMin, limitVal) {
    num = num.toString().replace(/\$|\,/g,'');
    if(isNaN(num) || num == limitVal) {
        return lbldefault;
    } else {
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num*100+0.50000000001);
        num = Math.floor(num/100).toString();        
        for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++) {
            num = num.substring(0,num.length-(4*i+3))+','+    
            num.substring(num.length-(4*i+3));
        }
    }
    if (bMin) {
        return (((sign)?'':'-') + '$' + num + '+');
    } else {
        return (((sign)?'':'-') + '$' + num);
    }    
}

function setSliderValues(key, data) {
    switch (key){
        case 'slidermin':
            aSliderMinValues = data.split(",");
            break;            
        case 'slidermax':
            aSliderMaxValues = data.split(",");            
            break;
        case 'slidersqft':
            aSliderSQFTValues = data.split(",");            
            break;            
        case 'slideryear':
            aSliderYearValues = data.split(",");            
            break;
    }   
}

function listingItemHover(obj,id) {
    var element = document.getElementById(obj);
    element.style.background = '#EFEFEF'    
    ItemHover = setTimeout('centerMapOnPin('+id+')', 250);
    centerMapOnPin(id);
}
function listingItemCancelHover(obj){
    var element = document.getElementById(obj);
    element.style.background = '#FFFFFF'
    clearTimeout(ItemHover);
}

function centerMapOnPin(pinid) {
    map = $find('myMap');
    
    if (map != null) {
        var pinIDs = map.get_listingMapID();
        pinloc = map.GetShapeByID(pinIDs[pinid]);
        currPin = pinloc;
        var center = pinloc.GetPoints();
        var latlon = new VELatLong(center[0].Latitude, center[0].Longitude);
        map.SetCenter(latlon);
        setTimeout("map.ShowInfoBox(pinloc)", 250);
    }
}

//Gets the browser specific XmlHttpRequest Object
function getXmlHttpRequestObject() {
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		alert("Upgrade your browser to one that supports Javascript!");
	}
}
//Our XmlHttpRequest object to get the auto suggest
var searchReq = getXmlHttpRequestObject();

//Called from keyup on the search textbox.
//Starts the AJAX request.
function searchSuggest(evt) {

    // make sure we have a valid event variable
    if(!evt && window.event) {
        evt = window.event;
    }
    var key = evt.keyCode;
    if ((key == KEYUP) || (key == KEYDOWN)  || (key == KEYENTER))
    {
        return true;
    }

	if (searchReq.readyState == 4 || searchReq.readyState == 0) {
		var str = escape(document.getElementById('txtCityStateZipMLS').value);
		var listtypeid = escape(document.getElementById('ddPropertyType').value);
		if (str.length > 0 ) {
		    searchReq.open("GET", 'autocomplete.asmx/GetCompletionList?sid='+mlsid+'&searchtext=' + str + '&listtypeid=' + listtypeid, true);
		    searchReq.onreadystatechange = handleSearchSuggest; 
		    searchReq.send(null);		
		} else {
		   suggestClose();
		}

	}		
}
//Called when the AJAX response is returned.
function handleSearchSuggest() {
	if (searchReq.readyState == 4) {
		var ss = document.getElementById('search_suggest')
		ss.innerHTML = '';
		//alert(searchReq.responseText);
		//Load XMLDom
		try //Internet Explorer
          {
          xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
          xmlDoc.async="true";
          xmlDoc.loadXML(searchReq.responseText);
          }
        catch(e)
          {
          try //Firefox, Mozilla, Opera, etc.
            {
            parser=new DOMParser();
            xmlDoc=parser.parseFromString(searchReq.responseText,"text/xml");
            }
          catch(e) {alert(e.message)}
          }
		var x=xmlDoc.getElementsByTagName('string');
		if (x.length > 0) {
		    for(i=0; i < x.length; i++) {
		        var suggestitem = x[i].childNodes[0].nodeValue.split("|");
		        document.getElementById('search_suggest').style.display = "block";
			    //Build our element string.  This is cleaner using the DOM, but
			    //IE doesn't support dynamically added attributes.
			    var suggest = '<div id="suggest' + i + '" onmouseover="javascript:suggestOver(this);" suggestvalue="' + suggestitem[0] + '" ';
			    suggest += 'onmouseout="javascript:suggestOut(this);" ';
			    suggest += 'onclick="javascript:setSearch(this);" ';
			    suggest += 'class="suggest_link"><table width="100%"><tr class="SmallGreyText"><td>' + suggestitem[0] + ' (' + suggestitem[1] + ')</td></tr></table></div>';
			    ss.innerHTML += suggest;
		    }
		    //add Close Button
		    var closeitem = '<div class="suggest_link"><table width="100%"><tr><td align="right"><div class="suggest_close" onclick="suggestClose();">Close</div></td></tr></table></div>'
		    ss.innerHTML += closeitem;
		    selected = -1;
		} else {
		    suggestClose();
		}
	}
}

//Mouse over function
function suggestOver(div_value) {
	div_value.className = 'suggest_link_over';
}
//Mouse out function
function suggestOut(div_value) {
	if (div_value != null) {
	div_value.className = 'suggest_link';
	}
}
//Click function
function setSearch(obj) {
    if (obj != null)  {
        var value = obj.getAttribute("suggestvalue");
	    document.getElementById('txtCityStateZipMLS').value = value;
	    document.getElementById('search_suggest').innerHTML = '';
	    document.getElementById('search_suggest').style.display = "none";
    }
}
function suggestClose() {
    document.getElementById('search_suggest').style.display = "none";
}

function keypressHandler(evt)
{
    // don't do anything if the div is hidden
    var div = document.getElementById('search_suggest');
    
    if (div.style.display == "none")
    return true;
    
    //Get number of results
    var divelements = div.childNodes.length;
    
    // make sure we have a valid event variable
    if(!evt && window.event) {
        evt = window.event;
    }
    var key = evt.keyCode;
    if ((key != KEYUP) && (key != KEYDOWN)  && (key != KEYENTER))
    {
        return true;
    }
    
    if (key == KEYUP){
        if ((selected-1) >= 0) {
            selected -= 1;
        } else {
            selected = 0
        }
    }
    
    if (key == KEYDOWN) {
        if ((selected+1) <= divelements) {
            selected += 1;
        } else {
            selected = divelements-1
        }
    }
    
    if (key == KEYENTER) {
        setSearch(document.getElementById("suggest"+selected));  
        return false;
    }
    
    if (selected <= divelements-1) {
        var selectedobj = document.getElementById("suggest"+selected);
        if (selectedobj != null) {
            suggestOut(document.getElementById("suggest"+(selected-1)));
            suggestOut(document.getElementById("suggest"+(selected+1)));
            suggestOver(selectedobj);
        }        
    }

    return true;
}

function eventTrigger (e) //returns event source as object for IE/Safari or FireFox
{
    if (! e)
    e = event;
    return e.target || e.srcElement;
}

function OpenRssFeed(url) {
    window.open(url);
}

function ValidateRequiredFields2() {
    if (document.getElementById("txtRegisterFirst2").value == "") {
        alert("Please enter a first name.");
        document.getElementById("txtRegisterFirst2").focus();
        return false;
    }
    if (document.getElementById("txtRegisterLast2").value == "") {
        alert("Please enter a last name.");
        document.getElementById("txtRegisterLast2").focus();
        return false;
    }
    if (document.getElementById("txtRegisterEmail2").value == "") {
        alert("Please enter an email address.");
        document.getElementById("txtRegisterEmail2").focus();
        return false;
    }
    var x = document.getElementById("txtRegisterEmail2").value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
    if (document.getElementById("txtRegisterEmailConfirm2").value == "") {
        alert("Please confirm your email address.");
        document.getElementById("txtRegisterEmailConfirm2").focus();
        return false;
    }
    var x = document.getElementById("txtRegisterEmailConfirm2").value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
        alert("Not a valid e-mail address");
        return false;
    }

    return true;
}

function ValidateRequiredFields3() {
    if (document.getElementById("txtRegisterFirst3").value == "") {
        alert("Please enter a first name.");
        document.getElementById("txtRegisterFirst3").focus();
        return false;
    }
    if (document.getElementById("txtRegisterLast3").value == "") {
        alert("Please enter a last name.");
        document.getElementById("txtRegisterLast3").focus();
        return false;
    }
    if (document.getElementById("txtRegisterEmail3").value == "") {
        alert("Please enter an email address.");
        document.getElementById("txtRegisterEmail3").focus();
        return false;
    }
    var x = document.getElementById("txtRegisterEmail3").value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
    if (document.getElementById("txtRegisterEmailConfirm3").value == "") {
        alert("Please confirm your email address.");
        document.getElementById("txtRegisterEmailConfirm3").focus();
        return false;
    }
    var x = document.getElementById("txtRegisterEmailConfirm3").value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
        alert("Not a valid e-mail address");
        return false;
    }

    return true;
}