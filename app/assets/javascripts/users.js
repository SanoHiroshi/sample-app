jQuery(document).ready(function($) {
  var label   = document.getElementById('label');

  var LIMIT = 140;
  var WARNING = 15;

  label.innerHTML = LIMIT;

  $('#post_body').on("keyup",function() {
    var remaining = LIMIT - $(this).val().length;
    label.innerHTML = remaining;
    label.className = remaining < WARNING ? 'warning' : '';
  });
});