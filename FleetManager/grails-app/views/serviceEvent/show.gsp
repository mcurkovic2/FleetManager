
<%@ page import="hr.fleetman.events.ServiceEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceEvent.label', default: 'ServiceEvent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-serviceEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-serviceEvent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list serviceEvent">
			
				<g:if test="${serviceEventInstance?.occurenceDate}">
				<li class="fieldcontain">
					<span id="occurenceDate-label" class="property-label"><g:message code="serviceEvent.occurenceDate.label" default="Occurence Date" /></span>
					
						<span class="property-value" aria-labelledby="occurenceDate-label"><g:formatDate date="${serviceEventInstance?.occurenceDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceEventInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="serviceEvent.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${serviceEventInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceEventInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="serviceEvent.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${serviceEventInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceEventInstance?.serviceFacility}">
				<li class="fieldcontain">
					<span id="serviceFacility-label" class="property-label"><g:message code="serviceEvent.serviceFacility.label" default="Service Facility" /></span>
					
						<span class="property-value" aria-labelledby="serviceFacility-label"><g:link controller="serviceFacility" action="show" id="${serviceEventInstance?.serviceFacility?.id}">${serviceEventInstance?.serviceFacility?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:serviceEventInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${serviceEventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
