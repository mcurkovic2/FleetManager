<%@ page import="hr.fleetman.common.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<%--<p>
	<a class="skip" href="#list-user" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content"></g:message></a>
</p>

--%>
<%--<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"></g:message></a></li>
		<li><g:link action="create" class="create">
				<g:message args="[entityName]" code="default.new.label"></g:message>
			</g:link></li>
	</ul>
</div>

--%>
<div class="row">
	<div class="col-lg-12">
		<div class="alert alert-info alert-dismissable">
			<button aria-hidden="true" class="close" data-dismiss="alert"
				type="submit">&times;</button>
			We&#39;re using <a class="alert-link"
				href="http://tablesorter.com/docs/">Tablesorter 2.0</a> for the sort
			function on the tables. Read the documentation for more customization
			options or feel free to use something else!
		</div>
	</div>
</div>

<div class="row">

	<div class="col-lg-12">
		<g:link action="create" class="btn btn-default">
			<g:message args="[entityName]" code="default.new.label"></g:message>
		</g:link>
		<button type="button" class="btn btn-default">Show List</button>
		<div class="btn-group">
			<button type="button" class="btn btn-default">New Service</button>
			<button type="button" class="btn btn-default">New
				Registration</button>
			<button type="button" class="btn btn-default">New Tire
				Change</button>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">&nbsp;</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="table-responsive">
			<table
				class="table table-bordered table-hover table-striped tablesorter">
				<thead>
					<tr>
						<th>
							${message(code: 'user.userId.label', default: 'User Id')} <i
							class="fa fa-sort"></i>
						</th>
						<th>
							${message(code: 'user.active.label', default: 'Active')}<i
							class="fa fa-sort"></i>
						</th>
						<th>
							${message(code: 'user.description.label', default: 'Description')}
							<i class="fa fa-sort"></i>
						</th>
						<th>
							${message(code: 'user.firstName.label', default: 'First Name')} <i
							class="fa fa-sort"></i>
						</th>
						<th>
							${message(code: 'user.lastName.label', default: 'Last Name')} <i
							class="fa fa-sort"></i>
						</th>
				</thead>
				<tbody>
					<g:each in="${userInstanceList}" status="i" var="userInstance">
						<tr>
							<td><g:link action="show" id="${userInstance.id}">
									${fieldValue(bean: userInstance, field: 'userId')}
								</g:link></td>
							<td><g:checkBox name="active" disabled="disabled"
									value="${userInstance.active}" /></td>
							<td>
								${fieldValue(bean: userInstance, field: 'description')}
							</td>
							<td>
								${fieldValue(bean: userInstance, field: 'firstName')}
							</td>
							<td>
								${fieldValue(bean: userInstance, field: 'lastName')}
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>


			<ul class="pagination">

				<li class="disabled"><a href="#">&laquo;</a></li>
				<g:each var="i" in="${ (0..<(userInstanceCount ?: 0)) }">
					<li><a href="#">${i+1} <span class="sr-only">(current)</span></a></li>
				</g:each>
				<li><a href="#">&raquo;</a></li>
<%--				<li class="disabled"><a href="#">&laquo;</a></li>--%>
<%--				<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>--%>
<%--				<li><a href="#">2 <span class="sr-only">(current)</span></a></li>--%>
<%--				<li><a href="#">3 <span class="sr-only">(current)</span></a></li>--%>
<%--				<li><a href="#">4 <span class="sr-only">(current)</span></a></li>--%>
			</ul>

			<%--			<div class="pagination">--%>
			<%--				<g:paginate total="${userInstanceCount ?: 0}"></g:paginate>--%>
			<%--			</div>--%>
		</div>
	</div>
</div>
<!-- /.row -->
</body>
</html>
