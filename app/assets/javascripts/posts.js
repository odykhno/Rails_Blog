$(function() {
    $('#new_comment').on('ajax:success', function(xhr, data, status) {
        $('.table tbody').prepend('<tr><td>' + data.author + '</td><td>' + data.text + '</td></tr>');
        $('#comment_text').val('');
    });
});
