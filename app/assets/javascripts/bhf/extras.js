// initHelper is something like $(document).ready() in jQuery, with a scope variable that alway should be used as a scope for the dom
initHelper(function(scope){
	var toggleVal = true;
	var checkAll = scope.getElementById('check_all');
	if (checkAll) {
		checkAll.addEvent('change', function(){
			scope.getElements('.key_val_check_box_holder input').each(function(elem){
				elem.checked = toggleVal;
			});
			toggleVal = !toggleVal;
		});
	}
});
