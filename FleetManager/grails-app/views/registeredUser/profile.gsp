<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="hr.fleetman.users.RegisteredUser"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodySingleColumn" />
</head>
<body>
	<content tag="validation"> <g:render
		template="/shared/validationMessage"
		model="[instance: registeredUserInstance, command: changePasswordCommand]"></g:render>
	</content>

	<content tag="message"> <g:render
		template="/shared/flashMessage"></g:render> </content>

	<content tag="mainContent">

	<div class="portlet portlet-default">
		<div class="portlet-body">
			<ul id="userTab" class="nav nav-tabs">
				<li class="active"><a href="#overview" data-toggle="tab"><g:message
							code="RegisteredUser.profile.overview.label" /></a></li>
				<li><a href="#profile-settings" data-toggle="tab"><g:message
							code="RegisteredUser.profile.update.label" /></a></li>
			</ul>
			<div id="userTabContent" class="tab-content">
				<g:if
					test="${(flash.tabPosition == null) || (flash.tabPosition?.menu == "overview")}">

					<div class="tab-pane fade in active" id="overview">
				</g:if>
				<g:else>

					<div class="tab-pane fade" id="overview">
				</g:else>
				<%--				<div class="tab-pane fade in active" id="overview">--%>

				<div class="row">
					<div class="col-lg-2 col-md-3"></div>
					<div class="col-lg-7 col-md-5">
						<h1>
							<g:fieldValue bean="${registeredUserInstance}" field="firstName" />
							&nbsp;
							<g:fieldValue bean="${registeredUserInstance}" field="lastName" />
						</h1>
						<p>
							<g:fieldValue bean="${registeredUserInstance}"
								field="description" />
						</p>
						<ul class="list-inline">
							<li><i class="fa fa-calendar fa-muted"></i>&nbsp;<g:message
									code="RegisteredUser.memberSince.label" /> <g:formatDate
									date="${registeredUserInstance.dateCreated}" type="datetime"
									style="LONG" timeStyle="SHORT" /></li>
						</ul>
						<h3>
							<g:message code="RegisteredUser.profile.recentActivity.label" />
						</h3>
						<div class="table-responsive">
							<table class="table table-hover table-bordered table-striped">
								<thead>
									<tr>
										<th>Date</th>
										<th>Time</th>
										<th>Amount</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1/31/14</td>
										<td>6:14 PM</td>
										<td>$12.07</td>
										<td><a class="btn btn-xs btn-orange disabled"><i
												class="fa fa-clock-o"></i> Pending</a></td>
									</tr>
									<tr>
										<td>1/31/14</td>
										<td>6:02 PM</td>
										<td>$5.32</td>
										<td><a class="btn btn-xs btn-orange disabled"><i
												class="fa fa-clock-o"></i> Pending</a></td>
									</tr>
									<tr>
										<td>1/31/14</td>
										<td>5:56 PM</td>
										<td>$6.58</td>
										<td><a class="btn btn-xs btn-green"><i
												class="fa fa-arrow-circle-right"></i> View Order</a></td>
									</tr>
									<tr>
										<td>1/31/14</td>
										<td>5:12 PM</td>
										<td>$15.61</td>
										<td><a class="btn btn-xs btn-green"><i
												class="fa fa-arrow-circle-right"></i> View Order</a></td>
									</tr>
									<tr>
										<td>1/31/14</td>
										<td>5:02 PM</td>
										<td>$9.89</td>
										<td><a class="btn btn-xs btn-green"><i
												class="fa fa-arrow-circle-right"></i> View Order</a></td>
									</tr>
									<tr>
										<td>1/31/14</td>
										<td>4:47 PM</td>
										<td>$2.21</td>
										<td><a class="btn btn-xs btn-red"><i
												class="fa fa-warning"></i> Error</a></td>
									</tr>
									<tr>
										<td>1/31/14</td>
										<td>4:32 PM</td>
										<td>$5.17</td>
										<td><a class="btn btn-xs btn-default"><i
												class="fa fa-arrow-circle-right"></i> Special Order</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col-lg-3 col-md-4">
						<h3>
							<g:message code="RegisteredUser.profile.contactDetails.label" />
						</h3>
						<g:if test="${registeredUserInstance?.contact?.phone != null}">
							<p>
								<i class="fa fa-phone fa-muted fa-fw"></i>
								<g:fieldValue bean="${registeredUserInstance.contact}"
									field="phone" />
							</p>
						</g:if>
						<g:if test="${registeredUserInstance?.contact?.email != null}">
							<p>
								<i class="fa fa-envelope-o fa-muted fa-fw"></i>
								<g:fieldValue bean="${registeredUserInstance.contact}"
									field="email" />
							</p>
						</g:if>
					</div>
				</div>

			</div>

			<g:if test="${flash.tabPosition?.menu=="profile-settings"}">

				<div class="tab-pane fade in active" id="profile-settings">
			</g:if>
			<g:else>

				<div class="tab-pane fade" id="profile-settings">
			</g:else>

			<%--				<div class="tab-pane fade" id="profile-settings">--%>

			<div class="row">
				<div class="col-sm-3">

					<ul id="userSettings" class="nav nav-pills nav-stacked">

						<g:if
							test="${(flash.tabPosition == null) || (flash.tabPosition?.submenu =="basicInformation")}">

							<li class="active">
						</g:if>
						<g:else>

							<li>
						</g:else>
					
						<a href="#basicInformation"
							data-toggle="tab"><i class="fa fa-user fa-fw"></i> <g:message
									code="RegisteredUser.profile.basicInfo.label" /></a></li>
						<g:if
							test="${(flash.tabPosition?.submenu == "changePassword")}">

							<li class="active">
						</g:if>
						<g:else>

							<li>
						</g:else>
						<a href="#changePassword" data-toggle="tab"><i
							class="fa fa-lock fa-fw"></i> <g:message
								code="RegisteredUser.profile.changePassword.label" /></a>
						</li>
					</ul>
				</div>
				<div class="col-sm-9">
					<div id="userSettingsContent" class="tab-content">

						<g:if
							test="${(flash.tabPosition?.submenu == null) || (flash.tabPosition?.submenu=="basicInformation")}">

							<div class="tab-pane fade in active" id="basicInformation">
						</g:if>
						<g:else>

							<div class="tab-pane fade" id="basicInformation">
						</g:else>
						<g:form url="[resource:registeredUserInstance, action:'update']"
							method="PUT">
							<h4 class="page-header">
								<g:message
									code="RegisteredUser.profile.personalInformation.heading" />
							</h4>
							<g:hiddenField name="version"
								value="${registeredUserInstance?.version}" />
							<fieldset>
								<g:render template="formEdit" />
							</fieldset>
							<fieldset>
								<g:actionSubmit class="btn btn-default" action="update"
									value="${message(code: 'default.button.update.label', default: 'Update')}" />
								<g:link class="btn btn-green" action="profileById"
									id="${registeredUserInstance.id}">
									<g:message code="default.back.label" />
								</g:link>
							</fieldset>
						</g:form>
					</div>

					<g:if test="${flash.tabPosition?.submenu=="changePassword"}">

						<div class="tab-pane fade in active" id="changePassword">
					</g:if>
					<g:else>

						<div class="tab-pane fade" id="changePassword">
					</g:else>
					<h3>
						<g:message code="ChangePassword.title" />
					</h3>
					<g:form
						url="[controller:registeredUserController, action:'changePassword']"
						method="PUT">
						<g:hiddenField name="username"
							value="${registeredUserInstance.username}" />
						<div class="form-group">
							<label><g:message code="ChangePassword.newPassword.label" /></label>
							<input name="newPassword" type="password" class="form-control"
								value="">
						</div>
						<div class="form-group">
							<label><g:message
									code="ChangePassword.retypePassword.label" /></label> <input
								name="confirmedPassword" type="password" class="form-control"
								value="">
						</div>
						<button type="submit" class="btn btn-default">
							<g:message code="ChangePassword.updatePassword.label" />
						</button>
						<g:link class="btn btn-green" action="profileById"
							id="${registeredUserInstance.id}">
							<g:message code="default.back.label" />
						</g:link>
					</g:form>
				</div>
			</div>
		</div>

	</div>
	</div>
	</div>
	<!-- /.portlet-body -->
	</div>
	<!-- /.portlet --> </content>
</body>
</html>