class VideogameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :photo, :description, :price_per_day, :created_at, :updated_at
end
