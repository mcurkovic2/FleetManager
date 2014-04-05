<%@ page import="hr.fleetman.Car"%>


<div class="form-group ${hasErrors(bean: carInstance, field: 'vin', 'has-error')}">
	<label class="control-label" for="vin"> <g:message code="car.vin.label" default="Vin" />
	</label>
	<g:textField name="vin" value="${carInstance?.vin}" class="form-control" />
</div>
<div class="form-group">
	<label class="control-label" for="active"> <g:message code="car.active.label" default="Active" class="form-control" />
	</label>
	<g:checkBox name="active" value="${carInstance.active}" />
</div>
<div class="form-group  ${hasErrors(bean: carInstance, field: 'color', 'has-error')}">
	<label class="control-label" for="color"> <g:message code="car.color.label" default="Color" />
	</label>
	<g:textField name="color" value="${carInstance?.color}" class="form-control" />
</div>
<div class="form-group  ${hasErrors(bean: carInstance, field: 'currentRegistrationId', 'has-error')}">
	<label class="control-label" for="currentRegistrationId"> <g:message code="car.currentRegistrationId.label" default="Current Registration Id" />
	</label>
	<g:textField name="currentRegistrationId" value="${carInstance?.currentRegistrationId}" class="form-control" />
</div>

<div class="form-group  ${hasErrors(bean: carInstance, field: 'description', 'has-error')}">
	<label class="control-label" for="description"> <g:message code="car.description.label" default="Description" />
	</label>
	<g:textField name="description" value="${carInstance?.description}" class="form-control" />
</div>

<div class="form-group  ${hasErrors(bean: carInstance, field: 'firstRegistrationDate', 'has-error')}">
	<label class="control-label" for="firstRegistrationDate"> <g:message code="car.firstRegistrationDate.label" default="First Registration Date" />
	</label>
	<g:datePicker name="firstRegistrationDate" precision="day" value="${carInstance?.firstRegistrationDate}" />
</div>
<div class="form-group ${hasErrors(bean: carInstance, field: 'fuelType', 'error')} required">
	<label class="control-label" for="fuelType"> <g:message code="car.fuelType.label" default="Fuel Type" />
	</label>
	<g:select name="fuelType" from="${hr.fleetman.Car$FuelType?.values()}" keys="${hr.fleetman.Car$FuelType.values()*.name()}" required=""
		value="${carInstance?.fuelType?.name()}" />
</div>

<div class="form-group ${hasErrors(bean: carInstance, field: 'inTrafficSinceDate', 'error')} required">
	<label class="control-label" for="inTrafficSinceDate"> <g:message code="car.inTrafficSinceDate.label" default="In Traffic Since Date" />
	</label>
	<g:datePicker name="inTrafficSinceDate" precision="day" value="${carInstance?.inTrafficSinceDate}" />
</div>

<div class="form-group  ${hasErrors(bean: carInstance, field: 'power', 'has-error')}">
	<label class="control-label" for="description"> <g:message code="car.power.label" default="Power Kw" />
	</label>
	<g:field type="number" name="power" min="10" max="500" value="${carInstance?.power}" class="form-control" />
</div>



