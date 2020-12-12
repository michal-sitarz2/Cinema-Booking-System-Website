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
//= require turbolinks
//= require jquery3
//= require jquery.validate
//= require rails-ujs
//= require bootstrap-sprockets
//= require activestorage
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

$.validator.addMethod(
    "regex",
    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    },
    "Please check your input."
);

$.validator.addMethod('positiveNumber',
    function (value) {
        return Number(value) > 0;
    }, 'Enter a positive number.');

$.validator.addMethod("isRestriction", function(value) {
    var states = [
      "N/A", "R", "G", "PG", "PG-13", "NC-17"
    ];
    return $.inArray(value.toUpperCase(), states) != -1;
}, "Please choose one of the following: 'N/A', 'R', 'G', 'PG', 'PG-13', 'NC-17'");

$.validator.addMethod("isType", function(value) {
    var states = [
      "2D", "3D", "4D"
    ];
    return $.inArray(value.toUpperCase(), states) != -1;
}, "Please choose one of the following: '2D', '3D', '4D'");


function ValidateContactForm(){
  $('#contactForm').validate({
    rules: {
      name: {required: true},
      email: {required: true, email:true},
      message: {required: true},
    },
    messages: {
      name: {required: "You must enter a name"},
      email: {required: "You must enter an email", email:"The input must be an email"},
      message: {required: "Please enter a message you want to submit."},
    }
  });

function ValidateMovieForm(){
    $('#movieForm').validate({
      rules: {
        'movie[title]' : {required: true},
        'movie[actors]' : {regex: "^[a-zA-Z, ]*$"},
        'movie[director]' : {regex: "^[a-zA-Z, ]*$"},
        'movie[genre]' : {required: true},
        'movie[restrictions]' : {required: true},
        'movie[release_date]' : {required: true},
        'movie[video]' : {required: true, regex: "^(https:\/\/www.youtube.com\/embed\/)(\w+)$"},
        'movie[duration]' : {required: true, digits: true, range: [1, 250]},
        'movie[poster]' : {required:true, regex: "\.(jpg|png|gif)$"},
        'movie[summary]' : {required: true}
      },
      messages: {
        'movie[title]' : {required: "You must enter the movie title"},
        'movie[actors]' : {regex: "Can only use letters, spaces and commas."},
        'movie[director]' : {regex: "Can only use letters, spaces and commas."},
        'movie[genre]' : {required: "You must enter the movie genre"},
        'movie[duration]' : {required: "You must enter the movie duration", digits: "Only digits", range: "The duration must range from 1 to 250"},
        'movie[poster]' : {required: "Must enter a poster for a movie", regex: "Must enter a link with '.png', '.gif' or '.jpg'"},
        'movie[summary]' : {required: "You must enter the movie summary"},
        'movie[restrictions]' : {required: "The restrictions must be entered"},
        'movie[release_date]' : {required: "Restriction has to be defined"},
        'movie[video]' : {required: "Video has to be defined", regex: "The video has to follow YouTube embedded format: https://www.youtube.com/embed/..."},
      }
    });
}

function ValidateScreeningForm(){
    $('#screeningForm').validate({
      rules: {
        'screening[movie]' : {required: true},
        'screening[cinema]' : {required: true},
        'screening[price]' : {required: true, number: true},
        'screening[screening_date]' : {required: true},
        'screening[screening_time]' : {required: true},
        'screening[arena]' : {required: true},
        'screening[available_seats]' : {required: true, digits: true},
      },
      messages: {
        'screening[movie]' : {required: "If there are no movies to select, please add movie first."},
        'screening[cinema]' : {required: "If there are no cinemas to select, please add cinema first."},
        'screening[price]' : {required: "Please add a price of the screening."},
        'screening[screening_date]' : {required: "Please select a date for the screening."},
        'screening[screening_time]' : {required: "Please specify the time for the screening."},
        'screening[arena]' : {required: "Please specify the arena in which the movie will be screened."},
        'screening[available_seats]' : {required: "Please specify how many seats will be available for the screening.", digits: "Has to be a positive integer."},
      }
    });
}


function ValidateCinemaForm(){
    $('#cinemaForm').validate({
      rules: {
        'cinema[name]' : {required: true}
        'cinema[address]' : {required : true}
        'cinema[image]' : {required : true, regex: "\.(jpg|png|gif)$"}}
      },
      messages: {
        'cinema[name]' : {required: "The cinema must have a defined name."}
        'cinema[address]' : {required : "The cinema must have a defined address."}
        'cinema[image]' : {required : "The cinema must have a picture added.", regex: "The image link has to be ending wiht '.jpg', '.gif' or '.png'."}
      }
    });
}


$(document).on('turbolinks:load', function(){

  if(document.getElementById('movieForm')){
    ValidateMovieForm();
  }

  if(document.getElementById('contactForm')){
    ValidateContactForm();
  }

  if(document.getElementById('screeningForm')){
    ValidateScreeningForm();
  }

  if(document.getElementById('cinemaForm')){
    ValidateCinemaForm();
  }

});
