<html>
  <head>
    <title>Project Details</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div id="yui-main">
      <div class="yui-b">
        <div class="yui-g main">
          <!-- YOUR DATA GOES HERE -->
          <div class="title">
            <h1>
              <span>Project Details</span>
            </h1>
            <div class="right_link">
              <span class="yui-button yui-link-button">
                <span class="first-child">
                  <g:link controller="project" action="post">Post a Project</g:link>
                </span>
              </span>
            </div>
          </div>
          <div class="block">
            <div class="rounded_container_top">
              <h3>${project.title}</h3>
            </div>
            <div class="rounded_container_middle">
              <p>${project.description}</p>
              <g:form action="apply" id="${project.id}">
                <p>
                  <label for="snippet">Snippet</label>
                  <g:textArea id="snippet" class="text" cols="40" rows="4" name="snippet" value="${application?.snippet}"/>
                  <span class="info">Lots of text can go in here</span>
                </p>
                <g:submitButton name="apply" value="Apply"/>
              </g:form>
            </div>
            <div class="rounded_container_bottom"><!--bottom border--></div>
          </div>
        </div>
      </div>
    </div>
    <div class="yui-b sidebar">
      <!-- YOUR NAVIGATION GOES HERE -->
      <h1>Award</h1>
      <ul class="sidebar_links">
        <li>${project.reward}</li>
      </ul>
      <h1>Dates</h1>
      <ul class="sidebar_links">
        <li>Starts: ${project.dateCreated}</li>
        <li>Ends: ${project.deadline}</li>
      </ul>
      <h1>Materials</h1>
      <ul class="sidebar_links">
        <li>${project.file}</li>
      </ul>
      <div class="sidebar_bottom"><!--sidebar_bottom--></div>
    </div>
  </body>
</html>