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
        'movie[genre]' : {required: true},
        'movie[duration]' : {required: true, digits: true, range: [1, 250]},
        'movie[poster]' : {required:true, url: true},
        'movie[summary]' : {required: true}
      },
      messages: {
        'movie[title]' : {required: "You must enter the movie title"},
        'movie[genre]' : {required: "You must enter the movie genre"},
        'movie[duration]' : {required: "You must enter the movie duration", digits: "Only digits", range: "The duration must range from 1 to 250"},
        'movie[poster]' : {required: "Must enter a poster URL", url: "Must enter a poster URL"},
        'movie[summary]' : {required: "You must enter the movie summary"}
      }
    });
}


function displayScreenings(cinema_id){
  $("table > tbody > tr").each(function () {
    $(this).hide();
  });

  $('.'+cinema_id).each(function() {
    $(this).show();
  });

}

$(document).ready(function(){

  if(document.getElementById('cinemas_display')){
    $("table > tbody > tr").each(function () {
      $(this).hide();
    });
  }

  // Get click event, assign button to var, and get values from that var
  $('#aBtnGroup button').on('click', function() {
    var thisBtn = $(this);

    thisBtn.addClass('active').siblings().removeClass('active');
    var btnText = thisBtn.text();
    var btnValue = thisBtn.val();

    $("table > tbody > tr").each(function () {
      $(this).hide();
    });

    $('.'+btnValue).each(function() {
      $(this).show();
    });
  });

  var today = new Date();
  var dd = String(today.getDate()).padStart(2, '0');
  var mm = String(today.getMonth() + 1).padStart(2, '0');

  var date = dd + '/' + mm;
  $('#'+date).click();


  if(document.getElementById('MovieForm')){
    ValidateMovieForm();
  }

  if(document.getElementById('ContactForm')){
    ValidateContactForm();
  }



});
