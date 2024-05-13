<%@page import="com.jalios.jcms.HttpUtil"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page
	import="com.jalios.jcmsplugin.openrainbow.ui.openRainbowAppHandler"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>

<%

%><jsp:useBean id="loginHandler" scope="page"
	class="com.jalios.jcmsplugin.openrainbow.ui.openRainbowAppHandler">
	<%

	%><jsp:setProperty name="loginHandler" property="request"
		value="<%=request%>" />
	<%

	%><jsp:setProperty name="loginHandler" property="response"
		value="<%=response%>" />
	<%

	%><jsp:setProperty name="loginHandler" property="*" />
	<%

	%>
</jsp:useBean>

<%
if (loginHandler.validate()) {
	return;
}

//Verify if its an AJAX request
if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {


    if ("GET".equalsIgnoreCase(request.getMethod())) {
        // Handle GET request for AJAX
        String token = loginHandler.getMemberToken();
        String appID = loginHandler.getApplicationID();
        String appSecretID = loginHandler.getApplicationSecretID();

        //put the data in json format
        String jsonData = "{" + "\"token\": \"" + token + "\"," + "\"appID\": \"" + appID + "\"," + "\"appSecretID\": \"" + appSecretID + "\"" + "}";
        response.setContentType("application/json");
        
        // sent the data in the response
        out.print(jsonData);
        out.flush();
        
    } else if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Handle a POST request within for AJAX to save the token

        String token = request.getParameter("access_token");

        //save the token
        loginHandler.setMemberToken(token);
        
        response.setContentType("text/plain"); //content type to plain text

        try (PrintWriter ouut = response.getWriter()) {
        	//send a succes message in response
            ouut.print("Success");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    } else {
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
    }
} else {
	
	//if its not an AJAX request display a message 
	response.setContentType("text/plain");
    
    try (PrintWriter ouut = response.getWriter()) {
        ouut.print("Direct access is not supported.");
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
}
%>
