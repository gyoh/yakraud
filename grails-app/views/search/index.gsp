<html>
  <head>
    <title>Search for Projects</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <div id="yui-main">
      <div class="yui-b">
        <div class="yui-g">
          <!-- YOUR DATA GOES HERE -->
          <g:if test="${searchResult?.results}">
            <g:render template="/suggestions" />
            <g:render template="/pagination" />
            <br/>
            <div class="db1">
              <g:each var="result" in="${searchResult.results}" status="hitNum">
                <div class="db1_title">
                  <h3>
                    <g:link controller="project"
                            action="show"
                            id="${result.id}">
                      ${result.title}
                    </g:link>
                  </h3>
                </div>
                <div class="db1_content">
                  <div class="db1_container">
                    <div class="db3">
                      <div class="bd3_top">
                        <div class="bd3_top_content">&nbsp;</div>
                      </div>
                      <div class="db3_content">
                        ${searchResult.highlights[hitNum]}
                        <p>
                        <g:link controller="project" action="details"
                                id="${result.id}">
                          Apply to this project
                        </g:link>&nbsp;
                        <g:link controller="solution" action="submit" id="${result.id}">
                          Submit solution
                        </g:link>
                        </p>
                      </div>
                      <div class="bd3_bot">
                        <div class="bd3_bot_content">&nbsp;</div>
                      </div>
                    </div>
                    <div class="db3">
                      <div class="bd3_top">
                        <div class="bd3_top_content">&nbsp;</div>
                      </div>
                      <div class="db3_content">
                        Owner:
                        <g:link controller="user" action="show"
                                id="${result.owner.id}">
                          ${result.owner.userRealName}
                        </g:link>
                      </div>
                      <div class="bd3_bot">
                        <div class="bd3_bot_content">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                </div>
              </g:each>
            </div>
            <g:render template="/pagination" />
          </g:if>
        </div>
      </div>
    </div>
    <div id="sidebar" class="yui-b">
      <!-- YOUR NAVIGATION GOES HERE -->
      <h1>SearchBox</h1>
      <g:form>
        <p>
        <g:textField class="text" name="q" value="${params.q}"/>
        </p>
        <p>
        <g:submitButton name="search" value="Search"/>
        </p>
      </g:form>
      <div class="sidebar_bottom"><!--sidebar_bottom--></div>
    </div>
  </body>
</html>
