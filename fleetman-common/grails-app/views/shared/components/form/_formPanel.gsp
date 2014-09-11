
	<g:if test="${showValidationMessage}">
		<g:render template="/shared/validationMessage" model="[instance: data.instance]" ></g:render>
	</g:if>
	
	<g:panelHeader title="${data.title}" actionButtonsTemplate="${data.upperActionsTemplate}" actionButtonsTemplatePlugin="${data.upperActionsTemplatePlugin}"/> 
			
			<g:if test="${(data.formTemplate!=null)}">
				<g:myRenderTemplate formTemplate="${data.formTemplate}"
					formTemplatePlugin="${data.formTemplatePlugin}"
					modelInstance="${data.instance}" />
			</g:if>
			
	<g:panelFooter actionButtonsTemplate="${data.bottomActionsTemplate}" actionButtonsTemplatePlugin="${data.bottomActionsTemplatePlugin}"/>		

			
			