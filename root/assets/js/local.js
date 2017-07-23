
function renderLineChart(setcode,cData) {

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
			radius: 0,
			fill: true,
			data: []
		};
		data.datasets[ndx].data.push( val );
	}
	
	if(setcode == 'Complaints') {
		
	  Ext.each(cData,function(itm){
	    data.labels.push(itm.day);
			appendDatSet(0,chartColors.red,'Complaints',itm.complaints);
			appendDatSet(1,chartColors.grey,'All Comments',itm.all_comments);
			appendDatSet(2,chartColors.orange,'Downtime Events (500x)',(itm.downtimes/500));
	  },this);
		
	}
	else if (setcode == 'one') {
	  Ext.each(cData,function(itm){
	    data.labels.push(itm.day);
			appendDatSet(0,chartColors.yellow,'A (Kg/Hr)',itm.a_kg_hr);
			appendDatSet(1,chartColors.blue,'B (Kg/Hr)',itm.b_kg_hr);
			appendDatSet(2,chartColors.green,'C (Kg/Hr)',itm.c_kg_hr);
			appendDatSet(3,chartColors.purple,'D (Kg/Hr)',itm.d_kg_hr);
	  },this);		
	}
	else if (setcode == 'two') {
	  Ext.each(cData,function(itm){
	    data.labels.push(itm.day);
			appendDatSet(0,chartColors.yellow,'E (Kg/Hr)',itm.e_kg_hr);
			appendDatSet(1,chartColors.blue,'F (Kg/Hr)',itm.f_kg_hr);
			appendDatSet(2,chartColors.green,'G (Kg/Hr)',itm.g_kg_hr);
			appendDatSet(3,chartColors.purple,'H (Kg/Hr)',itm.h_kg_hr);
	  },this);		
	}
	else if (setcode == 'three') {
	  Ext.each(cData,function(itm){
	    data.labels.push(itm.day);
			appendDatSet(0,chartColors.yellow,'I (Kg/Hr)',itm.i_kg_hr);
			appendDatSet(1,chartColors.blue,'J (Kg/Hr)',itm.j_kg_hr);
			appendDatSet(2,chartColors.green,'K (Kg/Hr)',itm.k_kg_hr);
			appendDatSet(3,chartColors.purple,'L (Kg/Hr)',itm.l_kg_hr);
	  },this);		
	}
	else if (setcode == 'four') {
	  Ext.each(cData,function(itm){
	    data.labels.push(itm.day);
			appendDatSet(0,chartColors.yellow,'M (Kg/Hr)',itm.m_kg_hr);
			appendDatSet(1,chartColors.blue,'N (Kg/Hr)',itm.n_kg_hr);
			appendDatSet(2,chartColors.green,'O (Kg/Hr)',itm.o_kg_hr);
			appendDatSet(3,chartColors.purple,'P (Kg/Hr)',itm.p_kg_hr);
	  },this);		
	}
	else if (setcode == 'five') {
	  Ext.each(cData,function(itm){
	    data.labels.push(itm.day);
			appendDatSet(0,chartColors.yellow,'Q (Kg/Hr)',itm.q_kg_hr);
			appendDatSet(1,chartColors.blue,'R (Kg/Hr)',itm.r_kg_hr);
			appendDatSet(2,chartColors.green,'S (Kg/Hr)',itm.s_kg_hr);
	  },this);		
	}
	else {
		
	  Ext.each(cData,function(itm){
	    data.labels.push(itm.day);
		
			appendDatSet(0,chartColors.yellow,'S (Kg/Hr)',itm.s_kg_hr);
			appendDatSet(1,chartColors.blue,'R (Kg/Hr)',itm.r_kg_hr);
			appendDatSet(2,chartColors.green,'Q (Kg/Hr)',itm.q_kg_hr);
			appendDatSet(3,chartColors.purple,'P (Kg/Hr)',itm.p_kg_hr);

	  },this);
		
	}
	



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
