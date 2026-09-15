	var mdbSelections;
    function MDBToggleText(e)
	{
		var eventSrc = eventTrigger(e) //This gets the event source in IE or FireFox
		var szBaseTarget = MDBGetTargetBase(eventSrc.id);	
		var szPropertyNum = MDBGetTargetPropertyNum(szBaseTarget, eventSrc.id);
		var oTxtBox = document.getElementById(szBaseTarget + "_txt");
		if(eventSrc.checked)
		{
			var oHidSelections = document.getElementById(szBaseTarget + "_Selections");

			if(oTxtBox.value.toString().length > 0)
			{
			    if (oTxtBox.value.toString() == "Any") {
			      oTxtBox.value = ""  
			    }
				oTxtBox.value += "," + document.getElementById(szBaseTarget + "_lbl" + szPropertyNum).innerHTML;
				oHidSelections.value += "," + szPropertyNum;
			}
			else
			{
				oTxtBox.value = document.getElementById(szBaseTarget + "_lbl" + szPropertyNum).innerHTML;
				oHidSelections.value = szPropertyNum;
			}
		}
		else
		{
			//var regExpTargetText = new RegExp(document.getElementById(szBaseTarget + "_lbl" + szPropertyNum).innerHTML, "gi");
			var regExpTargetText = document.getElementById(szBaseTarget + "_lbl" + szPropertyNum).innerHTML;
			oTxtBox.value = oTxtBox.value.toString().replace(regExpTargetText, "");
			if (oTxtBox.value.toString().length == 0) {
			    oTxtBox.value = "Any";
			}
			MDBRemoveSelectedValue(szBaseTarget, szPropertyNum);
		}
		oTxtBox.value = MDBTrimComas(oTxtBox.value);
		oTxtBox.title = MDBTrimComas(oTxtBox.value);
        mdbSelections = MDBTrimComas(oHidSelections.value);
    }
	function MDBRemoveSelectedValue(szBaseTarget, szPropertyNum)
	{
		var oHidSelections = document.getElementById(szBaseTarget + "_Selections");
		var aPairs = oHidSelections.value.toString().split(",");
		var szTempPair = new String();
		var szNewValue = new String();
		for(i=0; i<aPairs.length; i++)
		{
			szTempPair = aPairs[i];
			if(szTempPair != szPropertyNum)
			{
				if(szNewValue.length > 0)
				{
					szNewValue += "," + szTempPair;
				}
				else
				{
					szNewValue = szTempPair;
				}
			}
		}
		oHidSelections.value = szNewValue;
	}
	function MDBTrimComas(szTxtBoxValue)
	{
		var aPairs = szTxtBoxValue.split(",");
		var szTempPair = new String();
		var szReturn = new String();
		for(i=0; i<aPairs.length; i++)
		{
			szTempPair = aPairs[i];
			szTempPair = szTempPair.replace(/^\s+|\s+$/g, '');
			if(szTempPair.length > 0)
			{
				if(szReturn.length > 0)
				{
					szReturn += ", " + szTempPair;
				}
				else
				{
					szReturn = szTempPair;
				}
			}
		}
		return szReturn;
	}
	function MDBGetTargetPropertyNum(szBaseTarget, szCurrentID)
	{
        var aPair = szCurrentID.toString().split(szBaseTarget + "_chk");
		return new String(aPair[1].toString());
	}
	function MDBGetTargetBase(szCurrentTarget)
	{
		var aPair = szCurrentTarget.toString().split("_");
		return new String(aPair[0].toString());
	}
	function MDBToggleDD(e)
	{
		var eventSrc = eventTrigger(e) //This gets the event source in IE or FireFox
		var szBaseTarget = MDBGetTargetBase(eventSrc.id);
		if(szBaseTarget != null && szBaseTarget.length > 0)
		{
		    if(document.getElementById(szBaseTarget).getAttribute("MDBDown") == "0")
		    {
		    	if(e.type == "click")
		    	{
		    		document.getElementById(szBaseTarget).setAttribute("MDBDown", "1");
		    		eventSrc.src = "images/MultiDisplayBox/cbo_up_over.jpg";
		    		document.getElementById(szBaseTarget + "_ddDiv").style.display = "block";
		    		document.getElementById(szBaseTarget + "_ddDiv").scrollTop = 0;
		    	}
	    	}
		    else
		    {
		    	document.getElementById(szBaseTarget).setAttribute("MDBDown","0");
		    	document.getElementById(szBaseTarget + "_ddDiv").style.display = "none";
		    	//var t=setTimeout("document.getElementById('" + szBaseTarget + "_ddDiv').style.display = 'none';",500);
		    	if(event.type != "click")
		    	{
				    MDBOut(szBaseTarget);
		    	}
		    	else
		    	{
		    		document.getElementById(szBaseTarget + "_imgDD").src = "images/MultiDisplayBox/cbo_down_over.jpg";
		    	}
		    }
		}
	}

	function MDBHoverToggle(e)
	{
	    var eventSrc = eventTrigger(e) //This gets the event source in IE or FireFox
		var szBaseTarget = MDBGetTargetBase(eventSrc.id);
		if(document.getElementById(szBaseTarget).getAttribute("MDBDown") == "0")
		{
			if(e.type == "mouseover")
			{
				MDBOver(szBaseTarget);
			}
			else
			{
				MDBOut(szBaseTarget);
			}
		}
	}
	function MDBOut(szBaseTarget)
	{
		document.getElementById(szBaseTarget + "_imgDD").src = "images/MultiDisplayBox/cbo_down_off.jpg";
		document.getElementById(szBaseTarget + "_txtDiv").style.borderTopColor = "#ABADB3";
		document.getElementById(szBaseTarget + "_txtDiv").style.borderBottomColor = "#E3E9EF";
		document.getElementById(szBaseTarget + "_imgLeftBox").src = "images/MultiDisplayBox/cboBoxLeft_off.jpg";
	}
	function MDBOver(szBaseTarget)
	{
		document.getElementById(szBaseTarget + "_imgDD").src = "images/MultiDisplayBox/cbo_down_over.jpg";
		document.getElementById(szBaseTarget + "_txtDiv").style.borderTopColor = "#5794BF";
		document.getElementById(szBaseTarget + "_txtDiv").style.borderBottomColor = "#C7E2F1";
		document.getElementById(szBaseTarget + "_imgLeftBox").src = "images/MultiDisplayBox/cboBoxLeft_over.jpg";
	}
	function MDBCloseDD(e)
	{
	    var eventSrc = eventTrigger(e) //This gets the event source in IE or FireFox
		var szBaseTarget = MDBGetTargetBase(eventSrc.id);
		document.getElementById(szBaseTarget).setAttribute("MDBDown","0");
		document.getElementById(szBaseTarget + "_ddDiv").style.display = "none";
		MDBOut(szBaseTarget);
	}
    
    function eventTrigger (e) //returns event source as object for IE/Safari or FireFox
    {
        if (! e)
        e = event;
        return e.target || e.srcElement;
    }
    
    function forceItemClick(objid) {
        alert('Here');
        var obj = document.getElementById(objid);
        obj.click();
    }