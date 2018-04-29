// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('body').on('click', '.add_project_todo_list', function(){
    project_id = $(this).data('project-id');
    $.ajax({
      url: '/admin/add_project_todo/'+ project_id,
      type:'POST'}).done(function (rawData) {
    });
  });

  $('body').on('click', '.assign_developer', function(){
    project_id = $(this).data('project-id');
    todo_id = $(this).data('todo-id');
    $.ajax({
      url: '/admin/assign_developer/'+ project_id + '/' + todo_id,
      type:'POST'}).done(function (rawData) {
    });
  });

  $('body').on('click', '.change_todo_status', function(){
    project_id = $(this).data('project-id');
    todo_id = $(this).data('todo-id');
    $.ajax({
      url: '/change_todo_status/'+ project_id + '/' + todo_id,
      type:'POST'}).done(function (rawData) {
    });
  });
});