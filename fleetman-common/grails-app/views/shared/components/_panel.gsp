<div class="portlet portlet-default">
	<div class="portlet-heading">
		<div class="portlet-title">
			<h4>
				${data.title}
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
			<g:if test="${data.upperActionsTemplate }">
				<g:render template="${data.upperActionsTemplate}" plugin="${data.upperActionsTemplatePlugin}"></g:render>
			</g:if>
			
			<g:emptyRow />
			<!-- ENTER FORM-->
			<%--			<g:render template="${data.formTemplate}" plugin="${data.formTemplatePlugin}" model="[modelInstance: data.modelInstance]"></g:render>--%>
			<g:if test="${(data.instance != null) && (data.formTemplate!=null)}">
				<g:myRenderTemplate formTemplate="${data.formTemplate}"
					formTemplatePlugin="${data.formTemplatePlugin}"
					modelInstance="${data.instance}" />
			</g:if>
			<g:else>
     					ERROR modelInstance null!
			</g:else>
			<g:emptyRow />
			
			<g:if test="data.bottomActionsTemplate">
				<g:render template="${data.bottomActionsTemplate}" plugin="${data.bottomActionsTemplatePlugin}"></g:render>
			</g:if>
		</div>
	</div>
</div>