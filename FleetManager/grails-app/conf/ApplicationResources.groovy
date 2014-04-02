modules = {
    application {
        resource url:'application.js'
		resource url: '/css/bootstrap.css'
    }
	
	sbadmin {
		dependsOn 'bootstrap'
		resource url:'/css/sb-admin.css'
	}
}