var setDate = function(date) {
  $('.calendar-selected').removeClass('calendar-selected');
  $('label[for=date_' + date + ']').parent().addClass('calendar-selected');
};
