<div class="portlet portlet-default">
	<div class="portlet-heading">
		<div class="portlet-title">
			<h4>
				${title}
			</h4>
		</div>
		<div class="portlet-widgets">
			<a data-toggle="collapse" data-parent="#accordion"
				href="#formControls"><i class="fa fa-chevron-down"></i></a>
		</div>
		<div class="clearfix"></div>
	</div>
	<div id="formControls" class="panel-collapse collapse in">
		<div class="portlet-body">
		<g:if test="${actionsTemplate }">
				<g:render template="${actionsTemplate}" plugin="${actionsTemplatePlugin}"></g:render>
			</g:if>
			
			<g:emptyRow />