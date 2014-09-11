<div
	class="form-group ${hasErrors(bean: modelInstance, field: 'vin', 'has-error')} ">
	<label class="control-label" for="vin"> <g:message
			code="newVehicle.vin.label" default="VIN" />
	</label>
	<g:textField class="form-control input-lg" name="vin"
		value="${modelInstance?.vin}" />
</div>

<div
	class="form-group ${hasErrors(bean: modelInstance, field: 'currentRegistration', 'has-error')} ">
	<label class="control-label" for="vin"> <g:message
			code="newVehicle.currentRegistration.label"
			default="Current Registration" />
	</label>

	<g:textField class="form-control input-lg" name="currentRegistration"
		value="${modelInstance?.currentRegistration}" />
</div>