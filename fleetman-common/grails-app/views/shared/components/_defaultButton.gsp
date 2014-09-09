<g:set var="defType" value="${type== null ? 'default' : type}" />
<g:if test="${controller != null}">
	<g:link class="btn btn-${defType}" action="${action}"
		controller="controller">
		${title}
	</g:link>
</g:if>
<g:else>
	<g:link class="btn btn-${defType}" action="${action}">
		${title}
	</g:link>
</g:else>