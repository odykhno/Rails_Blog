json.extract! post, :id, :title, :text

json.created_at post.created_at.to_i
json.updated_at post.updated_at.to_i

json.comments post.comments, partial: 'api/comments/comment', as: :comment
json.user post.user, partial: 'api/users/user', as: :user