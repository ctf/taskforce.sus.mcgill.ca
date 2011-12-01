$(document).ready(function() {
	var printers = ['1b18a', '1b17a', '1b16a', 'hallway'];
	for (i in printers) {
		var printer = printers[i];
		var ajaxURL = 'http://staff.sus.mcgill.ca/services/getPrinterStatus.php?printer=' + printer + '&callback=?';
		/*$.getJSON(ajaxURL, function(data) {
			console.log(data);
		});*/
	}
});
