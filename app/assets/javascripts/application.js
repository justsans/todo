// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var domain = "192.168.1.3";
var domain_genie = "192.168.0.10";
var localhost = "localhost";
var port = ":3000";
var domain_url = "http://"+localhost+port;

function doTask(id) {
    var url = domain_url+"/tasks/"+id+"/do";
    $.get(url, function(data) {
//        alert("data");
    });
}

function undoTask(id) {
    var url = domain_url+"/tasks/"+id+"/undo";
    $.get(url, function(data) {
//         alert("data");
    });
}

$('.submittable').live('change', function() {
  $(this).parents('form:first').submit();
});

$('.task_form').ajaxForm(function() {

});



