<tbody>

	<g:each in="${instanceList}" status="i" var="instance">
		<tr>

			<g:each in="${columnOptions}" status="j" var="column">
				<td>
					<g:if test="${column.linkOptions != null}">
						
						<g:link controller="${column.linkOptions.controller}" action="${column.linkOptions.action}"
							id="${instance.getProperty(column.linkOptions.idProperty)}">
							${fieldValue(bean: instance, field: column.bindToProperty)}
						</g:link>
						
					</g:if> 
					
					<g:else>
						${fieldValue(bean: instance, field: column.bindToProperty)}
					</g:else>
					
				</td>
			</g:each>

		</tr>
	</g:each>
</tbody>


