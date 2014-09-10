<div>
        <g:submitButton class="btn btn-default" name="back" value="${message(code:'newVehicle.typeSelection.backToBrandSelection.label')}"></g:submitButton>
		<g:submitButton class="btn btn-default" name="next" value="${message(code:'newVehicle.typeSelection.nextToEnterDetails.label')}"></g:submitButton>		
		<g:submitButton class="btn btn-green" name="newType" value="${message(code:'newVehicle.typeSelection.newType.label')}"></g:submitButton>

		<g:link action="cancel" name="cancel">${message(code:'defalut.cancel.label')}</g:link>
</div>