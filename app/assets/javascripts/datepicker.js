document.addEventListener("turbolinks:load", function() {
  $('.datepicker').datepicker({
    todayHighlight: true, 
    orientation: 'auto top', 
    dateFormat: "yy-mm-dd"
  });
});