$(function() {
    // $('#new_comment').on('ajax:success', function(xhr, data, status) {
    //     // $('#comments_wrapper').html(data);
    //     $('.table tbody').prepend('<tr><td>' + data.author + '</td><td>' + data.text + '</td><td>'
    //     + '<span style="color:red">To have possibility delete this comment you need to reload this page!</span></td></tr>');
    //     $('#comment_text').val('');
    // });
});

Pusher.logToConsole = true;

var pusher = new Pusher('964185b17dbe78577e37', {
    cluster: 'eu',
    encrypted: true
});

var channel = pusher.subscribe('comments');
channel.bind('new', function(data) {
    // console.log(data);
    $('.table tbody').prepend('<tr><td>' + data.author + '</td><td>' + data.text + '</td><td>'
        + '<span style="color:red">To have possibility delete this comment you need to reload this page!</span></td></tr>');
    // $('#' + data.commentable_type.toLowerCase() + '_comments_' + data.commentable_id + ' tbody')
    //     .prepend('<tr><td>' + data.user_name + '</td><td>' + data.text + '</td></tr>');
    $('#comment_text').val('');
});