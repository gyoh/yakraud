<html>
  <head>
    <title>Enter Payment Details</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <div class="content">
      <div class="db1">
        <div class="db1_title">
          <h3>Enter Payment Details</h3>
        </div>
        <div class="db1_content">
          <div class="db1_container">
            <p>Fill in the payment details below and hit next.</p>
            <br/>
            <g:hasErrors bean="${payment}">
              <div class="errors">
                <g:renderErrors bean="${payment}"/>
              </div>
            </g:hasErrors>
            <g:form action="post">
              <dl>
                <dt>Credit card number</dt>
                <dd><g:textField name="cardNumber"
                                 value="${payment?.cardNumber}"/></dd>
                <dt>Name</dt>
                <dd><g:textField name="name"
                                 value="${payment?.name}"/></dd>
                <dt>Expiry (mm/yy)</dt>
                <dd><g:textField name="expiry"
                                 value="${payment?.expiry}"/></dd>
              </dl>
              <br/>
              <g:submitButton name="previous" value="Previous"/>
              <g:submitButton name="next" value="Next"/>
            </g:form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
