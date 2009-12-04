<html>
  <head>
    <title>Enter Solution Details</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <div class="content">
      <div class="db1">
        <div class="db1_title">
          <h3>Enter Solution Details</h3>
        </div>
        <div class="db1_content">
          <div class="db1_container">
            <p>Fill in the solution for project ${project.title} below and hit next.</p>
            <br/>
            <g:hasErrors bean="${solutionDetails}">
              <div class="errors">
                <g:renderErrors bean="${solutionDetails}"/>
              </div>
            </g:hasErrors>
            <g:form action="submit">
              <dl>
                <dt>Title</dt>
                <dd><g:textField name="title"
                                 value="${solutionDetails?.title}"/></dd>
                <dt>Content</dt>
                <dd><g:textArea name="content"
                                value="${solutionDetails?.content}"/></dd>
              </dl>
              <br/>
              <g:submitButton name="submit" value="Submit"/>
              <g:submitButton name="cancel" value="Cancel"/>
            </g:form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
