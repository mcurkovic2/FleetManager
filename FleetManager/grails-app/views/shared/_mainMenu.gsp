<!-- Sidebar -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand"
			href="${createLink(controller : 'dashboard', action: 'index')}">FleetManager</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<shiro:hasPermission permission="dashboard:*">
				<li><g:link controller="Dashboard">
						<i class="fa fa-dashboard"></i>
						<g:message code="main.menu.menuItem.dashboard" />
					</g:link></li>
			</shiro:hasPermission>


			<shiro:hasPermission permission="car:*">
				<li><g:link controller="Car">
						<i class="fa fa-bar-chart-o"></i>
						<g:message code="main.menu.menuItem.resources" />
					</g:link></li>
			</shiro:hasPermission>


			<shiro:hasPermission permission="user:*">
				<li><g:link controller="User">
						<i class="fa fa-table"></i>
						<g:message code="main.menu.menuItem.users" />
					</g:link></li>
			</shiro:hasPermission>

			<shiro:hasPermission permission="reports:*">
				<li><g:link controller="Reports">
						<i class="fa fa-edit"></i>
						<g:message code="main.menu.menuItem.reports" />
					</g:link></li>
			</shiro:hasPermission>

		</ul>

		<ul class="nav navbar-nav navbar-right navbar-user">
			<li class="dropdown messages-dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><i
					class="fa fa-envelope"></i> Messages <span class="badge">7</span> <b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li class="dropdown-header">7 New Messages</li>
					<li class="message-preview"><a href="#"> <span
							class="avatar"><img src="http://placehold.it/50x50"></span>
							<span class="name">John Smith:</span> <span class="message">Hey
								there, I wanted to ask you something...</span> <span class="time"><i
								class="fa fa-clock-o"></i> 4:34 PM</span>
					</a></li>
					<li class="divider"></li>
					<li class="message-preview"><a href="#"> <span
							class="avatar"><img src="http://placehold.it/50x50"></span>
							<span class="name">John Smith:</span> <span class="message">Hey
								there, I wanted to ask you something...</span> <span class="time"><i
								class="fa fa-clock-o"></i> 4:34 PM</span>
					</a></li>
					<li class="divider"></li>
					<li class="message-preview"><a href="#"> <span
							class="avatar"><img src="http://placehold.it/50x50"></span>
							<span class="name">John Smith:</span> <span class="message">Hey
								there, I wanted to ask you something...</span> <span class="time"><i
								class="fa fa-clock-o"></i> 4:34 PM</span>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">View Inbox <span class="badge">7</span></a></li>
				</ul></li>
			<li class="dropdown alerts-dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><i
					class="fa fa-bell"></i> Alerts <span class="badge">3</span> <b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Default <span class="label label-default">Default</span></a></li>
					<li><a href="#">Primary <span class="label label-primary">Primary</span></a></li>
					<li><a href="#">Success <span class="label label-success">Success</span></a></li>
					<li><a href="#">Info <span class="label label-info">Info</span></a></li>
					<li><a href="#">Warning <span class="label label-warning">Warning</span></a></li>
					<li><a href="#">Danger <span class="label label-danger">Danger</span></a></li>
					<li class="divider"></li>
					<li><a href="#">View All</a></li>
				</ul></li>
			<li class="dropdown user-dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><i
					class="fa fa-user"></i>&nbsp;<shiro:principal /><b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i> Inbox <span
							class="badge">7</span></a></li>
					<li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
					<li class="divider"></li>
					<li><a
						href="${createLink(controller : 'auth', action: 'signOut')}"><i
							class="fa fa-power-off"></i> Log Out</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</nav>