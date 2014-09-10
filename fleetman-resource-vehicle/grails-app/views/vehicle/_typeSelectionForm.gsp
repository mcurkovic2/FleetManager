<div class="form-group ${hasErrors(bean: modelInstance, field: 'typeId', 'has-error')} ">
	<g:select id="typeSelection" 
		name='typeId' 
		class="form-control input-lg"
		value="${modelInstance?.typeId}"
		noSelection="${['':message(code:'newVehicle.typeSelection.selectType.label', default:'SELECT ONE...')]}"
		from="${modelInstance.types}" optionKey="id" optionValue="name"></g:select>
</div>