<html>
  <head>
    <title>My Projects for ${user.username}</title>
    <meta name="layout" content="main" />
    <gui:resources components="tabView, dataTable, richEditor" mode="minimal" />
  </head>
  <body>
    <div id="yui-main">
      <div class="yui-b">
        <div class="yui-g">
          <gui:tabView>
            <gui:tab label="My Projects" active="true">
              <gui:dataTable
                id="myProjects"
                draggableColumns="true"
                columnDefs="[
                [key:'id', sortable:true, resizeable: true, label:'ID'],
                [key:'title', sortable:true, resizeable: true, label:'Title'],
                [key:'reward', type:'currency', sortable:true, resizeable: true, label: 'Reward'],
                [key:'deadline', type:'date', sortable:true, resizeable: true, label: 'Deadline'],
                ]"
                controller="project" action="listOwned"
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
                controller="project" action="listApplied"
                rowClickNavigation="true"
                />
            </gui:tab>
            <gui:tab label="Messages">
              <h2>Inside Tab 3</h2>
            </gui:tab>
          </gui:tabView>
        </div>
      </div>
    </div>
    <!--
    <p>
      <g:if test="${flash.message}">
        <div class="flash">
          ${flash.message}
        </div>
      </g:if>
      <g:formRemote name="addProject"
                    url="[controller: 'project', action: 'addProjectAjax']"
                    update="myProjects">
        <dl>
          <dt>Title</dt>
          <dd><g:textField name="title" /></dd>
          <dt>Description</dt>
          <dd><g:textArea name="description" /></dd>
          <dt>Reward</dt>
          <dd><g:textField name="reward" /></dd>
          <dt>Deadline</dt>
          <dd><g:textField id="deadline" name="deadline" /></dd>
          <input type="submit" value="Add" />
        </dl>
      </g:formRemote>
    </p>
    -->
  </body>
</html>
