class CommentMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def approve(comment)
    @comment = comment
    mail(to: comment.author, subject: 'Needs approval')
  end
end
