var RechAj = function()
{
	$input=$(this);
	$form=$input.parent("form");
	$formAction = $form.attr("action");
	$formValeur = $input.val();
	$zoneResult = '#RESULT_'+$input.attr("name");
	/*alert($form.attr("action"));
	alert($input.val());*/

	$formAction=$formAction.replace('.php','_ajax.php');
	/*alert($formAction);*/
	$.post( $formAction, { RECH_AJAX : $formValeur}).done(function(data){
		/*alert ("Data loaded" + data);*/
		$($zoneResult).replaceWith(data);
	});
};

$('.ecoute').on("keyup", RechAj);