
<g:panelHeader title="${tableOptions.panelTitle}"/>

<div class="table-responsive">
	<table id="${tableOptions.tableId}" class="table table-striped">
		<g:dataTableHeader columnOptions="${columnOptions}" />
		<g:dataTableBody columnOptions="${columnOptions}" instanceList="${instanceList}" />
	</table>

</div>
<g:panelFooter  />

<script>

	var dataTableMod${tableOptions.tableId} = function(){
		return {
			init: function() {
			    $('#${tableOptions.tableId}').dataTable();
			}
		}
	}();
	
	appConfig.addCallback(dataTableMod${tableOptions.tableId});
			
</script>



