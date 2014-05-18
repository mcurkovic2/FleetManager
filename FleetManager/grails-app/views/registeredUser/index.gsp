
<%@ page import="hr.fleetman.users.RegisteredUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registeredUser.label', default: 'RegisteredUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-registeredUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-registeredUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="userId" title="${message(code: 'registeredUser.userId.label', default: 'User Id')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'registeredUser.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'registeredUser.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'registeredUser.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'registeredUser.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'registeredUser.username.label', default: 'Username')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${registeredUserInstanceList}" status="i" var="registeredUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${registeredUserInstance.id}">${fieldValue(bean: registeredUserInstance, field: "userId")}</g:link></td>
					
						<td>${fieldValue(bean: registeredUserInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: registeredUserInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: registeredUserInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${registeredUserInstance.active}" /></td>
					
						<td>${fieldValue(bean: registeredUserInstance, field: "username")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${registeredUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
