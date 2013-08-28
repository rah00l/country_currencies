/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//$(document).ready(function (){
//     $('#new_review').submit(function (){

$(function () {
    $("#currencies_search").submit(function (){
        $.get(this.action, $(this).serialize(), null, 'script');
        return false;
    });

    $("#countries_search").submit(function (){
        $.get(this.action, $(this).serialize(), null, 'script');
        return false;
    });
});