<h1>SearchBox</h1>
<g:form action="search">
  <p>
    <g:textField class="text" name="q" value="${params.q}"/>
  </p>
  <p>
    <g:submitButton name="search" value="Search"/>
  </p>
</g:form>