<html>
  <head>
    <title>Profile</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <h1>Profile</h1>
    <div class="profilePic">
      <g:if test="${user.profile.photo}">
        <img src="<g:createLink controller='image'
             action='render' id='${user.username}' />" />
      </g:if>
      <p>Profile for <strong>${user.userRealName}</strong></p>
      <p>Bio: ${user.profile.bio}</p>
    </div>
  </body>
</html>
