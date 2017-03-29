var RechAj = function()
{
	$input=$(this);
	$form=$input.parent("form");
	alert($form.attr("action"));
	alert($input.val());
};

$('.ecoute').on("keydown", RechAj);