/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//$(document).ready(function (){
//     $('#new_review').submit(function (){

$(function () {

$('#country_form').bind('ajax:complete', function(event, data) {
    alert("Successfully updated");
//    $('#countries_updated_list').html(data.responseText);
});

//    $('#country_form').bind('ajax:success', function(data) {
//        alert("Successfully updated");
//    });


    $("#currencies_search").submit(function (){
        $.get(this.action, $(this).serialize(), null, 'script');
        return false;
    });

    $("#countries_search").submit(function (){
        $.get(this.action, $(this).serialize(), null, 'script');
        return false;
    });
});