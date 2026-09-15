var delimiter = "&";

function createCookie(clientID, AWSAccountID, FirstName, Email)
{	
	var value = "LastLogin=" + formatDate(new Date());
	value += delimiter + "XSContactID=" + clientID;
	value += delimiter + "AWSAccountID=" + AWSAccountID;
	value += delimiter + "FirstName=" + FirstName;
	value += delimiter + "Email=" + Email;
	value += delimiter + "AuthUntil=" + formatDate(moment().add('d', 14));
	
	$.cookie("XSitesContact", value, { expires: 365, path: "/" });
}

function getCookie()
{	
	$.cookie.raw = true;
	var XSitesContactCookie = readCookie("XSitesContact");

	if (XSitesContactCookie != undefined)
	{
		var values = XSitesContact.split(delimiter);
		var retObject = new Object();
		for (i=0; i < values.length; i++)
		{
			var value = values[i];
			retObject[value.split("=")[0]] = [value.split("=")[1]];
		}
		return retObject;
	}
	
	return;
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function deleteCookie()
{
	$.removeCookie('XSitesContact', { path: '/' });
}

function formatDate(date)
{
	dateToFormat = moment(date);
	return dateToFormat.format("MM/DD/YYYY h:m:ss A");
}