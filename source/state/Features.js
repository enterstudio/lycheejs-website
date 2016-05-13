
lychee.define('app.state.Features').includes([
	'lychee.app.State'
]).tags({
	platform: 'html'
}).exports(function(lychee, global, attachments) {

	var Class = function(main) {

		lychee.app.State.call(this, main);

	};


	Class.prototype = {

		/*
		 * CUSTOM API
		 */

		update: function(clock, delta) {

		},

		enter: function(oncomplete) {
			oncomplete(true);
		},

		leave: function(oncomplete) {
			oncomplete(true);
		}

	};


	return Class;

});

