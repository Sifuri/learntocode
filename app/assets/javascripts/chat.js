$(document).ready(function(){
	var msg_btn = $('.msg_btn');
	var msg_box = $('.msg_box');
	var box_state = false;

	msg_btn.click(toggleBox);

	$('body').click(function(e){
		if ($(e.target).is($("header, header *"))) {
			return;
		}
		if (box_state) {
			box_state = false;
			hide_msg_box();
		}
	});

	function toggleBox() {
		if (box_state) {
			box_state = false;
			hide_msg_box();
		} else {
			box_state = true;
			show_msg_box()
		}
	}

	function hide_msg_box() {
		msg_box.hide();
	}

	function show_msg_box() {
		msg_box.show();
	}


}); 

