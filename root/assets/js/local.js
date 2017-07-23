
function renderLineChart(title,cData) {

  var data = {
      labels: [],
      datasets: []
  };
  
	var chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};
	
	function appendDatSet(ndx,color,name,val) {
		data.datasets[ndx] = data.datasets[ndx] || {
			label: name,
			backgroundColor: color,
			borderColor: color,
			borderWidth: 1,
			data: []
		};
		data.datasets[ndx].data.push( val );
	}
	
  Ext.each(cData,function(itm){
    data.labels.push(itm.day);
		
		appendDatSet(0,chartColors.red,'A (Kg/Hr)',itm.a_kg_hr);
		appendDatSet(1,chartColors.blue,'B (Kg/Hr)',itm.b_kg_hr);

  },this);


  // We expect 'this' scope to be an <img> within the target <canvas> element
  var canvas = this.parentElement;
  
  if(canvas && canvas.tagName && canvas.tagName.toLowerCase() == 'canvas') {
  
    var options = {};
  
    var ctx = canvas.getContext("2d");
    var myBarChart = new Chart(ctx, {
      type: 'line',
      data: data,
      options: options
    });
  }

};
