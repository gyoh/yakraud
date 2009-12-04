<html>
    <head>
        <title>Project Details</title>
	<meta name="layout" content="main" />
    <g:render template="/jquery" />
    <g:javascript>
      $(function() {
		$("#source").accordion();
      });
    </g:javascript>
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
								<h3>Award</h3>
                                  ${project.reward}
						</div>
					</div>
					<div class="bd2_bot">
						<div class="bd2_bot_content">&nbsp;</div>
					</div>
				</div>
				<!-- design box 2 end -->
				<div class="db3" style="" >
					<div class="bd3_top">
						<div class="bd3_top_content">&nbsp;</div>
					</div>
					<div class="db3_content">
						<h3>Dates</h3>
                          Starts: ${project.dateCreated}<br />
                          Ends: ${project.deadline}
					</div>
					<div class="bd3_bot">
						<div class="bd3_bot_content">&nbsp;</div>
					</div>
				</div>
				<div class="db4" style="" >
					<div class="bd4_top">
						<div class="bd4_top_content">&nbsp;</div>
					</div>
					<div class="db4_content">
						<h3>Materials</h3>
                          ${project.file}
					</div>
					<div class="bd4_bot">
						<div class="bd4_bot_content">&nbsp;</div>
					</div>
				</div>
		</div>
		<!-- left column start-->
		<div class="left_col">
			<div class="db1">
				<div class="db1_title">
					<h3>${project.title}</h3>
				</div>
				<div class="db1_content">
					<div class="db1_container">
                      <p>
                        ${project.description}
                      </p>
                      <br/>
                      <!--
                      <div id="source">
                        <a href="#">First header</a>
                        <div>First content</div>
                        <a href="#">Second header</a>
                        <div>Second content</div>
                      </div>
                      -->
                      <div class="db1" style="width:370px; float:left; margin-right:25px;">
						<div class="db1_title">
							<h3>Source snippet</h3>
						</div>
						<div class="db1_content">
                          <div class="db1_container">
                            <p>
                              ${project.content}
                            </p>
                            <h4>Apply</h4>
                            <g:form action="apply" id="${project.id}">
                            <dl>
                              <dt>Snippet</dt>
                              <dd><g:textArea name="snippet"
                                value="${application?.snippet}"/></dd>
                            </dl>
                            <br/>
                            <g:submitButton name="apply" value="Apply"/>
                            </g:form>
                          </div>
						</div>
                      </div>
                    </div>
                </div>
			</div>
		</div>
    </body>
</html>