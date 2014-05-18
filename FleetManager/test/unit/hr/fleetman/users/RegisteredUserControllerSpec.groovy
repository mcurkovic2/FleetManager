package hr.fleetman.users



import grails.test.mixin.*
import spock.lang.*

@TestFor(RegisteredUserController)
@Mock(RegisteredUser)
class RegisteredUserControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
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
            model.registeredUserInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def registeredUser = new RegisteredUser()
            registeredUser.validate()
            controller.save(registeredUser)

        then:"The create view is rendered again with the correct model"
            model.registeredUserInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            registeredUser = new RegisteredUser(params)

            controller.save(registeredUser)

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
            view == 'edit'
            model.registeredUserInstance == registeredUser

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            registeredUser = new RegisteredUser(params).save(flush: true)
            controller.update(registeredUser)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/registeredUser/show/$registeredUser.id"
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
}
