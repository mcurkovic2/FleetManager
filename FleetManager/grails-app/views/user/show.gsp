
<%@ page import="hr.fleetman.common.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<%--		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--%>
	<%--		<div class="nav" role="navigation">--%>
	<%--			<ul>--%>
	<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
	<%--				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--%>
	<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
	<%--			</ul>--%>
	<%--		</div>--%>
	<g:render template="/shared/flashMessage"></g:render>
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<g:message code="user.details" />
				</div>
				<div class="panel-body">
					<dl>
						<dt>
							<g:message code="user.userId.label" default="Id" />
						</dt>

						<dd>
							<g:fieldValue bean="${userInstance}" field="userId" />
						</dd>
						<br>
						<dt>
							<g:message code="user.active.label" default="Active" />
						</dt>
						<dd>
							<g:checkBox name="active " value="true"
								checked="${userInstance?.active == true}" disabled="true" />
						</dd>
						<br>
						<dt>
							<g:message code="user.firstName.label" default="First Name" />
						</dt>
						<dd>
							<g:fieldValue bean="${userInstance}" field="firstName" />
						</dd>
						<br>
						<dt>
							<g:message code="user.lastName.label" default="Last Name" />
						</dt>
						<dd>
							<g:fieldValue bean="${userInstance}" field="lastName" />
						</dd>
						<br>
						<dt>
							<g:message code="user.description.label" default="Descritption" />
						</dt>
						<dd>
							<g:fieldValue bean="${userInstance}" field="description" />
						</dd>

					</dl>
				</div>
			</div>
		</div>
	</div>

	<div>
		<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${userInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
