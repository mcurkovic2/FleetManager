<g:if test="${controller != null}">
	<g:link class="btn btn-default" action="${action}"
		controller="controller">
		${title}
	</g:link>
</g:if>
<g:else>
	<g:link class="btn btn-default" action="${action}">
		${title}
	</g:link>
</g:else>