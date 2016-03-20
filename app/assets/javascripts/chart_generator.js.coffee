@init_universal_chart = (container ,server_path, chart_title, log_start, log_end) ->
	console.log server_path
	$.ajax(server_path, 
		type: "GET"
		success: (data) ->
			console.log data
			init_line_chart(container, data, "Einheiten", "Zeitpunkt", chart_title, log_start, log_end)
	)

init_line_chart = (container, values, x_axis_desc, y_axis_desc, chart_title, log_start, log_end) ->
	console.log values.times
	$(container).highcharts({
		chart: {
			type: 'line'
		},
		title: {
			text: chart_title,
			x: -20
		},
		subtitle: {
			text: 'vom ' + log_start + " bis " + log_end,
			x: -20
		},
		xAxis: {
			categories: values.times
			labels: {
				enabled:false,
				y : 20,
				rotation: -45,
				align: 'right'
			}
		},
		yAxis: {
			title: {
				text: x_axis_desc
			},
			plotLines: [{
				value: 0,
				width: 1,
				color: '#808080'
			}]
		},
		tooltip: {
			headerFormat: "",
			pointFormat: '{series.name}:<br/>{point.y:,.0f}'
		}
		legend: {
			layout: 'vertical',
			align: 'right',
			verticalAlign: 'middle',
			borderWidth: 0
		},
		series: values.series
	});