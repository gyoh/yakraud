<html>
  <head>
    <title>Project Details</title>
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
              <span>Project Details</span>
            </h1>
            <div class="right_link">
              <a id="listlink" href="${createLink(action:'listProjects')}">Back to My Projects</a>
              <a id="editlink" href="<g:createLink action='editProject' id='${params.id}' />">Edit Project</a>
              <g:javascript>
                new YAHOO.widget.Button("listlink");
                new YAHOO.widget.Button("editlink");
              </g:javascript>
            </div>
          </div>
          <gui:tabView>
            <gui:tab label="Details" active="true">
              <h2>${project.title}</h2>
              <p>${project.description}</p>
              <h3>Reward</h3>
              <p>${project.reward}</p>
              <h3>Dates</h3>
              <ul class="sidebar_links">
                <li>Starts: ${project.dateCreated}</li>
                <li>Ends: ${project.deadline}</li>
              </ul>
              <h3>Materials</h3>
              <ul class="sidebar_links">
                <li>${project.file}</li>
              </ul>
            </gui:tab>
            <gui:tab label="Applicants">
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
            <gui:tab label="Solutions">
              <h2>Solutions</h2>
            </gui:tab>
            <gui:tab label="Messages">
              <h2>Messages</h2>
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