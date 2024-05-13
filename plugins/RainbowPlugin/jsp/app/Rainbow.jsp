<%@page import="java.io.Console"%>
<%@page import="com.jalios.jcms.HttpUtil"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file="/front/app/doAppCommon.jspf"%>

<%@ page
	import="com.jalios.jcmsplugin.openrainbow.ui.openRainbowAppHandler"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>


<jsp:useBean id="loginHandler" scope="page"
	class="com.jalios.jcmsplugin.openrainbow.ui.openRainbowAppHandler">
	<jsp:setProperty name="loginHandler" property="request"
		value="<%= request %>" />
	<jsp:setProperty name="loginHandler" property="response"
		value="<%= response %>" />
	<jsp:setProperty name="loginHandler" property="*" />
</jsp:useBean>

<%

if (loginHandler.validate()) {
    return;
}


String token = loginHandler.getMemberToken();
// if we don't have the token yet we redirect the user to the rainbow authentification platform
if (token == null || token.equals("")) {
	
	//retrieve the RainbowAuthURI with the expected format
    String url = loginHandler.getRainbowAuthURI();
    
    String validUrl = HttpUtil.validateHttpUrl(url);

  // jcmsContext.sendRedirect(url);
  //redirection
    response.sendRedirect(url);

} else {
// in case we have the token then we display the rainbow interface
%>


<%
    // Display page content
    String appUrl = loginHandler.getAppUrl();

    jcmsContext.setPageTitle("Open Rainbow");
    jcmsContext.addCSSHeader("plugins/RainbowPlugin/css/Rainbow.css");
    jcmsContext.addJavaScript("plugins/RainbowPlugin/js/RainbowSDK.js");
%>

<head>
<link rel="stylesheet" href="../../css/openrainbow.css">
</head>

<!-- Include necessary external libraries -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/es5-shim/4.5.9/es5-shim.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/es6-promise/4.0.5/es6-promise.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<script
	src="//cdn.jsdelivr.net/momentjs/2.15.1/moment-with-locales.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.5/angular.min.js"></script>

<!-- Include the Rainbow Web SDK -->
<script src="../../rainbow-web-sdk/src/vendors-sdk.min.js"></script>

<!--  Include the openrainbowSDK.js as a module type -->
<script type="module" src="../../js/RainbowSDK.js"></script>

<div class="ajax-refresh-div" data-jalios-ajax-refresh-url=<%= appUrl %>>
	<jalios:app name="OpenRainbow">
		<div class="container">

			<!-- Sidebar -->
			<%@ include
				file='/plugins/RainbowPlugin/jsp/app/doRainbowSidebar.jspf'%>

			<div class="content-section">
				<!-- Search and Recent Conversations Section -->
				<%@ include
					file='/plugins/RainbowPlugin/jsp/app/doRainbowConversations.jspf'%>
				<!-- Main Section -->
				<%@ include file='/plugins/RainbowPlugin/jsp/app/doRainbowBody.jspf'%>

			</div>


			<%@ include file='/plugins/RainbowPlugin/jsp/app/Details.jspf'%>

		</div>
	</jalios:app>
</div>

<%
    }
%>
