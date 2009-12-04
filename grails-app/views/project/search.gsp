<html>
  <head>
    <title>Search for Projects</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
    <div class="right_col">
      <!-- design box 2 start -->
      <div class="db2" style="margin-top:0px" >
        <div class="bd2_top">
          <div class="bd2_top_content">&nbsp;</div>
        </div>
        <div class="db2_content">
          <div class="db2_content_container">
            <h3>SearchBox</h3>
            <g:form action="search">
              <g:textField name="q" value="${params.q}"/>
              <g:select name="max" from="${[5, 10, 50]}"
                        value="${params.max ?: 10}" /> hits
              <g:submitButton name="search" value="Search"/>
              <g:isLoggedIn>
                <p>
                Just my stuff:
                <g:checkBox name="justMine" value="${params.justMine}"/>
                </p>
              </g:isLoggedIn>
            </g:form>
          </div>
        </div>
        <div class="bd2_bot">
          <div class="bd2_bot_content">&nbsp;</div>
        </div>
      </div>
      <!-- design box 2 end -->
    </div>

    <!-- left column start-->
    <div class="left_col">
      <div class="db1">
        <div class="db1_title">
          <h3>Search for projects</h3>
        </div>
        <div class="db1_content">
          <div class="db1_container">
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
    </div>
  </body>
</html>
