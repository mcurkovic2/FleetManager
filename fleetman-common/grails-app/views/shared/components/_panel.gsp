<g:render template="/shared/components/panelHeader" model="[title:data.title, actionsTemplate: data.upperActionsTemplate, actionsTemplatePlugin:data.upperActionsTemplatePlugin]" />
	
			<g:if test="${(data.formTemplate!=null)}">
				<g:myRenderTemplate formTemplate="${data.formTemplate}"
					formTemplatePlugin="${data.formTemplatePlugin}"
					modelInstance="${data.instance}" />
			</g:if>
			
<g:render template="/shared/components/panelFooter" model="[actionsTemplate: data.bottomActionsTemplate, actionsTemplatePlugin:data.bottomActionsTemplatePlugin]" />
			
			