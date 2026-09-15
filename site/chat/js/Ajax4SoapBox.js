/********************************************
** Name: Ajax4SoapBox javascript library    *
** Purpose: create a javascript abstraction *
**          of SoapBox Webservice.          *
** Author: Ing. Paolo Labellarte            *
** Version: 1.0 (20070306)                  *
** Customer: Conversant                     *    
********************************************/


//CONSTANTS
//define base SOAP request
var SoapBoxBaseRequestHeader='<?xml version="1.0" encoding="utf-8"?>'
            +'<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'
                +'<soap:Header>'
                  +'<SoapBoxHeader xmlns="URI">'
              +'SBHeaderParams'
            +'</SoapBoxHeader>'
          +'</soap:Header>'
          +'<soap:Body>'
            +'<MethodName xmlns="URI">'
              +'SBParams'
            +'</MethodName>'
          +'</soap:Body>'
        +'</soap:Envelope>'

//URI - SOAP namespace
var webServiceUri='http://www.winfessor.com/SoapBoxWebService/SoapBoxWebService';
var webServiceUriXSD='http://www.MortgageXSites.com/XSitesDesktopSVC/Chat'
//Utility
//Expose some static methods
Utility=function()
    {
           
            
        
        }
 
 
 //getSoapBoxRequest
 //build the soap envelope to use in DoSoapBoxRequest
Utility.getSoapBoxRequest=function(methodName,xmlStringHeaderParams,xmlStringBodyParams)
            {
               
                var reURI=/URI/g;
                var reSBHeaderParams=/SBHeaderParams/;
                var reMethodName=/MethodName/g;
                var reSBParams=/SBParams/;
                
                var res=SoapBoxBaseRequestHeader.replace(reURI,webServiceUri).replace(reSBHeaderParams,xmlStringHeaderParams).replace(reMethodName,methodName).replace(reSBParams,xmlStringBodyParams);
                //alert(res);
                return res;                                
                
            } 
            
//getXmlDocument
//not used            
Utility.getXmlDocument=function(xmlString)
            {
            var xmlDocString=xmlString;
            var xDoc=null;
            if (document.implementation && document.implementation.createDocument){
            //xDoc=document.implementation.createDocument("","root",null);
            var parser=new DOMParser();
            xDoc=parser.parseFromString(xmlDocString,"text/xml");
            }else if (typeof ActiveXObject != "undefined"){
            var msXmlAx=null;
            try{
            msXmlAx=new ActiveXObject("Msxml2.DOMDocument");
            msXmlAx.async = false;
            }catch (e){
            msXmlAx=new ActiveXObject("Msxml.DOMDocument");
            msXmlAx.async = false;
            }
            
            msXmlAx.loadXML(xmlDocString);
            xDoc=msXmlAx;
            }
            if (xDoc==null || typeof xDoc.load=="undefined"){
            xDoc=null;
            }
            return xDoc;
                
              }

//serialize
//convert params in a xml rappresentation
//params must be a key-value object 
Utility.serialize=
        function(params)
        { 
            var res='';
            for(var param in params)
            {
                res+='<'+param+'>'+params[param]+'</'+param+'>';
            }
            return res;
        }
        
//deserialize
//not used        
Utility.deserialize=
        function(xmlString)
        { 
            //var xmlDoc=Sys.Serialization.JavaScriptSerializer.deserialize(xmlString);
            //alert(xmlDoc.getElementById('params'));
             var doc=Utility.getXmlDocument(xmlString);
             //alert(doc);
        }    
        
//htmlEncode
//simple encode of xml response to be printed in html document       
Utility.htmlEncode=
        function(htmlString)
        { 
            var res='';
            if(htmlString!=null)res=htmlString.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\'/g,'&apos;').replace(/"/g,'&quot;');
            return res;
        }            
        
WebService=function(OnCompleteHandler, url)
                     {
						  this._webServiceUrl = url;
                          this._sessionID=null;
                          this._lastResponseData='';
                          this._lastResponseXml=null;
                          this._lastResponseError='';
                          this._request=[];
                          
                          WebService._OnComplete=OnCompleteHandler; 
                     }


WebService.prototype.set_OnComplete=function(OnCompleteHandler)
                    {WebService._OnComplete=OnCompleteHandler;}      
                                  
WebService.prototype.get_sessionID=function()
                {return this._sessionID;}        
WebService.prototype.get_lastResponseData=function()
                {return this._lastResponseData;}
WebService.prototype.get_lastResponseXml=function()
                {return this._lastResponseXml;}      
WebService.prototype.get_lastResponseError=function()
                {return this._lastResponseError;}                               

//****methods 

WebService.prototype.DoSoapBoxRequest=
        function(mode,methodName,SBHeaderParams,SBBodyParams,OnWebRequestCompleted)
        {
			var xmlSoapBoxHeaderParams=Utility.serialize(SBHeaderParams);
			var xmlSoapBoxBodyParams=Utility.serialize(SBBodyParams);
			var strSoap;
			
			YAHOO.util.Connect.resetDefaultHeaders();
			
			if(mode == 1)
			{
				strSoap=Utility.getSoapBoxRequest(methodName,
													xmlSoapBoxHeaderParams,
													xmlSoapBoxBodyParams);
	            
				YAHOO.util.Connect.initHeader("SOAPAction", webServiceUri + '/' + methodName, false);
				YAHOO.util.Connect.initHeader("Content-Type", "text/xml", true); 	
			}
			else if(mode == 2)
			{	
				strSoap = '<?xml version="1.0" encoding="utf-8"?>';
				strSoap += '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">';
				strSoap += '<soap:Body>';
				strSoap += '<' + methodName + ' xmlns="' + webServiceUriXSD + '">';
				strSoap += xmlSoapBoxBodyParams;	
				strSoap += '</' + methodName + '>';
				strSoap += '</soap:Body>';
				strSoap += '</soap:Envelope>';	            
				
				YAHOO.util.Connect.initHeader("SOAPAction", webServiceUriXSD + '/' + methodName, false);
				YAHOO.util.Connect.initHeader("Content-Type", "text/xml", true); 
			}
			
			YAHOO.util.Connect.setDefaultPostHeader(false);      
			
			var id = YAHOO.util.Connect._transaction_id;
			this._request[this._request.length] = YAHOO.util.Connect.asyncRequest('POST', this._webServiceUrl, { success:this.OnWebRequestCompleted, failure:this.OnError, argument:[this, id] }, strSoap);
		}         

