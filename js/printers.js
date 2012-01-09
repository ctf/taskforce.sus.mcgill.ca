$(document).ready(function() {
	var printers = ['1b18a', '1b17a', '1b16a', 'backup'];
	var ajaxURL = '/taskforce/printers.php';
	var updatePrinters = function() {
		$.getJSON(ajaxURL, function(data) {
			for (i in printers) {
				var printer = printers[i];
				var printerData = data[printer];
				var printerSelector = $('#printer-' + printer);

				// If the state is 0, make it OK; else, DOWN
				var stateElement = $(printerSelector).find('.state');
				var state = printerData.state;
				var changeState = (stateElement.hasClass('ok') && state == 1) || (stateElement.hasClass('down') && state == 0);
				if (changeState) {
					if (state == 1) {
						// Printer has gone down - change the text and the class
						$(stateElement).text('DOWN').removeClass('ok').addClass('down');
					} else {
						$(stateElement).text('OK').removeClass('down').addClass('ok');
					}
				}

				// Set the number of jobs
				var jobsElement = $(printerSelector).find('.jobs');
				if (jobsElement.text() !== printerData.jobs) { // both are strings
					var pluralElement = $(printerSelector).find('.plural');
					$(jobsElement).text(printerData.jobs);

					// Check if we need to change the pluralisation of "job"
					if (printerData.jobs == '1') {
						if ($(pluralElement).text() == 's') {
							$(pluralElement).text('');
						}
					} else {
						if ($(pluralElement).text() == '') {
							$(pluralElement).text('s');
						}
					}
				}
			}

			// Update every 5 seconds until the end of time
			setTimeout(function() {
				updatePrinters();
			}, 5000);
		});
	};
	updatePrinters();
});
