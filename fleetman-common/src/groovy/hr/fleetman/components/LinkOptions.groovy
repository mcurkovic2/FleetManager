package hr.fleetman.components

/**
 * Class represents link optins
 * @author mcurkovic
 *
 */
class LinkOptions {
	/**
	 * Controller to be called after clicking on link
	 */
	String controller
	
	/**
	 * Action on specified controller to be called after click on link
	 */
	String action
	
	/**
	 * Value of this property will be passed to controller 
	 */
	String idProperty
}
