<html>
  <head>
    <title>Confirm Posting Solution</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <div class="content">
      <div class="db1">
        <div class="db1_title">
          <h3>Confirm Posting Solution</h3>
        </div>
        <div class="db1_content">
          <div class="db1_container">
            <p>Title: ${solutionDetails.title}</p>
            <p>Content: ${solutionDetails.content}</p>
            <br/>
            <g:form action="submit">
              <g:submitButton name="confirm" value="Confirm"/>
              <g:submitButton name="cancel" value="Cancel"/>
            </g:form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
