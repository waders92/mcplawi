document.addEventListener("turbolinks:load", function() {
  $("a").on('click', function(event) {
    if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
      $('html, body').stop().animate({
        scrollTop: $(hash).offset().top
      }, 750, function(){
        window.location.hash = hash;
      });
    } 
  });
});