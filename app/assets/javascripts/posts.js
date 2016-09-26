// $(function() {
//     $('#new_comment').on('ajax:success', function(xhr, data, status) {
//         // $('#comments_wrapper').html(data);
//         $('.table tbody').prepend('<tr><td>' + data.author + '</td><td>' + data.text + '</td><td>'
//         + '<span style="color:red">To have possibility delete this comment you need to reload this page!</span></td></tr>');
//         $('#comment_text').val('');
//     });
// });

Pusher.logToConsole = true;

var pusher = new Pusher('4f00e2203bc49efd9268', {
    cluster: 'eu',
    encrypted: true
});

var channel = pusher.subscribe('comments');
channel.bind('new', function(data) {
    $('#post_comments_' + data.post_id + ' tbody').prepend('<tr><td>' + data.author + '</td><td>' + data.text
      + '</td><td>' + '<span style="color:red">To have possibility delete this comment you need to reload this page!</span></td></tr>');
    $('#comment_text').val('');
});

// $('.table tbody').delegate($('.delete_comment'), 'click', function(event) {
//     $(event.target).closest('tr').remove();
//     event.preventDefault();
//     // $.ajax({
//     //     url: '/posts/' + $(event.target).data(data-post-id) + '/comments/' + $(event.target).data(data-id),
//     //     type: 'DELETE',
//     //     success: function(result) {
//     //         $(event.target).closest('tr').remove();
//     //     }
//     // });
// });