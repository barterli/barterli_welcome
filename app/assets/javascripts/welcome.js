
 function toggle_visibility(id) {
   var e = document.getElementById(id);
   if(e.style.display == 'block')
      e.style.display = 'none';
   else
      e.style.display = 'block';
    }
$(function() {
  $("form").on("ajax:before", function() {
     $('input[type="submit"]').attr('disabled','disabled');
  });
});
