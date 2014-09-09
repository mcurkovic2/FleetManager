
<%@ page import="hr.fleetman.resources.Vehicle"%>
<!DOCTYPE html>
<html>
<%@ page import="hr.fleetman.components.TableOptions" %>
<%@ page import="hr.fleetman.components.TableColumnOptions" %>
<%@ page import="hr.fleetman.components.LinkOptions" %>
<head>
<meta name="layout" content="bodyTwoColumns" />
</head>
<body>
	<content tag="col1"> 
		<g:if test="${vehicleInstanceList == null || vehicleInstanceList.size() == 0}">
			<g:emptyTableMessage
				title="${message(code:'vehicle.emptyTable.title')}"
				message="${message(code:'vehicle.emptyTable.message')}"
				newItemButtonControllerAction="create"
				newItemButtonTitle="${message(code:'vehicle.action.new.label')}" />

		</g:if>
		<g:else>
		
		<g:dataTable 
			tableOptions="${new TableOptions()}"
			instanceList="${vehicleInstanceList}"
			columnOptions="${[
				new TableColumnOptions(
					headerCode: 'vehicle.vin.tableHeader', 
					cssClass:2,
					bindToProperty:'vin', 
					linkOptions: new LinkOptions(action:'show', idProperty:'id')),
				new TableColumnOptions(
					headerCode: 'vehicle.brand.tableHeader', 
					cssClass:2,
					bindToProperty:'brand.name' 
					),
				new TableColumnOptions(
					headerCode: 'vehicle.type.tableHeader', 
					cssClass:2,
					bindToProperty:'type.name' 
					),
				new TableColumnOptions(
					headerCode: 'vehicle.currentRegistration.tableHeader', 
					cssClass:2,
					bindToProperty:'currentRegistration' 
					)]}"
			 />
			
<%--			<div class="portlet portlet-default">--%>
<%--				<div class="portlet-heading">--%>
<%--					<div class="portlet-title">--%>
<%--						<h4>--%>
<%--							<g:message code="vehicle.vehicles.panelHeader" />--%>
<%--						</h4>--%>
<%--					</div>--%>
<%--					<div class="clearfix"></div>--%>
<%--				</div>--%>
<%--	--%>
<%--				<div class="portlet-body">--%>
<%--					<div class="row">--%>
<%--						<div class="col-lg-12">--%>
<%--							<g:link action="create" class="btn btn-default">--%>
<%--								<g:message code="vehicle.newVehicle.label"></g:message>--%>
<%--							</g:link>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--	--%>
<%--					<fm:emptyRow />--%>
<%--	--%>
<%--					--%>
<%--					<g:render template="vehiclesTable" model="[instanceList: vehicleInstanceList]"/>--%>
<%--				</div>--%>
<%--			</div>--%>
		</g:else> 
	</content>
	<content tag="javascript">
		<script>
			$(document).ready(function() {
			    $('#tblVehicles').dataTable();
			} );
	
		</script>
	</content>
</body>
</html>
