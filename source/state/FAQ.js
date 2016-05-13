
lychee.define('app.state.FAQ').requires([
	'lychee.data.HTML',
	'lychee.data.MD'
]).includes([
	'lychee.app.State',
	'lychee.event.Emitter'
]).tags({
	platform: 'html'
}).exports(function(lychee, global, attachments) {

	var _CONTENT = attachments["md"];



	/*
	 * HELPERS
	 */

	var _ui_update = function() {

		_ui_render_details.call(this);

	};

	var _ui_render_details = function() {

		var that = this;

		var content = _CONTENT || null;
		if (content !== null) {

			var blob = lychee.data.MD.decode(content.buffer);
			var data = lychee.data.HTML.encode(blob);

			ui.render('' + data, '#faq');

		}

	};



	/*
	 * IMPLEMENTATION
	 */

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

			_ui_update.call(this);

			oncomplete(true);

		},

		leave: function(oncomplete) {

			oncomplete(true);

		}

	};


	return Class;

});

