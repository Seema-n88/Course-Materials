var hashValue = window.location.hash.substr(1);
//customized Accordion use it on text and text/image objects
$(document).ready(function () {

    //pull the header from the tce and push them to another position
    if($(".accordionelement :header").length > 0){
        $(".accordionelement").each(function(){
            var thisheader = $(this).find(':header:first').html();
            thisheader = '<div class="trigger accordionheader"><h3>'+thisheader+'</h3></div>';
            $(this).find(':header:first').remove();
            $(this).prepend(thisheader);
              
           $(this).find('.csc-default').addClass("toggle_container");
        });
    }
    
    //default hide all accordion elements
    $('.trigger').not('.trigger_active').parent().find('.toggle_container').hide();

    if(hashValue){
        $('#'+hashValue+'[class=toggle_container]').show();
        $('#'+hashValue+'[class=toggle_container]').prev().addClass('trigger_active');
    }

    //show elements by clicking the header
    $('.trigger').click( function() {
        var trig = $(this);
        if ( trig.hasClass('trigger_active') ) {
            trig.parent().find('.toggle_container').slideToggle('slow');
            trig.removeClass('trigger_active');
        } else {
        //  automatisches schließen der Elemente deaktivieren    
            $('.trigger_active').removeClass('trigger_active');
            trig.parent().find('.toggle_container').slideToggle('slow');
            trig.addClass('trigger_active');
        };
        return false;
    });

    //if there are links with hashes cklicking inside an accordionelement
    $(".toggle_container a[href*='#']").on("click",function(e){
           hashValue = this.hash.substr(1);
           if($( "#" + hashValue).length > 0 ){
               e.preventDefault(e);
               $(".trigger_active").removeClass("trigger_active");
               $(".toggle_container").hide('slow');
               $('#'+hashValue).show('slow');
               $('#'+hashValue).prev().addClass('trigger_active');
               var target = $('#'+hashValue).offset().top;
               $("html, body").animate({ scrollTop: target }, 1000);
           }
       }
   );

    
    // Accordion Arrow open/close
    $(".accordionelement :header").addClass("icon-plus"); 

    $(".accordionelement :header").click(function(){ // active trigger 
        
        if( $(this).hasClass("icon-minus") ) {
            $(this).removeClass('icon-minus').addClass('icon-plus');
        } else {
        // wechselt beim Klick von "closed" zu "open"
            $(this).removeClass('icon-plus').addClass('icon-minus');
        }
    }); 
	   

    if($(".sliderelement :header").length > 0){
        $(".sliderelement").each(function(){
           var thisheader = $(this).find(':header:first').html();
           thisheader = '<div class="csc-header"><h2>'+thisheader+'</h2></div>';
           $(this).find(':header:first').remove();
           $(this).prepend(thisheader);
        });
    }
    
    /*Pure Javascript slider, elements selected by TYPO3 layout*/
    /*create new element before the first slider element*/
    $(".sliderelement").first().before('<div id="carousel" class="carousel slide" data-ride="carousel"></div>');

    //append new element as parent of slides and append all slides
    $("#carousel").append('<div class="carousel-inner" id="carousel-inner"></div>');
    $(".sliderelement").appendTo('#carousel-inner');

    //we append the arrows too
    $("#carousel").append('<a data-slide="prev" role="button" href="#carousel" class="left carousel-control" title="<<"><span class="icon-prev"></span></a>' +
            '<a data-slide="next" role="button" href="#carousel" class="right carousel-control" title=">>"><span class="icon-next"></span></a>');

    //append the navigation list
    $("#carousel").append('<ol class="carousel-indicators" id="carousel-indicators"></ol>');

    //iterate over existing sliderelements, create controller links and append them
    $(".sliderelement").each(function(index){
            $("#carousel-indicators").append('<li data-target="#carousel" data-slide-to="'+index+'" ></li>');
            }
    );
    
    //the first items should be active
    $(".sliderelement").first().addClass('active');
    $("#carousel-indicators li").first().addClass('active');
    

    // carousel intervall
    $('.carousel').carousel({
        interval: 8000
    });
    

    // Crop Slidertext
    $(".sliderelement .csc-text").each(function(){
        if($(this).text().length > 100){
            $(this).text($(this).text().substring(0,100) + '...');
        };
    });



    // Aufheben des Floatings beim letztem Element
    $('.floatboxLast').parent().after('<div class="element"><div class="floatbox"></div></div></div><div class="floatboxclear"></div>');

    // Breite des umschließenden outerWrap erfassen
    var floattrig = $(".floatbox").parent().width();

    // Hälte der Breite der Floatbox minus Margin
    var floatwidth = floattrig / 2 - 10;

    $(".floatbox").parent().css({
        width: floatwidth
    });

    // Margin-Abstand
    $('.floatbox:even').parent().css('margin-right', '19px');
    // Floating der Boxen
    $('.floatbox').parent().css('float', 'left');



});
