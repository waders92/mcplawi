document.addEventListener("turbolinks:load", function() {
  $('#covid-agreement').click(function(){
    if($(this).is(':checked')){
        $('#registration-btn').attr("disabled", false);
    } else{
        $('#registration-btn').attr("disabled", true);
    }
  });
});