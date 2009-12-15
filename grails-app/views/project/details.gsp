<html>
  <head>
    <title>Project Details</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <div id="yui-main">
      <div class="yui-b">
        <div class="yui-g">
          <!-- YOUR DATA GOES HERE -->
          <div class="title">
            <h1>
              <span>Project Details</span>
            </h1>
            <div class="right_link">
              <a href="#" class="link">
                <span>Apply to this Project</span>
              </a>
            </div>
          </div>
          <div id="block">
            <div class="rounded_container_top">
              <h3>${project.title}</h3>
            </div>
            <div class="rounded_container_middle">
              <p>${project.description}</p>
              <g:form action="apply" id="${project.id}">
                <dl>
                  <dt>Snippet</dt>
                  <dd><g:textArea name="snippet"
                                  value="${application?.snippet}"/></dd>
                </dl>
                <br/>
                <g:submitButton name="apply" value="Apply"/>
              </g:form>
            </div>
            <div class="rounded_container_bottom"><!--bottom border--></div>
          </div>
        </div>
      </div>
    </div>
    <div class="yui-b">
      <!-- YOUR NAVIGATION GOES HERE -->
      <div id="sidebar">
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
    </div>
  </body>
</html>