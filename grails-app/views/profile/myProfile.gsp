<html>
  <head>
    <title>Term of Use</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <div class="content">
      <div class="db1">
        <div class="db1_title">
          <h3>My Profile</h3>
        </div>
        <div class="db1_content">
          <div class="db1_container">
            <g:if test="${user.profile?.photo}">
              <div class="db1" style="float:left; margin-right:25px;">
                <div class="db1_title">
                  <h3>Photo</h3>
                </div>
                <div class="db1_content">
                  <div class="db1_container">
                    <div class="db3" style="margin:10px;" >
                      <div class="bd3_top"><div class="bd3_top_content">&nbsp;</div></div>
                      <div class="db3_content">
                        <img src="<g:createLink controller='image'
                             action='render' id='${user.username}' />"
                             alt="${user.username}'s photo"/>
                      </div>
                      <div class="bd3_bot"><div class="bd3_bot_content">&nbsp;</div></div>
                    </div>

                  </div>
                </div>
              </div>
            </g:if>
            <p>Bio: ${user.profile?.bio}</p>
            <p>Homepage: ${user.profile?.homepage}</p>
            <p>Timezone: ${user.profile?.timezone}</p>
            <p>Country: ${user.profile?.country}</p>
            <br/>
            <g:link action="editProfile">Edit</g:link>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>