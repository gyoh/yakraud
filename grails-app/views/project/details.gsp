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
              <a id="postlink" href="${createLink(action:'post')}">Post a Project</a>
              <g:javascript>
                new YAHOO.widget.Button("postlink");
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
            <gui:tab label="Apply to this Project">
              <g:form action="apply" id="${project.id}">
                <p>
                  <label for="snippet">Snippet</label>
                  <g:textArea id="snippet" class="text" cols="40" rows="4" name="snippet" value="${application?.snippet}"/>
                  <span class="info">Lots of text can go in here</span>
                </p>
                <g:submitButton id="applybutton" name="apply" value="Apply" />
                <g:javascript>
                  new YAHOO.widget.Button("applybutton");
                </g:javascript>
              </g:form>
            </gui:tab>
          </gui:tabView>
        </div>
      </div>
    </div>
    <div class="yui-b sidebar">
      <!-- YOUR NAVIGATION GOES HERE -->
      <h1>Award</h1>
      <ul class="sidebar_links">
        <li>${project.reward}</li>
      </ul>
      <h1>Dates</h1>
      <ul class="sidebar_links">
        <li>Starts: ${project.dateCreated}</li>
        <li>Ends: ${project.deadline}</li>
      </ul>
      <h1>Materials</h1>
      <ul class="sidebar_links">
        <li>${project.file}</li>
      </ul>
      <div class="sidebar_bottom"><!--sidebar_bottom--></div>
    </div>
  </body>
</html>