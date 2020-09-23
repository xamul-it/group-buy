/**
 * The dashboard module.
 */
var dashboardModule = angular.module('fs.dashboard');

dashboardModule.controller( 'DashboardController', function( $scope ) {

    // Chart.js Data
    this.data = {
      labels: ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre'],
      datasets: [
        {
          label: 'Incassi',
          fillColor: 'rgba(32, 160, 145,0.8)',
          highlightFill: 'rgba(32, 160, 145,1)',
          data: [500, 1000, 2000, 3500, 4000, 4500, 5000, 5500, 5900, 6000, 3000, 5600]
        },
        {
          label: 'Fatturato',
          fillColor: 'rgba(32, 160, 145,0.5)',
          highlightFill: 'rgba(32, 160, 145,0.75)',
          data: [1000, 1500, 2500, 4100, 4400, 5000, 5300, 5900, 5800, 5200, 1900, 5700]
        },
        {
          label: 'Uscite',
          fillColor: 'rgba(0,0,0,0.15)',
          highlightFill: 'rgba(0,0,0,0.3)',
          data: [800, 1200, 1500, 2500, 4000, 3500, 2500, 1500, 3000, 2800, 900, 1600]
        }
      ]
    };

	// Chart.js Options
	this.options =  {
		
		// Boolean - If we should show the scale at all
		showScale: true,
		
		// Boolean - Whether to show labels on the scale
		scaleShowLabels: true,
		
		// String - Template string for single tooltips
		tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %> €",

		// String - Template string for multiple tooltips
		multiTooltipTemplate: "<%if (datasetLabel){%><%=datasetLabel%>: <%}%><%= value %> €",//"<%= value %> €",
		
		// String - Colour behind the legend colour block
		multiTooltipKeyBackground: '#fff',
		
		// Sets the chart to be responsive
		responsive: true,

		//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
		scaleBeginAtZero : true,

		//Boolean - Whether grid lines are shown across the chart
		scaleShowGridLines : false,

		//String - Colour of the grid lines
		scaleGridLineColor : "rgba(0,0,0,.05)",

		//Number - Width of the grid lines
		scaleGridLineWidth : 1,

		//Boolean - If there is a stroke on each bar
		barShowStroke : false,

		//Number - Pixel width of the bar stroke
		barStrokeWidth : 1,

		//Number - Spacing between each of the X value sets
		barValueSpacing : 2,

		//Number - Spacing between data sets within X values
		barDatasetSpacing : 0,

		//String - A legend template
		legendTemplate : '<ul class="tc-chart-js-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].fillColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>'
	};
	
	// Custom Legend Variable, to link chart to the legend directive
	$scope.legend = '';

  });
