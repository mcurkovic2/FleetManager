var appConfig = function() {
	var internalCallbacks = [];
	return {
		addCallback : function(callback) {

			if (callback.init == null) {
				appConfig.log("no callback function defined for name=" + name)
			}

			internalCallbacks.push(callback);
		},
		initialize : function() {
			for (var i = 0; i < internalCallbacks.length; i++) {
				internalCallbacks[i].init();
			}
		},
		log : function(entry) {
			//TODO check console
			console.log(entry);
		}

	}
}();
