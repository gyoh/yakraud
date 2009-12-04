<html>
  <head>
    <title>Search Results</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <h1>Search Results</h1>
    <p>Searched ${com.yakraud.Project.count()} records for items matching
    <em>${term}</em>. Found <strong>${projects.size()}</strong> hits.</p>
    <ul>
      <g:each var="project" in="${projects}">
        <li>${project.title}</li>
      </g:each>
    </ul>
  </body>
</html>
