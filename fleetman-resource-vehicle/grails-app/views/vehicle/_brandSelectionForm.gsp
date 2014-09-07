<div class="form-group ${hasErrors(bean: modelInstance, field: 'brandId', 'has-error')} ">
	<g:select id="brandSelection" 
		name="brandId" 
		class="form-control input-lg"
		value="${modelInstance?.brandId}"
		noSelection="${['':message(code:'newVehicle.brandSelection.selectBrand.label', default:'SELECT ONE...')]}" 
		from="${modelInstance.brands}"
		optionKey="id" 
		optionValue="name"/>
</div>