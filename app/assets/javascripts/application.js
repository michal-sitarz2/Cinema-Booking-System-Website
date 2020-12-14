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
  /* Changes the color and the opacity of the background */
  document.body.style.backgroundColor = "rgba(0,0,0,0.9)"
}

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
  document.getElementById("pageHeader").style.marginLeft = "0";
  /* Changes the view back to normal*/
  document.body.style.backgroundColor = "white";
}

/* A method added to JQuery validator which checks inputted regular expression with the value*/
$.validator.addMethod(
    "regex",
    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    },
    "Please check your input."
);

/* A method added to JQuery validator which checks if the number is positive (the funciton is added as the class in the form input)*/
$.validator.addMethod('positiveNumber',
    function (value) {
        return Number(value) > 0;
    }, 'Enter a positive number.');

/* A method added to JQuery validator which checks if the value is within the specified values (the funciton is added as the class in the form input)*/
$.validator.addMethod("isRestriction", function(value) {
    var states = [
      "N/A", "R", "G", "PG", "PG-13", "NC-17"
    ];
    return $.inArray(value.toUpperCase(), states) != -1;
}, "Please choose one of the following: 'N/A', 'R', 'G', 'PG', 'PG-13', 'NC-17'");

/* A method added to JQuery validator which checks if the value is within the specified values (the funciton is added as the class in the form input)*/
$.validator.addMethod("isType", function(value) {
    var states = [
      "2D", "3D", "4D"
    ];
    return $.inArray(value.toUpperCase(), states) != -1;
}, "Please choose one of the following: '2D', '3D', '4D'");

/*
* Function to validate the contact form
*/
function ValidateContactForm(){
  $('#contactForm').validate({
    rules: {
      // The name cannot be blank
      name: {required: true},
      // The email must be an email, and also cannot be left blank
      email: {required: true, email:true},
      // A message has to be provided
      message: {required: true},
    },
    /* Messages which pop up if the input is incorrect */
    messages: {
      name: {required: "You must enter a name"},
      email: {required: "You must enter an email", email:"The input must be an email"},
      message: {required: "Please enter a message you want to submit."},
    }
  });
}

/*
* Function to validate the form as the user inputs the data.
* This validates the form when new movies are created or edited.
*/
function ValidateMovieForm(){
    $('#movieForm').validate({
      rules: {
        // A movie cannot be defined without title
        'movie[title]' : {required: true},
        // Actors have to be defined only with letters, spaces and commas if there are more than one
        'movie[actors]' : {regex: "^[a-zA-Z, ]*$"},
        // Directors have to be defined only with letters, spaces and commas if there are more than one
        'movie[director]' : {regex: "^[a-zA-Z, ]*$"},
        // A movie cannot be defined without genre
        'movie[genre]' : {required: true},
        // A movie cannot be defined without restrictions
        'movie[restrictions]' : {required: true},
        // A movie has to have specified releas date
        'movie[release_date]' : {required: true},
        // A movie has to have a video link, which will have a correct embedded link format
        'movie[video]' : {required: true, regex: "^(https:\/\/www.youtube.com\/embed\/)"},
        // A movies has to have a duration and has to be a positive integer
        'movie[duration]' : {required: true, digits: true, range: [1, 500]},
        // A movies has to have a correct image link for the poster
        'movie[poster]' : {required:true, regex: "\.(jpg|png|gif)$"},
        // A movie must have a summary
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

/*
* Function to validate the form as the user inputs the data.
* This validates the form when new screenings are created or edited.
*/
function ValidateScreeningForm(){
    $('#screeningForm').validate({
      rules: {
        // A movie and cinema must be defined
        'screening[movie]' : {required: true},
        'screening[cinema]' : {required: true},
        // A price is required and has to be a number
        'screening[price]' : {required: true, number: true},
        // Needs a screening date and a screening time
        'screening[screening_date]' : {required: true},
        // Screening time has to have a correct format
        'screening[screening_time]' : {required: true, regex:"^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$"},
        // Arena must be defined where the screening will take place
        'screening[arena]' : {required: true},
        // Available seats are defined as a number
        'screening[available_seats]' : {required: true, digits: true},
      },
      messages: {
        'screening[movie]' : {required: "If there are no movies to select, please add movie first."},
        'screening[cinema]' : {required: "If there are no cinemas to select, please add cinema first."},
        'screening[price]' : {required: "Please add a price of the screening."},
        'screening[screening_date]' : {required: "Please select a date for the screening."},
        'screening[screening_time]' : {required: "Please specify the time for the screening.", regex: "The format must be 'HH:MM'"},
        'screening[arena]' : {required: "Please specify the arena in which the movie will be screened."},
        'screening[available_seats]' : {required: "Please specify how many seats will be available for the screening.", digits: "Has to be a positive integer."},
      }
    });
}

/*
* Function to validate the form as the user inputs the data.
* This validates the form when new cinemas are created or edited.
*/
function ValidateCinemaForm(){
    $('#cinemaForm').validate({
      rules: {
        // A name and address are required
        'cinema[name]' : {required: true},
        'cinema[address]' : {required : true},
        // Image must have a correct format
        'cinema[image]' : {required : true, regex: "\.(jpg|png|gif)$"},
      },
      messages: {
        'cinema[name]' : {required: "The cinema must have a defined name."},
        'cinema[address]' : {required : "The cinema must have a defined address."},
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
