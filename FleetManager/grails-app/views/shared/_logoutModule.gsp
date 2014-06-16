<!-- Logout Notification Box -->
<div id="logout">
	<div class="logout-message">
		<img class="img-circle img-logout"
			src="${assetPath(src: 'img/profile-pic.jpg')}" alt="">
		<h3>
			<i class="fa fa-sign-out text-green"></i> <g:message code="default.message.logoutQuestion"/>
		</h3>
		<p>
		<g:message	code="default.message.logout"/>
			
		</p>
		<ul class="list-inline">
			<li><a
				href="${createLink(controller : 'auth', action: 'signOut')}" class="btn btn-green"> <strong><g:message
							code="default.button.logout" /></strong></a></li>
			<li>
				<button class="logout_close btn btn-green">
					<g:message code="default.button.cancel"/>
				</button>
			</li>
		</ul>
	</div>
</div>
