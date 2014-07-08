
<%@ page import="hr.fleetman.events.ServiceEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceEvent.label', default: 'ServiceEvent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-serviceEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-serviceEvent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="occurenceDate" title="${message(code: 'serviceEvent.occurenceDate.label', default: 'Occurence Date')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'serviceEvent.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'serviceEvent.description.label', default: 'Description')}" />
					
						<th><g:message code="serviceEvent.serviceFacility.label" default="Service Facility" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceEventInstanceList}" status="i" var="serviceEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serviceEventInstance.id}">${fieldValue(bean: serviceEventInstance, field: "occurenceDate")}</g:link></td>
					
						<td><g:formatBoolean boolean="${serviceEventInstance.active}" /></td>
					
						<td>${fieldValue(bean: serviceEventInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: serviceEventInstance, field: "serviceFacility")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serviceEventInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
