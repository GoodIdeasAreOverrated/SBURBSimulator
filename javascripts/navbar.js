//just loads the navbar.text into the appropriate div.
function loadNavbar(){
	$.ajax({
		url: "navbar.txt",
		success:(function(data){
		 $("#navbar").html(data)
		 if(getParameterByName("seerOfVoid")  == "true"){
	 		alert("If you gaze long into an abyss, the abyss also gazes into you.  - Troll Bruce Willis")
	 		$("#story").append("<button onclick='toggleVoid()'>Peer into Void, Y/N?</a><div class='void'>Well, NOW you've certainly gone and done it. You can expect to see any Void Player shenanignans now. If there are any.");
	 	}
		wireUpNavbar();
		}),
		dataType: "text"
	});


}

function wireUpNavbar(){
	alert("so tired.")
}


//http://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript
function getParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function getRawParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return results[2];
}

function toggleVoid(){
	$(".void").toggle();
}
