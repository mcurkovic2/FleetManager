<%@ page import="hr.fleetman.common.Country" %>



<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="country.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${countryInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="country.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${countryInstance?.name}"/>

</div>

