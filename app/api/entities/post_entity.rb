class PostEntity < Grape::Entity
  format_with(:iso_timestamp) { |dt| dt.to_i }

  expose :id, :title, :text

  with_options(format_with: :iso_timestamp) do
    expose :created_at
    expose :updated_at
  end
end