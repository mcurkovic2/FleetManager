


package hr.fleetman.users

import grails.test.mixin.*
import hr.fleetman.common.Contact
import hr.fleetman.security.SecurityService
import hr.fleetman.utils.Utils

import org.apache.shiro.crypto.hash.Sha512Hash

import spock.lang.*

@TestFor(RegisteredUserController)
@Mock([RegisteredUser, SecurityService])
class RegisteredUserControllerSpec extends Specification {
	
	def securityServiceMock
	def registeredUserServiceMock

	def registeredUserService = Stub(RegisteredUserService)
	
	def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        params["username"] = 'someValidName'
		params["passwordHash"] = Utils.encrypt("aaaaaa");
		params["firstName"] = "firstName"
		params["lastName"] = "lastName"
		params["description"] = "descr"
    }
	
	def createAdminUser() {
		return new RegisteredUser(
			username: "admin",
			passwordHash: new Sha512Hash("admin").toHex(),
			firstName : "James",
			lastName : "Hetfield",
			description: "James Alan Hetfield is the main songwriter, co-founder, lead vocalist, rhythm guitarist and lyricist for the American heavy metal band Metallica.",
			contact: new Contact(email: "test@gmail.com", phone:"0993100144")
			);
	}
	
	void setup() {
		securityServiceMock = mockFor(SecurityService)
		securityServiceMock.demand.getLoggedRegisteredUser { ->  createAdminUser() }
		controller.securityService = securityServiceMock.createMock()
		
//		registeredUserServiceMock = mockFor(RegisteredUserService)
//		registeredUserServiceMock.demand.findByUsername(1..10) {username -> 
//			if (username=="admin") {
//				createAdminUser() 
//			}
//		}
//		controller.registeredUserService = registeredUserServiceMock.createMock()
		registeredUserService.findByUsername(_) >> {args -> 

			if (args[0]=="admin") {
				createAdminUser() 
			}
		}
		controller.registeredUserService = registeredUserService
	}
	
    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.registeredUserInstanceList
            model.registeredUserInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.newRegisteredUserCommandInstance!= null
			model.newRegisteredUserCommandInstance.username == null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
			
			//NO PASSWORD PROVIDED
            def newRegisteredUserCommand = new NewRegisteredUserCommand(username: "user", confirmedPassword:"")
			controller.save(newRegisteredUserCommand)

        then:"The create view is rendered again with the correct model"
		
			
           	model.newRegisteredUserCommandInstance != null
            view == '/registeredUser/create'

        when:"The save action is executed with a valid instance"
            response.reset()
            def validNewRegisteredUserCommand = new NewRegisteredUserCommand(username: "user", newPassword:"aaa123456", confirmedPassword: "aaa123456")

            controller.save(validNewRegisteredUserCommand)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/registeredUser/show/1'
            controller.flash.message != null
            RegisteredUser.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def registeredUser = new RegisteredUser(params)
            controller.show(registeredUser)

        then:"A model is populated containing the domain instance"
            model.registeredUserInstance == registeredUser
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def registeredUser = new RegisteredUser(params)
            controller.edit(registeredUser)

        then:"A model is populated containing the domain instance"
            model.registeredUserInstance == registeredUser
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/registeredUser/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def registeredUser = new RegisteredUser()
            registeredUser.validate()
            controller.update(registeredUser)

        then:"The edit view is rendered again with the invalid instance"
            view == 'profile'
            model.registeredUserInstance == registeredUser
			flash.tab == "UPDATE"
			flash.subMenu == "BASICINFO"

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            registeredUser = new RegisteredUser(params).save(flush: true)
            controller.update(registeredUser)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/registeredUser/profile"
			flash.message != null
			
    }

    void "Test that the delete action deletes an instance if it exists"() {
			
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/registeredUser/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def registeredUser = new RegisteredUser(params).save(flush: true)

        then:"It exists"
            RegisteredUser.count() == 1
			
		
        when:"The domain instance is passed to the delete action"
            controller.delete(registeredUser)

        then:"The instance is deleted"
            RegisteredUser.count() == 0
            response.redirectedUrl == '/registeredUser/index'
            flash.message != null
    }
	
	void "Test that displaying profile page displays profile page vith currently logged user data" (){
		when: "The profile action is called"
			response.reset()
			controller.profile()
		then: "A registeredUserInstance of currently logged user is shown"
			model.registeredUserInstance != null
			model.registeredUserInstance.username == "admin"
			view == 'profile' 
		
	}
	
	void "Test change password" () {
		given:
			def command = new ChangePasswordCommand(username:"unknown", newPassword:"bla", confirmedPassword:"bla");
			command.validate()
			
			def command2 = new ChangePasswordCommand(username:"admin", newPassword:"bla", confirmedPassword:"blaNOTGOOD");
			command2.validate()
			
			def validCommand = new ChangePasswordCommand(username:"admin", newPassword:"blabla", confirmedPassword:"blabla");
			validCommand.validate()
			
		when: "Invalid (uknown username) ChangePasswordCommand is provided" 
			request.contentType = FORM_CONTENT_TYPE
			controller.changePassword(command)
		then: "Redirect back to index"
			response.redirectedUrl == '/registeredUser/index'
			
		when: "Invalid (no validation) ChangePasswordCommand is provided"
			response.reset()
			request.contentType = FORM_CONTENT_TYPE
			
			controller.changePassword(command2)
		then: "Change profile view is rendered with flash.tab=PROFILE flash.submenu=changePassword"
			view == "/registeredUser/profile"
			model.registeredUserInstance != null //changePasswordCommand
			model.changePasswordCommand != null
			def tabPosition = flash.tabPosition
			tabPosition != null
			
		when: "Ok ChangePasswordCommand is provided"
			response.reset()
			request.contentType = FORM_CONTENT_TYPE
			controller.changePassword(validCommand)
		then: "Change profile view is rendered with flash.tab=PROFILE flash.submenu=changePassword"
			view == "profile"
			flash.tabPosition != null
			flash.message == "RegisteredUser.profile.changePassword.success"
			
	}
	
	
}
