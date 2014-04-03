package hr.fleetman.events

import hr.fleetman.Car
import hr.fleetman.common.Money

abstract class  Event {

	static mapping = {
        tablePerHierarchy false
    }
	
	static constraints = {
		occurenceDate nullable: false
		id unique: true, nullable: false
	}
	
	static belongsTo=[car:Car]
	
	Date occurenceDate = new Date()
	boolean active
	Integer id
	String description
	Money cost

}
