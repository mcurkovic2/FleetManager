package hr.fleetman.resources.vehicle

class Brand implements Serializable{

    static constraints = {
		name nullable:false, size: 3..50
    }
	
	String name

	static hasMany =[types:Type]

}
