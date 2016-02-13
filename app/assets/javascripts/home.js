$(document).ready(function(){

  $('.filter-set').hide(); //hide dropdown filter menu

// ********************************
// AJAX request
  $('.form-cities').on('submit', function() {
    event.preventDefault();
    $('.filter-set').slideDown(); //show dropdown filter menu
    var API_URL = 'https://api.seatgeek.com/2/events?venue.city='
    var userInput = $('.inputCity').val();

    $.ajax({
      type: 'GET',
      url: API_URL + userInput,
      success: showEvents,
      dataType: 'json'
    }); //end AJAX
  });

// ********************************
// display request results in HTML
  function showEvents(response) {
    var events = response.events;
    // order events by date (default order)
    filterResults(events, date);

    var statusHTML = '';

    $.each(events, function(index, event) {
      if(event.type === 'concert') { //filter to see only concerts
        var eventId = event.id; //store event id for the event-detail-view

        statusHTML += '<li class="event-card">';
          statusHTML += '<h3 class="event-title">' + '<a href="/events/'  + event.id + '">' + event.title + '</a>' + '</h3>';
          if(event.performers[0].image) { // if event has image, display it
            statusHTML += '<img src="' + event.performers[0].image + '">';
          }
          statusHTML += '<div class="venue-data">';
            statusHTML += '<p class="venue-name">' + event.venue.name + '</p>';
            statusHTML += '<p class="venue-address">' + event.venue.address + '</p>';
          statusHTML += '</div>';
          statusHTML += event.datetime_utc;
          statusHTML += event.stats.average_price;
          //create the button to show event details
          statusHTML += '<br><a href="/events/'  + event.id + '" class="show-details btn btn-default">Show event details</button>';
        statusHTML += '</li>';
      }
    });
   $('.list-group').html(statusHTML);
  }

// ********************************
// filter results
function filterResults(array, order){
  switch (order){
    case 'date'
      // code
      break;
    case 'price_asc'
      // code
      break;
    case 'price_desc'
      // code
      break;
  }
}

}); //end ready
