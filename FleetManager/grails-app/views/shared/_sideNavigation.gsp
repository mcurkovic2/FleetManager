<!-- begin SIDE NAVIGATION -->
<nav class="navbar-side" role="navigation">
	<div class="navbar-collapse sidebar-collapse collapse">
		<ul id="side" class="nav navbar-nav side-nav">
			<!-- begin SIDE NAV USER PANEL -->
			<li class="side-user hidden-xs"><img class="img-circle"
				src="${assetPath(src: 'img/profile-pic.jpg')}" alt="">
				<p class="welcome">
					<i class="fa fa-key"></i> Logged in as
				</p>
				<p class="name tooltip-sidebar-logout">
					John <span class="last-name">Smith</span> <a style="color: inherit"
						class="logout_open" href="#logout" data-toggle="tooltip"
						data-placement="top" title="Logout"><i class="fa fa-sign-out"></i></a>
				</p>
				<div class="clearfix"></div></li>
			<!-- end SIDE NAV USER PANEL -->
			<!-- begin SIDE NAV SEARCH -->
			<li class="nav-search">
				<form role="form">
					<input type="search" class="form-control" placeholder="Search...">
					<button class="btn">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</li>
			<!-- end SIDE NAV SEARCH -->
			<!-- begin DASHBOARD LINK -->
			<shiro:hasPermission permission="dashboard:index">
				<li><a href="${createLink(controller:'dashboard')}"> <i
						class="fa fa-dashboard"></i> <g:message
							code="main.menu.menuItem.dashboard" />
				</a></li>
			</shiro:hasPermission>
			<shiro:hasPermission permission="resources:index">
				<li><a href="${createLink(controller:'car')}"> <i
						class="fa fa-dashboard"></i> <g:message
							code="main.menu.menuItem.resources" />
				</a></li>
			</shiro:hasPermission>
			<shiro:hasPermission permission="registeredUser:index">
				<li><a href="${createLink(controller:'registeredUser')}"> <i
						class="fa fa-dashboard"></i> <g:message
							code="main.menu.menuItem.users" />
				</a></li>
			</shiro:hasPermission>
			<shiro:hasPermission permission="reports:index">
				<li><a href="${createLink(controller:'reports', action:'index')}"> <i
						class="fa fa-dashboard"></i> <g:message
							code="main.menu.menuItem.reports" />
				</a></li>
			</shiro:hasPermission>

		</ul>
		<!-- /.side-nav -->
	</div>
	<!-- /.navbar-collapse -->
</nav>
<!-- /.navbar-side -->
<!-- end SIDE NAVIGATION -->