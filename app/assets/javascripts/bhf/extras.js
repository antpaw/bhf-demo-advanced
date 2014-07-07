window.addEvent('bhfDomChunkReady', function(scope){
	var showAddressCheckbox = scope.getElementById('location_show_address');
	var addressTextarea = scope.getElementById('location_address');
	if (showAddressCheckbox) {
		var checkboxChangeCallback = function() {
			addressTextarea.getParent('.node').toggleClass('hide', !this.checked);
		};
		checkboxChangeCallback.call(showAddressCheckbox.addEvent('change', checkboxChangeCallback));
	}
});
