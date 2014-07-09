<%@ page import="hr.fleetman.events.RegistrationEvent" %>



<div class="fieldcontain ${hasErrors(bean: registrationEventInstance, field: 'occurenceDate', 'error')} required">
	<label for="occurenceDate">
		<g:message code="registrationEvent.occurenceDate.label" default="Occurence Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="occurenceDate" precision="day"  value="${registrationEventInstance?.occurenceDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: registrationEventInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="registrationEvent.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${registrationEventInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: registrationEventInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="registrationEvent.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${registrationEventInstance?.description}"/>

</div>

