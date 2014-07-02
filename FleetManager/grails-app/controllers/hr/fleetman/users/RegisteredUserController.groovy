package hr.fleetman.users



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import hr.fleetman.common.Contact
import hr.fleetman.security.SecurityService;
import hr.fleetman.utils.Utils

import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject
import org.springframework.util.Assert

@Transactional(readOnly = true)
class RegisteredUserController {
	
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def securityService
	def registeredUserService

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond RegisteredUser.list(params), model:[registeredUserInstanceCount: RegisteredUser.count()]
	}

	def show(RegisteredUser registeredUserInstance) {
		respond registeredUserInstance
	}

	def create() {
		respond new NewRegisteredUserCommand()
	}

	@Transactional
	def editRole(RegisteredUser registeredUserInstance) {
		respond registeredUserInstance
	}

	@Transactional
	def save(NewRegisteredUserCommand newRegisteredUserCommand) {
		if (newRegisteredUserCommand == null) {
			notFound()
			return
		}

		newRegisteredUserCommand.validate()

		if (newRegisteredUserCommand.hasErrors()) {
			def map = [newRegisteredUserCommandInstance: newRegisteredUserCommand]
			render(view: "create", model: map)
			return
		}

		def passwordHash = Utils.encrypt(newRegisteredUserCommand.confirmedPassword);

		def registeredUserInstance = new RegisteredUser()

		bindData(registeredUserInstance, newRegisteredUserCommand)
		bindData(registeredUserInstance, [passwordHash: passwordHash])
		bindData(registeredUserInstance, [active: 1])

		if (registeredUserInstance.save(flush:true)) {
			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.created.message',
					args: [
						message(code: 'registeredUserInstance.label', default: 'RegisteredUser'),
						registeredUserInstance.username
					])
					redirect registeredUserInstance
				}
				'*' { respond registeredUserInstance, [status: CREATED] }
			}

		} else {
			log error "Could not save registeredUser instance. username = "	 registeredUserInstance.username
		}


	}

	def edit(RegisteredUser registeredUserInstance) {
		respond registeredUserInstance
	}

	@Transactional
	def update(RegisteredUser registeredUserInstance) {
		if (registeredUserInstance == null) {
			notFound()
			return
		}

		if (registeredUserInstance.hasErrors()) {
			respond registeredUserInstance.errors, view:'profile'
			flash.tab = "UPDATE"
			flash.subMenu = "BASICINFO"
			flash.tabposition = new TabPosition()
			return
		}
		
		registeredUserInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'RegisteredUser.label', default: 'RegisteredUser'),
					registeredUserInstance.username
				])
				redirect (action: "profile", model:[registeredUserInstance])
			}
			'*'{ respond registeredUserInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(RegisteredUser registeredUserInstance) {

		if (registeredUserInstance == null) {
			notFound()
			return
		}

		def loggedRegisteredUser = securityService.getLoggedRegisteredUser()
		if (registeredUserInstance.username == loggedRegisteredUser.username){
			flash.message = message(code: 'RegisteredUser.delete.currentUser.error', args: [
				registeredUserInstance.username
			])
			redirect registeredUserInstance
			return
		}

		registeredUserInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'RegisteredUser.label', default: 'RegisteredUser'),
					registeredUserInstance.username
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	@Transactional
	def changePassword(ChangePasswordCommand changePasswordCommand) {
		def registeredUserInstance = registeredUserService.findByUsername(changePasswordCommand.username)
		
		if (registeredUserInstance == null) {
			notFound()
			return
		}
		
		if (changePasswordCommand.hasErrors()) {
			render view:"profile", model:[registeredUserInstance: registeredUserInstance, changePasswordCommand: changePasswordCommand]
			def tabPosition = new TabPosition(tab: "profile-settings", submenu:"changePassword")
			flash.tabPosition = tabPosition
			return
		}
		
		flash.message = "RegisteredUser.profile.changePassword.success"
		
		
		respond registeredUserInstance, view:"profile"

	}

	def profile() {
		RegisteredUser registeredUserInstance = securityService.getLoggedRegisteredUser()
		if (registeredUserInstance != null) {
			respond registeredUserInstance, [view:"profile"]
		} else {
			throw new IllegalStateException("No user in session!");
		}
	}

	def profileById() {
		Assert.hasText(params.id);
		RegisteredUser registeredUserInstance = RegisteredUser.findById(params.id)
		if (registeredUserInstance != null) {
			respond registeredUserInstance, [view:"profile"]
		} else {
			throw new IllegalStateException("No user in session!");
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'registeredUserInstance.label', default: 'RegisteredUser'),
					params.username
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}

class TabPosition {
			
		String tab
		String submenu
	}

class ChangePasswordCommand {
	def securityService
	
	String username
	
	String newPassword
	String confirmedPassword
	
	
	static constraints = {
		username null:false, blank: false
		newPassword nullable: false, blank: false, size: 3..20
		confirmedPassword (nullable: false, blank: false,
			validator: { passwd, cmd ->
				if (passwd != cmd.newPassword) {
					 return ["ChangePasswordCommand.confirmedPassword.doesNotMatch"]
				} 
			}
		);
	}
}

class NewRegisteredUserCommand {

	String username
	String firstName
	String lastName
	String description
	String email
	String phone
	String newPassword
	String confirmedPassword

	static constraints = {
		importFrom RegisteredUser
		newPassword (nullable: false, blank: false, size: 3..20,)
		confirmedPassword (nullable: false, blank: false,			
			validator: { passwd, cmd ->
				return passwd == cmd.newPassword
			}
		);
	}

}

