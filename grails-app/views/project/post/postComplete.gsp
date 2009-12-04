<html>
  <head>
    <title>Confirm Project Submission</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <div class="content">
      <div class="db1">
        <div class="db1_title">
          <h3>Confirm Posting Project</h3>
        </div>
        <div class="db1_content">
          <div class="db1_container">
            <p>Title: ${projectDetails.title}</p>
            <p>Description: ${projectDetails.description}</p>
            <p>Reward: ${projectDetails.reward}</p>
            <p>Deadline: ${projectDetails.deadline}</p>
            <p>Credit Card Number: ${payment.cardNumber}</p>
            <p>Name: ${payment.name}</p>
            <p>Expiry: ${payment.expiry}</p>
            <br/>
            <g:form action="post">
              <g:submitButton name="cancel" value="Cancel"/>
              <g:submitButton name="confirm" value="Confirm"/>
            </g:form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
