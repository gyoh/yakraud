<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
  "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Yakraud &raquo; <g:layoutTitle /></title>
    <link rel="stylesheet" href="http://yui.yahooapis.com/2.7.0/build/reset-fonts-grids/reset-fonts-grids.css" type="text/css" />
    <link rel="stylesheet" href="http://yui.yahooapis.com/2.7.0/build/base/base-min.css" type="text/css" />
    <!--<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" type="text/css" />-->
    <link rel="stylesheet" href="${resource(dir:'css',file:'yuiapp.css')}" type="text/css" />
    <link id="theme" rel="stylesheet" href="${resource(dir:'css',file:'gray.css')}" type="text/css" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="yui" />
  <nav:resources override="true" />
</head>
<body class="yui-skin-sam rounded">
  <div id="doc4" class="yui-t6">
    <div id="hd" role="banner">
      <h1>Yakraud</h1>
      <div id="navigation">
        <nav:render group="primary" />
        <ul id="navigation_user">
          <li>
          <g:isLoggedIn>
            <g:link controller="profile" action="myProfile">My Profile</g:link>
          </g:isLoggedIn>
          <g:isNotLoggedIn>
            <g:link controller="register" action="index">Register</g:link>
          </g:isNotLoggedIn>
          </li>
          <li>
          <g:isLoggedIn>
            <g:link controller="logout" action="index">Sign out</g:link>
          </g:isLoggedIn>
          <g:isNotLoggedIn>
            <g:link controller="login" action="index">Sign in</g:link>
          </g:isNotLoggedIn>
          </li>
        </ul>
        <div class="clear"></div>
      </div>
    </div>
    <div id="bd" role="main">
      <g:layoutBody />
    </div>
    <div id="ft" role="contentinfo"><p>Copyright 2009- Agiligent LLC</p></div>
  </div>
</body>
</html>