WebService.prototype.OnError = function(error)
{
	WebService._OnComplete(this._sessionID,null,null,null);
}  

WebService.prototype.dispose = function()
{
	if(this._request != null)
	{
		while(this._request.length > 0)
		{			
			this.removeAt(0);
		}		
	}
	YAHOO.util.Connect._transaction_id = 0;
	this._request = [];
	if (typeof CollectGarbage != 'undefined') CollectGarbage();
}   

WebService.prototype.removeAt = function(idx)
{			
	if(this._request[idx] != null)
	{
		YAHOO.util.Connect.abort(this._request[idx], this.disposeComplete, true);
		YAHOO.util.Connect.releaseObject(this._request[idx]);
	}
	this._request.splice(idx, 1);
}   

WebService.prototype.disposeComplete = function()
{
}   

//*****settings
WebService.prototype.SettingsSetAutoAwayPresenceValues=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'SettingsSetAutoAwayPresenceValues',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.SettingsSetSessionTimeouts=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'SettingsSetSessionTimeouts',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        

//*****session                     
WebService.prototype.SessionLogin=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'SessionLogin',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.SessionLoginEx=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'SessionLoginEx',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}                        
WebService.prototype.SessionLogout=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'SessionLogout',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}
WebService.prototype.SessionLogoutEx=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'SessionLogoutEx',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)} 

//*****message
WebService.prototype.MessageSend=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'MessageSend',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.MessageSendEx=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'MessageSendEx',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.MessageSendEx2=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'MessageSendEx2',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.MessageSendEx3=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'MessageSendEx3',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.MessageDequeue=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'MessageDequeue',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.MessageWaitForIncoming=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'MessageWaitForIncoming',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.CancelMessageWaitForIncoming=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'CancelMessageWaitForIncoming',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        

//****contacts
WebService.prototype.ContactsGet=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'ContactsGet',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.ContactsGetDelta=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'ContactsGetDelta',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.ContactsRequestFromServerAndWait=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'ContactsRequestFromServerAndWait',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.ContactsWaitForDelta=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'ContactsWaitForDelta',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.ContactsAddUser=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'ContactsAddUser',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.ContactsRemoveUser=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'ContactsRemoveUser',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.ContactsUpdateUser=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'ContactsUpdateUser',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}       
WebService.prototype.InsertContactEx=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(2,'InsertContactEx',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}       

//****presence
WebService.prototype.PresenceSendAvailable=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'PresenceSendAvailable',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.PresenceSendAvailableEx=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'PresenceSendAvailableEx',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.PresenceSendCurrent=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'PresenceSendCurrent',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.PresenceSendUnavailable=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'PresenceSendUnavailable',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.PresenceSendUnavailableEx=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'PresenceSendUnavailableEx',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        


//****registration
WebService.prototype.RegisterUser=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'RegisterUser',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.RegisterUserEx=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'RegisterUserEx',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.RegisterUserWithGateway=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'RegisterUserWithGateway',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.RegisterRemoveUser=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'RegisterRemoveUser',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
WebService.prototype.RegisterRemoveUserFromGateway=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'RegisterRemoveUserFromGateway',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        
                
//****exception                
WebService.prototype.AsyncExceptionsDequeue=function(SBHeadersMembers,SBBodyMembers)
                {this.DoSoapBoxRequest(1,'AsyncExceptionsDequeue',SBHeadersMembers,SBBodyMembers,this._OnWebRequestCompleted)}        

//_OnWebRequestCompleted
//Call back method that must be call before other call back.
WebService.prototype.OnWebRequestCompleted=function(o)
                {
               
                    var nameResponse='';
                    var xmlDoc=null;                       
                    var arr=null;
                    
                    this._lastResponseData=o.responseText;
                    
                    var reFaultString=new RegExp('<faultstring>(.*)','');
                    arr=reFaultString.exec(o.responseText);
                    if(arr!=null)this._lastResponseError=arr[1];
                    
                    var reSessionID=new RegExp('<SoapBoxHeader[^>]*><SessionID>(.*?)</SessionID></SoapBoxHeader>','');
                    arr=reSessionID.exec(o.responseText);
                    if(arr!=null)this._sessionID=arr[1];                       
                                        
                    var reXml=new RegExp('Response[^>]*>([.|^.]*)','');
                    arr=reXml.exec(o.responseText);
                    if(arr!=null)this._lastResponseXml=arr[1];                      
                    
                    WebService._OnComplete(this._sessionID,this._lastResponseData,this._lastResponseXml,this._lastResponseError);
                
					if(o.argument[0]._request != null)
					{
						for(i=0; i<o.argument[0]._request.length; i++)
						{
							if(o.argument[0]._request[i].tId == o.argument[1])
							{
								o.argument[0].removeAt(i);
								break;
							}
						}
					}
                 }        


//To create UI for web service




            
        