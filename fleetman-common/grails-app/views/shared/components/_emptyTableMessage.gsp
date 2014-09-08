<div class="row">
	<div class="col-lg-12">
		<div class="tile green">
			<h4>
				${title}
			</h4>
			<p>
				${message}&nbsp;
				<g:if test="${newItemButtonControllerAction!=null}">
					
						<g:defaultButton action="${newItemButtonControllerAction}"
							title="${newItemButtonTitle}" />
					
				</g:if>
			</p>
		</div>
	</div>

	<!-- /.col-lg-12 -->
</div>