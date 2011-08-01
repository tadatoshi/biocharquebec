jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} 
});

jQuery(document).ready(function($) {
  
  jQuery(".content-detail").hide(); 

  jQuery(".content-title").click(function() {
    jQuery("div[data-content-id='" + jQuery(this).attr("data-content-id") + "']").slideToggle("slow");
    return false;
  });
  
});