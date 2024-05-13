<%@page import="java.io.Console"%>
<%@page import="com.jalios.jcms.HttpUtil"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file="/front/app/doAppCommon.jspf"%>

<%@ page import="com.jalios.jcmsplugin.openrainbow.ui.openRainbowAppHandler" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<jsp:useBean id="loginHandler" scope="page" class="com.jalios.jcmsplugin.openrainbow.ui.openRainbowAppHandler">
  <jsp:setProperty name="loginHandler" property="request" value="<%= request %>" />
  <jsp:setProperty name="loginHandler" property="response" value="<%= response %>" />
  <jsp:setProperty name="loginHandler" property="*" />
</jsp:useBean>

<head>
    <link rel="stylesheet" href="../../css/load.css">
</head>

<script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>

<%

jcmsContext.addJavaScript("plugins/RainbowPlugin/js/fetchToken.js");

String redirectedFromRainbowUrl=loginHandler.getRedirectedFromRainbowUrl();

%>

<div class="ajax-refresh-div" data-jalios-ajax-refresh-url=<%= redirectedFromRainbowUrl %>

<div class="rainbow-loading-container">

  <div class="background-image-container">
    <img src="../../images/rainbowBackground_1.jpg" alt="Loading background image">
  </div>

  <div class="progress-bar-container">
    <div class="progress-bar" style="width: 0%;"></div>
  </div>
  
<div class="logo-container">
    <img class="rainbow-logo" src="../../images/OpenRainbowLogo-nb.png" alt="Rainbow logo">
</div>
</div>

  <img class="alcatel-logo" src="../../images/AlcatelLogo.png" alt="Alcatel logo">


</div>
