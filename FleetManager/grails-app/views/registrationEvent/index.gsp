
<%@ page import="hr.fleetman.events.RegistrationEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registrationEvent.label', default: 'RegistrationEvent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-registrationEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-registrationEvent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="occurenceDate" title="${message(code: 'registrationEvent.occurenceDate.label', default: 'Occurence Date')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'registrationEvent.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'registrationEvent.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${registrationEventInstanceList}" status="i" var="registrationEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${registrationEventInstance.id}">${fieldValue(bean: registrationEventInstance, field: "occurenceDate")}</g:link></td>
					
						<td><g:formatBoolean boolean="${registrationEventInstance.active}" /></td>
					
						<td>${fieldValue(bean: registrationEventInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${registrationEventInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
