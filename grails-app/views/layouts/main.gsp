<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Yakraud &raquo; <g:layoutTitle /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <g:layoutHead />
  </head>
  <body>
    <div id="spinner" class="spinner" style="display:none;">
      <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
    </div>
    <div id="container">
      <!-- header block START -->
      <div id="header" role="banner">
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
        <div id="logo"><span>logo text hidden</span></div>
        <div id="primary_menu">
          <div id="pm_main">
            <ul>
              <li class="active"><a href="/yakraud/"><b>Home</b></a></li>
              <li><a href="/yakraud/project/myProjects/"><b>My Projects</b></a></li>
              <li><a href="/yakraud/project/search/"><b>Search Projects</b></a></li>
              <li><a href="#"><b>FAQ</b></a></li>
              <li><a href="#"><b>Articles</b></a></li>
            </ul>
          </div>

          <div id="pm_sub">
            <ul>
              <li><g:link controller="project" action="post">Post a project</g:link></li>
            </ul>
          </div>


        </div>
      </div>
      <!-- header block End -->
      <!-- content block START -->
      <div id="content" role="main">
        <g:layoutBody />
      </div>
      <!-- content block End -->
      <!-- footer block START -->
      <div id="footer" role="contentinfo">
        <div id="copyright"> Copyright 2009 Agiligent LLC </div>
        <div id="designby">Design by <a href="http://www.flashdaweb.com/">Flashdaweb</a></div>
        <div id="bottom_menu"> </div>
      </div>
      <!-- footer block End -->
    </div>
  </body>
</html>