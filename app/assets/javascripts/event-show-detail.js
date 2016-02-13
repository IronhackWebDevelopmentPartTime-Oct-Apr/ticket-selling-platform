function showDetailEvent(event){
	event.preventDefault()

	var eventId = $(this).attr('id')
	console.log(eventId)


 	$.ajax({
	  	type: 'GET',
	  	url: 'https://api.seatgeek.com/2/' + "2911905",
	 	success: showInfoEvent
  	});
}

function showInfoEvent
	var event_coordinates = response.venue.location  
	var event_performers = response.performers

	$(".show-title-event").html(response.title);
	$(".show-date-event").html(response.datetime_local);
	$(".show-place-event").html(response.venue.name);
	$(".show-city-event").html(response.venue.extended_address);
	$(".show-address-event").html(response.venue.address);


	event_performers.forEach{
		$(".show-name-performers").html(event_performers.name);
		$(".show-img-performers").();
		$(".show-img-performers").attr("img", event_performers.image);
	}

	$(".show-price-event").html(response.stats.average_price);
}
