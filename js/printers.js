$(document).ready(function() {
	var ajaxURL = 'printers.php';
	var updatePrinters = function() {
		$.getJSON(ajaxURL, function(printerData) {
			if (printerData == null) {
				// Not working - possibly network problems; try again in 30 seconds
				setTimeout(function() {
					updatePrinters();
				}, 30000);
				return;
			}

			for (var printer in printerData) {
                console.log(printer);
				var isWorking = printerData[printer];
				var printerSelector = $('#printer-' + printer);

				// If the state is 0, make it OK; else, DOWN
				var stateElement = $(printerSelector).find('.state');
				var changeState = (stateElement.hasClass('ok') && !isWorking) || (stateElement.hasClass('down') && isWorking);
				if (changeState) {
					if (!isWorking) {
						// Printer has gone down - change the text and the class
						$(stateElement).text('DOWN').removeClass('ok').addClass('down');
					} else {
						$(stateElement).text('OK').removeClass('down').addClass('ok');
					}
				}

                /*
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
                */
			}

			// Update every 5 seconds until the end of time
			setTimeout(function() {
				updatePrinters();
			}, 5000);
		});
	};
	updatePrinters();
});
