<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
  "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Yakraud &raquo; <g:layoutTitle /></title>
    <link rel="stylesheet" href="http://yui.yahooapis.com/2.8.0r4/build/reset-fonts-grids/reset-fonts-grids.css" type="text/css" />
    <link rel="stylesheet" href="http://yui.yahooapis.com/2.8.0r4/build/base/base-min.css" type="text/css" />
    <link rel="stylesheet" href="http://yui.yahooapis.com/2.8.0r4/build/button/assets/skins/sam/button.css" type="text/css" />
    <!--<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" type="text/css" />-->
    <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" type="text/css" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="yui" />
  <script type="text/javascript" src="http://yui.yahooapis.com/2.8.0r4/build/button/button-min.js"></script>
  <nav:resources override="true" />
</head>
<body class="yui-skin-sam">
  <div id="doc4" class="yui-t5">
    <div id="hd" role="banner">
      <div class="logo">
        <h1 class="logo_inside">
          <a title="Yakraud" href="/yakraud/">
            <!--<img border="none" src="/yakraud/images/yakraud_logo.png" alt="Yakraud"/>-->
            Yakraud
          </a>
        </h1>
      </div>
      <div class="search">
        <g:form controller="search" action="index">
          <g:textField class="text" title="Search" name="q" value="${params.q}" />
          <!--<g:submitButton name="search" value="Search"/>-->
        </g:form>
      </div>
      <div class="navigation">
        <ul>
          <nav:eachItem group="main" var="nav">
            <li>
            <g:if test="${nav.active}">
              <a class="active" href="${nav.link}"><span>${nav.title}</span></a>
            </g:if>
            <g:else>
              <a href="${nav.link}"><span>${nav.title}</span></a>
            </g:else>
            </li>
          </nav:eachItem>
        </ul>
        <div>
          <span>
            <g:isLoggedIn>
              <g:link controller="profile" action="myProfile">
                <g:loggedInUserInfo field="userRealName" />
              </g:link>
            </g:isLoggedIn>
            <g:isNotLoggedIn>
              <g:link controller="register" action="index">Join now</g:link>
            </g:isNotLoggedIn>
          </span>
          <small>|</small>
          <g:isLoggedIn>
            <g:link controller="logout" action="index">Sign out</g:link>
          </g:isLoggedIn>
          <g:isNotLoggedIn>
            <g:link controller="login" action="index">Sign in</g:link>
          </g:isNotLoggedIn>
        </div>
      </div>
    </div>
    <div id="bd" role="main">
      <g:layoutBody />
    </div>
    <div id="ft" role="contentinfo"><p>Copyright 2009- Agiligent LLC</p></div>
  </div>
</body>
</html>