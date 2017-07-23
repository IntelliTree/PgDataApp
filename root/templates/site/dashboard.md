
[% SET chart_json = line_chart_data_json 
 title = 'Dashbord ' _ c.req.params.set
%]

<title>[% title %]</title>

<div style="height:350px;padding-bottom:25px;">
  <canvas width=700 height=250>
    <!-- here we're using an <img> tag so we can hijack its onload event -->
    <img 
      src="[% c.mount_url %]/assets/rapidapp/misc/static/s.gif" 
      onload='renderLineChart.call(this,
				"[% c.req.params.set %]",
				[% chart_json %]
			)' 
    >
  </canvas>
</div>
	

<div style="height:250px;">
  <canvas width=700 height=175>
    <img 
      src="[% c.mount_url %]/assets/rapidapp/misc/static/s.gif" 
      onload='renderLineChart.call(this,
				"Complaints",
				[% chart_json %]
			)' 
    >
  </canvas>
</div>
