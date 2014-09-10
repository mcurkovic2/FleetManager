<div>
	<g:submitButton class="btn btn-default" name="next" value="${message(code:'newVehicle.brandSelection.nextToTypeSelection.label')}"></g:submitButton>
	<g:submitButton class="btn btn-green"  name="newBrand" value="New Brand" value="${message(code:'newVehicle.brandSelection.newBrand.label')}"></g:submitButton>
<%--	<g:submitButton class="btn btn-red"  name="cancel" value="${message(code:'defalut.cancel.label')}"></g:submitButton>--%>
	
	<g:link action="cancel" name="cancel">${message(code:'defalut.cancel.label')}</g:link>
</div>