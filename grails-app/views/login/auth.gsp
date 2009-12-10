<head>
  <meta name="layout" content="main" />
  <title>Login</title>
</head>
<body>
  <div id="login">
    <div id="lg_form_container" class="lg_outer">
      <div class="lg_container">
        <div class="lg_top"> </div>
        <div class="lg_content">
          <form name="login_form" method="post" id="login_form" action="${postUrl}">
            <label for="j_username">Username</label>
            <input type="text" value="" size="20" name="j_username" id="login" value="${request.remoteUser}" />
            <label for="j_password">Password</label>
            <input type="password" value="" size="20" name="j_password" id="password" />
            <div class="lg_button">
              <input type="submit" value="Log in" style="display: none;" name="commit" />
              <a title="Login" onclick="javascript:document.getElementById('login_form').submit();" href="#">Login</a>
            </div>
            <p class="secured">SECURED</p>
          </form>
          <p>
            <a href="/account/forgot_password">Forgot your password?</a><br/>
            <a href="/account/resend_activation">Resend activation email?</a>  
          </p>	
          <g:if test="${flash.message}">
            <div id="error_message">Login failed</div>
          </g:if>
        </div>
        <div class="lg_bottom"> </div>			
      </div>
    </div>
  </div>
<script type='text/javascript'>
<!--
(function(){
	document.forms['login_form'].elements['j_username'].focus();
})();
// -->
</script>
</body>
