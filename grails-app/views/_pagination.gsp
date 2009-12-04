<p>
  Displaying hits
  <b>${searchResult.offset + 1} - ${searchResult.offset + searchResult.max}</b> of
  <b>${searchResult.total}</b>:

<g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}"/>
<g:if test="${totalPages == 1}">
  <span class="currentStep">1</span>
</g:if>
<g:else>
  <g:paginate action="search"
              params="[q: params.q]"
              total="${searchResult.total}"
              prev="&lt; previous"
              next="next &gt;"/>
</g:else>
</p>
