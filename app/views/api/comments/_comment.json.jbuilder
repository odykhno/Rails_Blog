json.extract! comment, :id, :text, :author

json.created_at comment.created_at.to_i
json.updated_at comment.updated_at.to_i