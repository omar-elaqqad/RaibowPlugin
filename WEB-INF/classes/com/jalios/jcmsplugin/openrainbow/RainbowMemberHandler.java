package com.jalios.jcmsplugin.openrainbow;

import com.jalios.jcms.BasicDataController;
import com.jalios.jcms.Member;

public class RainbowMemberHandler extends BasicDataController{

	private final static String TOKENPROPERTYNAME = "extra.Member.jcmsplugin.rainbow.tokenRainbow";



	public RainbowMemberHandler() {
		//empty
	}

    // Method to get Token for a member
    public static String getToken(Member member) {
        return member.getExtraData(TOKENPROPERTYNAME);
    }

    // Method to set Token for a member
    public static void setToken(Member member, String token) {
        member.setExtraData(TOKENPROPERTYNAME, token);
    }

    // Method to remove Token for a member
    public static void removeToken(Member member) {
        member.removeExtraData(TOKENPROPERTYNAME);
    }

}
