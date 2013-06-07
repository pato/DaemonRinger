$(document).ready(function(){
	$(".person").click(function(){
		var person = $(this).attr("person");
		var msg = $(".msginput").val();
		msg = msg==""?"Come downstairs":msg;
		$(".toastdiv").empty();
		$(".toastdiv").hide();
		$.get('handle.php?op=punch&name='+person+"&msg="+msg, function(data) {
		  $(".toastdiv").append('<div class="span12 toast"><h3>'+person+' ringed successfully!</h3></div>');
		  $(".toastdiv").fadeIn().delay(2000).fadeOut();
		  $("body").append(data);
		});
	});
});