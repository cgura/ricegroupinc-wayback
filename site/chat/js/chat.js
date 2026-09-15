var _FirstTime = true;
var _msg = '';
var ws;
var _Waiting = false;
var _TimeoutID = 0;
var _Closing = false;
var _Presence = 'normal';
var _From = '';

function HandleError(e)
{
	if(e.statusText == undefined)
	{
		alert(e.message);
	}
	else
	{
		alert(e.statusText);
	}
	messageWait();
}

function OnMessageWait(sessionID, data, xml, error) 
{	
	try
	{
		_Waiting = false;
		
		var re = new RegExp("<body>(.*)<\/body>");

		var m = re.exec(data);
		if (m != null) 
		{
			if (m[1] != '') 
			{
				AppendToMessageWindow(m[1], 'blue', true);
			}
		}
	}
	catch(e)
	{
		HandleError(e);
	}
}

function messageWait() 
{	
	try
	{		
		if(_Waiting == true)
			return;
			
		var hParams={};
		var bParams={};

		if (_SessionID != '') 
		{
			hParams['SessionID']=_SessionID;
			bParams['waitMilliseconds']='15000';			
			bParams['bGetWebChatMsgs'] = true;
			bParams['bGetWebChatCmds'] = false;
			
			ws['MessageWaitForIncoming'](hParams,bParams);	
			_Waiting = true;	
			
			clearTimeout(_TimeoutID);
			_TimeoutID = setTimeout('WatchTimeout()', 20000);
		}
	}
	catch(e)
	{
		HandleError(e);
	}
}

function SendPresence()
{
    var hParams={};
	var bParams={};

	hParams['SessionID']=_SessionID;
	bParams['showValue']=_Presence;
	bParams['longText']='';
	
    ws['PresenceSendAvailable'](hParams,bParams);  
}

function Unwrap(msg)
{
	msg = replaceAll(msg, "&lt;Message", "<Message");
	msg = replaceAll(msg, "&lt;/Message&gt;", "</Message>");
	msg = replaceAll(msg, "&gt;&lt;Body&gt;", "><Body>");
	msg = replaceAll(msg, "&lt;/Body&gt;", "</Body>");
	
	var xml = GetXMLObject(msg);		
	var msgnode = xml.getElementsByTagName('Message')[0];
	if(msgnode != null)
	{
		_From = msgnode.getAttribute("From");

		var bodynode = msgnode.getElementsByTagName('Body')[0];
		if(bodynode != null)
		{			
			var txt;
			if(isIE)
				txt = bodynode.text;
			else
				txt = bodynode.textContent;
				
			txt = replaceAll(txt, "&lt;", "<");
			txt = replaceAll(txt, "&gt;", ">");
			txt = replaceAll(txt, "&amp;", "&");
				
			if(txt == '_GetContact_')
				return 'contact';
			else if(txt.indexOf('Name::', txt) != -1) // old, dont use
				return 'name';
			
			return txt;	
		} 
	}		
}

function Wrap(msg)
{
	var xml = '<Message><Body>' + msg + '</Body></Message>';
	xml = escape(xml);
	
	return xml;
}

function GetXMLObject(xmlstring) {
    var xmlobject;
    
    // code for IE
	if (window.ActiveXObject)
	{
        xmlobject=new ActiveXObject("Microsoft.XMLDOM");
        xmlobject.async="false";
        xmlobject.loadXML(xmlstring);
	}
	// code for Mozilla, Firefox, Opera, etc.
	else
	{
        var parser=new DOMParser();
        xmlobject=parser.parseFromString(xmlstring,"text/xml");//"application/xml");
	}
//	alert(xmlobject);
	return xmlobject;
}

function replaceAll(str, look, replace)
{
    while(str.indexOf(look) != -1)
        str = str.replace(look, replace);
        
    return str;
}

function SendIfEnter(evt) 
{
    var charCode = (evt.which) ? evt.which : event.keyCode
	
    if (charCode == 13) 
    {
    	if(_LO.length > 0)
    		DoSendMessage();    		
    	return false;
    }
    
    return true;
}

