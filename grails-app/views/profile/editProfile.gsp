<html>
  <head>
    <title>Profile</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div class="content">
      <div class="db1">
        <div class="db1_title">
          <h3>Edit Profile</h3>
        </div>
        <div class="db1_content">
          <div class="db1_container">
            <g:hasErrors>
              <div class="errors">
                <g:renderErrors bean="${user}" as="list" />
              </div>
            </g:hasErrors>
            <g:if test="${flash.message}">
              <div class="flash">
                ${flash.message}
              </div>
            </g:if>
            <g:uploadForm action="saveProfile">
              <dl>
                <dt>Photo</dt>
                <dd><input type="file" name="photo" /></dd>
                <dt>Bio</dt>
                <dd><g:textArea name="bio" value="${user?.profile?.bio}" /></dd>
                <dt>Homepage</dt>
                <dd><g:textField name="homepage" value="${user?.profile?.homepage}" /></dd>
                <dt>Country</dt>
                <dd><g:countrySelect name="country"
                                     noSelection="['':'Choose your country...']" /></dd>
                <dt>Timezone</dt>
                <dd><g:timeZoneSelect name="timezone"
                                      noSelection="['':'Choose your timezone...']" /></dd>
              </dl>
              <g:submitButton name="save" value="Save" />
            </g:uploadForm>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
