$(document).ready(function() {

    $('#btnSubmit').click(function(e) {

        var error = false;

        // for each input, check if something is entered
        $('form input').each(function() {

            if ($(this).val() == '') {
                $(this).addClass('is-invalid');
                error = true;
            } else {
                $(this).removeClass('is-invalid');
            }
        })

        if (error) {
            e.preventDefault(); // prevent form submit
            return;
        }
    })
})