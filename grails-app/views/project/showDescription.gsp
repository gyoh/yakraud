<div class="description">
  ${project.description}
</div>
<div class="details_button">
  <a id="detailslink" href="<g:createLink action='details' id='${project.id}' />">Show Details</a>
  <g:javascript>
    new YAHOO.widget.Button("detailslink");
  </g:javascript>
</div>
