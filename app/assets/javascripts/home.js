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

    // filterResults
    // showResults

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
// datepicker
  var nowTemp = new Date();
  var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

  var checkin = $('#dpd1').datepicker({
    onRender: function(date) {
      return date.valueOf() < now.valueOf() ? 'disabled' : '';
    }
  }).on('changeDate', function(ev) {
    if (ev.date.valueOf() > checkout.date.valueOf()) {
      var newDate = new Date(ev.date)
      newDate.setDate(newDate.getDate() + 1);
      checkout.setValue(newDate);
    }
    checkin.hide();
    $('#dpd2')[0].focus();
  }).data('datepicker');
  var checkout = $('#dpd2').datepicker({
    onRender: function(date) {
      return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
    }
  }).on('changeDate', function(ev) {
    checkout.hide();
  }).data('datepicker');


}); //end ready