function DoSendMessage()
{
	try
	{
		if(null == _SessionID || _SessionID.length == 0)
			return;
			
		var txt = document.getElementById('txtMessage').value;
		if(txt.length == 0)
			return;
			
		AppendToMessageWindow(txt, 'green', false);
		
		var hParams={};
		var bParams={};
		
		hParams['SessionID']=_SessionID;
		bParams['text']=Wrap(document.getElementById('txtMessage').value);  
		
		document.getElementById('txtMessage').value = ''; 

		bParams['toUser']=_LO;
		bParams['thread']='XMPP';		
		
		ws['MessageSend'](hParams,bParams);		
	}
	catch(e)
	{
		HandleError(e);
	}
}

function DoSendContact()
{
	try
	{
		var wsContact = new WebService(OnWebserviceCallback, window.location.protocol + '//' + window.location.host + '/xsitesdesktopsvc/chat.asmx');
		var hParams={};
		var bParams={};
		
		bParams['PassportID']=_LO.split("@")[0];
		bParams['AWSAccountsID']=_AWSAccountsID;		
		bParams['FirstName']=document.getElementById('txtFirst').value;	
		bParams['LastName']=document.getElementById('txtLast').value;	
		bParams['Address']=document.getElementById('txtAddress').value;	
		bParams['City']=document.getElementById('txtCity').value;	
		bParams['State']=document.getElementById('txtState').value;	
		bParams['Zip']=document.getElementById('txtZip').value;	
		bParams['Phone']=document.getElementById('txtPhone').value;	
		bParams['Email']=document.getElementById('txtEmail').value;	
		
		wsContact['InsertContactEx'](hParams,bParams);	
		
		var msg = '<Message>';
		msg += '<System>New contact has been added:\r\n';
		msg += document.getElementById('txtFirst').value + ' ' + document.getElementById('txtLast').value + '\r\n';
		msg += document.getElementById('txtAddress').value + '\r\n';
		msg += document.getElementById('txtCity').value + ', ' + document.getElementById('txtState').value + ' ' + document.getElementById('txtZip').value + '\r\n';
		msg += document.getElementById('txtPhone').value + '\r\n';
		msg += document.getElementById('txtEmail').value;
		msg += '</System>';		
		msg += '</Message>';
		msg = escape(msg);
	
		hParams['SessionID']=_SessionID;
		bParams['text']=msg;
		bParams['toUser']=_LO;
		bParams['thread']='XMPP';		
		
		ws['MessageSend'](hParams,bParams);		
		
		msg = '<Message>';
		msg += '<Name>';
		msg += document.getElementById('txtFirst').value + ' ' + document.getElementById('txtLast').value;
		msg += '</Name>';
		msg += '</Message>';
		msg = escape(msg);
		
		bParams['text']=msg;		
		
		ws['MessageSend'](hParams,bParams);
	}
	catch(e)
	{
		HandleError(e);
	}
}

function AppendToMessageWindow(msg, color, unwrap) 
{	
	if(unwrap == true)
		msg = Unwrap(msg);
	
	if(msg != 'contact' && msg != 'name')
	{
		if (document.getElementById('outMessage').innerHTML.length > 0) 
			document.getElementById('outMessage').innerHTML=document.getElementById('outMessage').innerHTML + "<br>";
			
		var pref;
		if(unwrap)
		{
			var ddl = document.getElementById('ddlUsers');				
			var name = 'Operator';
			for(i = 0; i < ddl.options.length; i++)
				if(ddl.options[i].value == _From)
					name = ddl.options[i].text;
	
			pref = "<b>" + name + " said:</b><br>";
		}
		else
			pref = "<b>You said:</b><br>";
		
		document.getElementById('outMessage').innerHTML=document.getElementById('outMessage').innerHTML + "<font color='" + color + "'>" + pref + msg + "</font>";
		document.getElementById('outMessage').scrollTop = document.getElementById('outMessage').scrollHeight;
	}
	else if(msg == 'contact')
	{
		GetContactInfo();
	}	
}	

function DoLogin()
{
	try
	{		
		ws = new WebService(OnWebserviceCallback, window.location.protocol + '//' + window.location.host + '/chat/ws/SoapBoxWebService.asmx');
		
		var hParams={};
		var bParams={};

		hParams['SessionID']='';
		bParams['username']=_UID;
		bParams['password']='alamode';
		bParams['autocreate']=true;
		bParams['hostname']=_Server;    	

		ws['SessionLogin'](hParams,bParams);
	}
	catch(e)
	{
		HandleError(e);
	}
}

