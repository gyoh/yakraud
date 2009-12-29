<p>
  <g:if test="${searchResult?.suggestedQuery}">
    <%@ page import="org.codehaus.groovy.grails.plugins.searchable.util.StringQueryUtils" %>
    <p>Did you mean</p>
    <g:link action="search" params="[q: searchResult.suggestedQuery]">
      ${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggetedQuery)}
    </g:link>?
  </g:if>
</p>