function add_option(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(".new_option").append(content.replace(regexp, new_id));
}

function remove_option(){
  $("#option_field").on("click", ".remove-option", function(){
    $(this).prev().val(1);
    $(this).parent().parent().parent().hide(100);
  });
}

$(document).on("change", "#question_question_type", function() {
  if($(this).val() == "single_choice" || $(this).val() == "multiple_choice") {
    $(".add_answ").show();
    $("#options").show();
    $(".is_correct").show();
    $("#answer-field").hide();
  } else if($(this).val() == "text") {
  	$("#options").hide();
    $(".add_answ").hide();
    $("#answer-field").show()
  }
});