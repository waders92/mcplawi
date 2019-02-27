document.addEventListener("turbolinks:load", function() {
  $(".reg-btn").click(function() {
    $("#registrations").toggle("slow", "swing");
  });});