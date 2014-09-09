<thead>
	<tr>
		<g:each in="${columns}" status="i" var="column">

			<th class="col-md-${column.cssClass}">
				${message(code: column.headerCode, default: 'TABLE_COLUMN')}
			</th>

		</g:each>
	</tr>
</thead>

