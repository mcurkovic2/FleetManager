
<%@ page import="hr.fleetman.resources.Car"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-car" class="row">
		<div class="col-lg-12">
			<h1>
				<g:message code="default.list.label" args="[entityName]" />
			</h1>
		</div>

	</div>
	
	<%--<div class="row">
		<div class="col-lg-12">
			<g:if test="${flash.message}">
				<div class="alert alert-info alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					${flash.message}
				</div>
			</g:if>
		</div>
	</div>
	--%><div class="row">
		<div class="col-lg-8">
			<h2>
				<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
			</h2>

			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped tablesorter">
					<thead>
						<tr>
							<th class="header">
								${message(code: 'car.vin.label', default: 'Vin')}
							</th>
							<th class="header">
								${message(code: 'car.active.label', default: 'Active')}
							</th>
							<th class="header">
								${message(code: 'car.color.label', default: 'Color')}
							</th>
							<th class="header">
								${message(code: 'car.currentRegistrationId.label', default: 'Current Registration Id')}
							</th>
							<th class="header">
								${message(code: 'car.description.label', default: 'Description')}
							</th>
							<th class="header">
								${message(code: 'car.firstRegistrationDate.label', default: 'First Registration Date')}
							</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${carInstanceList}" status="i" var="carInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="show" id="${carInstance.id}">
										${fieldValue(bean: carInstance, field: "vin")}
									</g:link></td>
								<td>
									${fieldValue(bean: carInstance, field: "active")}
								</td>
								<td>
									${fieldValue(bean: carInstance, field: "color")}
								</td>
								<td>
									${fieldValue(bean: carInstance, field: "currentRegistrationId")}
								</td>
								<td>
									${fieldValue(bean: carInstance, field: "description")}
								</td>
								<td><g:formatDate date="${carInstance.firstRegistrationDate}" /></td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%--<a href="#list-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-car" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="vin" title="${message(code: 'car.vin.label', default: 'Vin')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'car.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="color" title="${message(code: 'car.color.label', default: 'Color')}" />
					
						<g:sortableColumn property="currentRegistrationId" title="${message(code: 'car.currentRegistrationId.label', default: 'Current Registration Id')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'car.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="firstRegistrationDate" title="${message(code: 'car.firstRegistrationDate.label', default: 'First Registration Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carInstanceList}" status="i" var="carInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carInstance.id}">${fieldValue(bean: carInstance, field: "vin")}</g:link></td>
					
						<td>${fieldValue(bean: carInstance, field: "active")}</td>
					
						<td>${fieldValue(bean: carInstance, field: "color")}</td>
					
						<td>${fieldValue(bean: carInstance, field: "currentRegistrationId")}</td>
					
						<td>${fieldValue(bean: carInstance, field: "description")}</td>
					
						<td><g:formatDate date="${carInstance.firstRegistrationDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carInstanceCount ?: 0}" />
			</div>
		</div>
	--%>
</body>
</html>
