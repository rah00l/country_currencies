/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//$(document).ready(function (){
//     $('#new_review').submit(function (){

$(function () {

    $('#countries_search').keyup(function() {
        $('#countries_search').submit();
    });

    $('#currencies_search').keyup(function() {
        $('#currencies_search').submit();
    });

    $('#country_form').bind('ajax:complete', function(event, data) {
        $('body, html').animate({
            scrollTop:$('body').offset().top
            }, 'slow');
        alert("Successfully updated");
    });

    $("#currencies_search").submit(function (){
        $.get(this.action, $(this).serialize(), null, 'script');
        return false;
    });

    $("#countries_search").submit(function (){
        $.get(this.action, $(this).serialize(), null, 'script');
        return false;
    });
});