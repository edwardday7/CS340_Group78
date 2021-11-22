$(document).ready(function() {

    $('#btnSubmit').click(function(e) {

        var error = false;

        // for each input, check if something is entered
        $('#createBookForm input').each(function() {

            if ($(this).val() == '') {
                $(this).addClass('is-invalid');
                error = true;
            } else {

                // Positive number include 0
                var regex = new RegExp(/^[0-9]\d*$/, 'g');
                if ($(this).attr('id') == 'timesBorrowedInput' && !($(this).val().match(regex))) {
                    $(this).addClass('is-invalid');
                    error = true;
                } else {
                    $(this).removeClass('is-invalid');
                }
            }
        })

        if (error) {
            e.preventDefault(); // prevent form submit
            return;
        }
    })
})