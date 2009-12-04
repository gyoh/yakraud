<html>
  <head>
    <title>Upload photo</title>
    <meta name="layout" content="main" />
  </head>
  <body>
    <h1>Upload photo</h1>
    <g:uploadForm action="upload">
      Username:
      <g:select name="username" from="${userList}"
                optionKey="username" optionValue="username" />
      <p />
      Photo: <input name="photo" type="file" />
      <g:submitButton name="upload" value="Upload" />
    </g:uploadForm>
  </body>
</html>
