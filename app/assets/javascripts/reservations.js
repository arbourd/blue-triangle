var setDate = function(date) {
  $('.calendar-selected').removeClass('calendar-selected');
  $('label[for=date_' + date + ']').parent().addClass('calendar-selected');
};

var makeUserRequest = function() {
  var val = $('input[id="member_number"]').val();
  if (!val) {
    $("#members-error").html("Please enter a member's number");
  } else {
    $("#members-error").html("");
    $.get("/members/name/" + val, function(data) {});
  }
};

var removeUser = function(number) {
  $('tr[data-number= ' + number + ']').remove();
};
