<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
  "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Yakraud &raquo; <g:layoutTitle /></title>
    <link rel="stylesheet" href="http://yui.yahooapis.com/2.7.0/build/reset-fonts-grids/reset-fonts-grids.css" type="text/css">
    <link rel="stylesheet" href="http://yui.yahooapis.com/2.7.0/build/base/base-min.css" type="text/css">
    <!--<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />-->
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="yui" />
  <nav:resources />
</head>
<body class="yui-skin-sam">
  <div id="doc4" class="yui-t5">
    <div id="hd" role="banner">
      <h1>Yakraud</h1>
      <div id="top_menu">
        <div id="topmenu_container">
          <ul>
            <li>
            <g:isLoggedIn>
              <g:link controller="profile" action="myProfile">My Profile</g:link>
            </g:isLoggedIn>
            <g:isNotLoggedIn>
              <g:link controller="register" action="index">Register</g:link>
            </g:isNotLoggedIn>
            </li>
            <li>|</li>
            <li>
            <g:isLoggedIn>
              <g:link controller="logout" action="index">Sign out</g:link>
            </g:isLoggedIn>
            <g:isNotLoggedIn>
              <g:link controller="login" action="index">Sign in</g:link>
            </g:isNotLoggedIn>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div id="bd" role="main">
      <nav:render group="tabs" />
      <div id="yui-main">
        <div class="yui-b">
          <div class="yui-g">
            <!-- YOUR DATA GOES HERE -->
            <g:layoutBody />
          </div>
        </div>
      </div>
      <div class="yui-b">
        <!-- YOUR NAVIGATION GOES HERE -->
      </div>
    </div>
    <div id="ft" role="contentinfo"><p>Copyright 2009- Agiligent LLC</p></div>
  </div>
</body>
</html>