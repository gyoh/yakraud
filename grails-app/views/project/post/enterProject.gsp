<html>
  <head>
    <title>Enter Project Details</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <div class="content">
      <div class="db1">
        <div class="db1_title">
          <h3>Enter Project Details</h3>
        </div>
        <div class="db1_content">
          <div class="db1_container">
            <p>Fill in the project details below and hit next.</p>
            <br/>
            <g:hasErrors bean="${projectDetails}">
              <div class="errors">
                <g:renderErrors bean="${projectDetails}"/>
              </div>
            </g:hasErrors>
            <g:form action="post">
              <dl>
                <dt>Title</dt>
                <dd><g:textField name="title"
                                 value="${projectDetails?.title}"/></dd>
                <dt>Description</dt>
                <dd><g:textArea name="description"
                                value="${projectDetails?.description}"/></dd>
                <dt>Reward</dt>
                <dd><g:textField name="reward"
                                 value="${projectDetails?.reward}"/></dd>
                <dt>Deadline</dt>
                <dd><g:datePicker id="deadline" name="deadline"
                                  value="${projectDetails?.deadline}"/></dd>
              </dl>
              <br/>
              <g:submitButton name="previous" value="Back"/>
              <g:submitButton name="next" value="Continue"/>
            </g:form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
