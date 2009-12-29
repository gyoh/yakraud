<html>
  <head>
    <title>Projects</title>
    <meta name="layout" content="main" />
    <gui:resources components="tabView, dataTable" mode="minimal" />
  </head>
  <body>
    <div id="yui-main">
      <div class="yui-b">
        <div class="yui-g main">
          <!-- YOUR DATA GOES HERE -->
          <div class="title">
            <h1>
              <span>Projects</span>
            </h1>
            <div class="right_link">
              <span class="yui-button yui-link-button">
                <span class="first-child">
                  <g:link controller="project" action="post">Post a Project</g:link>
                </span>
              </span>
            </div>
          </div>
          <gui:dataTable
            id="search"
            draggableColumns="true"
            columnDefs="[
            [key:'title', sortable:true, resizeable: true, label:'Title'],
            [key:'reward', formatter:'currency', sortable:true, resizeable: true, label: 'Reward'],
            [key:'deadline', formatter:'date', sortable:true, resizeable: true, label: 'Deadline'],
            ]"
            controller="project" action="searchAjax"
            sortedBy="deadline"
            params="${params}"
            rowExpansion="true"
            />
        </div>
      </div>
    </div>
    <div class="yui-b sidebar">
      <!-- YOUR NAVIGATION GOES HERE -->
      <g:render template="/project/sidebar" />
      <div class="sidebar_bottom"><!--sidebar_bottom--></div>
    </div>
  </body>
</html>
