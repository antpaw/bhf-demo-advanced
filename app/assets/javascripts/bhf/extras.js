window.addEvent('bhfDomChunkReady', function(scope){
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
