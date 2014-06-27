<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="hr.fleetman.users.RegisteredUser"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodySingleColumn" />
<%--<title><g:message code="title.homepage" /></title>--%>
</head>
<body>
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
				<div class="tab-pane fade in active" id="overview">

					<div class="row">
						<div class="col-lg-2 col-md-3">
							<%--						IMAGE--%>
							<%--							<a href="#"> <span class="profile-edit">Edit</span>--%>
							<%--							</a><img class="img-responsive img-profile"--%>
							<%--								src="${assetPath(src: 'img/profile-full.jpg')}" alt="" />--%>
							<%--<div class="list-group">
								<a href="#" class="list-group-item active"><g:message
										code="RegisteredUser.profile.overview.label" /></a> <a href="#"
									class="list-group-item">Messages<span class="badge green">4</span></a>
								<a href="#" class="list-group-item">Alerts<span
									class="badge orange">9</span></a> <a href="#"
									class="list-group-item">Tasks<span class="badge blue">10</span></a>
							</div>
						--%>
						</div>
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
								<%--								<li><i class="fa fa-map-marker fa-muted"></i> Bayville, FL</li>--%>
								<%--								<li><i class="fa fa-user fa-muted"></i> Administrator</li>--%>
								<%--								<li><i class="fa fa-group fa-muted"></i> Sales, Marketing,--%>
								<%--									Management</li>--%>
								<%--								<li><i class="fa fa-trophy fa-muted"></i> Top Seller</li>--%>
								<li><i class="fa fa-calendar fa-muted"></i>&nbsp;<g:message
										code="RegisteredUser.memberSince.label" />&nbsp; <%--									<g:fieldValue bean="${registeredUserInstance}"--%>
									<%--										field="dateCreated" />--%> <g:formatDate
										date="${registeredUserInstance.dateCreated}" type="datetime"
										style="LONG" timeStyle="SHORT" /></li>
							</ul>
							<h3>Recent Sales</h3>
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
<%--							<ul class="list-inline">--%>
<%--								<li><a class="facebook-link" href="#"><i--%>
<%--										class="fa fa-facebook-square fa-2x"></i></a></li>--%>
<%--								<li><a class="twitter-link" href="#"><i--%>
<%--										class="fa fa-twitter-square fa-2x"></i></a></li>--%>
<%--								<li><a class="linkedin-link" href="#"><i--%>
<%--										class="fa fa-linkedin-square fa-2x"></i></a></li>--%>
<%--								<li><a class="google-plus-link" href="#"><i--%>
<%--										class="fa fa-google-plus-square fa-2x"></i></a></li>--%>
<%--							</ul>--%>
						</div>
					</div>

				</div>
				<div class="tab-pane fade" id="profile-settings">

					<div class="row">
						<div class="col-sm-3">
							<ul id="userSettings" class="nav nav-pills nav-stacked">
								<li class="active"><a href="#basicInformation"
									data-toggle="tab"><i class="fa fa-user fa-fw"></i> Basic
										Information</a></li>
								<li><a href="#profilePicture" data-toggle="tab"><i
										class="fa fa-picture-o fa-fw"></i> Profile Picture</a></li>
								<li><a href="#changePassword" data-toggle="tab"><i
										class="fa fa-lock fa-fw"></i> Change Password</a></li>
							</ul>
						</div>
						<div class="col-sm-9">
							<div id="userSettingsContent" class="tab-content">
								<div class="tab-pane fade in active" id="basicInformation">
									<form role="form">
										<h4 class="page-header">Personal Information:</h4>
										<div class="form-group">
											<label>First Name</label> <input type="text"
												class="form-control" value="John">
										</div>
										<div class="form-group">
											<label>Last Name</label> <input type="text"
												class="form-control" value="Smith">
										</div>
										<div class="form-group">
											<label>Phone Number</label> <input type="tel"
												class="form-control" value="1+(234) 555-2039">
										</div>
										<div class="form-group">
											<label>Address</label> <input type="text"
												class="form-control" value="8516 Market St.">
										</div>
										<div class="form-inline">
											<div class="form-group">
												<label>City</label> <input type="text" class="form-control"
													value="Bayville">
											</div>
											<div class="form-group">
												<label>State</label> <input type="text" class="form-control"
													value="FL">
											</div>
											<div class="form-group">
												<label>ZIP</label> <input type="text" class="form-control"
													value="55555">
											</div>
										</div>
										<h4 class="page-header">Contact Details:</h4>
										<div class="form-group">
											<label><i class="fa fa-envelope-o fa-fw"></i> Email
												Address</label> <input type="email" class="form-control"
												value="jsmith@website.com">
										</div>
										<div class="form-group">
											<label><i class="fa fa-globe fa-fw"></i> Website</label> <input
												type="url" class="form-control"
												value="http://www.website.com">
										</div>
										<h4 class="page-header">Profile Information:</h4>
										<div class="form-group">
											<label><i class="fa fa-info fa-fw"></i> About</label>
											<textarea class="form-control" rows="3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis.</textarea>
										</div>
										<div class="form-group">
											<label><i class="fa fa-building-o fa-fw"></i>
												Departments</label> <select multiple class="form-control">
												<option>Accounting</option>
												<option>Customer Support</option>
												<option>Human Resources</option>
												<option selected>Management</option>
												<option selected>Marketing</option>
												<option>Production</option>
												<option>Quality Assurance</option>
												<option selected>Sales</option>
											</select>

										</div>
										<h4 class="page-header">Social Profiles:</h4>
										<div class="form-group">
											<label><i class="fa fa-facebook fa-fw"></i> Facebook
												Profile URL</label> <input type="url" class="form-control"
												value="http://www.facebook.com/john.smith9324">
										</div>
										<div class="form-group">
											<label><i class="fa fa-linkedin fa-fw"></i> LinkedIn
												Profile URL</label> <input type="url" class="form-control"
												value="http://www.linkedin.com/u/john.smith923">
										</div>
										<div class="form-group">
											<label><i class="fa fa-google-plus fa-fw"></i>
												Google+ Profile URL</label> <input type="url" class="form-control"
												value="http://plus.google.com/john-smith9993">
										</div>
										<div class="form-group">
											<label><i class="fa fa-twitter fa-fw"></i> Twitter
												Username</label> <input type="text" class="form-control"
												value="@JohnSmith">
										</div>
										<button type="submit" class="btn btn-default">Update
											Profile</button>
										<button class="btn btn-green">Cancel</button>
									</form>
								</div>
								<div class="tab-pane fade" id="profilePicture">
									<h3>Current Picture:</h3>
									<img class="img-responsive img-profile"
										src="${assetPath(src: 'img/profile-full.jpg')}" alt="">
									<br>
									<form role="form">
										<div class="form-group">
											<label>Choose a New Image</label> <input type="file">
											<p class="help-block">
												<i class="fa fa-warning"></i> Image must be no larger than
												500x500 pixels. Supported formats: JPG, GIF, PNG
											</p>
											<button type="submit" class="btn btn-default">Update
												Profile Picture</button>
											<button class="btn btn-green">Cancel</button>
										</div>
									</form>
								</div>
								<div class="tab-pane fade in" id="changePassword">
									<h3>Change Password:</h3>
									<form role="form">
										<div class="form-group">
											<label>Old Password</label> <input type="password"
												class="form-control" value="">
										</div>
										<div class="form-group">
											<label>New Password</label> <input type="password"
												class="form-control" value="">
										</div>
										<div class="form-group">
											<label>Re-Type New Password</label> <input type="password"
												class="form-control" value="">
										</div>
										<button type="submit" class="btn btn-default">Update
											Password</button>
										<button class="btn btn-green">Cancel</button>
									</form>
								</div>
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