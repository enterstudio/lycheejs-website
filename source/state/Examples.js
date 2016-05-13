
lychee.define('app.state.Examples').requires([
	'lychee.data.HTML',
	'lychee.data.MD'
]).includes([
	'lychee.app.State',
	'lychee.event.Emitter'
]).tags({
	platform: 'html'
}).exports(function(lychee, global, attachments) {

	var _README  = {
		'default': '<p>No instructions given.</p>'
	};
	var _RELEASE = [];



	/*
	 * HELPERS
	 */

	var _replace_template = function(template, object) {

		template = typeof template === 'string' ? template : '';
		object   = object instanceof Object     ? object   : null;


		if (object !== null) {

			var buffer = '' + template;
			var keys   = Object.keys(object);
			var values = Object.values(object);


			keys.forEach(function(key, k) {

				var value    = values[k];
				var pointers = [];
				var pointer  = buffer.indexOf('${' + key + '}');

				while (pointer !== -1) {
					pointers.push(pointer);
					pointer = buffer.indexOf('${' + key + '}', pointer + 1);
				}


				var offset = 0;

				pointers.forEach(function(index) {
					buffer  = buffer.substr(0, index + offset) + value + buffer.substr(index + offset + key.length + 3);
					offset += (value.length - (key.length + 3));
				});

			});


			return buffer;

		}


		return template;

	};

	var _ui_update = function() {

		_ui_render_selection.call(this);
		_ui_render_details.call(this);

	};

	var _ui_render_selection = function() {

		if (_RELEASE.length > 0) {

			var code = '';
			var id   = (this.__example !== null ? this.__example.identifier : 'boilerplate');


			code = _RELEASE.map(function(example, index) {

				var checked = id === example.identifier;
				var chunk   = '';

				chunk += '<li>';
				chunk += '<input id="examples-selection-content-' + index + '" name="identifier" type="radio" value="' + example.identifier + '"' + (checked ? ' checked' : '') + '>';
				chunk += '<label for="examples-selection-content-' + index + '">' + example.identifier + '</label>';
				chunk += '</li>';

				return chunk;

			}).join('');


			ui.render(code, '#examples-selection-content');

		} else {

			ui.render('<li>Server is re-bundling.</li>', '#examples-selection-content');

		}

	};

	var _ui_render_details = function() {

		var that = this;


		var example = this.__example || null;
		if (example !== null) {

			var readme = _README[example.readme] || null;
			if (readme !== null) {

				var code = '';
				var size = parseInt(example.size, 10);
				if (!isNaN(size)) {
					size = (size / 1000 / 1000).toFixed(2) + ' MB';
				}


				code += '<h3><b>2</b>Install ' + example.identifier + ' Example</h3>';
				code += '<table>';
				code += '<tr><th>Architectures</th><td>' + example.architectures.join(', ') + '</td></tr>';
				code += '<tr><th>Runtimes</th><td>'      + example.runtimes.join(', ')      + '</td></tr>';
				code += '<tr class="div"></tr>';
				code += '<tr><th>File Name</th><td>'     + example.package                  + '</td></tr>';
				code += '<tr><th>File Size</th><td>'     + size                            + '</td></tr>';
				code += '<tr><th>MD5 Sum</th><td>'       + example.hash                     + '</td></tr>';
				code += '<tr class="div"></tr>';
				code += '</table>';

				code += _replace_template(readme, example);

				ui.render(code, '#examples-detail');

			} else if (example.readme !== undefined) {

				readme = new Stuff('/download/example/' + example.readme);
				readme.onload = function() {

					var data = lychee.data.HTML.encode(lychee.data.MD.decode(this.buffer));
					if (data !== null) {
						_README[example.readme] = data;
					} else {
						_README[example.readme] = _README['default'];
					}

					_ui_render_details.call(that);

				};
				readme.load();

			} else {

				example.readme = 'default';
				_ui_render_details.call(that);

			}

		}

	};



	/*
	 * IMPLEMENTATION
	 */

	var Class = function(main) {

		lychee.app.State.call(this, main);
		lychee.event.Emitter.call(this);


		this.__example = null;



		/*
		 * INITIALIZATION
		 */

		this.bind('submit', function(id, settings) {

			if (id === 'examples-selection') {

				var identifier = settings.identifier || null;
				if (identifier !== null) {

					var filtered = _RELEASE.filter(function(example) {
						return example.identifier === identifier;
					});

					if (filtered.length > 0) {
						this.__example = filtered[0];
						_ui_render_details.call(this);
					}

				}

			}

		}, this);

		this.bind('download', function() {
			global.open('http://lycheejs.org/download/example/' + this.__example.package);
		}, this);

	};


	Class.prototype = {

		/*
		 * CUSTOM API
		 */

		update: function(clock, delta) {

		},

		enter: function(oncomplete) {

			var that   = this;
			var config = new Config('/download/examples/release.json');

			config.onload = function() {

				var buffer = this.buffer;
				if (buffer !== null) {

					_RELEASE = Object.values(buffer.example);

					that.__example = _RELEASE.filter(function(example) {
						return example.identifier === 'boilerplate';
					})[0] || null;

				}


				_ui_update.call(that);
				oncomplete(true);

			};

			config.load();

		},

		leave: function(oncomplete) {

			oncomplete(true);

		}

	};


	return Class;

});

