$(document).ready ->
	url = window.location
	# Will only work if string in href matches with location
	$('ul.nav a[href="' + url + '"]').parent().addClass('active')

	# Will also work for relative and absolute hrefs
	$('ul.nav a').filter ->
	    this.href == url
	.parent().addClass('active')