function GetContacts()
{
	try
	{		
		ws = new WebService(OnWebserviceCallback, window.location.protocol + '//' + window.location.host + '/chat/ws/SoapBoxWebService.asmx');
		
		var hParams={};
		var bParams={};

		if (_SessionID != '') 
		{
			hParams['SessionID']=_SessionID;

			ws.set_OnComplete(OnWebserviceCallback);
			ws['ContactsGet'](hParams,bParams);
		}   
	}
	catch(e)
	{
		HandleError(e);
	}
}

function OnGetContacts(sessionID, data, xml, error) 
{
	var re = new RegExp("<contactpoint");
	var m = re.exec(data);
	if (m != null) {
	    var xmlobject = GetXMLObject(data);

        //code for ie
	    if (window.ActiveXObject) {
	        var nodes = GetXMLObject(data).selectNodes("//group/contact/contactpoint");
	    }
	    // code for Mozilla, Firefox, Opera, etc.
	    else {
	          var nodes = xmlobject.getElementsByTagName("contactpoint");
	    }

        //var nodes = 
		if (nodes.length > 0) 
		{
			var ddl = document.getElementById('ddlUsers');			
			ddl.length = nodes.length + 1;
			
			for(var i = 0; i < nodes.length; i++)
			{
				var jid = nodes[i].getAttribute("barejid");
				var name = nodes[i].getAttribute("name");
				
				ddl.options[i+1].text = name;
				ddl.options[i+1].value = jid;
				
				if(jid == _LO || name == _LO)
				{
					ddl.options[i+1].selected = true;
					document.getElementById("txtMessage").disabled = false;
					_LO = jid;
				}
			}	
		}
	}
}

function StaffMemberChanged()
{
	var ddl = document.getElementById('ddlUsers');

	_LO = ddl.options[ddl.selectedIndex].value;
	document.getElementById('txtMessage').disabled = false;
}

function WatchTimeout()
{
	if(true == _Waiting)
	{
		_Waiting = false;
		messageWait();	
	}
}

function DoLogout()
{
}

function OnWebserviceCallback2(sessionID, data, xml, error)
{
debugger
}

function OnWebserviceCallback(sessionID, data, xml, error)
{
	try
	{
		if(true == _Closing)
			return;
			
		if(data == null)
		{
			messageWait();
			return;
		}
			
		if(sessionID != null && _SessionID.length == 0)
			_SessionID = sessionID;
			
		var webService = GetResponseType(data);
	
		switch (webService)
		{
			case 'SessionLoginResponse':		
				SendPresence();
				break;			
			case 'MessageWaitForIncomingResponse':				
				OnMessageWait(sessionID, data, xml, error);
				SendPresence();
				break;		
			case 'MessageSendResponse':
				messageWait();
				break;	
			case 'CancelMessageWaitForIncomingResponse':
				DoSendMessageEx();
				break;
			case 'PresenceSendAvailableResponse':	
				GetContacts();		
				messageWait();
				break;
			case 'ContactsGetResponse':				
				OnGetContacts(sessionID, data, xml, error);	
				break;
			case 'soap:Fault':
				alert(data);
				break;
			default:			
				break;
		}
	}
	catch(e)
	{
		HandleError(e);		
		messageWait();
	}
}

function GetResponseType(data)
{
	// code for IE
	if (window.ActiveXObject)
    {
        var xmlobject=new ActiveXObject("Microsoft.XMLDOM");
        xmlobject.async="false";
        xmlobject.loadXML(data);
    }
	// code for Mozilla, Firefox, Opera, etc.
	else
    {
        var parser=new DOMParser();
        var xmlobject=parser.parseFromString(data,"text/xml");
    }

	// get the XML root item
	var root = xmlobject.getElementsByTagName('Body');
	if(root[0] == null)
		root = xmlobject.getElementsByTagName('soap:Body');
		
	if(root[0] != null)
	{
		var responseType = root[0].firstChild;
		if (responseType)
			return responseType.nodeName;
		else
			return "";
	}
	else
		return "";
}

var isIE = (window.navigator.userAgent.indexOf("MSIE") > 0);
if (! isIE) 
	{
	HTMLElement.prototype.__defineGetter__("innerText", function () { return(this.textContent); });
	HTMLElement.prototype.__defineSetter__("innerText", function (txt) { this.textContent = txt; });
	}