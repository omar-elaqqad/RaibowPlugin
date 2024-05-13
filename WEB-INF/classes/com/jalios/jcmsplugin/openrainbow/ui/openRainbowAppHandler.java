package com.jalios.jcmsplugin.openrainbow.ui;


import com.jalios.jcms.Member;
import com.jalios.jcms.handler.QueryHandler;
import com.jalios.jcmsplugin.openrainbow.RainbowMemberHandler;

public class openRainbowAppHandler extends QueryHandler {

	protected RainbowMemberHandler rmh = new RainbowMemberHandler();

	private Member mbr;

	private final static String APPIDPROPERTYNAME = "jcmsplugin.rainbowPlugin.APPLICATIONID";
	private final static String SECRETKEYPROPERTYNAME = "jcmsplugin.rainbowPlugin.APPLICATIONSECRET" ;
	private final static String RAINBOWHOST = "https://sandbox.openrainbow.com/api/rainbow/authentication/v1.0/oauth/authorize?";
	private final static String REDIRECTURLPROPERTYNAME = "jcmsplugin.rainbowPlugin.OAuthRedirect";


	public openRainbowAppHandler() {
		//mbr=loggedMember;
		mbr=channel.getCurrentLoggedMember();
	}

	public String getAppUrl() {
		return "plugins/RainbowPlugin/jsp/app/Rainbow.jsp";
	}
	
	public String getRedirectedFromRainbowUrl() {
		return "plugins/RainbowPlugin/jsp/app/doRainbowRedirect.jsp";
	}


	public String getRainbowAuthURI() {
	    // Retrieve login information
	    String appID = getApplicationID();
	    String oAuthRedirect = getApplicationRedirectUri();

		/*
		 * boolean isValidRedirect = HttpUtil.isValidHttpUrl(oAuthRedirect);
		 *
		 * if (isValidRedirect) { String rainbowAuthURI = RAINBOWHOST +
		 * "response_type=token" + "&client_id=" + appID+ "&redirect_uri=" +
		 * oAuthRedirect+ "&scope=all"; return rainbowAuthURI; } else { return ; }
		 */
	        String rainbowAuthURI =
	        		RAINBOWHOST +
	                "response_type=token" +
	                "&client_id=" + appID+
	                "&redirect_uri=" + oAuthRedirect+
	                "&scope=all";
	        return rainbowAuthURI;
	}

	public String getApplicationID() {

		return channel.getProperty(APPIDPROPERTYNAME);

	}

	public String getApplicationSecretID() {
		return channel.getProperty(SECRETKEYPROPERTYNAME);

	}

	public String getApplicationRedirectUri() {
		return channel.getProperty(REDIRECTURLPROPERTYNAME);

	}

	public String getMemberToken() {

		String token=null;

		if(isLogged) {
		    token = RainbowMemberHandler.getToken(mbr);

		}
		 return token;
	}
	

	public void setMemberToken(String token){
		RainbowMemberHandler.setToken(mbr, token);
	}
	
	public void removeMemberToken() {
		RainbowMemberHandler.removeToken(mbr);
	}

}
