$(function() {
    $('#new_comment').on('ajax:success', function(xhr, data, status) {
        console.log(data);
        $('#comments_wrapper').html(data);
        // $('.table tbody').prepend('<tr><td>' + data.author + '</td><td>' + data.text + '</td><td>'
        // + '<span style="color:red">To have possibility delete this comment you need to reload this page!</span></td></tr>');
        $('#comment_text').val('');
    });
});