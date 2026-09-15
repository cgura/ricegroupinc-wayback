window.onload = (function () {

	// Purpose:	When browser window resizes, resize child iframes containing the class "jsResizable"
	// Author:	Alan Gardner
	// Date:	June 24, 2015
	window.onresize = resizeiFrame;

	function resizeiFrame() {
		// get all iframes on the page
		var iFrameList = document.getElementsByTagName('iframe');
		if (iFrameList.length > 0) {
			var iframeArray = Array.prototype.slice.call(iFrameList);
			iframeArray.forEach(function (iFrameList) {
				// Check to see if they have the 'jsResizable' class
				var iframeHasClass = (' ' + iFrameList.className + ' ').indexOf('jsResizable') > -1;
				if (iframeHasClass) {
					var iFrameElementId = iFrameList.getAttribute('id');
					try {
						// try to call resizeMe() if function exists on the page
						resizeMe(iFrameElementId);
					}
					catch (e) {
						// fail gracefully.
						console.log('do nothing');
					}
				}
			});
		}
	}

})();