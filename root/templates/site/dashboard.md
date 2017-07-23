# Dashboard

  <canvas width="100%">
    <!-- here we're using an <img> tag so we can hijack its onload event -->
    <img 
      src="[% c.mount_url %]/assets/rapidapp/misc/static/s.gif" 
      onload='renderLineChart.call(this,
				"Maker Stream Data",
				[% line_chart_data_json %]
			)' 
    >
  </canvas>