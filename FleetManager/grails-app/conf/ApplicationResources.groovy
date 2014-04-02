modules = {
    bootstrap {
        resource url:'/js/lib/bootstrap.js'
		resource url: '/css/bootstrap.css'
    }
	
	sbadmin {
		dependsOn 'bootstrap'
		resource url:'/css/sb-admin.css'
	}
}