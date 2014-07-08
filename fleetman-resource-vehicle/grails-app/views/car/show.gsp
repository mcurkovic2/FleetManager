
<%@ page import="hr.fleetman.resources.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		
		<div class="row">
		<div class="col-lg-4">
            <h1>Descriptions</h1>
            <dl>
              <dt><g:message code="car.vin.label" default="Vin" /></dt>
              <dd><g:fieldValue bean="${carInstance}" field="vin"/></dd>
              
              <dt><g:message code="car.active.label" default="Active" /></dt>
              <dd><g:fieldValue bean="${carInstance}" field="active"/></dd>
             
              <dt> <g:message code="car.color.label" default="Color" /></dt>
              <dd><g:fieldValue bean="${carInstance}" field="color"/></dd>
              
            </dl>            
            <dl class="dl-horizontal">
              <dt>Horizontal Description List</dt>
              <dd>Description Text</dd>
              <dt>Description List Title</dt>
              <dd>Description List Text</dd>
            </dl>            
          </div>
		</div>
		<div id="show-car" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list car">
			
				<g:if test="${carInstance?.vin}">
				<li class="fieldcontain">
					<span id="vin-label" class="property-label"><g:message code="car.vin.label" default="Vin" /></span>
					
						<span class="property-value" aria-labelledby="vin-label"><g:fieldValue bean="${carInstance}" field="vin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="car.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:fieldValue bean="${carInstance}" field="active"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="car.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${carInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.currentRegistrationId}">
				<li class="fieldcontain">
					<span id="currentRegistrationId-label" class="property-label"><g:message code="car.currentRegistrationId.label" default="Current Registration Id" /></span>
					
						<span class="property-value" aria-labelledby="currentRegistrationId-label"><g:fieldValue bean="${carInstance}" field="currentRegistrationId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="car.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${carInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.firstRegistrationDate}">
				<li class="fieldcontain">
					<span id="firstRegistrationDate-label" class="property-label"><g:message code="car.firstRegistrationDate.label" default="First Registration Date" /></span>
					
						<span class="property-value" aria-labelledby="firstRegistrationDate-label"><g:formatDate date="${carInstance?.firstRegistrationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.fuelType}">
				<li class="fieldcontain">
					<span id="fuelType-label" class="property-label"><g:message code="car.fuelType.label" default="Fuel Type" /></span>
					
						<span class="property-value" aria-labelledby="fuelType-label"><g:fieldValue bean="${carInstance}" field="fuelType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.inTrafficSinceDate}">
				<li class="fieldcontain">
					<span id="inTrafficSinceDate-label" class="property-label"><g:message code="car.inTrafficSinceDate.label" default="In Traffic Since Date" /></span>
					
						<span class="property-value" aria-labelledby="inTrafficSinceDate-label"><g:formatDate date="${carInstance?.inTrafficSinceDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.lastRegistrationEvent}">
				<li class="fieldcontain">
					<span id="lastRegistrationEvent-label" class="property-label"><g:message code="car.lastRegistrationEvent.label" default="Last Registration Event" /></span>
					
						<span class="property-value" aria-labelledby="lastRegistrationEvent-label"><g:formatDate date="${carInstance?.lastRegistrationEvent}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.make}">
				<li class="fieldcontain">
					<span id="make-label" class="property-label"><g:message code="car.make.label" default="Make" /></span>
					
						<span class="property-value" aria-labelledby="make-label"><g:fieldValue bean="${carInstance}" field="make"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.manufacturer}">
				<li class="fieldcontain">
					<span id="manufacturer-label" class="property-label"><g:message code="car.manufacturer.label" default="Manufacturer" /></span>
					
						<span class="property-value" aria-labelledby="manufacturer-label"><g:fieldValue bean="${carInstance}" field="manufacturer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.maufacturerCountry}">
				<li class="fieldcontain">
					<span id="maufacturerCountry-label" class="property-label"><g:message code="car.maufacturerCountry.label" default="Maufacturer Country" /></span>
					
						<span class="property-value" aria-labelledby="maufacturerCountry-label"><g:link controller="country" action="show" id="${carInstance?.maufacturerCountry?.id}">${carInstance?.maufacturerCountry?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.model}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="car.model.label" default="Model" /></span>
					
						<span class="property-value" aria-labelledby="model-label"><g:fieldValue bean="${carInstance}" field="model"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.power}">
				<li class="fieldcontain">
					<span id="power-label" class="property-label"><g:message code="car.power.label" default="Power" /></span>
					
						<span class="property-value" aria-labelledby="power-label"><g:fieldValue bean="${carInstance}" field="power"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.registrationEvents}">
				<li class="fieldcontain">
					<span id="registrationEvents-label" class="property-label"><g:message code="car.registrationEvents.label" default="Registration Events" /></span>
					
						<g:each in="${carInstance.registrationEvents}" var="r">
						<span class="property-value" aria-labelledby="registrationEvents-label"><g:link controller="registrationEvent" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.serviceEvents}">
				<li class="fieldcontain">
					<span id="serviceEvents-label" class="property-label"><g:message code="car.serviceEvents.label" default="Service Events" /></span>
					
						<g:each in="${carInstance.serviceEvents}" var="s">
						<span class="property-value" aria-labelledby="serviceEvents-label"><g:link controller="serviceEvent" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.tireChangeEvents}">
				<li class="fieldcontain">
					<span id="tireChangeEvents-label" class="property-label"><g:message code="car.tireChangeEvents.label" default="Tire Change Events" /></span>
					
						<g:each in="${carInstance.tireChangeEvents}" var="t">
						<span class="property-value" aria-labelledby="tireChangeEvents-label"><g:link controller="tireChangeEvent" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="car.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${carInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:carInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${carInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
