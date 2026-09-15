// JScript File
//Web service model
var methodArray = new Array()
methodArray={
                //Settings
                'SettingsSetAutoAwayPresenceValues':{type:'Session',headerParams:['SessionID'],bodyParams:['autoAwayStatus','autoAwayShowValue']},
                'SettingsSetSessionTimeouts':{type:'Session',headerParams:['SessionID'],bodyParams:['autoAwayTimeoutSeconds','autoBlockMessagesTimeoutSeconds','autoLogoutTimeoutSeconds']},
                //Session
                'SessionLoginEx':{type:'Session',headerParams:['SessionID'],bodyParams:['username','password','resource','hostname']},
                'SessionLogin':{type:'Session',headerParams:['SessionID'],bodyParams:['username','password','hostname']},
                'SessionLogout':{type:'Session',headerParams:['SessionID'],bodyParams:[]},
                'SessionLogout':{type:'Session',headerParams:['SessionID'],bodyParams:['remove']},
                //Message
                'MessageSend':{type:'Message',headerParams:['SessionID'],bodyParams:['text','toUser','thread']},
                'MessageSendEx':{type:'Message',headerParams:['SessionID'],bodyParams:['text','toUser','thread','payload']},
                'MessageSendEx2':{type:'Message',headerParams:['SessionID'],bodyParams:['text','toUser','thread','subject']},
                'MessageSendEx3':{type:'Message',headerParams:['SessionID'],bodyParams:['text','toUser','thread','subject','payload']},
                'MessageDequeue':{type:'Message',headerParams:['SessionID'],bodyParams:[]},
                'MessageWaitForIncoming':{type:'Session',headerParams:['SessionID'],bodyParams:['waitMilliseconds']},
                'CancelMessageWaitForIncoming':{type:'Session',headerParams:['SessionID'],bodyParams:[]},
                //contacts
                'ContactsGet':{type:'contacts',headerParams:['SessionID'],bodyParams:[]},
                'ContactsGetDelta':{type:'contacts',headerParams:['SessionID'],bodyParams:[]},
                'ContactsRequestFromServerAndWait':{type:'contacts',headerParams:['SessionID'],bodyParams:['waitMilliseconds']},
                'ContactsWaitForDelta':{type:'contacts',headerParams:['SessionID'],bodyParams:['waitMilliseconds']},
                'ContactsAddUser':{type:'contacts',headerParams:['SessionID'],bodyParams:['friendlyName','group','jid']},
                'ContactsRemoveUser':{type:'contacts',headerParams:['SessionID'],bodyParams:['jid']},
                'ContactsUpdateUser':{type:'contacts',headerParams:['SessionID'],bodyParams:['friendlyName','group','jid']},
                'InsertContactEx':{type:'contacts',headerParams:[],bodyParams:['PassportID','AWSAccountsID','FirstName','LastName','Address','City','State','Zip','Phone','Email']},
                //presence
                'PresenceSendAvailable':{type:'presence',headerParams:['SessionID'],bodyParams:['showValue','longText']},
                'PresenceSendAvailableEx':{type:'presence',headerParams:['SessionID'],bodyParams:['showValue','longText','priority']},
                'PresenceSendCurrent':{type:'presence',headerParams:['SessionID'],bodyParams:['toUserJID']},
                'PresenceSendUnavailable':{type:'presence',headerParams:['SessionID'],bodyParams:[]},
                'PresenceSendUnavailableEx':{type:'presence',headerParams:['SessionID'],bodyParams:['toUserJID']},
                //registration
                'RegisterUser':{type:'registration',headerParams:['SessionID'],bodyParams:['username','password','hostname']},
                'RegisterUserEx':{type:'registration',headerParams:['SessionID'],bodyParams:['username','password','hostname']},
                'RegisterUserWithGateway':{type:'registration',headerParams:['SessionID'],bodyParams:['username','password','hostname','gatewayJID']},
                'RegisterRemoveUser':{type:'registration',headerParams:['SessionID'],bodyParams:[]},
                'RegisterRemoveUserFromGateway':{type:'registration',headerParams:['SessionID'],bodyParams:['gatewayJID']},
                //exception
                'AsyncExceptionsDequeue':{type:'exception',headerParams:['SessionID'],bodyParams:[]}
            }


