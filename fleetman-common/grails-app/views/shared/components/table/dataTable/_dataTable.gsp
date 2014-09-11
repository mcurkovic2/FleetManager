<g:panelHeader title="${panelTitle}" actionButtonsTemplate="${upperActionButtonsTemplate}" actionButtonsTemplatePlugin="${upperActionButtonsTemplatePlugin}"/>
	<div class="table-responsive">
		<table id="${tableId}" class="table table-striped">
			<g:dataTableHeader columnOptions="${columnOptions}" />
			<g:dataTableBody columnOptions="${columnOptions}" instanceList="${instanceList}" />
		</table>
	</div>
<g:panelFooter/>

<script>

	var dataTableMod${tableId} = function(){
		return {
			init: function() {
			    $('#${tableId}').dataTable();
			}
		}
	}();
	
	appConfig.addCallback(dataTableMod${tableId});
			
</script>



