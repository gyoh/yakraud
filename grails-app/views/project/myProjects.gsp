<html>
  <head>
    <title>My Projects for ${user.username}</title>
    <meta name="layout" content="main" />
    <gui:resources components="tabView, dataTable, richEditor" mode="minimal" />
  </head>
  <body>
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

    <gui:tabView>
      <gui:tab label="My Projects" active="true">
        <gui:dataTable
          id="myProjects"
          draggableColumns="true"
          columnDefs="[
            [key:'id', sortable:true, resizeable: true, label:'ID'],
            [key:'title', sortable:true, resizeable: true, label:'Title'],
            [key:'description', sortable:true, resizeable: true, label:'Description'],
            [key:'reward', type:'currency', sortable:true, resizeable: true, label: 'Reward'],
            [key:'deadline', type:'date', sortable:true, resizeable: true, label: 'Dealine'],
          ]"
          controller="project" action="listAjax"
          rowClickNavigation="true"
        />
      </gui:tab>
      <gui:tab label="Applied Projects">
          <h2>Inside Tab 2</h2>
          <gui:richEditor id='editor' value="You can use gui components within tabs, too!"/>
      </gui:tab>
      <gui:tab label="Messages">
          <h2>Inside Tab 3</h2>
      </gui:tab>
    </gui:tabView>
  </body>
</html>
