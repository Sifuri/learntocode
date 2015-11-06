var ref = new Firebase("https://hacker-news.firebaseio.com/v0/");
var itemRef;

ref.child('topstories').child(0).on('value', function(snapshot) {
	if(itemRef) {
		itemRef.off();
	}

	//Get the ID of the top article
	var id = snapshot.val();

	//Get the article details and update in realtime
	itemRef = ref.child('item').child(id);
	itemRef.on('value', function(snapshot) {			
		var item = snapshot.val();

		document.getElementById("score").innerHTML = item.score;

		var anchor = document.getElementById("article_a")
		anchor.innerHTML = item.title;
		anchor.href = item.url;

		document.getElementById("comments_a").href = "https://news.ycombinator.com/item?id=" + 'item.id';
	});		
});
