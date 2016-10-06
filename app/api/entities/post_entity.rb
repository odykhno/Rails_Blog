class PostEntity < Grape::Entity
  expose :id, :title, :text
end