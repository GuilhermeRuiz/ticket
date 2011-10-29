alert_count = 0;

function createAlert(mensagem,milisec) {
  var container = "<div id=\"alert_container\"></div>";
  var alertId   = "alert_"+this.alert_count;
  var template  = "<div id=\""+alertId+"\" class=\"alert-message warning fade in alert_will_fade \" data-alert=\"alert\" style=\"display:none;\" ><a class=\"close\" href=\"#\">x</a><p>"+mensagem+"</p></div>";
  
  
  if(!$("#alert_container").length > 0) {
    $("body").prepend(container);
  }
  
  $("#alert_container").append(template);
  this.alert_count++;
  
  $(".alert_will_fade").fadeIn("slow", function() {
    $(".alert_will_fade").removeClass("alert_will_fade");
  });
  
  if(milisec > 0) {
    setTimeout("$(\"#"+alertId+"\").fadeOut(\"slow\",function() {$(\"#"+alertId+"\").remove()});",milisec);
  }
  
}