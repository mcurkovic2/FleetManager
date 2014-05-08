package hr.fleetman.filters

class FleetmanFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
	
            }
            after = { Map model ->
	
            }
            afterView = { Exception e ->

            }
        }
    }
}
