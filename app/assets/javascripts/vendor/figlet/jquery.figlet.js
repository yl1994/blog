/**
 * Figlet JS jQuery Plugin
 * 
 * Copyright (c) 2010 Scott González
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 * 
 * http://github.com/scottgonzalez/figlet-js
 * 
 * Requires figlet.js
 */
(function($) {

Figlet.loadFont = function(name, fn) {
	$.ajax({
		url: "assets/vendor/figlet/fonts/" + name + ".flf",
		dataType: "text",
		success: fn
	});
};

$.fn.figlet = function(text, font) {
	Figlet.write(text, font || $.fn.figlet.defaultFont, function(str) {
		console.log(str);
	});
	return this;
};

$.fn.figlet.defaultFont = "standard";

})(jQuery);
