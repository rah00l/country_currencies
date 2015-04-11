/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
 $(function ()
 {
 	$('#currencies_search input').keyup(function () {
 		$.get($('#currencies_search').attr('action'), $('#currencies_search').serialize(), null, 'script');
 		return false;
 	});

 	$('#countries_search input').keyup(function () {
 		$.get($('#countries_search').attr('action'), $('#countries_search').serialize(), null, 'script');
 		return false;
 	});

 	$('#country_form').bind('ajax:complete', function(event, data) {
 		$('body, html').animate({
 			scrollTop:$('body').offset().top
 		}, 'slow');
      alert("Successfully updated");
  });
 });
