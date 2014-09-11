<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
<%--	<content tag="validation"> <g:hasErrors bean="${enterDetailsCommand}">--%>
<%--		<div class="alert alert-danger alert-dismissable">--%>
<%--			<button type="button" class="close" data-dismiss="alert"--%>
<%--				aria-hidden="true">×</button>--%>
<%--			<ul>--%>
<%--				<g:eachError bean="${enterDetailsCommand}" var="error">--%>
<%--					<li--%>
<%--						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message--%>
<%--							error="${error}" /></li>--%>
<%--				</g:eachError>--%>
<%--			</ul>--%>
<%--		</div>--%>
<%--	</g:hasErrors>--%>
<%--	</content>--%>
	
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
			<g:textField class="form-control" name="currentRegistration"
				value="${enterDetailsCommand?.currentRegistration}" />
		</div>

		<!-- Other fields -->
		<g:submitButton name="confirm" value="Confirm"></g:submitButton>
		<g:submitButton name="back" value="Back"></g:submitButton>
		<g:submitButton name="cancel" value="Cancel"></g:submitButton>
	</g:form> </content>

</body>
</html>