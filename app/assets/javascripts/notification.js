$(document).ready(function() {
	var noti_box = $('.notification_box');
	noti_box.find('.view .sect').hide().eq(0).show();
	noti_box.find('.tabs h3').eq(0).addClass('active');
	noti_box.hide();


	noti_box.find('.tabs > *').click(function(){
		var i = $(this).index();
		showTab(i);
	});

	var fbtn = $('.frdreqs')
	var ibtn = $('.invtreqs');

	fbtn.click(function(){
		noti_box.show();
		showTab(0);
	});

	ibtn.click(function(){
		noti_box.show();
		showTab(1);
	});

	noti_box.click(function(e){
		if ($(this)[0]==e.target) {
			$(this).hide();
		}
	})
	
	function showTab(i) {
		var t =  noti_box.find('.tabs > *').eq(i);
		var v = noti_box.find('.view .sect');
		t.siblings().removeClass('active');
		t.addClass('active');
		v.hide().eq(i).show();	
	}
});
