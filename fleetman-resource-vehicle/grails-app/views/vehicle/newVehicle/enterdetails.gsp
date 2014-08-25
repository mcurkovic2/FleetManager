<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1">
	<h2>Enter Details</h2>
	<g:form>

		<div
			class="form-group ${hasErrors(bean: enterDetailsCommand, field: 'vin', 'has-error')} ">
			<label class="control-label" for="vin"> <g:message
					code="newVehuicle.vin.label" default="Vin" />
			</label>
			<g:textField class="form-control" name="vin"
				value="${enterDetailsCommand?.vin}" />
		</div>
		
		<div
			class="form-group ${hasErrors(bean: enterDetailsCommand, field: 'currentRegistration', 'has-error')} ">
			<label class="control-label" for="vin"> <g:message
					code="newVehuicle.currentRegistration.label" default="Current Registration" />
			</label>
			<g:textField class="form-control" name="vin"
				value="${enterDetailsCommand?.currentRegistration}" />
		</div>

		<!-- Other fields -->
		<g:submitButton name="confirm" value="Confirm"></g:submitButton>
		<g:submitButton name="back" value="Back"></g:submitButton>
		<g:submitButton name="cancel" value="Cancel"></g:submitButton>
	</g:form> </content>

</body>
</html>