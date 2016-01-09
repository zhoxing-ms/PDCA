<!doctype html>
<html lang="en">
	<head>
		<script type="text/javascript"
			src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
		<script type="text/javascript"
			src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
		<script type="text/javascript"
			src="http://cdn.hcharts.cn/highcharts/exporting.js"></script>
		<script>
	
var pe ={ 
    "p1": [
    { "firstName": "Brett", "per": 40 ,"sa":"rw"},
    { "firstName": "Jason", "per": 60 ,"sa":"rw"}

   ],
  "p2": [
    { "firstName": "Isaac", "per": 30,"sa":"ww"},
    { "firstName": "Tad",   "per": 20,"sa":"ew"},
    { "firstName": "Frank", "per": 20,"sa":"rw"},
    { "firstName": "Brett", "per": 20,"sa":"tw"},
    { "firstName": "Jason", "per": 10,"sa":"yw"}
    
   ]
  }


$(function () {
    var chart;
 var browsers = [];
             if (pe.p1 != null) {
                 $.each(pe.p1, function (i,d) {
                     browsers.push([d.firstName, d.per]);
                 });
             } 
    
    $(document).ready(function () {
    	
    	// Build the chart
        $('#container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: name
      
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: browsers
            }]
        });
    });
    
});	
		
</script>
	</head>
	<body>
		<div id="container" style="min-width: 700px; height: 400px"></div>

	</body>
</html>