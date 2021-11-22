$(document).ready(function() {

    $('#btnCreate').click(function(e) {

        var error = false;

        // for each input, check if something is entered
        $('#createRatingForm input').each(function() {

            // Number 1 through 5
            var regex = new RegExp(/^[1-5]$/, 'g');
            if ($(this).attr('id') == 'starInput' && !($(this).val().match(regex))) {
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

    $('#btnUpdate').click(function(e) {

        var error = false;

        // for each input, check if something is entered
        $('#updateRatingForm input').each(function() {

            // Number 1 through 5
            var regex = new RegExp(/^[1-5]$/, 'g');
            if ($(this).attr('id') == 'starInput' && !($(this).val().match(regex))) {
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