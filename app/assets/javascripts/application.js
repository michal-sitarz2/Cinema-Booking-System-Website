// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require jquery.validate
//= require rails-ujs
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .

/* Set the width of the sidebar to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidebar").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.getElementById("pageHeader").style.marginLeft = "250px";
  document.body.style.backgroundColor = "rgba(0,0,0,0.9)"
}

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
  document.getElementById("pageHeader").style.marginLeft = "0";
  //document.getElementsByClass("navbar-nav")[0].style.color = "rgba(0,0,0,0.9)"
  document.body.style.backgroundColor = "white";
}

function ValidateContactForm(){
  $(request_contact_path).validate({
    rules: {
      "name" : {required: true}
    },
    messages: {
      "name" : {required: "You must enter the Name"}
    }
  });

}

function ValidateMovieForm(){

    $('#MovieForm').validate({
      rules: {
        'movie[title]' : {required: true},
        'movie[director]' : {required: true},
        'movie[genre]' : {required: true},
        'movie[duration]' : {required: true, digits: true, range: [1, 250]},
        'movie[year]' : {digits: true, range: [1900, 2030]}
      },
      messages: {
        'movie[title]' : {required: "You must enter the movie title"},
        'movie[director]' : {required: "You must enter the movie director"},
        'movie[genre]' : {required: "You must enter the movie genre"},
        'movie[duration]' : {required: "You must enter the movie duration", digits: "Only digits", range: "The duration must range from 1 to 250"},
        'movie[year]' : {digits: "You must use digits", range: "The year must range from 1900 to 2030"}
      }
    });
}

function ToggleText(elem){
  $('#'+elem.id+"p").toggle();

  if(elem.id+"p" == "ump"){
    $(".container").toggle();
  }
}

function SetFontSize(val){
  $('*').each(function(i,e){
    e.style.fontSize = val
  });
}

$(document).ready(function(){

  if(document.getElementById('welcome_id')){
    $('#wfp, #tbp, #newsp, #tmp, .ump').hide();
  }

  if(document.getElementById('MovieForm')){
    ValidateMovieForm();
  }

  if(document.getElementById('ContactForm')){
    ValidateContactForm();
  }

  $('[data-js-hide-link]').click(function(event){
    $(this).parents('li').hide();
    alert('You clicked the Hide link');
    event.preventDefault();
  });


});
