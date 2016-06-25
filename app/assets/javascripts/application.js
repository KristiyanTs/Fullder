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
//= require bootstrap-sprockets
//= require bootstrap-select
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require cocoon
//= require_tree .

$( document ).ready(function() {

$(".meal_image").click(function(){
  if($(this).parent().hasClass("active_meal")){
    removeActiveMeals();
    showInactiveMeals();
  }
  else{
    removeActiveMeals();
    $(this).parent().addClass("active_meal");
    $(this).parent().next().removeClass("hidden");
    hideInactiveMeals();
  }
});

$(".meal_size").click(function(){
  if($(this).hasClass("meal_size_active")){
    removeActiveMealSizes();
  }
  else{
    removeActiveMealSizes();
    $(this).parent().next().removeClass("hidden");
    $(this).addClass("meal_size_active");
  }
});

$(".meal_supplemental").click(function(){
  if($(this).hasClass("meal_supplemental_active")){
    $(this).removeClass("meal_supplemental_active")
  }
  else{
    $(this).addClass("meal_supplemental_active");
  }
});

function removeActiveMeals(){
  $(".active_meal").next().addClass("hidden");
  $(".active_meal").next().next().addClass("hidden");
  $(".active_meal").removeClass("active_meal");
}

function removeActiveMealSizes(){
  $(".meal_size_active").removeClass("meal_size_active");
}

function showInactiveMeals(){
  $(".meal.hidden").removeClass("hidden");
}

function hideInactiveMeals(){
  $(".meal:not(.active_meal)").addClass("hidden");
}

});