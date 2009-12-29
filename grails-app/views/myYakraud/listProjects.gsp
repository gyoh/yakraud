<html>
  <head>
    <title>My Projects for ${user.username}</title>
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
              <span>My Projects</span>
            </h1>
            <div class="right_link">
              <a id="postlink" href="${createLink(controller:'project',action:'post')}">Post a Project</a>
              <g:javascript>
                new YAHOO.widget.Button("postlink");
              </g:javascript>
            </div>
          </div>
          <gui:tabView>
            <gui:tab label="Owned Projects" active="true">
              <gui:dataTable
                id="ownedProjects"
                draggableColumns="true"
                columnDefs="[
                [key:'id', sortable:true, resizeable: true, label:'ID'],
                [key:'title', sortable:true, resizeable: true, label:'Title'],
                [key:'reward', type:'currency', sortable:true, resizeable: true, label: 'Reward'],
                [key:'deadline', type:'date', sortable:true, resizeable: true, label: 'Deadline'],
                ]"
                controller="myYakraud" action="listOwnedProjects"
                rowClickNavigation="true"
                />
            </gui:tab>
            <gui:tab label="Applied Projects">
              <gui:dataTable
                id="appliedProjects"
                draggableColumns="true"
                columnDefs="[
                [key:'id', sortable:true, resizeable: true, label:'ID'],
                [key:'title', sortable:true, resizeable: true, label:'Title'],
                [key:'reward', type:'currency', sortable:true, resizeable: true, label: 'Reward'],
                [key:'deadline', type:'date', sortable:true, resizeable: true, label: 'Deadline'],
                ]"
                controller="myYakraud" action="listAppliedProjects"
                rowClickNavigation="true"
                />
            </gui:tab>
            <gui:tab label="Watchlist">
              <h2>Inside Tab 3</h2>
            </gui:tab>
          </gui:tabView>
        </div>
      </div>
    </div>
    <div class="yui-b sidebar">
      <!-- YOUR NAVIGATION GOES HERE -->
      <g:render template="/myYakraud/sidebar" />
      <div class="sidebar_bottom"><!--sidebar_bottom--></div>
    </div>
  </body>
</html>
