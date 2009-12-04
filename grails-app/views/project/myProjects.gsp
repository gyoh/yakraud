<html>
  <head>
    <title>My Projects for ${user.username}</title>
    <meta name="layout" content="main" />
    <g:render template="/jquery" />
    <g:javascript>
      $(function() {
		$("#tabs").tabs();
      });

      $(function() {
        $('#deadline').datepicker();
      });

      $(function() {
        oTable = $('#dataTable').dataTable({
          "bJQueryUI": true,
          "sPaginationType": "full_numbers",
          "bProcessing": true,
          "bServerSide": true,
          "sAjaxSource": "/yakraud/project/listAjax",
          "fnInitComplete": function () {
            $(oTable.fnGetNodes()).click(function () {
              alert();
            });
          }
        });
      });
    </g:javascript>
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

    <div id="tabs">
      <ul>
        <li><a href="#tabs-1">My Projects</a></li>
        <li><a href="#tabs-2">Applied Projects</a></li>
        <li><a href="#tabs-3">Messages</a></li>
      </ul>
      <div id="tabs-1">
        <div id="demo">
          <table cellpadding="0" cellspacing="0" border="0" class="display" id="dataTable">
            <thead>
              <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Content</th>
                <th>Reward</th>
                <th>Deadline</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colspan="5" class="dataTables_empty">Loading data from server</td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Content</th>
                <th>Reward</th>
                <th>Deadline</th>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
      <div id="tabs-2">
        <p>Tab 2 content</p>
      </div>
      <div id="tabs-3">
        <div id="myProjects" class="myProjects">
          <g:each in="${user.ownedProjects}" var="project">
            <div class="project">
              <div class="projectTitle">${project.title}</div>
              <div class="projectDescrition">${project.description}</div>
              <div class="projectReward">${project.reward}</div>
              <div class="projectDeadline">${project.deadline}</div>
              <div class="projectSolution">
                <g:link controller="solution" action="submit" id="${project.id}">
                  Submit solution
                </g:link>
              </div>
            </div>
          </g:each>
        </div>
      </div>
    </div>
    </body>
</html>
