$(document).ready(function(){


	var msg_btn = $('.msg_btn');
	var msg_box = $('.msg_box');
	var box_state = false;
	var msg_btn_2 = $('.msg');
	var send_btn = $('.send_msg');
	var msgsObj = JSON.parse(msgs);
	var clonemsg = msg_box.find('.msg');

	init();

	function init() {
		for(var k in msgsObj) {
			console.log(msgsObj);
			var grav_url = msgsObj[k].user.gravatar;
			var last_msg = msgsObj[k].msgs[msgsObj[k].msgs.length-1].content
			var cloned = clonemsg.clone().removeClass('hide');
			cloned.find('img')[0].src = grav_url;
			cloned.find('.txt').text(last_msg);

			msg_box.append(cloned);
		}
	}

	msg_btn.click(toggleBox);
	msg_btn_2.click(toggleBox);

	$('body').click(function(e){
		if ($(e.target).is($("header, header *")) || $(e.target).is($('.msg, .msg *'))) {
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
	var chatController = new ChatController();
	var storageController = new StorageController(chatController);
	window.c = chatController;

	send_btn.click(function(){
		//open if not open
		var open = chatController.open_windows.some(function(e){
			if (e.userId == +other_user.id) return true;
		});
		if (!open) {
			chatController.create_window(new User(other_user.name, other_user.id, other_user.msgs))
		} else {
			var w = chatController.open_windows.filter(function(e){
					if (e.userId == +other_user.id) return true;
				})[0];
			openMsgWindow(w);
		}
	});




function StorageController(c) {
	this.save = function(){

	}
}


function ChatController() {
	this.max_windows = 3;
	this.open_windows = [];
	this.create_window = createWindow;
	this.close_window = closeWindow;
	this.send_message = sendMessage;
	this.chat = $('.chat');
	this.delete_left_window = delete_left_window;



	function createWindow(user) {
		if (this.open_windows.length >= this.max_windows) {
			this.delete_left_window();
		}
		var w = new ChatWindow(this.open_windows,user);
		this.open_windows.push(w);

		var c = this.chat.find('.clone').clone().removeClass('clone');
		w.ele = c;
		c.css('right',w.y+'px');
		c.find('.title').text(w.title);
		c.find('.title').click(titleClick.bind(this, w));
		c.find('.close').click(closeClick.bind(this, w));
		c.find('input').bind("keypress", {w: w}, sendMessage)
		this.chat.append( c );
	}

	function closeWindow(i) {
		if (this.open_windows[i] == undefined )return;
		this.open_windows[i].ele.remove();
		deleteFromArray(this.open_windows,this.open_windows[i]);
	}

	function delete_left_window() {
		this.close_window(this.max_windows -1);
	}


}

	// chatController.open_windows.filter(function(w){
	// 	return w.userId == id;
	// });

function addMessage(w,msg,self) {
	var m = $("<div>");
	m.addClass('msg')
	m.text(msg);
	if(self) m.addClass('self');
	var msgs = w.ele.find('.msgs');
	msgs.append(m);
	msgs.scrollTop(msgs.height());
}

function sendMessage(e) {
	if (e.which == 13 && $(this).val().trim().length>0) {
		var msg = $(this).val();
		addMessage(e.data.w, msg, true);
    	$(this).val('');

    	$.get('/chat/send?to='+e.data.w.userId+'&msg='+msg);
 	}
}

function closeClick(w) {
	this.close_window(this.open_windows.indexOf(w));
}


function titleClick(w) {
	if (w.state == 'open') {	
		closeMsgWindow(w);
	} else if (w.state == 'close') {	
		openMsgWindow(w);
	} 
}


function openMsgWindow(w) {
	w.ele.find('.wrap').show();
	w.state = 'open';
}

function closeMsgWindow(w) {
	w.ele.find('.wrap').hide();
	w.state = 'close';
}


function User(name, id, msgs) {
	return {
		name: name,
		id: id,
		msgs: msgs
	}
}

function ChatWindow(open_windows, user) {
	this.y = open_windows.length*310+50;
	this.userId = user.id;
	this.title = user.name
	this.ele;
	this.state = 'open';
}


function Message() {
	this.txt = null;
	this.sender = null;
	this.reciever = null;
}


function deleteFromArray(arr, ele) {
    arr = arr || [];
	ele = ele || ele;
	var index = arr.indexOf(ele);
	if (index > -1) {
	    arr.splice(index,  1);
	}
}







}); 