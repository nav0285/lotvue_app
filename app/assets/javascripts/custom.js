$(document).ready(function () { 

	$(document).on('click', '#bulk_update', function(e){
		e.preventDefault();
		var val = [];
    $(':checkbox:checked').each(function(i){
      val[i] = $(this).val();
    });
		$.ajax({
      url: '/roles/bulk_update',
      data: {role_ids: val}
    }).done(function() {
      location.reload();
    });
	});

	$(document).on('click', '#hide_roles', function(){
		if ($('.roles').length){
			$('.roles').remove()
		}
	});

	$(document).on('click', '#users', function(){
		if ($('.all_users').length){
			$('.all_users').remove()
		}
	});

})