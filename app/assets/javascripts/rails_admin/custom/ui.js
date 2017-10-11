//= require rails_admin/themes/material/ui.js

$(document).on('rails_admin.dom_ready', function(){ 


$('#user_subject_ids_field').hide();
$('#user_school_id_field').hide();

// Todos los checkboxs vacíos!
$('#user_superadmin_role,#user_utp_role,#user_teacher_role').attr('checked',false);


$('#user_superadmin_role').on('change', function () {
	if (this.checked) {
		$('#user_utp_role,#user_teacher_role').attr('disabled', true);
    }
    else{
    	$('#user_utp_role,#user_teacher_role').attr('disabled', false);
    }
    
});

$('#user_utp_role').on('change', function () {
	if (this.checked) {
		$('#user_superadmin_role,#user_teacher_role').attr('disabled', true);
		$('#user_school_id_field').show();
    }
    else{
    	$('#user_superadmin_role,#user_teacher_role').attr('disabled', false);
		$('#user_school_id_field').hide();
    }
});

$('#user_teacher_role').on('change', function () {
	if (this.checked) {
        $('#user_utp_role,#user_superadmin_role').attr('disabled', true);
        $('#user_school_id_field').hide();
    }
    else{
    	$('#user_utp_role,#user_superadmin_role').attr('disabled', false);
		$('#user_school_id_field').hide();
    }
});



});