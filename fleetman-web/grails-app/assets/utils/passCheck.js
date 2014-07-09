var passCheck = function() {
	var isPopulated = function(val) {
		return ((typeof val === 'string') && (val !== ''));
	};
	
	var validate = function(msgOk, msgNotOk) {
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();

		if (isPopulated(password1) || isPopulated(password2)) {

			$("#passMatch").show();
			
			if (password1 == password2) {
				$("#passMatch").removeClass("alert-danger");
				$("#passMatch").addClass("alert-success");
				$("#validate-status").text(msgNotOk);
			} else {
				$("#passMatch").removeClass("alert-success");
				$("#passMatch").addClass("alert-danger");
				$("#validate-status").text(msgOk);
			}
		} else {
			$("#passMatch").hide();
		}
	};
	
	return {
		init: function(msgOk, msgNotOk) {
			if (($("#password1") == null) || ($("#password2") == null)) {
				return;
			}
			
			if (isPopulated(msgOk) === false) {
				msgOk = 'Password match!';
			}
			
			if (isPopulated(msgNotOk) === false) {
				msgNotOk = 'Entered passwords do not match!';
			}
			
			
			$("#password2").keyup(validate(msgOk, msgNotOk));
			$("#password1").keyup(validate(msgOk, msgNotOk));
			
		}
	}
}();