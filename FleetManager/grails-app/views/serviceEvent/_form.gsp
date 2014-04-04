<%@ page import="hr.fleetman.events.ServiceEvent" %>



<div class="fieldcontain ${hasErrors(bean: serviceEventInstance, field: 'occurenceDate', 'error')} required">
	<label for="occurenceDate">
		<g:message code="serviceEvent.occurenceDate.label" default="Occurence Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="occurenceDate" precision="day"  value="${serviceEventInstance?.occurenceDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceEventInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="serviceEvent.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${serviceEventInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: serviceEventInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="serviceEvent.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${serviceEventInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceEventInstance, field: 'serviceFacility', 'error')} required">
	<label for="serviceFacility">
		<g:message code="serviceEvent.serviceFacility.label" default="Service Facility" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="serviceFacility" name="serviceFacility.id" from="${hr.fleetman.common.ServiceFacility.list()}" optionKey="id" required="" value="${serviceEventInstance?.serviceFacility?.id}" class="many-to-one"/>

</div>

