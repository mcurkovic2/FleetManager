<%@ page import="hr.fleetman.Car" %>



<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'vin', 'error')} ">
	<label for="vin">
		<g:message code="car.vin.label" default="Vin" />
		
	</label>
	<g:textField name="vin" value="${carInstance?.vin}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'active', 'error')} required">
	<label for="active">
		<g:message code="car.active.label" default="Active" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="active" type="number" value="${carInstance.active}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'color', 'error')} ">
	<label for="color">
		<g:message code="car.color.label" default="Color" />
		
	</label>
	<g:textField name="color" value="${carInstance?.color}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'currentRegistrationId', 'error')} ">
	<label for="currentRegistrationId">
		<g:message code="car.currentRegistrationId.label" default="Current Registration Id" />
		
	</label>
	<g:textField name="currentRegistrationId" value="${carInstance?.currentRegistrationId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="car.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${carInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'firstRegistrationDate', 'error')} required">
	<label for="firstRegistrationDate">
		<g:message code="car.firstRegistrationDate.label" default="First Registration Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="firstRegistrationDate" precision="day"  value="${carInstance?.firstRegistrationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'fuelType', 'error')} required">
	<label for="fuelType">
		<g:message code="car.fuelType.label" default="Fuel Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="fuelType" from="${hr.fleetman.Car$FuelType?.values()}" keys="${hr.fleetman.Car$FuelType.values()*.name()}" required="" value="${carInstance?.fuelType?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'inTrafficSinceDate', 'error')} required">
	<label for="inTrafficSinceDate">
		<g:message code="car.inTrafficSinceDate.label" default="In Traffic Since Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inTrafficSinceDate" precision="day"  value="${carInstance?.inTrafficSinceDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'lastRegistrationEvent', 'error')} required">
	<label for="lastRegistrationEvent">
		<g:message code="car.lastRegistrationEvent.label" default="Last Registration Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastRegistrationEvent" precision="day"  value="${carInstance?.lastRegistrationEvent}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'make', 'error')} ">
	<label for="make">
		<g:message code="car.make.label" default="Make" />
		
	</label>
	<g:textField name="make" value="${carInstance?.make}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'manufacturer', 'error')} ">
	<label for="manufacturer">
		<g:message code="car.manufacturer.label" default="Manufacturer" />
		
	</label>
	<g:textField name="manufacturer" value="${carInstance?.manufacturer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'maufacturerCountry', 'error')} required">
	<label for="maufacturerCountry">
		<g:message code="car.maufacturerCountry.label" default="Maufacturer Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="maufacturerCountry" name="maufacturerCountry.id" from="${hr.fleetman.common.Country.list()}" optionKey="id" required="" value="${carInstance?.maufacturerCountry?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'model', 'error')} ">
	<label for="model">
		<g:message code="car.model.label" default="Model" />
		
	</label>
	<g:textField name="model" value="${carInstance?.model}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'power', 'error')} required">
	<label for="power">
		<g:message code="car.power.label" default="Power" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="power" type="number" value="${carInstance.power}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'registrationEvents', 'error')} ">
	<label for="registrationEvents">
		<g:message code="car.registrationEvents.label" default="Registration Events" />
		
	</label>
	<g:select name="registrationEvents" from="${hr.fleetman.events.RegistrationEvent.list()}" multiple="multiple" optionKey="id" size="5" value="${carInstance?.registrationEvents*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'serviceEvents', 'error')} ">
	<label for="serviceEvents">
		<g:message code="car.serviceEvents.label" default="Service Events" />
		
	</label>
	<g:select name="serviceEvents" from="${hr.fleetman.events.ServiceEvent.list()}" multiple="multiple" optionKey="id" size="5" value="${carInstance?.serviceEvents*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'tireChangeEvents', 'error')} ">
	<label for="tireChangeEvents">
		<g:message code="car.tireChangeEvents.label" default="Tire Change Events" />
		
	</label>
	<g:select name="tireChangeEvents" from="${hr.fleetman.events.TireChangeEvent.list()}" multiple="multiple" optionKey="id" size="5" value="${carInstance?.tireChangeEvents*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="car.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${carInstance?.type}"/>

</div>

