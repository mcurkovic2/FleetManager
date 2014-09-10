
	<g:panelHeader title="${data.title}"   actionsButtonsTemplate="${data.upperActionsTemplate}" actionButtonsTemplatePlugin="${data.upperActionsTemplatePlugin}"/> 
			
			<g:if test="${(data.formTemplate!=null)}">
				<g:myRenderTemplate formTemplate="${data.formTemplate}"
					formTemplatePlugin="${data.formTemplatePlugin}"
					modelInstance="${data.instance}" />
			</g:if>
			
	<g:panelFooter actionsButtonsTemplate="${data.bottomActionsTemplate}" actionButtonsTemplatePlugin="${data.bottomActionsTemplatePlugin}"/>		

			
			